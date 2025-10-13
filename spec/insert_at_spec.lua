require("init")
local constants = require("constants")
local mocks = require("mocks")

local inspect = require("inspect")

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

describe("linked_list.insert_at", function()
	describe("empty list", function()
		before_each(function()
			linked_list.new()
			linked_list.head = mocks.empty_list.head
			linked_list.nodes = mocks.empty_list.nodes
		end)
		it("empty list returns success false", function()
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node1.value)
			assert.is_nil(added_node, constants.EXPECTED_NODE)
		end)
		it("empty list returns error message", function()
			local _, err = linked_list.insert_at(mocks.node_to_add.value, mocks.node1.value)
			assert.are.equal(linked_list.ERRORS.EMPTY_LIST, err, constants.EXPECTED_ERROR)
		end)
		it("list is not changed", function()
			local _, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node1.value)
			assert.is_nil(linked_list.head, constants.EXPECTED_HEAD)
		end)
	end)
	describe("single item list", function()
		before_each(function()
			linked_list.new()
			linked_list.head = mocks.one_item_list.head
			linked_list.nodes = mocks.one_item_list.nodes
		end)
		it("returns a new node", function()
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node1.value)
			assert.is_not_nil(added_node, constants.EXPECTED_NODE)
		end)
		it("no error returned", function()
			local _, err = linked_list.insert_at(mocks.node_to_add.value, mocks.node1.value)
			assert.is_nil(err, constants.EXPECTED_ERROR)
		end)
		it("new node at head", function()
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node1.value)
			assert.are.equal(added_node.address, linked_list.head, constants.EXPECTED_HEAD)
		end)
		it("new node next is correct", function()
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node1.value)
			local next_node = linked_list.nodes[added_node.next]
			assert.is_not_nil(next_node, constants.EXPECTED_NEXT)
		end)
		it("length is 2", function()
			linked_list.insert_at(mocks.node_to_add.value, mocks.node1.value)
			assert.are.equal(2, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		end)
	end)
	describe("errors when insertion point not found", function()
		before_each(function()
			linked_list.new()
			linked_list.head = mocks.three_item_list.head
			linked_list.nodes = mocks.three_item_list.nodes
		end)
		it("returned node is nil", function()
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, " ")
			assert.is_nil(added_node, constants.EXPECTED_NODE)
		end)
		it("returned correct error", function()
			local _, err = linked_list.insert_at(mocks.node_to_add.value, " ")
			assert.are.equal(linked_list.ERRORS.NODE_NOT_FOUND, err, constants.EXPECTED_ERROR)
		end)
	end)
	describe("insert at last node", function()
		before_each(function()
			linked_list.new()
			linked_list.head = mocks.three_item_list.head
			linked_list.nodes = mocks.three_item_list.nodes
		end)
		it("returns a new node", function()
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node3.value)
			assert.is_not_nil(added_node, constants.EXPECTED_NODE)
		end)
		it("no error returned", function()
			local _, err = linked_list.insert_at(mocks.node_to_add.value, mocks.node3.value)
			assert.is_nil(err, constants.EXPECTED_ERROR)
		end)
		it("list head not changed", function()
			local expected_head = linked_list.head
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node3.value)
			assert.are.equal(expected_head, linked_list.head, constants.EXPECTED_HEAD)
		end)
		it("new node next is correct", function()
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node3.value)
			local next_node = linked_list.nodes[added_node.next]
			assert.is_not_nil(next_node, constants.EXPECTED_NEXT)
		end)
		it("new node next is at end of list", function()
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node3.value)
			local next_node = linked_list.nodes[added_node.next]
			assert.is_nil(next_node.next, constants.EXPECTED_TAIL)
		end)
		it("length is 4", function()
			linked_list.insert_at(mocks.node_to_add.value, mocks.node1.value)
			assert.are.equal(4, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		end)
	end)

	describe("insert into middle of list", function()
		before_each(function()
			linked_list.new()
			linked_list.head = mocks.three_item_list.head
			linked_list.nodes = mocks.three_item_list.nodes
			print(inspect(mocks))
		end)
		it("returns a new node", function()
			--local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node3.value)
			assert.is_not_nil(added_node, constants.EXPECTED_NODE)
		end)
		--[====[
		it("no error returned", function()
			local _, err = linked_list.insert_at(mocks.node_to_add.value, mocks.node3.value)
			assert.is_nil(err, constants.EXPECTED_ERROR)
		end)
		it("list head not changed", function()
			local expected_head = linked_list.head
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node3.value)
			assert.are.equal(expected_head, linked_list.head, constants.EXPECTED_HEAD)
		end)
		it("new node next is correct", function()
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node3.value)
			local next_node = linked_list.nodes[added_node.next]
			assert.is_not_nil(next_node, constants.EXPECTED_NEXT)
		end)
		it("new node next is at end of list", function()
			local added_node, _ = linked_list.insert_at(mocks.node_to_add.value, mocks.node3.value)
			local next_node = linked_list.nodes[added_node.next]
			assert.is_nil(next_node.next, constants.EXPECTED_TAIL)
		end)
		it("length is 4", function()
			linked_list.insert_at(mocks.node_to_add.value, mocks.node1.value)
			assert.are.equal(4, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		end)
		--]====]
	end)
end)
