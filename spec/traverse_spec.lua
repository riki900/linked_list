require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.traverse()", function()
	describe("empty list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.empty_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("empty list returns nothing", function()
			local node_count = 0
			for _ in linked_list.traverse() do
				node_count = node_count + 1
			end
			assert.are.equal(0, node_count, constants.EXPECTED_LENGTH)
		end)
	end)
	describe("one item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.one_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("returns 1 item", function()
			local node_count = 0
			local current_node_address = linked_list.head
			for address in linked_list.traverse() do
				assert.are.equal(current_node_address, address, constants.EXPECTED_ADDRESS)
				node_count = node_count + 1
				current_node_address = linked_list.nodes[address].next
			end
			assert.are.equal(1, node_count, constants.EXPECTED_LENGTH)
		end)
	end)
	describe("three item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.three_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("returns 3 items", function()
			local node_count = 0
			local current_node_address = linked_list.head
			for address in linked_list.traverse() do
				assert.are.equal(current_node_address, address, constants.EXPECTED_ADDRESS)
				node_count = node_count + 1
				current_node_address = linked_list.nodes[address].next
			end
			assert.are.equal(3, node_count, constants.EXPECTED_LENGTH)
		end)
	end)
end)
