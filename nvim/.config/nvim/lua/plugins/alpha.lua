local ascii = require("../ascii")

local alpha = {
  "goolord/alpha-nvim",
  config = function()
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.header.val = ascii.boykisser2
    -- Dashboard buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recently used files", ":Telescope oldfiles<CR>"),
      dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>"),
      dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
    }
    local function footer()
      local total_plugins = require("lazy").stats().count
      local version = vim.version()
      local nvim_version_info = "  Neovim v"
          .. version.major
          .. "."
          .. version.minor
          .. "."
          .. version.patch
      return "󰂓 " .. total_plugins .. " plugins" .. nvim_version_info
    end
    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "AlphaFooter"

    require("alpha").setup(dashboard.config)
  end,
}

return alpha
