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

describe("linked_list.push_right(node)", function()
	before_each(function()
		linked_list.new()
	end)
	it("add to empty list", function()
		linked_list.head = mocks.empty_list.head
		linked_list.nodes = mocks.empty_list.nodes
		local new_node = mocks.new_node()
		linked_list.push_right(new_node)
		local node = linked_list.get_last_node()
		assert.are.equal(new_node.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(1, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		assert.are.equal(new_node.address, linked_list.head, constants.EXPECTED_HEAD)
	end)
	it("add to single item list", function()
		linked_list.head = mocks.one_item_list.head
		linked_list.nodes = mocks.one_item_list.nodes
		local new_node = mocks.new_node()
		linked_list.push_right(new_node)
		local node = linked_list.get_last_node()
		assert.are.equal(new_node.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(2, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
	end)
	it("add to two item list", function()
		linked_list.head = mocks.two_item_list.head
		linked_list.nodes = mocks.two_item_list.nodes
		local new_node = mocks.new_node()
		linked_list.push_right(new_node)
		local node = linked_list.get_last_node()
		assert.are.equal(new_node.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(3, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
	end)
end)

-- insert_at_tail function calls push_right
-- test that calls to push_right are correct
describe("linked_list.insert_at_tail(node)", function()
	before_each(function()
		linked_list.new()
	end)
	it("add to empty list", function()
		linked_list.head = mocks.empty_list.head
		linked_list.nodes = mocks.empty_list.nodes
		local new_node = mocks.new_node()
		linked_list.insert_at_tail(new_node)
		local node = linked_list.get_last_node()
		assert.are.equal(new_node.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(1, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		assert.are.equal(new_node.address, linked_list.head, constants.EXPECTED_HEAD)
	end)
	it("add to single item list", function()
		linked_list.head = mocks.one_item_list.head
		linked_list.nodes = mocks.one_item_list.nodes
		local new_node = mocks.new_node()
		linked_list.insert_at_tail(new_node)
		local node = linked_list.get_last_node()
		assert.are.equal(new_node.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(2, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
	end)
	it("add to two item list", function()
		linked_list.head = mocks.two_item_list.head
		linked_list.nodes = mocks.two_item_list.nodes
		local new_node = mocks.new_node()
		linked_list.insert_at_tail(new_node)
		local node = linked_list.get_last_node()
		assert.are.equal(new_node.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(3, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
	end)
end)
