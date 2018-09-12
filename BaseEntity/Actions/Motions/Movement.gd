extends "res://BaseEntity/Actions/Motions/Motion.gd"

var minimum_cost = 3
var grow_cost = 1

func get_editor():
	return Action_manager.get_node("Editor/Movement_editor")