#!/bin/env fish

function __install -d "Install neovim"
  printf "Installing Neovim...\n"
  clone_branch "https://github.com/neovim/neovim" /tmp/nvim stable && \
    pushd /tmp/nvim && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && \
    sudo make install

  set -l save_status $status
  # Restore dir
  if test $PWD != /tmp/nvim
    return $save_status
  end
  popd
  return $save_status
end
