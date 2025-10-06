--local inspect = require("inspect")
require("init")
local constants = require("constants")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field
local node1, node2, node3
describe("linked_list.pop_right()", function()
	before_each(function()
		linked_list.new()
		node1 = linked_list.new_node("ONE")
		node1.address = 1
		node2 = linked_list.new_node("TWO")
		node2.address = 2
		node3 = linked_list.new_node("THREE")
		node3.address = 3
	end)
	it("empty list returns nil", function()
		assert.is_true(linked_list.pop_right() == nil)
	end)
	it("one item in list", function()
		linked_list.push(node1)
		local node = linked_list.pop_right()
		assert.are.equal(node1.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(0, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("two items in list", function()
		linked_list.push(node1)
		linked_list.push(node2)
		local node = linked_list.pop_right()
		assert.are.equal(node1.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(1, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("three items in list", function()
		linked_list.push(node1)
		linked_list.push(node2)
		linked_list.push(node3)
		local node = linked_list.pop_right()
		assert.are.equal(node1.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(2, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
end)
