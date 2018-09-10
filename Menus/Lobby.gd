extends Node

func _on_Return_button_down():
	Network.on_quit_server() # replace with function body


func _on_Edit_player_name_text_entered(new_text):
	Network.my_info.name = name
	if new_text.length() > 3:
		$Player_name_error.text = ""
		rpc("player_changed_name", Network.my_id, new_text)
	else:
		$Player_name_error.text = "Name should be at least 3 character long" 

sync func player_changed_name(id, name):
	Network.player_changed_name(id, name)
	
func empty_player_container():
	for i in range(0, $Player_container.get_child_count()):
		$Player_container.get_child(i).queue_free()