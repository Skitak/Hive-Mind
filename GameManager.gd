extends Node

export var world_path = "res://BaseEntity/Player.tscn"
export var player_path = "res://World/World.tscn"


var players = []
var my_player

remote func _on_menu_play():
	$Menu.queue_free()
	$UI_game.show()
	
	var player_model = load(player_path)
	var world = load(world_path).instance()
	add_child(world)
	
	my_player = player_model.instance()
	my_player.name = Network.my_info.name
	my_player.set_network_master(Network.my_id)
	players.append(my_player)
	UI_game.set_player(my_player)
	world.add_child(my_player)
	
	for p in Network.player_info:
		if p != Network.my_id:
			var player = player_model.instance()
			player.name = Network.player_info[p].name
			players.append(player)
			world.add_child(player)
	if get_tree().is_network_server():
		rpc("_on_menu_play")
	
	
