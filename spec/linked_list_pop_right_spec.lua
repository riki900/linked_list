--local inspect = require("inspect")
require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.pop_right()", function()
	before_each(function()
		linked_list.new()
	end)
	it("empty list returns nil", function()
		linked_list.head = mocks.mock_empty_list.head
		linked_list.nodes = mocks.mock_empty_list.nodes
		assert.is_true(linked_list.pop_right() == nil)
	end)
	it("one item in list", function()
		linked_list.head = mocks.mock_one_item_list.head
		linked_list.nodes = mocks.mock_one_item_list.nodes
		local node = linked_list.pop_right()
		assert.are.equal(mocks.mock_node1_value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(0, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("two items in list", function()
		linked_list.head = mocks.mock_two_item_list.head
		linked_list.nodes = mocks.mock_two_item_list.nodes
		local node = linked_list.pop_right()
		assert.are.equal(mocks.mock_node2_value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(1, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("three items in list", function()
		linked_list.head = mocks.mock_three_item_list.head
		linked_list.nodes = mocks.mock_three_item_list.nodes
		local node = linked_list.pop_right()
		assert.are.equal(mocks.mock_node3_value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(2, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
end)
