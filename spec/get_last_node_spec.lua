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
		linked_list.head = mocks.empty_list.head
		linked_list.nodes = mocks.empty_list.nodes
		assert.is_true(linked_list.get_last_node() == nil, constants.EXPECTED_ADDRESS)
	end)
	it("single item list", function()
		linked_list.head = mocks.one_item_list.head
		linked_list.nodes = mocks.one_item_list.nodes
		local address = linked_list.get_last_node()
		assert.are.equal(mocks.node1.address, address, constants.EXPECTED_ADDRESS)
	end)
	it("two item list", function()
		linked_list.head = mocks.two_item_list.head
		linked_list.nodes = mocks.two_item_list.nodes
		local address = linked_list.get_last_node()
		assert.are.equal(mocks.node2.address, address, constants.EXPECTED_ADDRESS)
	end)
	it("three item list", function()
		linked_list.head = mocks.three_item_list.head
		linked_list.nodes = mocks.three_item_list.nodes
		local address = linked_list.get_last_node()
		assert.are.equal(mocks.node3.address, address, constants.EXPECTED_ADDRESS)
	end)
end)
