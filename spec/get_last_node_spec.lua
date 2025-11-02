require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.get_last_node()", function()
	before_each(function()
		linked_list.new()
	end)
	it("empty list returns nil", function()
		local head, nodes = mocks.empty_list()
		linked_list.head = head
		linked_list.nodes = nodes
		assert.is_true(linked_list.get_last_node() == nil, constants.EXPECTED_ADDRESS)
	end)
	it("single item list", function()
		local head, nodes = mocks.one_item_list()
		linked_list.head = head
		linked_list.nodes = nodes
		local address = linked_list.get_last_node()
		assert.are.equal(mocks.node1.address, address, constants.EXPECTED_ADDRESS)
	end)
	it("two item list", function()
		local head, nodes = mocks.two_item_list()
		linked_list.head = head
		linked_list.nodes = nodes
		local address = linked_list.get_last_node()
		assert.are.equal(mocks.node2.address, address, constants.EXPECTED_ADDRESS)
	end)
	it("three item list", function()
		local head, nodes = mocks.three_item_list()
		linked_list.head = head
		linked_list.nodes = nodes
		local address = linked_list.get_last_node()
		assert.are.equal(mocks.node3.address, address, constants.EXPECTED_ADDRESS)
	end)
end)
