extends CanvasLayer

func _ready():
	set_visible(false)

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused

func _on_Continue_pressed():
	get_tree().paused = false
	set_visible(false)

func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible

func _on_Fullscreen_pressed():
	OS.window_fullscreen = !OS.window_fullscreen

func _on_Quit_pressed():
	get_tree().quit()

func _on_Retry_pressed():
	get_tree().get_root().propagate_call("on_retry")
	# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	set_visible(false)
	get_tree().paused = false

