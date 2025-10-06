-- mocks for linked_list assets

local M = {}

M.head = 1
M.node1_value = "node 1"
M.node2_value = "node 2"
M.mock_node3_value = "node 3"
M.new_node_value = "new node"

function M.new_node()
	return {
		next = nil,
		address = 99,
		value = M.new_node_value,
	}
end

M.empty_list = {
	head = nil,
	nodes = {},
}

M.one_item_list = {
	head = 1,
	nodes = {
		{
			next = nil,
			address = 1,
			value = M.node1_value,
		},
	},
}

M.two_item_list = {
	head = 1,
	nodes = {
		{
			next = 2,
			address = 1,
			value = M.node1_value,
		},
		{
			next = nil,
			address = 2,
			value = M.node2_value,
		},
	},
}

M.three_item_list = {
	head = 1,
	nodes = {
		{
			next = 2,
			address = 1,
			value = M.node1_value,
		},
		{
			next = 3,
			address = 2,
			value = M.node2_value,
		},
		{
			next = nil,
			address = 3,
			value = M.mock_node3_value,
		},
	},
}

return M
