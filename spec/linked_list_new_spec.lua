require("init")
local constants = require("constants")

local linked_list = require("linked_list")

-- following to disable warning for assert.are checks
--- @diagnostic disable: undefined-field

describe("linked_list.new()", function()
	before_each(function()
		linked_list.new()
	end)
	it("nodes is empty list", function()
		linked_list.new()
		assert.are.equal(nil, next(linked_list.nodes), constants.EXPECTED_LENGTH)
	end)
	it("head is nil", function()
		linked_list.new()
		assert.are.equal(nil, linked_list.head, constants.EXPECTED_HEAD)
	end)
end)
