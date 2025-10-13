require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.length()", function()
	before_each(function()
		linked_list.new()
	end)
	it("empty list length is 0 ", function()
		local head, nodes = mocks.empty_list()
		linked_list.head = head
		linked_list.nodes = nodes
		assert.are.equal(0, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("one item in list length is 1", function()
		local head, nodes = mocks.one_item_list()
		linked_list.head = head
		linked_list.nodes = nodes
		assert.are.equal(1, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("two items in list length is 2", function()
		local head, nodes = mocks.two_item_list()
		linked_list.head = head
		linked_list.nodes = nodes
		local address = linked_list.get_last_node()
		assert.are.equal(2, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("three items in list length is 3", function()
		local head, nodes = mocks.three_item_list()
		linked_list.head = head
		linked_list.nodes = nodes
		local address = linked_list.get_last_node()
		assert.are.equal(3, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
end)
