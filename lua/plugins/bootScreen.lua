return {
	  {
    "goolord/alpha-nvim",
    lazy = true,
    event = "VimEnter",
    config = function()
      require "alpha".setup(require "alpha.themes.dashboard".config)
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[

███╗  ██╗███████╗ █████╗ ██╗   ██╗██╗   ██╗███████╗
████╗ ██║██╔════╝██╔══██╗██║   ██║██║   ██║██╔════╝
██╔██╗██║█████╗  ██║  ██║╚██╗ ██╔╝██║   ██║█████╗
██║╚████║██╔══╝  ██║  ██║ ╚████╔╝ ██║   ██║██╔══╝
██║ ╚███║███████╗╚█████╔╝  ╚██╔╝  ╚██████╔╝███████╗
╚═╝  ╚══╝╚══════╝ ╚════╝    ╚═╝    ╚═════╝ ╚══════╝
]]

      dashboard.section.header.val = vim.split(logo, "\n")
      --dashboard.section.buttons.val = {}
    end,
  },
}
