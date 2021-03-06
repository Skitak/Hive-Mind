extends Node

var menu = null
var lobby = null

var server_port = 4444
var server_ip = "192.168.0.1"
var server_name = "server name"
var server_max_player = 4

const SERVER_DEFAULT_IP = "192.168.1.52"
const SERVER_DEFAULT_PORT = 4444
var my_id = 1

var player_info = {}
# Info we send to other players
var my_info = {
	name = "player"
}

func set_player_host():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(server_port, server_max_player)
	get_tree().set_network_peer(peer)
	player_info[my_id] = my_info
	lobby.add_player_name(my_info.name)
	lobby.get_node("Player_status").set_text("Vous êtes l'hôte de la partie")
	lobby.get_node("Play").show()
	rpc("_set_server_status","En attente d'autres joueurs")

func set_player_client():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(server_ip, server_port)
	get_tree().set_network_peer(peer)
	my_id = get_tree().get_network_unique_id()
	lobby.get_node("Player_status").set_text("Vous êtes client de la partie")
	lobby.get_node("Ready").show()
	rpc("_set_server_status","En attente d'autres joueurs")

func _ready():
    get_tree().connect("network_peer_connected", self, "_player_connected")
    get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
    get_tree().connect("connected_to_server", self, "_connected_ok")
    get_tree().connect("connection_failed", self, "_connected_fail")
    get_tree().connect("server_disconnected", self, "_server_disconnected")

sync func _set_server_status(status):
	lobby.get_node("Server_status").set_text(status)

func _player_connected(id):
    pass # Will go unused, not useful here

func _player_disconnected(id):
	player_info.erase(id) # Erase player from info
	lobby.get_node("Ready").disabled = true
	if players_done.has(id):
		players_done.remove(players_done.find(id))
	lobby.get_node("Play").disabled = true
	rpc("_set_server_status", "En attente d'autres joueurs")
	refresh_player_names()

func _connected_ok():
	lobby.empty_player_container()
	rpc("register_player", get_tree().get_network_unique_id(), my_info)

func _server_disconnected():
	menu.back()
	lobby.reset_lobby()
	menu.get_node("Join server/Erreur").set_text("Le serveur a été déconnecté.")

func _connected_fail():
	menu.back()
	lobby.reset_lobby()
	menu.get_node("Join server/Erreur").set_text("Nous n'avons pas pu vous connecter au serveur.")

remote func register_player(id, info):
    # Store the info
	player_info[id] = info
	lobby.add_player_name(info.name)
    # If I'm the server, let the new guy know about existing players
	if get_tree().is_network_server():
        # Send the info of existing players
		for peer_id in player_info:
			rpc_id(id, "register_player", peer_id, player_info[peer_id])
		if player_info.size() == server_max_player:
			rpc("_wait_for_client")
		

remote func _wait_for_client():
	lobby.get_node("Ready").disabled = false
	rpc("_set_server_status", "Préparation des joueurs")
	
#remote func pre_configure_game():
#	get_tree().set_pause(true) # Pre-pause
#	var selfPeerID = get_tree().get_network_unique_id()
#
#    # Load world
#	var world = load("res://World/World.tscn").instance()
#	get_node("/root").add_child(world)
#
#    # Load my player
#	var my_player = preload("res://BaseEntity/Player.tscn").instance()
#	my_player.set_name(str(selfPeerID))
#	my_player.set_network_master(selfPeerID) # Will be explained later
#	get_node("/root/world/players").add_child(my_player)
#
#    # Load other players
#	for p in player_info:
#		var player = preload("res://BaseEntity/Player.tscn").instance()
#		player.set_name(str(p))
#		get_node("/root/world/players").add_child(player)
#
#    # Tell server (remember, server is always ID=1) that this peer is done pre-configuring
#	rpc_id(1, "done_preconfiguring", selfPeerID)
#
#remote func done_preconfiguring(who):
#    # Here is some checks you can do, as example
#    assert(get_tree().is_network_server())
#    assert(who in player_info) # Exists
#    assert(not who in players_done) # Was not added yet
#
#    players_done.append(who)
#
#    if players_done.size() == player_info.size():
#        rpc("post_configure_game")
#
#remote func post_configure_game():
#    get_tree().set_pause(false)
#    # Game starts now!

func player_changed_name(id, name):
	player_info[id].name = name
	var playerContainer = lobby.get_node("Player_container")
	refresh_player_names()

func refresh_player_names():
	lobby.empty_player_container()
	for id in player_info:
		lobby.add_player_name(player_info[id].name)
##### SIGNALS #####

func on_quit_server():
	get_tree().set_network_peer(null)
	lobby.empty_player_container()
	
var players_done = []


sync func player_ready(id):
	if not players_done.has(id):
		players_done.append(id)
		if get_tree().is_network_server() and players_done.size() == server_max_player - 1:
			lobby.get_node("Play").disabled = false
			rpc("_set_server_status", "En attente de l'hôte")
	else :
		players_done.remove(players_done.find(id))
		lobby.get_node("Play").disabled = true
		rpc("_set_server_status", "Préparation des joueurs")