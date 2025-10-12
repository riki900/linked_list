-- C-style linked list implementation for practice
-- Simulates manual memory management with addresses

local M = {}

-- Simulates memory allocator
local NEXT_ADDRESS = 1000

-- malloc equivalent - allocate a node
function M.alloc_node(value)
	local node = {
		address = NEXT_ADDRESS,
		value = value,
		next = nil, -- NULL equivalent
	}
	NEXT_ADDRESS = NEXT_ADDRESS + 1
	return node
end

-- Create new list (like malloc'ing a struct)
function M.new()
	local list = {
		head = nil, -- NULL
		nodes = {}, -- Simulates heap memory
		size = 0,
	}
	return list
end

-- free equivalent - deallocate a node
function M.free_node(list, address)
	if not address then
		return false, "NULL pointer"
	end

	list.nodes[address] = nil
	return true
end

-- Push to front (like C: prepend to list)
function M.push_front(list, node)
	if not list then
		return false, "NULL list pointer"
	end
	if not node then
		return false, "NULL node pointer"
	end

	-- Store node in "heap"
	list.nodes[node.address] = node

	if not list.head then
		list.head = node.address
	else
		node.next = list.head
		list.head = node.address
	end

	list.size = list.size + 1
	return true
end

-- Pop from front
function M.pop_front(list)
	if not list then
		return nil, "NULL list pointer"
	end

	if not list.head then
		return nil, "Empty list"
	end

	local old_head_addr = list.head
	local old_head_node = list.nodes[old_head_addr]

	if not old_head_node then
		return nil, "Corrupted list - dangling pointer"
	end

	-- Update head
	list.head = old_head_node.next

	-- Free the old head
	M.free_node(list, old_head_addr)

	list.size = list.size - 1

	return old_head_node
end

-- Push to back (append)
function M.push_back(list, node)
	if not list then
		return false, "NULL list pointer"
	end
	if not node then
		return false, "NULL node pointer"
	end

	-- Store in heap
	list.nodes[node.address] = node

	if not list.head then
		list.head = node.address
	else
		-- Traverse to end
		local last_addr = M.get_tail_address(list)
		if not last_addr then
			return false, "Failed to find tail"
		end
		list.nodes[last_addr].next = node.address
	end

	list.size = list.size + 1
	return true
end

-- Pop from back
function M.pop_back(list)
	if not list then
		return nil, "NULL list pointer"
	end

	if not list.head then
		return nil, "Empty list"
	end

	-- Single element
	local head_node = list.nodes[list.head]
	if not head_node.next then
		local node = head_node
		M.free_node(list, list.head)
		list.head = nil
		list.size = 0
		return node
	end

	-- Multiple elements - find second to last
	local prev_addr = nil
	local curr_addr = list.head

	while curr_addr do
		local curr_node = list.nodes[curr_addr]
		if not curr_node then
			return nil, "Corrupted list"
		end

		if not curr_node.next then
			-- Found last node
			break
		end

		prev_addr = curr_addr
		curr_addr = curr_node.next
	end

	local last_node = list.nodes[curr_addr]

	-- Update second-to-last node
	if prev_addr then
		list.nodes[prev_addr].next = nil
	end

	-- Free last node
	M.free_node(list, curr_addr)
	list.size = list.size - 1

	return last_node
end

-- Get address of tail node
function M.get_tail_address(list)
	if not list or not list.head then
		return nil
	end

	local curr_addr = list.head
	local curr_node = list.nodes[curr_addr]

	while curr_node and curr_node.next do
		curr_addr = curr_node.next
		curr_node = list.nodes[curr_addr]

		if not curr_node then
			return nil -- Dangling pointer detected
		end
	end

	return curr_addr
end

-- Find node by value (returns address, like returning pointer in C)
function M.find(list, search_value)
	if not list or not list.head then
		return nil
	end

	local curr_addr = list.head

	while curr_addr do
		local curr_node = list.nodes[curr_addr]

		if not curr_node then
			return nil -- Dangling pointer
		end

		if curr_node.value == search_value then
			return curr_addr -- Return "pointer"
		end

		curr_addr = curr_node.next
	end

	return nil
end

-- Check if value exists
function M.contains(list, value)
	return M.find(list, value) ~= nil
end

-- Remove first occurrence of value
function M.remove(list, search_value)
	if not list or not list.head then
		return false, "Empty list"
	end

	-- Special case: removing head
	local head_node = list.nodes[list.head]
	if head_node.value == search_value then
		M.pop_front(list)
		return true
	end

	-- Find node before the target
	local prev_addr = list.head
	local curr_addr = head_node.next

	while curr_addr do
		local curr_node = list.nodes[curr_addr]

		if not curr_node then
			return false, "Dangling pointer"
		end

		if curr_node.value == search_value then
			-- Unlink node
			list.nodes[prev_addr].next = curr_node.next

			-- Free node
			M.free_node(list, curr_addr)
			list.size = list.size - 1

			return true
		end

		prev_addr = curr_addr
		curr_addr = curr_node.next
	end

	return false, "Value not found"
end

-- Insert after a specific address
function M.insert_after(list, target_addr, new_node)
	if not list then
		return false, "NULL list pointer"
	end

	local target_node = list.nodes[target_addr]
	if not target_node then
		return false, "Invalid address"
	end

	-- Store new node in heap
	list.nodes[new_node.address] = new_node

	-- Link it in
	new_node.next = target_node.next
	target_node.next = new_node.address

	list.size = list.size + 1
	return true
end

-- Get size
function M.length(list)
	if not list then
		return 0
	end
	return list.size
end

-- Traverse (iterator) - returns addresses like C pointers
function M.traverse(list)
	if not list or not list.head then
		return function()
			return nil
		end
	end

	local curr_addr = list.head

	return function()
		if not curr_addr then
			return nil
		end

		local curr_node = list.nodes[curr_addr]
		if not curr_node then
			-- Dangling pointer detected!
			return nil
		end

		local return_addr = curr_addr
		curr_addr = curr_node.next

		return return_addr
	end
end

-- Print list (debugging helper)
function M.print_list(list)
	if not list then
		print("NULL list")
		return
	end

	if not list.head then
		print("Empty list")
		return
	end

	local parts = {}
	for addr in M.traverse(list) do
		local node = list.nodes[addr]
		table.insert(parts, string.format("[%d]%s", addr, tostring(node.value)))
	end

	print(table.concat(parts, " -> ") .. " -> NULL")
end

-- Destroy entire list (free all nodes)
function M.destroy(list)
	if not list then
		return
	end

	while list.head do
		M.pop_front(list)
	end

	-- Clear any remaining references
	list.nodes = {}
	list.size = 0
end

-- Check for memory leaks (debugging helper)
function M.check_leaks(list)
	if not list then
		return 0
	end

	local count = 0
	for _ in pairs(list.nodes) do
		count = count + 1
	end

	if count ~= list.size then
		print(string.format("WARNING: Memory leak detected! %d nodes in heap but size is %d", count, list.size))
	end

	return count
end

-- Reverse the list (modifies in place)
function M.reverse(list)
	if not list or not list.head then
		return true
	end

	local prev_addr = nil
	local curr_addr = list.head

	while curr_addr do
		local curr_node = list.nodes[curr_addr]
		if not curr_node then
			return false, "Corrupted list"
		end

		local next_addr = curr_node.next
		curr_node.next = prev_addr
		prev_addr = curr_addr
		curr_addr = next_addr
	end

	list.head = prev_addr
	return true
end

return M
