local inspect = require("inspect")

local M = {}

M.ERRORS = {
	EMPTY_LIST = "ERROR. Empty list",
	NODE_NOT_FOUND = "ERROR. at node not found",
}

---@alias node table
---@alias address integer
---@alias error string

--- creates a new node instance
---@param value any
---@return node
function M.alloc_node(value)
	local node = {}
	node.next = nil
	node.address = M.malloc()
	node.value = value

	return node
end

--- sets the randomseed
function M.randomseed()
	math.randomseed(32768)
end

--- generate a new address
---@return integer
function M.malloc()
	return math.random(999, 9999)
end

--- initializes the linked list
function M.new()
	M.randomseed()
	M.head = nil
	M.nodes = {}
end

--- add a value at the head
---@param value any
---@return address
function M.push(value)
	local node = M.alloc_node(value)
	if not M.head then
		M.head = node.address
	else
		node.next = M.head
		M.head = node.address
	end

	M.nodes[node.address] = node
	return node.address
end

--- pop from the head
---@return any
function M.pop()
	if not M.head then
		return nil
	end
	local save_head_address = M.head
	local value = M.nodes[save_head_address].value
	M.head = M.nodes[save_head_address].next
	M.nodes[save_head_address] = nil

	return value
end

--- get length of linked list
---@return integer
function M.length()
	local length = 0
	for _ in M.traverse() do
		length = length + 1
	end

	return length
end

--- add value at the end
---@param value any
---@return address
function M.push_right(value)
	local node = M.alloc_node(value)
	if not M.head then
		M.head = node.address
	else
		local last_node_address = M.get_last_node()
		M.nodes[last_node_address].next = node.address
	end
	M.nodes[node.address] = node
	return node.address
end

--- insert value before the searched value
---@param value any
---@param search_for any
---@return address | nil, error | nil
function M.insert_at(value, search_for)
	local node = M.alloc_node(value)
	if not M.head then
		return nil, M.ERRORS.EMPTY_LIST
	end
	local prior_address, at_address
	prior_address = M.head
	for address in M.traverse() do
		if M.nodes[address].value == search_for then
			at_address = address
			break
		else
			prior_address = address
		end
	end
	-- insertion at node not found
	if not at_address then
		return nil, M.ERRORS.NODE_NOT_FOUND
	end
	if prior_address == M.head then
		M.head = node.address
	else
		M.nodes[prior_address].next = node.address
	end
	node.next = at_address
	M.nodes[node.address] = node
	return node.address, nil
end

--- pop from the end of the list
---@return any | nil
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
	return end_node.value
end

--- get address of last node
---@return address | nil
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

--- check if value is in list
---@return boolean
function M.is_in_list(search_for)
	local node_address = M.find(search_for)
	if node_address then
		return true
	end

	return false
end

--- find the value in the list
---@return address | nil
function M.find(search_for)
	for address in M.traverse() do
		if M.nodes[address].value == search_for then
			return address
		end
	end

	return nil
end

--- walk the list
---@return function
function M.traverse()
	local next_node_address = M.head
	return function()
		--- inner interator
		---@return address | nil
		local current_node = M.nodes[next_node_address]
		if not current_node then
			return nil
		end
		next_node_address = current_node.next
		return current_node.address
	end
end

return M
