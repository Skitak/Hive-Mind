extends Panel

signal joinServer
signal createServer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _on_Create_Server_button_down():
	emit_signal("createServer")


func _on_Join_Server_button_down():
	emit_signal("joinServer")
