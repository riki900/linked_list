-- will generate templates for tests

local inspect = require("inspect")

local source_module_path = arg[1]

local source_file, err = io.open(source_module_path, "r")

if not source_file then
	error(err)
end

local functions = {}
for src_line in source_file:lines() do
	if src_line:match("^function") then
		table.insert(functions, src_line)
	end
end
source_file:close()

local prefix = [[
local M = {}
M.module = "${module_name}"
M.functions = {
]]

local suffix = [[
}

return M
]]

local module_name = "linked_list"

print(prefix:gsub("${module_name}", module_name))

for _, func_name in ipairs(functions) do
	print('"' .. func_name:gsub("function M", module_name) .. '",')
end

print(suffix)
