extends Control

# Is created in UI_game

var action

func _ready():
	$TextureRect.texture = action_image 

func set_action(action):
	self.action = action
	$TextureRect.texture = action.icon

func _on_button_down():
	action.get_editor().edit()