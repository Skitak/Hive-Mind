extends Control

signal player_added
signal all_player_added
 
var player
var players

func set_player(player):
	self.player = player
	emit_signal("player_added")

func set_all_players(players):
	self.players = players
	emit_signal("all_players_added")


