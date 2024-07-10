extends Node

const levels = preload("res://data/levels.gd").Database

var is_running = false
var score = 0

func load_level(target_level):
	Global.current_level = target_level
	is_running = true
	get_tree().reload_current_scene()

func complete_level():
	for level in levels:
		if levels[level]["name"] == levels[Global.current_level]["unlocks"]:
			levels[level]["unlocked"] = true
			
		if level == Global.current_level:
			if levels[Global.current_level]["best_score"] < score:
				levels[Global.current_level]["best_score"] = score
				
	Global.current_level = null
	is_running = false
	score = 0
	
	get_tree().change_scene_to_file("res://menus/level_select.tscn")
	

func _process(delta):
	if Input.is_action_just_pressed("exit_level"):
		complete_level()
	
