extends KinematicBody2D

signal health_modified
signal state_modified

export (Texture) var profile

var health = 200
var max_health = 300
var speed = 200
var action_speed = 2
var attack = 20
var defense = 20
var weapons = {}
var state

onready var actions = {
	"motion" : [
		Action_manager.get_node("Motion/Movement").duplicate()
	],
	"operation" : [
		
	]
}

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
