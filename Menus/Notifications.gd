extends Control

func notify(time, text):
	$Information/Label.text = text
	$Information/Timer.wait_time = time
	$Information/Timer.start()
	$Information.show()

func _on_Timer_timeout():
	$Information.hide()
