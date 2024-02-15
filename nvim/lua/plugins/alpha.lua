return {
	"goolord/alpha-nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[                                __ _._.,._.__]],
			[[                          .o8888888888888888P']],
			[[                        .d88888888888888888K]],
			[[          ,8            888888888888888888888boo._]],
			[[         :88b           888888888888888888888888888b.]],
			[[          `Y8b          88888888888888888888888888888b.]],
			[[            `Yb.       d8888888888888888888888888888888b]],
			[[              `Yb.___.88888888888888888888888888888888888b]],
			[[                `Y888888888888888888888888888888CG88888P"']],
			[[                  `88888888888888888888888888888MM88P"']],
			[[ "Y888K    "Y8P""Y888888888888888888888888oo._""""]],
			[[   88888b    8    8888`Y88888888888888888888888oo.]],
			[[   8"Y8888b  8    8888  ,8888888888888888888888888o,]],
			[[   8  "Y8888b8    8888""Y8`Y8888888888888888888888b.]],
			[[   8    "Y8888    8888   Y  `Y8888888888888888888888]],
			[[   8      "Y88    8888     .d `Y88888888888888888888b]],
			[[ .d8b.      "8  .d8888b..d88P   `Y88888888888888888888]],
			[[                                  `Y88888888888888888b.]],
			[[                   "Y888P""Y8b. "Y888888888888888888888]],
			[[                     888    888   Y888`Y888888888888888]],
			[[                     888   d88P    Y88b `Y8888888888888]],
			[[                     888"Y88K"      Y88b dPY8888888888P]],
			[[                     888  Y88b       Y88dP  `Y88888888b]],
			[[                     888   Y88b       Y8P     `Y8888888]],
			[[                   .d888b.  Y88b.      Y        `Y88888]],
			[[                                                  `Y88K]],
			[[                                                    `Y8]],
			[[                                                      ']],
		}

		vim.api.nvim_exec(
			[[
        augroup CenterAlpha
            autocmd!
            autocmd WinEnter,BufEnter * if &buftype ==# 'dashboard' | normal! zz | endif
        augroup END
    ]],
			false
		)

		alpha.setup(dashboard.opts)
	end,
}