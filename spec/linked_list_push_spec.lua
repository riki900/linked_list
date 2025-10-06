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
describe("linked_list.push(node)", function()
	before_each(function()
		linked_list.new()
	end)
	it("add one item to empty list", function()
		linked_list.head = mocks.empty_list.head
		linked_list.nodes = mocks.empty_list.nodes
		local new_node = mocks.new_node()
		linked_list.push(new_node)
		assert.are.equal(1, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		assert.is_true(linked_list.head == new_node.address, constants.EXPECTED_HEAD)
		assert.is_true(new_node.next == nil, constants.EXPECTED_NEXT)
	end)
	it("add to one item list", function()
		linked_list.head = mocks.one_item_list.head
		linked_list.nodes = mocks.one_item_list.nodes
		local new_node = mocks.new_node()
		linked_list.push(new_node)
		assert.are.equal(2, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		assert.is_true(linked_list.head == new_node.address, constants.EXPECTED_HEAD)
		--assert.is_true(node2.next == node1.address, constants.EXPECTED_NEXT)
		--assert.is_true(node1.next == nil, constants.EXPECTED_NEXT)
	end)
	it("add to two item list", function()
		linked_list.head = mocks.two_item_list.head
		linked_list.nodes = mocks.two_item_list.nodes
		local new_node = mocks.new_node()
		linked_list.push(new_node)
		assert.are.equal(3, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		assert.is_true(linked_list.head == new_node.address, constants.EXPECTED_HEAD)
		--assert.is_true(node3.next == node2.address, constants.EXPECTED_NEXT)
		--assert.is_true(node2.next == node1.address, constants.EXPECTED_NEXT)
		--assert.is_true(node1.next == nil, constants.EXPECTED_NEXT)
	end)
end)
-- insert_at_head calls push
describe("linked_list.insert_at_head(node)", function()
	describe("linked_list.push(node)", function()
		before_each(function()
			linked_list.new()
		end)
		it("add one item to empty list", function()
			linked_list.head = mocks.empty_list.head
			linked_list.nodes = mocks.empty_list.nodes
			local new_node = mocks.new_node()
			linked_list.push(new_node)
			assert.are.equal(1, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
			assert.is_true(linked_list.head == new_node.address, constants.EXPECTED_HEAD)
			assert.are.equal(nil, new_node.next, constants.EXPECTED_NEXT)
		end)
		it("add to one item list", function()
			linked_list.head = mocks.one_item_list.head
			linked_list.nodes = mocks.one_item_list.nodes
			local new_node = mocks.new_node()
			linked_list.push(new_node)
			assert.are.equal(2, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
			assert.is_true(linked_list.head == new_node.address, constants.EXPECTED_HEAD)
			--assert.is_true(node2.next == node1.address, constants.EXPECTED_NEXT)
			--assert.is_true(node1.next == nil, constants.EXPECTED_NEXT)
		end)
		it("add to two item list", function()
			linked_list.head = mocks.two_item_list.head
			linked_list.nodes = mocks.two_item_list.nodes
			local new_node = mocks.new_node()
			linked_list.push(new_node)
			assert.are.equal(3, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
			assert.is_true(linked_list.head == new_node.address, constants.EXPECTED_HEAD)
			--assert.is_true(node3.next == node2.address, constants.EXPECTED_NEXT)
			--assert.is_true(node2.next == node1.address, constants.EXPECTED_NEXT)
			--assert.is_true(node1.next == nil, constants.EXPECTED_NEXT)
		end)
	end)
end)
