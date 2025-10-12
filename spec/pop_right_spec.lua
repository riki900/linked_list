--local inspect = require("inspect")
require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

local function nodes_length(nodes)
	local length = 0
	for _, _ in pairs(nodes) do
		length = length + 1
	end
	return length
end

describe("linked_list.pop_right()", function()
	before_each(function()
		linked_list.new()
	end)
	it("empty list returns nil", function()
		linked_list.head = mocks.empty_list.head
		linked_list.nodes = mocks.empty_list.nodes
		assert.are.equal(nil, linked_list.head, constants.EXPECTED_HEAD)
	end)
	it("one item in list", function()
		linked_list.head = mocks.one_item_list.head
		linked_list.nodes = mocks.one_item_list.nodes
		local node = linked_list.pop_right()
		assert.are.equal(nil, linked_list.head, constants.EXPECTED_HEAD)
		assert.are.equal(mocks.node1.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(0, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
	end)
	it("two items in list", function()
		linked_list.head = mocks.two_item_list.head
		linked_list.nodes = mocks.two_item_list.nodes
		local node = linked_list.pop_right()
		local first_node = linked_list.nodes[linked_list.head]
		assert.are.equal(nil, first_node.next, constants.EXPECTED_NEXT)
		assert.are.equal(mocks.node2.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(1, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
	end)
	it("three items in list", function()
		linked_list.head = mocks.three_item_list.head
		linked_list.nodes = mocks.three_item_list.nodes
		local node = linked_list.pop_right()
		local end_node = linked_list.nodes[mocks.node2.address]
		assert.are.equal(nil, end_node.next, constants.EXPECTED_NEXT)
		assert.are.equal(mocks.node3.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(2, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
	end)
end)
