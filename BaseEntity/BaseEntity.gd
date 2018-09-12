extends KinematicBody2D

signal health_modified
signal state_modified

var health = 200
var max_health = 300
var speed = 200
var action_speed = 2
var attack = 20
var defense = 20
var weapons = {}
const action_path = "res://BaseEntity/Actions/"
var actions = {
	"motion" : [
		"Motions/Movement.tscn"
	],
	"action" : [
		
	]
}
export (Texture) var profile
var state

func _ready():
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
