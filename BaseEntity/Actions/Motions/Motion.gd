extends "res://BaseEntity/Actions/Action.gd"

var positions = []
var editor = null

func _ready():
	is_compressible = true

func get_editor():
	return editor