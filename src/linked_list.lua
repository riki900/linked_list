local inspect = require("inspect")

local M = {}

function M.alloc_node(value)
	local node = {}
	node.next = nil
	node.address = M.malloc()
	node.value = value

	return node
end

function M.randomseed()
	math.randomseed(32768)
end

function M.malloc()
	return math.random(999, 9999)
end

function M.new()
	M.randomseed()
	M.head = nil
	M.nodes = {}
end

function M.push(value)
	local node = M.alloc_node(value)
	if not M.head then
		M.head = node.address
	else
		node.next = M.head
		M.head = node.address
	end

	M.nodes[node.address] = node
end

function M.pop()
	if not M.head then
		return nil
	end
	local old_head_address = M.head
	local old_head_node = M.nodes[old_head_address]
	M.head = old_head_node.next
	M.nodes[old_head_address] = nil

	return old_head_node
end

function M.length()
	local length = 0
	for _ in M.traverse() do
		length = length + 1
	end

	return length
end

function M.push_right(value)
	local node = M.alloc_node(value)
	if not M.head then
		M.head = node.address
	else
		local last_node_address = M.get_last_node()
		M.nodes[last_node_address].next = node.address
	end
	M.nodes[node.address] = node
end

function M.insert_at(value, search_for)
	local node = M.alloc_node(value)
	if not M.head then
		return false, "ERROR. Empty list"
	end
	local prior_address, at_address
	prior_address = M.head
	for address in M.traverse() do
		if M.nodes[address].value == search_for then
			at_address = address
		else
			prior_address = address
		end
	end
	-- insertion at node not found
	if not at_address then
		return false, "ERROR. at node not found"
	end
	node.next = at_address
	M.nodes[prior_address].next = node.address
	M.nodes[node.address] = node
	return true, nil
end

function M.pop_right()
	-- empty list
	if not M.head then
		return nil
	end
	-- single item list
	if M.nodes[M.head].next == nil then
		local node = M.nodes[M.head]
		M.nodes[M.head] = nil
		M.head = nil
		return node
	end
	-- multiple item list traverse to end saving prior_address
	local end_address, end_node
	local prior_address = M.head
	for address in M.traverse() do
		-- last node?
		if M.nodes[address].next == nil then
			end_address = address
		else
			-- no save prior_address
			prior_address = address
		end
	end
	end_node = M.nodes[end_address]
	M.nodes[prior_address].next = nil
	M.nodes[end_address] = nil
	return end_node
end

function M.get_last_node()
	if not M.head then
		return nil
	end

	local current_address
	for address in M.traverse() do
		current_address = address
	end

	return current_address
end

function M.is_in_list(search_for)
	local node_address = M.find(search_for)
	if node_address then
		return true
	end

	return false
end

function M.find(search_for)
	for address in M.traverse() do
		if M.nodes[address].value == search_for then
			return address
		end
	end

	return nil
end

function M.traverse()
	local next_node_address = M.head
	return function()
		local current_node = M.nodes[next_node_address]
		if not current_node then
			return nil
		end
		next_node_address = current_node.next
		return current_node.address
	end
end

return M
