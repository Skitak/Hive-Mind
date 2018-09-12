extends Control

var actions = []

func _ready():
	for i in range(Time_manager.total_tick):
		actions.append(null)

func get_action(tick):
	pass

func get_all_actions():
	pass

func cut_action(tick):
	pass

func move_action(from_tick, to_tick):
	pass

func add_action(from_tick, action):
	pass

func remove_action(tick):
	pass

func play_timeline():
	pass

func preview_timeline():
	pass

func can_add_action(action):
	pass