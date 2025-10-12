local M = {}

M.module = "linked_list"
M.functions = {
	"linked_list.new_node(value)",
	"linked_list.new()",
	"linked_list.push(node)",
	"linked_list.insert_at_head(node)",
	"linked_list.pop()",
	"linked_list.length()",
	"linked_list.push_right(node)",
	"linked_list.insert_at_tail(node)",
	"linked_list.pop_right()",
	"linked_list.get_last_node()",
	"linked_list.is_in_list(search_for)",
	"linked_list.all_nodes()",
}

return M
