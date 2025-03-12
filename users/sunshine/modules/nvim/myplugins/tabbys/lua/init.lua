local workspace_list = {}

local workspace = {}
package.path = package.path .. ";/etc/nixos/users/sunshine/modules/nvim/myplugins/tabbys/lua/utils.lua"

local utils = require("utils")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

vim.notify = require("notify")

function workspace.new(opts)
	local opts = opts or {}
	local t = {
		path = opts.path or "yourpath/here",
		buffers = "",
		build = function()
			print("builded")
		end,
	}
	return t
end

function add_workspace(opts)
	local opts = opts or {}
	local new = workspace.new(opts)
	table.insert(workspace_list, new)
end

local function show_workspaces(opts)
	opts = opts or {}
	pickers
		.new({}, {
			prompt_title = "workspaces",
			finder = finders.new_table({
				results = workspace_list,
				entry_maker = function(entry)
					return {
						value = entry,
						display = entry.path,
						ordinal = entry.path,
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					-- vim.notify(inspect(selection))
					vim.api.nvim_put({ selection[1] }, "", false, true)
				end)
				return true
			end,
		})
		:find()
end
vim.keymap.set("n", "<leader>w", function()
	add_workspace({ path = vim.fn.getcwd() })
end, {})
vim.keymap.set("n", "<leader>we", function()
	show_workspaces(opts)
end, {})
