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
	describe("empty list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.empty_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("node is in list", function()
			local address = linked_list.push_right(mocks.node_to_add.value)
			local node = linked_list.nodes[address]
			assert.is_not_nil(linked_list.nodes[node.address], constants.EXPECTED_NODE)
		end)
		it("node.next is nil", function()
			local address = linked_list.push_right(mocks.node_to_add.value)
			local node = linked_list.nodes[address]
			assert.is_nil(node.next, constants.EXPECTED_NEXT)
		end)
		it("head is set", function()
			local address = linked_list.push_right(mocks.node_to_add.value)
			local node = linked_list.nodes[address]
			assert.are.equal(node.address, linked_list.head, constants.EXPECTED_HEAD)
		end)
		it("length is 1", function()
			local _ = linked_list.push_right(mocks.node_to_add.value)
			assert.are.equal(1, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		end)
	end)
	describe("one item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.one_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("node is in list", function()
			local address = linked_list.push_right(mocks.node_to_add.value)
			local node = linked_list.nodes[address]
			assert.is_not_nil(linked_list.nodes[node.address], constants.EXPECTED_NODE)
		end)
		it("node.next is nil", function()
			local address = linked_list.push_right(mocks.node_to_add.value)
			local node = linked_list.nodes[address]
			assert.is_nil(node.next, constants.EXPECTED_NEXT)
		end)
		it("head is unchanged", function()
			local expected_head = linked_list.head
			local _ = linked_list.push_right(mocks.node_to_add.value)
			assert.are.equal(expected_head, linked_list.head, constants.EXPECTED_HEAD)
		end)
		it("length is 2", function()
			local _ = linked_list.push_right(mocks.node_to_add.value)
			assert.are.equal(2, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		end)
	end)

	describe("two item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.two_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("node is in list", function()
			local address = linked_list.push_right(mocks.node_to_add.value)
			local node = linked_list.nodes[address]
			assert.is_not_nil(linked_list.nodes[node.address], constants.EXPECTED_NODE)
		end)
		it("node.next is nil", function()
			local address = linked_list.push_right(mocks.node_to_add.value)
			local node = linked_list.nodes[address]
			assert.is_nil(node.next, constants.EXPECTED_NEXT)
		end)
		it("head is unchanged", function()
			local expected_head = linked_list.head
			local _ = linked_list.push_right(mocks.node_to_add.value)
			assert.are.equal(expected_head, linked_list.head, constants.EXPECTED_HEAD)
		end)
		it("length is 3", function()
			local _ = linked_list.push_right(mocks.node_to_add.value)
			assert.are.equal(3, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		end)
	end)
end)
