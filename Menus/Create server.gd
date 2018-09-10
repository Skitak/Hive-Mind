extends Control

func _on_create_server():
	Network.server_name = int($"Server infos/Server name/Edit server name".get_text())
	Network.server_port = int($"Server infos/Server port/Edit server port".get_text())
	Network.server_max_player = int($"Server infos/Server max player/max player selected".get_text())
	Network.set_player_host()
