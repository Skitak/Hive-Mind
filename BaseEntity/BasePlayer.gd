extends "res://BaseEntity/BaseEntity.gd"

var actions = {
	"motion" : [
		"Motions/Movement.tscn",
		"Motions/Jump.tscn"
	],
	"action" : [
		"Operations/Hit.tscn",
		"Operations/Grab.tscn",
		"Operations/Shoot.tscn"
	]
}

func _ready():
	pass
