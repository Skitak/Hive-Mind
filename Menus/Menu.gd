extends Control

onready var network = get_node("/root/Network")

var current_menu = "Home"
var menu_tree = []

func back():
	var previous_menu = menu_tree.pop_front()
	_swap_menu(previous_menu)
	
func go_to_menu(menu):
	menu_tree.push_front(current_menu)
	_swap_menu(menu)

func _swap_menu(to_menu):
	get_node(current_menu).hide()
	get_node(to_menu).show()
	current_menu = to_menu