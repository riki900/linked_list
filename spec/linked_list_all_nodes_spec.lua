require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.all_nodes()", function()
	before_each(function()
		linked_list.new()
	end)
	it("empty list returns nil", function()
		linked_list.head = mocks.mock_empty_list.head
		linked_list.nodes = mocks.mock_empty_list.nodes
		local node_count = 0
		for _ in linked_list.all_nodes() do
			node_count = node_count + 1
		end
		assert.are.equal(0, node_count, constants.EXPECTED_LENGTH)
	end)
	it("one item list", function()
		linked_list.head = mocks.mock_one_item_list.head
		linked_list.nodes = mocks.mock_one_item_list.nodes
		local node_count = 0
		local current_node_address = 1
		for node in linked_list.all_nodes() do
			assert.are.equal(current_node_address, node.address, constants.EXPECTED_ADDRESS)
			node_count = node_count + 1
			current_node_address = current_node_address + 1
		end
		assert.are.equal(1, node_count, constants.EXPECTED_LENGTH)
	end)
	it("three item list", function()
		linked_list.head = mocks.mock_three_item_list.head
		linked_list.nodes = mocks.mock_three_item_list.nodes
		local node_count = 0
		local current_node_address = 1
		for node in linked_list.all_nodes() do
			assert.are.equal(current_node_address, node.address, constants.EXPECTED_ADDRESS)
			node_count = node_count + 1
			current_node_address = current_node_address + 1
		end
		assert.are.equal(3, node_count, constants.EXPECTED_LENGTH)
	end)
end)
