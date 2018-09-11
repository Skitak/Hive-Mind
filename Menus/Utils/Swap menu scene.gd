extends Button

export var to_node_path = ""
	
func _on_Swap_button_down():
	get_parent().owner.go_to_menu(to_node_path)
