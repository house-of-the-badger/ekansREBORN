extends CanvasLayer
const START_SCREEN = preload("res://menus/start_screen.tscn")

const start_screen_scene:PackedScene = preload("res://menus/start_screen.tscn")

func _on_button_pressed():
	queue_free()
