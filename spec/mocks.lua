-- mocks for linked_list assets

local M = {}

M.mock_head = 1
M.mock_node1_value = "node 1"
M.mock_node2_value = "node 2"
M.mock_node3_value = "node 3"
M.mock_new_node_value = "new node"

function M.new_node()
	return {
		next = nil,
		address = 99,
		value = M.mock_new_node_value,
	}
end

M.mock_empty_list = {
	head = nil,
	nodes = {},
}

M.mock_one_item_list = {
	head = 1,
	nodes = {
		{
			next = nil,
			address = 1,
			value = M.mock_node1_value,
		},
	},
}

M.mock_two_item_list = {
	head = 1,
	nodes = {
		{
			next = 2,
			address = 1,
			value = M.mock_node1_value,
		},
		{
			next = nil,
			address = 2,
			value = M.mock_node2_value,
		},
	},
}

M.mock_three_item_list = {
	head = 1,
	nodes = {
		{
			next = 2,
			address = 1,
			value = M.mock_node1_value,
		},
		{
			next = 3,
			address = 2,
			value = M.mock_node2_value,
		},
		{
			next = nil,
			address = 3,
			value = M.mock_node3_value,
		},
	},
}

return M
