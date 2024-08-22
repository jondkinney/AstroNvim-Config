-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

--  TODO: (2024-08-21) Jon => add sections for each type of plugin:
--  * REQUIRED
--  * OPTIONAL
--  * EXPERIMENTAL
--

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  { import = "astrocommunity.bars-and-lines.lualine-nvim" }, -- Bottom status bar
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" }, -- shows smartcolumn only when you execeed it
  -- { import = "astrocommunity.color.tint-nvim" }, -- highlight splits based on which is focused (using a custom config though)
  { import = "astrocommunity.completion.cmp-calc" }, -- Inline calculations
  { import = "astrocommunity.completion.cmp-spell" }, -- Inline spelling suggestions
  { import = "astrocommunity.completion.copilot-lua-cmp" }, -- Automatic code completion through copilot
  { import = "astrocommunity.editing-support.mini-operators" }, --  FIXME: (gx doesn't work) g= Evaluate text and replace with output, gx exchange text regions, gm multiply text, gr replace text with register, gs sort text
  { import = "astrocommunity.editing-support.nvim-origami" }, -- Fold with h (but only from the very beginning of the line, expand with l
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" }, -- Intelligent ends for if, do, etc.
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" }, -- Highlights ends for { and [ more intelligently
  { import = "astrocommunity.editing-support.treesj" }, -- Splitting and joining blocks of code. <Leader>m (or s or j)
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" }, -- Works in the background, I think?
  { import = "astrocommunity.editing-support.vim-move" }, -- "drag visuals" plugin. opt + j or k. Also supports h and l.
  { import = "astrocommunity.git.blame-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.gitgraph-nvim" }, --  TODO: (2024-08-21) Jon => determine if I need this
  { import = "astrocommunity.git.neogit" }, -- TODO: (2024-08-06) Jon => experimental git plugin neogit. Try it out and see if it's better than vim-figitive
  { import = "astrocommunity.git.octo-nvim" }, -- Code review. <Leader>O (capital o for Octo), list PRs. <Leader> [O]cto > [p]ull requests > [t] list open PRs
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },
  { import = "astrocommunity.media.codesnap-nvim" }, -- Take a screenshot of your code and share it with others --  TODO: (2024-08-21) Jonfigure out how this works
  -- { import = "astrocommunity.motion.hop-nvim" }, -- Type lowercase s, then jump to words/lines with 2 letters
  { import = "astrocommunity.motion.leap-nvim" }, -- Type lowercase s, then jump to words/lines with 2 letters
  { import = "astrocommunity.motion.nvim-surround" },
  { import = "astrocommunity.neovim-lua-development.lazydev-nvim" },
  { import = "astrocommunity.pack.chezmoi" }, -- Dotfile manager
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  -- { import = "astrocommunity.split-and-window.colorful-winsep-nvim" }, -- Colorful window separators
  -- { import = "astrocommunity.split-and-window.windows-nvim" }, -- Automatically expand width of the current window. Maximizes and restore it. And all this with nice animations!
  -- { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.utility.nvim-toggler" }, -- <Leader>i - toggle true to false or yes to no.
}

--More to get!
-- https://github.com/kevinhwang91/nvim-hlslens
-- https://github.com/haya14busa/vim-asterisk
-- https://github.com/MagicDuck/grug-far.nvim
-- https://github.com/dannyfritz/dotfiles/blob/master/starship.toml (terminal prompt)

-- Look into https://lazy.folke.io/developers#minit-minimal-init for reproducing errors with a minimal init.lua
-- https://github.com/AstroNvim/.github/blob/main/CONTRIBUTING.md - create a PR that updates the contributing guidelines for AstroNvim local dev
-- https://github.com/mehalter/zsh-nvim-appname - add this to my local dev setup chezmoi?

-- https://github.com/gbprod/nord.nvim -- submit a PR for community for this colorscheme
-- https://github.com/nordtheme  -- submit a PR to add the kitty theme to the nordtheme repo
-- https://milkdown.dev/ -- markdown editor to look into
-- https://github.com/ThePrimeagen/harpoon/tree/harpoon2 - look into this for managing windows
