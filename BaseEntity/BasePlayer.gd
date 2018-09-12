extends "res://BaseEntity/BaseEntity.gd"


onready var actions = {
	"motion" : [
		Action_manager.get_node("Motion/Movement").duplicate(),
		Action_manager.get_node("Motion/Bump").duplicate(),
		Action_manager.get_node("Motion/Jump").duplicate()
	],
	"operation" : [
		Action_manager.get_node("Operation/Grab").duplicate(),
		Action_manager.get_node("Operation/Hit").duplicate(),
		Action_manager.get_node("Operation/Shoot").duplicate()
	]
}

func _ready():
	actions.operation[0].editor = Action_manager.get_node("Editor/Grab_editor")
	actions.operation[1].editor = Action_manager.get_node("Editor/Cone_editor")
	actions.operation[2].editor = Action_manager.get_node("Editor/Cone_editor")
