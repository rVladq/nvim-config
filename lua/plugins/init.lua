return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"vim",
				"lua",
				"vimdoc",
				"html",
				"css",
				"c_sharp",
				"javascript",
				"typescript",
				"tsx",
				"c",
			},
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = require("configs.gitsigns"),
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			filters = {
				dotfiles = false, -- Show dotfiles
				git_ignored = false, -- Show gitignored files
				custom = {}, -- No custom filters, show all
			},
			git = {
				enable = true, -- Enable git integration
				ignore = false, -- Do not ignore .gitignored files
			},
			view = {
				width = 30,
				side = "left",
				adaptive_size = false,
			},
			renderer = {
				highlight_git = true,
				highlight_opened_files = "all",
			},
			update_focused_file = {
				enable = true,
				update_cwd = false,
			},
			hijack_directories = { enable = false },
		},
	},

	{
		"tpope/vim-fugitive",
		lazy = false,
		-- config = require("configs.fugitive")
	},

	{
		"rmagatti/auto-session",
		lazy = false,

		opts = require("configs.auto-session"),
	},

	{
		"ThePrimeagen/harpoon",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon").setup()
		end,
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"leoluz/nvim-dap-go",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()

			-- Handled by nvim-dap-go
			-- dap.adapters.go = {
			--   type = "server",
			--   port = "${port}",
			--   executable = {
			--     command = "dlv",
			--     args = { "dap", "-l", "127.0.0.1:${port}" },
			--   },
			-- }

			local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
			if elixir_ls_debugger ~= "" then
				dap.adapters.mix_task = {
					type = "executable",
					command = elixir_ls_debugger,
				}

				dap.configurations.elixir = {
					{
						type = "mix_task",
						name = "phoenix server",
						task = "phx.server",
						request = "launch",
						projectDir = "${workspaceFolder}",
						exitAfterTaskReturns = false,
						debugAutoInterpretAllModules = false,
					},
				}
			end

			local netcoredbg_path = vim.fn.exepath("netcoredbg")
			if netcoredbg_path ~= "" then
				dap.adapters.coreclr = {
					type = "executable",
					command = netcoredbg_path,
					args = { "--interpreter=vscode" },
				}

				dap.configurations.cs = {
					{
						type = "coreclr",
						name = "Launch - .NET Core",
						request = "launch",
						program = function()
							return vim.fn.input("Path to dll: ", vim.fn.getcwd() .. "/bin/Debug/net8.0/", "file")
						end,
						env = function()
              local launch_profile = require("get-launch-profile").select_launch_profile(vim.fn.getcwd())
              if launch_profile == nil then return nil end
              return launch_profile.environmentVariables or nil
						end,
					},
				}
			end
			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},

	{
		"olimorris/codecompanion.nvim",
		lazy = false,
		opts = {
			strategies = {
				chat = {
					adapter = "openai",
				},
				inline = {
					adapter = "openai",
				},
			},
			adapters = {
				openai = function()
					return require("codecompanion.adapters").extend("openai", {
						schema = {
							model = {
								default = "gpt-4.1",
							},
						},
						env = {
							api_key = OPENAI_API_KEY,
						},
					})
				end,
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
	},
}
