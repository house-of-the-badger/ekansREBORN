extends Node


@onready var level_element_scene = load("res://menus/level_element.tscn")

func _ready():
	for level in LevelManager.levels:
		var spawned_element = level_element_scene.instantiate()
		
		spawned_element.get_node("HBoxContainer").get_node("Label").text = LevelManager.levels[level]["name"]
		spawned_element.get_node("HBoxContainer2").get_node("Label").text = "Best Score: " + str(LevelManager.levels[level]["best_score"])
		
		if LevelManager.levels[level]["unlocked"] == false:
			spawned_element.get_node("HBoxContainer").get_node("Label").modulate = Color(0, 0, 0)
			spawned_element.get_node("HBoxContainer2").get_node("Label").modulate = Color(0, 0, 0)
			
		spawned_element.target_level = level
		get_node("ScrollContainer").get_node("GridContainer").add_child(spawned_element)
