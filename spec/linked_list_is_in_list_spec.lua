require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.is_in_list(search_for)", function()
	before_each(function()
		linked_list.new()
	end)
	it("empty list returns false", function()
		linked_list.head = mocks.mock_empty_list.head
		linked_list.nodes = mocks.mock_empty_list.nodes
		assert.is_false(linked_list.is_in_list("find_me"), constants.EXPECTED_BOOLEAN)
	end)
	it("in list returns true", function()
		linked_list.head = mocks.mock_three_item_list.head
		linked_list.nodes = mocks.mock_three_item_list.nodes
		assert.is_true(linked_list.is_in_list(mocks.mock_node2_value), constants.EXPECTED_BOOLEAN)
	end)
	it("not in list returns false", function()
		linked_list.head = mocks.mock_three_item_list.head
		linked_list.nodes = mocks.mock_three_item_list.nodes
		assert.is_false(linked_list.is_in_list("NOT_IN_LIST"), constants.EXPECTED_BOOLEAN)
	end)
end)
