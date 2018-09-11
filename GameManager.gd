extends Node

export var world = ""

sync func _on_menu_play():
	load(world).instance()
