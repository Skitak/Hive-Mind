extends "res://BaseEntity/Actions/Motions/Motion.gd"

var minimum_cost = 5

func _ready():
	cost = 5

func get_editor():
	return Action_manager.get_node("Editor/Jump_editor")