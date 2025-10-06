require("init")
local constants = require("constants")
local mocks = require("mocks")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.find(search_for)", function()
	before_each(function()
		linked_list.new()
	end)
	it("empty list returns nil", function()
		linked_list.head = mocks.empty_list.head
		linked_list.nodes = mocks.empty_list.nodes
		assert.is_true(linked_list.find("") == nil, constants.EXPECTED_POSITION)
	end)
	it("single item list", function()
		linked_list.head = mocks.one_item_list.head
		linked_list.nodes = mocks.one_item_list.nodes
		local position = linked_list.find(mocks.node1_value)
		assert.are.equal(1, position, constants.EXPECTED_POSITION)
	end)
	it("not in single item list", function()
		linked_list.head = mocks.one_item_list.head
		linked_list.nodes = mocks.one_item_list.nodes
		local position = linked_list.find(" ")
		assert.are.equal(nil, position, constants.EXPECTED_POSITION)
	end)
	it("find first in two item list", function()
		linked_list.head = mocks.two_item_list.head
		linked_list.nodes = mocks.two_item_list.nodes
		local position = linked_list.find(mocks.node1_value)
		assert.are.equal(1, position, constants.EXPECTED_POSITION)
	end)
	it("find second in two item list", function()
		linked_list.head = mocks.two_item_list.head
		linked_list.nodes = mocks.two_item_list.nodes
		local position = linked_list.find(mocks.node2_value)
		assert.are.equal(2, position, constants.EXPECTED_POSITION)
	end)
	it("not in two item list", function()
		linked_list.head = mocks.two_item_list.head
		linked_list.nodes = mocks.two_item_list.nodes
		local position = linked_list.find(" ")
		assert.are.equal(nil, position, constants.EXPECTED_POSITION)
	end)
	it("find first in three item list", function()
		linked_list.head = mocks.three_item_list.head
		linked_list.nodes = mocks.three_item_list.nodes
		local position = linked_list.find(mocks.node1_value)
		assert.are.equal(1, position, constants.EXPECTED_POSITION)
	end)
	it("find second in three item list", function()
		linked_list.head = mocks.three_item_list.head
		linked_list.nodes = mocks.three_item_list.nodes
		local position = linked_list.find(mocks.node2_value)
		assert.are.equal(2, position, constants.EXPECTED_POSITION)
	end)
	it("find third in three item list", function()
		linked_list.head = mocks.three_item_list.head
		linked_list.nodes = mocks.three_item_list.nodes
		local position = linked_list.find(mocks.mock_node3_value)
		assert.are.equal(3, position, constants.EXPECTED_POSITION)
	end)
	it("not in three item list", function()
		linked_list.head = mocks.three_item_list.head
		linked_list.nodes = mocks.three_item_list.nodes
		local position = linked_list.find(" ")
		assert.are.equal(nil, position, constants.EXPECTED_POSITION)
	end)
end)
