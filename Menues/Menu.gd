extends Control


export var SERVER_PORT = 4445
export var SERVER_IP = "192.168.0.1"
export var MAX_PLAYERS = 4


func _on_Home_createServer():
	join_lobby()
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().set_network_peer(peer)


func _on_Home_joinServer():
	join_lobby()
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(SERVER_IP, SERVER_PORT)
	get_tree().set_network_peer(peer)


func join_lobby():
	$Lobby.visible = true
	$Home.visible = false
	
func _on_Lobby_back():
	$Home.visible = true
	$Lobby.visible = false
