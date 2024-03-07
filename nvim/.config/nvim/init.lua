require("options")
require("keymaps")

local themes = require("themes")
local plugins = require("plugins")

-- Lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- End Lazy

-- Import plugins

require("lazy").setup({
  plugins,
  themes,
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = {
      "nvim-lua/plenary.nvim"
    }
  },
  { "williamboman/mason.nvim" },
  {
    "stevearc/conform.nvim",
    opts = {},
  },
  {
    "mfussenegger/nvim-lint",
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
  { "echasnovski/mini.pairs", event = "VeryLazy" },
  -- { "echasnovski/mini.surround", version = "*" },
  {
    "echasnovski/mini.bufremove",
    event = "VeryLazy",
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  { "williamboman/mason.nvim" },
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  {
    "akinsho/toggleterm.nvim",
    version = "*",
    opts = {
      open_mapping = [[<c-\>]],
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { { "williamboman/mason-lspconfig.nvim" } },
  },
  { "folke/neodev.nvim",      opts = {} },
  { "hrsh7th/cmp-nvim-lsp" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "typescript", "html", "solidity" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
  },
  { 'justinmk/vim-sneak' }
})

-- Bufferline
require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "neo-tree",
        highlight = "Directory",
        text = "File Explorer",
        text_align = "left",
      },
    },
  },
})

-- Aerial
require("aerial").setup({
  layout = {
    min_width = 30,
  },
})

-- Mason
require("mason").setup({})

-- Mini
require("mini.pairs").setup({})
-- require("mini.surround").setup({})

-- Nvim.lint
require("lint").linters_by_ft = {
  lua = { "luacheck" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Conform formatter
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { { "prettierd" } },
  },
  format_on_save = {
    timeout_ms = 300,
    lsp_fallback = true,
  },
})

-- Telescope
require("telescope").setup({
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

-- Theme
-- vim.cmd([[colorscheme gruvbox]])
vim.cmd([[colorscheme nord]])
-- vim.cmd([[colorscheme rose-pine]])

-- CMP
local cmp = require("cmp")
cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
  }, {
    { name = "buffer" },
  }),
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
})
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- LSPs
require("neodev").setup({})

require("lspconfig").lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
require("lspconfig").solidity_ls_nomicfoundation.setup({
  capabilities = capabilities,
})
require("lspconfig").tsserver.setup({
  capabilities = capabilities,
})
require("lspconfig").prismals.setup({
  capabilities = capabilities,
})
-- Set signs for LSP gutter
-- local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
local emojis = { Error = "🤬", Warn = "⚠️", Hint = "💡", Info = "👀" }
for type, icon in pairs(emojis) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
