extends Control

func _on_create_server():
	var port = $"Server infos/Server port/Edit server port".get_text()
	var name = $"Server infos/Server name/Edit server name".get_text()
	var max_player = $"Server infos/Server max player/Edit max player".get_text()
	
	Network.server_name = $"Server infos/Server name/Edit server name".get_text()
	Network.server_port = int(port) if port else Network.SERVER_DEFAULT_PORT
	Network.server_max_player = int(max_player)
	Network.set_player_host()
