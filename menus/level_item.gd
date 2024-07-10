extends Node


var target_level = ""

func _on_button_pressed():
	if LevelsManager.levels[target_level]["unlocked"] == true:
		LevelsManager.load_level(target_level)
	else:
		print("level is locked")
