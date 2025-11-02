require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.find(search_for)", function()
	describe("when list is empty", function()
		before_each(function()
			linked_list.new()
		end)
		it("empty list returns nil", function()
			local head, nodes = mocks.empty_list()
			linked_list.head = head
			linked_list.nodes = nodes
			assert.is_true(linked_list.find("") == nil, constants.EXPECTED_ADDRESS)
		end)
	end)
	describe("when single item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.one_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("found item", function()
			local search_for_node = mocks.node1
			local address = linked_list.find(search_for_node.value)
			assert.are.equal(search_for_node.address, address, constants.EXPECTED_ADDRESS)
		end)
		it("not found", function()
			local address = linked_list.find(" ")
			assert.are.equal(nil, address, constants.EXPECTED_ADDRESS)
		end)
	end)
	describe("when two item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.two_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("find first", function()
			local head, nodes = mocks.two_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
			local search_for_node = mocks.node1
			local address = linked_list.find(search_for_node.value)
			assert.are.equal(search_for_node.address, address, constants.EXPECTED_ADDRESS)
		end)
		it("find second", function()
			local head, nodes = mocks.two_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
			local search_for_node = mocks.node2
			local address = linked_list.find(search_for_node.value)
			assert.are.equal(search_for_node.address, address, constants.EXPECTED_ADDRESS)
		end)
		it("not found", function()
			local head, nodes = mocks.two_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
			local position = linked_list.find(" ")
			assert.are.equal(nil, position, constants.EXPECTED_ADDRESS)
		end)
	end)
	describe("when three item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.three_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("find first item", function()
			local search_for_node = mocks.node1
			local address = linked_list.find(search_for_node.value)
			assert.are.equal(search_for_node.address, address, constants.EXPECTED_ADDRESS)
		end)
		it("find second item", function()
			local search_for_node = mocks.node2
			local address = linked_list.find(search_for_node.value)
			assert.are.equal(search_for_node.address, address, constants.EXPECTED_ADDRESS)
		end)
		it("find third item", function()
			local search_for_node = mocks.node3
			local address = linked_list.find(search_for_node.value)
			assert.are.equal(search_for_node.address, address, constants.EXPECTED_ADDRESS)
		end)
		it("not found", function()
			local position = linked_list.find(" ")
			assert.are.equal(nil, position, constants.EXPECTED_ADDRESS)
		end)
	end)
	--]====]
end)
