local M = {
  "kndndrj/nvim-dbee",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require("dbee").install()
  end,
  config = function()
    local sources = require("dbee.sources")
    local cache = vim.fn.expand("~/.cache/csr-db")
    local repo = vim.fn.expand("~/sw")

    -- Each entry: a conn name (== cache basename) and the source .sqlite.lz4.
    -- addrmap DBs are checked-in under generated/; the code_factory tag overlay
    -- DBs are Bazel outputs under bazel-bin/ (build them with:
    --   bazel build //fw/soc/chronos/csrs:chronos_code_factory_tags.sqlite.lz4 \
    --               //fw/soc/chronos/csrs:cpu_ss_code_factory_tags.sqlite.lz4 )
    local csrs = repo .. "/fw/soc/chronos/csrs"
    local dbs = {
      { name = "chronos_top_addrmap", lz4 = csrs .. "/generated/chronos_top_addrmap.sqlite.lz4" },
      { name = "cpu_ss_full_addrmap", lz4 = csrs .. "/generated/cpu_ss_full_addrmap.sqlite.lz4" },
      { name = "chronos_code_factory_tags", lz4 = repo .. "/bazel-bin/fw/soc/chronos/csrs/chronos_code_factory_tags.sqlite.lz4" },
      { name = "cpu_ss_code_factory_tags", lz4 = repo .. "/bazel-bin/fw/soc/chronos/csrs/cpu_ss_code_factory_tags.sqlite.lz4" },
    }

    local conns, lz4_paths = {}, {}
    for _, db in ipairs(dbs) do
      table.insert(conns, { name = db.name, type = "sqlite", url = cache .. "/" .. db.name .. ".sqlite" })
      table.insert(lz4_paths, db.lz4)
    end

    -- Decompress each source .sqlite.lz4 -> cache/<basename>.sqlite, skipping
    -- up-to-date files. Missing sources (e.g. an unbuilt tag DB) are ignored.
    local function decompress()
      local py = [[
import lz4.frame, pathlib, sys
out = pathlib.Path(sys.argv[1]); out.mkdir(parents=True, exist_ok=True)
for s in sys.argv[2:]:
    f = pathlib.Path(s)
    if not f.exists():
        continue
    dst = out / f.name[:-4]  # strip .lz4
    if dst.exists() and dst.stat().st_mtime >= f.stat().st_mtime:
        continue
    dst.write_bytes(lz4.frame.decompress(f.read_bytes()))
]]
      vim.fn.system(vim.list_extend(
        { "uv", "run", "--no-project", "--with", "lz4", "--quiet", "python", "-c", py, cache },
        lz4_paths))
    end

    require("dbee").setup({
      sources = {
        sources.MemorySource:new(conns, "csr"),
        sources.FileSource:new(vim.fn.stdpath("state") .. "/dbee/persistence.json"),
      },
    })

    vim.api.nvim_create_user_command("CsrDb", function()
      decompress()
      require("dbee").open()
    end, { desc = "Decompress Chronos CSR addrmap + code_factory tag DBs and open dbee" })
  end,
}

return M
