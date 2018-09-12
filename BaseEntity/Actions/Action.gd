extends Object

var minimum_cost = 0
var grow_cost = 0
var cost = 0

export (Texture) var timeline_texture
export (Texture) var icon

func get_editor():
	return null

func get_tick_size():
	return cost

func try_cut(cost_left):
	if cost_left < minimum_cost:
		return 0
	return cost_left - (cost_left % grow_cost)