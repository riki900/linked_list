local gen_spec = require("spec/gen_spec")

local SPEC_DIR = "spec"
local SPEC_FILE_SUFFIX = "_spec.lua"

local TEST_TEMPLATE = [[
require("init")

local ${module_name} = require("${module_name}")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("${function_name}", function()
	it("name test", function()
        ${function_name}
    end)
end)
]]

local function write_test(test_file_path, test_source)
	local test_file, err = io.open(test_file_path, "w")
	if not test_file then
		error(err)
	end

	test_file:write(test_source)
	test_file:close()
end
local tests = {}
for _, func_name in ipairs(gen_spec.functions) do
	local test_details = {}
	local file_name
	file_name = func_name:gsub("%.", "_")
	file_name = file_name:gsub("%(.*%)", SPEC_FILE_SUFFIX)
	test_details.file_name = file_name
	test_details.func_name = func_name
	table.insert(tests, test_details)
end

for _, test in ipairs(tests) do
	local test_file_path = SPEC_DIR .. "/" .. test.file_name
	local test_source = TEST_TEMPLATE
	test_source = test_source:gsub("${module_name}", gen_spec.module)
	test_source = test_source:gsub("${function_name}", test.func_name)
	write_test(test_file_path, test_source)
end
