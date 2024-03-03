return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    opts = {
    },
    config =
        function()
          require("gruvbox").setup({
            overrides = {
              AlphaFooter = { italic = true },
            },
          })
        end
  },
  { "rose-pine/neovim",         name = "rose-pine" },
  { 'arcticicestudio/nord-vim', name = 'nord' },
}
