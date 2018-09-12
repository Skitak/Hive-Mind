extends Control

signal on_play

onready var network = get_node("/root/Network")

var current_menu = "Home"
var menu_tree = []

func _ready():
	Network.menu = self
	Network.lobby = $Lobby

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


func _on_Play_button_down():
	emit_signal("on_play")
