# vim-textbook-samples

書籍 **『Vim/Neovim の教科書 — コア標準機能で作る最短の実用環境 ― vim.pack・組み込みLSP・Lua設定』**（森川 陽介 / KDP）の companion 設定です。

本書の第11章で完成させる Neovim 設定一式（init.lua + 6 分割ファイル、計 180 行）を、本文のリストと 1 対 1 で対応する形で収録しています。すべて Neovim 0.12.3 で実機検証済みです。リポジトリ直下がそのまま設定ディレクトリの形になっているため、clone してそのまま `~/.config/nvim` として使えます。

Kindle 版: [Vim/Neovim の教科書](https://www.amazon.co.jp/dp/B0H7T7FC8D)

## 動作前提

- Neovim 0.12 以降（`vim.pack` がコア標準になったバージョン）
- git（`vim.pack` がプラグインの取得に使います）

以下は無くてもエディタは起動しますが、あると全機能が動きます。

- ripgrep — `:grep` と telescope の grep 検索に使用
- lua-language-server / gopls — LSP。導入すると第6章の補完・診断・リネームが有効になります
- tree-sitter CLI と C コンパイラ — nvim-treesitter が go パーサをビルドするときのみ必要。Homebrew の場合、CLI の formula 名は `tree-sitter` ではなく `tree-sitter-cli` です

## 使い方

既存の設定がある場合は、先にバックアップしてください。

```bash
# 既存設定の退避
mv ~/.config/nvim ~/.config/nvim.bak

# clone してそのまま設定ディレクトリにする
git clone https://github.com/forest6511/vim-textbook-samples ~/.config/nvim

# 起動
nvim
```

初回起動時に `vim.pack` がプラグインインストールの確認プロンプトを出すので、`y` と答えてください。5 つのプラグインが [`nvim-pack-lock.json`](./nvim-pack-lock.json) に記録された固定リビジョンで一括インストールされます（実測でロックファイルと 5/5 一致することを確認済みです）。

## ファイル構成

- `init.lua` — エントリポイント。リーダーキーの定義と各モジュールの読み込み（第11章）
- `lua/options.lua` — エディタの基本オプション（第4・8章）
- `lua/keymaps.lua` — キーマップ定義（第4章）
- `lua/autocmds.lua` — 自動コマンド（第4章）
- `lua/plugins.lua` — `vim.pack` によるプラグイン宣言と設定（第5章）
- `lua/lsp.lua` — 組み込み LSP の設定（第6章）
- `lua/treesitter.lua` — Treesitter の設定（第7章）
- `nvim-pack-lock.json` — `vim.pack` のロックファイル。プラグインのリビジョンを固定

## 入っているプラグイン

コア標準機能でまかなえない部分だけを、次の 5 つで補っています。

- tokyonight.nvim — カラースキーム
- plenary.nvim — telescope の依存ライブラリ
- telescope.nvim — ファジーファインダ
- oil.nvim — バッファ編集としてのファイル操作
- nvim-treesitter — Treesitter 追加パーサの導入係（機能本体は Neovim 組み込み）

`vim.pack` はプラグイン間の依存を解決しないため、telescope.nvim が必要とする plenary.nvim も `lua/plugins.lua` に明示的に並べています。

## 本書の方針

この設定は「全行を説明できる」ことを方針にしています。1 行ごとの意図、なぜ lazy.nvim や mason ではなくコア標準機能（`vim.pack`・組み込み LSP）を使うのか、どこまでをプラグインに頼るのかの判断は、本書の第4〜7章と第11章で解説しています。

## ライセンス

MIT License。書籍の本文と図表の著作権は著者に帰属します。
