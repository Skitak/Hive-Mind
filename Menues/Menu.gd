extends Control


func _on_Home_createServer():
	join_lobby()
	$Lobby.set_player_host()


func _on_Home_joinServer():
	join_lobby()
	$Lobby.set_player_client()


func join_lobby():
	$Lobby.visible = true
	$Home.visible = false
	
func _on_Lobby_back():
	$Home.visible = true
	$Lobby.visible = false
