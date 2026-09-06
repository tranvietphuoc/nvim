#!/usr/bin/env fish

set -l arch (uname -m)

switch $arch
      case x86_64
          set asset nvim-linux-x86_64.tar.gz
      case aarch64 arm64
          set asset nvim-linux-arm64.tar.gz
      case '*'
          echo "Không hỗ trợ kiến trúc CPU: $arch"
          exit 1
end

set -l tmpdir (mktemp -d)
set -l archive "$tmpdir/$asset"
set -l url "https://github.com/neovim/neovim/releases/latest/download/$asset"

echo "Đang tải Neovim từ:"
echo "$url"

curl -fL "$url" -o "$archive"
if test $status -ne 0
    echo "Tải Neovim thất bại."
    rm -rf "$tmpdir"
    exit 1
end

tar -xzf "$archive" -C "$tmpdir"
if test $status -ne 0
    echo "Giải nén thất bại."
    rm -rf "$tmpdir"
    exit 1
end

set -l extracted (find "$tmpdir" -mindepth 1 -maxdepth 1 -type d -print -quit)

if test -z "$extracted"
    echo "Không tìm thấy thư mục Neovim sau khi giải nén."
    rm -rf "$tmpdir"
    exit 1
end

mkdir -p "$HOME/.local/opt" "$HOME/.local/bin"
set -l install_dir "$HOME/.local/opt/nvim-"(date "+%Y%m%d-%H%M%S")
mv "$extracted" "$install_dir"

ln -sfn "$install_dir/bin/nvim" "$HOME/.local/bin/nvim"

  # Lưu PATH vĩnh viễn cho Fish
fish_add_path -U "$HOME/.local/bin"
# Cập nhật PATH cho tmux server hiện tại
if type -q tmux
    tmux set-environment -g PATH "$HOME/.local/bin:$PATH"
end

rm -rf "$tmpdir"

echo
echo "Đã cài Neovim:"
"$HOME/.local/bin/nvim" --version | head -3

if type -q codex
    echo
    echo "Codex CLI:"
    command -v codex
else
    echo
    echo "Cảnh báo: chưa tìm thấy Codex CLI trong PATH."
end

echo
echo "Hãy chạy:"
echo "  exec fish"
echo "  nvim --version"
echo "  tmux new"
