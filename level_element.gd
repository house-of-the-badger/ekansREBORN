extends Node


var target_level = ""

func _on_button_pressed():
	if LevelManager.levels[target_level]["unlocked"] == true:
		LevelManager.load_level(target_level)
	else:
		print("level is locked")
