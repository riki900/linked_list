local inspect = require("inspect")
local M = {}

M = {}

function M.new_node(value)
	local node = {}
	node.next = nil
	node.address = math.random(999, 9999)
	node.value = value

	return node
end

function M.new()
	M.head = nil
	M.nodes = {}
end

function M.push(node)
	if not M.head then
		M.head = node.address
	else
		node.next = M.head
		M.head = node.address
	end

	M.nodes[node.address] = node
end

function M.insert_at_head(node)
	M.push(node)
end

function M.pop()
	if not M.head then
		return nil
	end
	local head_node = M.nodes[M.head]
	M.head = head_node.next
	M.nodes[head_node.address] = nil

	return head_node
end

function M.length()
	local length = 0
	for _ in M.all_nodes() do
		length = length + 1
	end

	return length
end

function M.push_right(node)
	if not M.head then
		M.head = node.address
	else
		local tail_node = M.get_last_node()
		tail_node.next = node.address
	end
	M.nodes[node.address] = node
end

function M.insert_at_tail(node)
	M.push_right(node)
end

function M.pop_right()
	if not M.head then
		return nil
	end
	local prior_address
	for node in M.all_nodes() do
		-- edge case list with one item
		if node.address == M.head then
			if not node.next then
				M.head = nil
				M.nodes[node.address] = nil
				return node
			else
				prior_address = node.next
			end
		end
		if not node.next then
			M.nodes[prior_address].next = nil
			M.nodes[node.address] = nil
			return node
		end
	end
	error("FATAL. ran past end of list")
end

function M.get_last_node()
	if not M.head then
		return nil
	end

	local current_node
	for node in M.all_nodes() do
		current_node = node
	end

	return current_node
end

function M.is_in_list(search_for)
	if not M.head then
		return false
	end

	for node in M.all_nodes() do
		if node.value == search_for then
			return true
		end
	end

	return false
end

function M.all_nodes()
	local next_node_address = M.head
	return function()
		if not next_node_address then
			return nil
		end
		local current_node = M.nodes[next_node_address]
		next_node_address = current_node.next
		return current_node
	end
end

return M
