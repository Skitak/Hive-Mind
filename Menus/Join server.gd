extends Control



func _on_join_server():
	var ip = $"Server infos/Server ip/Edit server ip".get_text()
	var port = $"Server infos/Server port/Edit server port".get_text()
	
	Network.server_ip = ip if ip else Network.SERVER_DEFAULT_IP 
	Network.server_port = int(port) if port else Network.SERVER_DEFAULT_PORT
	Network.set_player_client()