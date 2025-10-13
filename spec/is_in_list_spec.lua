require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.is_in_list(search_for)", function()
	describe("empty list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.empty_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("returns false", function()
			assert.is_false(linked_list.is_in_list("find_me"), constants.EXPECTED_BOOLEAN)
		end)
	end)
	describe("three item list", function()
		before_each(function()
			linked_list.new()
			local head, nodes = mocks.three_item_list()
			linked_list.head = head
			linked_list.nodes = nodes
		end)
		it("first in list returns true", function()
			assert.is_true(linked_list.is_in_list(mocks.node1.value), constants.EXPECTED_BOOLEAN)
		end)
		it("in list returns true", function()
			assert.is_true(linked_list.is_in_list(mocks.node2.value), constants.EXPECTED_BOOLEAN)
		end)
		it("last in list returns true", function()
			assert.is_true(linked_list.is_in_list(mocks.node3.value), constants.EXPECTED_BOOLEAN)
		end)
		it("not in list returns false", function()
			assert.is_false(linked_list.is_in_list("NOT_IN_LIST"), constants.EXPECTED_BOOLEAN)
		end)
	end)
end)
