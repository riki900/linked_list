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
		linked_list.head = mocks.mock_empty_list.head
		linked_list.nodes = mocks.mock_empty_list.nodes
		assert.are.equal(0, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("one item in list length is 1", function()
		linked_list.head = mocks.mock_one_item_list.head
		linked_list.nodes = mocks.mock_one_item_list.nodes
		assert.are.equal(1, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("two items in list length is 2", function()
		linked_list.head = mocks.mock_two_item_list.head
		linked_list.nodes = mocks.mock_two_item_list.nodes
		assert.are.equal(2, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("three items in list length is 3", function()
		linked_list.head = mocks.mock_three_item_list.head
		linked_list.nodes = mocks.mock_three_item_list.nodes
		assert.are.equal(3, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
end)
