require("init")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

local NODE_VALUE = "VALUE"
local node

describe("linked_list.new_node(value)", function()
	before_each(function()
		linked_list.new()
		node = linked_list.new_node(NODE_VALUE)
	end)
	it("next is nil", function()
		assert.are.equal(nil, node.next)
	end)
	it("next is nil", function()
		assert.are.equal(nil, node.next)
	end)
	it("address is greater than 999", function()
		assert.is_true(node.address > 999 and node.address < 9999)
	end)
	it("value is correct", function()
		assert.are.equal(NODE_VALUE, node.value)
	end)
end)
