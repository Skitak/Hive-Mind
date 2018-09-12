extends Control

export (Texture) var action_image
var action

func _ready():
	$TextureRect.texture = action_image 

func set_action(action):
	self.action = action
	# Do stuff