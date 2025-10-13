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
	describe("empty list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.empty_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("empty list returns nil", function()
			local node = linked_list.pop_right()
			assert.is_nil(node, constants.EXPECTED_NODE)
		end)
	end)
	describe("one item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.one_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("node returned", function()
			local node = linked_list.pop_right()
			assert.are.equal(mocks.node1.value, node.value, constants.EXPECTED_NODE)
		end)
		it("head is nil", function()
			local _ = linked_list.pop_right()
			assert.is_nil(linked_list.head, constants.EXPECTED_HEAD)
		end)
		it("length is 0", function()
			local _ = linked_list.pop_right()
			assert.are.equal(0, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		end)
	end)
	describe("two item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.two_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("node returned", function()
			local node = linked_list.pop_right()
			assert.are.equal(mocks.node2.value, node.value, constants.EXPECTED_NODE)
		end)
		it("head unchanged", function()
			local expected_head = linked_list.head
			local _ = linked_list.pop_right()
			assert.are.equal(expected_head, linked_list.head, constants.EXPECTED_HEAD)
		end)
		it("length is 1", function()
			local _ = linked_list.pop_right()
			assert.are.equal(1, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		end)
	end)
	describe("three item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.three_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("node returned", function()
			local node = linked_list.pop_right()
			assert.are.equal(mocks.node3.value, node.value, constants.EXPECTED_NODE)
		end)
		it("head unchanged", function()
			local expected_head = linked_list.head
			local _ = linked_list.pop_right()
			assert.are.equal(expected_head, linked_list.head, constants.EXPECTED_HEAD)
		end)
		it("length is 2", function()
			local _ = linked_list.pop_right()
			assert.are.equal(2, nodes_length(linked_list.nodes), constants.EXPECTED_LENGTH)
		end)
	end)
end)
