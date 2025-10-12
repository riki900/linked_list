require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.pop()", function()
	before_each(function()
		linked_list.new()
	end)
	it("empty list returns nil", function()
		linked_list.head = mocks.empty_list.head
		linked_list.nodes = mocks.empty_list.nodes
		assert.is_true(linked_list.pop() == nil, constants.EXPECTED_NODE)
	end)
	it("single item list", function()
		linked_list.head = mocks.one_item_list.head
		linked_list.nodes = mocks.one_item_list.nodes
		local node = linked_list.pop()
		assert.are.equal(mocks.node1.address, node.address, constants.EXPECTED_NODE)
		assert.are.equal(nil, linked_list.head, constants.EXPECTED_HEAD)
		assert.are.equal(0, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("two item list", function()
		linked_list.head = mocks.two_item_list.head
		linked_list.nodes = mocks.two_item_list.nodes
		local node = linked_list.pop()
		assert.are.equal(mocks.node1.address, node.address, constants.EXPECTED_NODE)
		assert.are.equal(mocks.node2.address, linked_list.head, constants.EXPECTED_HEAD)
		assert.are.equal(1, linked_list.length(), constants.EXPECTED_LENGTH)
		assert.are.equal(mocks.node2.address, linked_list.head, constants.EXPECTED_HEAD)
	end)
	it("three items in list", function()
		linked_list.head = mocks.three_item_list.head
		linked_list.nodes = mocks.three_item_list.nodes
		local node = linked_list.pop()
		assert.are.equal(mocks.node1.address, node.address, constants.EXPECTED_NODE)
		assert.are.equal(2, linked_list.length(), constants.EXPECTED_LENGTH)
		assert.are.equal(mocks.node2.address, linked_list.head, constants.EXPECTED_HEAD)
	end)
end)
