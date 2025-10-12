-- mocks for linked_list assets

local M = {}

M.head = 1
M.node1 = { value = "node 1", address = 10 }
M.node2 = { value = "node 2", address = 22 }
M.node3 = { value = "node 3", address = 33 }
M.node_to_add = { value = "new node" }

function M.new_node()
	return {
		next = nil,
		address = M.node_to_add.address,
		value = M.node_to_add.value,
	}
end

M.empty_list = {
	head = nil,
	nodes = {},
}

M.one_item_list = {
	head = M.node1.address,
	nodes = {
		[M.node1.address] = {
			next = nil,
			address = M.node1.address,
			value = M.node1.value,
		},
	},
}

M.two_item_list = {
	head = M.node1.address,
	nodes = {
		[M.node1.address] = {
			next = M.node2.address,
			address = M.node1.address,
			value = M.node1.value,
		},
		[M.node2.address] = {
			next = nil,
			address = M.node2.address,
			value = M.node2.value,
		},
	},
}

M.three_item_list = {
	head = M.node1.address,
	nodes = {
		[M.node1.address] = {
			next = M.node2.address,
			address = M.node1.address,
			value = M.node1.value,
		},
		[M.node2.address] = {
			next = M.node3.address,
			address = M.node2.address,
			value = M.node2.value,
		},
		[M.node3.address] = {
			next = nil,
			address = M.node3.address,
			value = M.node3.value,
		},
	},
}

return M
