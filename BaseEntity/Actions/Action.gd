extends Object

var is_compressible = false
var start_frame = 0
var end_frame = 0
var minimum_cost = 0

export (Texture) var timeline_texture
export (Texture) var action_texture

func get_editor():
	return null