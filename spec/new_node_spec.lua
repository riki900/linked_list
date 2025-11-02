require("init")
local constants = require("constants")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

local NODE_VALUE = "VALUE"
local node

describe("linked_list.new_node(value)", function()
	before_each(function()
		linked_list.new()
		node = linked_list.alloc_node(NODE_VALUE)
	end)
	it("next is nil", function()
		assert.are.equal(nil, node.next, constants.EXPECTED_NEXT)
	end)
	it("address is greater than 999", function()
		assert.is_true(node.address > 999 and node.address < 9999, constants.EXPECTED_ADDRESS)
	end)
	it("value is correct", function()
		assert.are.equal(NODE_VALUE, node.value, constants.EXPECTED_VALUE)
	end)
end)
