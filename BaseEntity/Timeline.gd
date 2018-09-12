extends Control

var actions = []
var snap_size = 5
onready var wait_action = Action_manager.get_node("Wait")

func _ready():
	for i in range(Time_manager.total_tick):
		actions.append(wait_action)

func get_action(tick):
	return actions[tick]

func get_all_actions():
	var all_actions = []
	var preview_action = wait_action
	for i in range(actions.size()):
		if actions[i] != wait_action and actions[i] != preview_action:
			all_actions.append(actions[i])
			preview_action = actions[i]
	return all_actions

func cut_action(tick):
	if actions[tick] != wait_action:
		pass
		 #d actions[tick].minimum_cost > 

func move_action(from_tick, to_tick):
	var movement = from_tick - to_tick
	var action = actions[from_tick]
	if action == wait_action or movement == 0:
		return
		
	var action_start = _get_action_start(from_tick)
	var action_desired_start = action_start + movement
	# the action fits, just put it there
	if can_add_action(action, action_desired_start):
		remove_action(action_start)
		add_action(action, action_desired_start)
		return
	# else, try to slide it at a maximum of snap_size ticks
	var i  = 1
	while abs(i) < snap_size: 
		if can_add_action(action, action_desired_start + i):
			remove_action(action_start)
			add_action(action, action_desired_start + i)
		i = i * -1 if i > 0 else i * -1 + 1
	# move in consequence

func add_action(from_tick,action):
	if can_add_action(from_tick, action):
		var to_tick = from_tick + action.get_tick_size()
		for i in range (from_tick, to_tick + 1):
			actions[i] = action

func remove_action(tick):
	if actions[tick] == wait_action:
		return
	var action = actions[tick]
	var action_start = _get_action_start(tick)
	while actions[action_start] == action:
		actions[action_start] = wait_action
		action_start += 1

func play_timeline():
	pass

func preview_timeline():
	for i in range (0, actions.size()):
		print ( str(i + " : " + actions[i].name ))
	pass

func can_add_action(from_tick, action):
	var to_tick = from_tick + action.get_tick_size()
	for i in range(from_tick , to_tick + 1):
		if actions[i] != wait_action:
			return false
	return true

func empty():
	actions = []

func _get_action_start(tick):
	var action = actions[tick]
	while tick >= 0 or actions[tick] == action:
		tick -= 1
	return tick + 1
	