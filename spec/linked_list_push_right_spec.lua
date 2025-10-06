require("init")

local linked_list = require("linked_list")
local constants = require("constants")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

local node1, node2, node3

describe("linked_list.push_right(node)", function()
	before_each(function()
		linked_list.new()
		node1 = linked_list.new_node("ONE")
		node1.address = 1
		node2 = linked_list.new_node("TWO")
		node2.address = 2
		node3 = linked_list.new_node("THREE")
		node3.address = 3
	end)
	it("add to empty list", function()
		linked_list.push_right(node1)
		local node = linked_list.get_last_node()
		assert.are.equal(node1.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(1, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("add to single item list", function()
		linked_list.push(node1)
		linked_list.push_right(node2)
		local node = linked_list.get_last_node()
		assert.are.equal(node2.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(2, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("add to two item list", function()
		linked_list.push(node1)
		linked_list.push(node2)
		linked_list.push_right(node3)
		local node = linked_list.get_last_node()
		assert.are.equal(node3.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(3, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
end)

-- insert_at_tail function calls push_right
-- test that calls to push_right are correct
describe("linked_list.insert_at_tail(node)", function()
	before_each(function()
		linked_list.new()
		node1 = linked_list.new_node("ONE")
		node1.address = 1
		node2 = linked_list.new_node("TWO")
		node2.address = 2
		node3 = linked_list.new_node("THREE")
		node3.address = 3
	end)
	it("add to empty list", function()
		linked_list.insert_at_tail(node1)
		local node = linked_list.get_last_node()
		assert.are.equal(node1.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(1, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("add to single item list", function()
		linked_list.push(node1)
		linked_list.insert_at_tail(node2)
		local node = linked_list.get_last_node()
		assert.are.equal(node2.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(2, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
	it("add to two item list", function()
		linked_list.push(node1)
		linked_list.push(node2)
		linked_list.insert_at_tail(node3)
		local node = linked_list.get_last_node()
		assert.are.equal(node3.value, node.value, constants.EXPECTED_NODE)
		assert.are.equal(3, linked_list.length(), constants.EXPECTED_LENGTH)
	end)
end)
