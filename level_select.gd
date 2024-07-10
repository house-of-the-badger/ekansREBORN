extends Node


const level_element_scene = preload("res://menus/level_item.tscn")

func _ready():
	for level in LevelsManager.levels:
		var spawned_element = level_element_scene.instantiate()
		
		spawned_element.get_node("PanelContainer").get_node("MarginContainer").get_node("VBoxContainer").get_node("GridContainer").get_node("LevelNumber").text = LevelsManager.levels[level]["name"]
		spawned_element.get_node("PanelContainer").get_node("MarginContainer").get_node("VBoxContainer").get_node("HighScore").text = "Best Score: " + str(LevelsManager.levels[level]["best_score"])
		
		
		if LevelsManager.levels[level]["unlocked"] == false:
			spawned_element.get_node("PanelContainer").get_node("MarginContainer").get_node("VBoxContainer").get_node("GridContainer").get_node("LevelNumber").modulate = Color(0, 0, 0)
			spawned_element.get_node("PanelContainer").get_node("MarginContainer").get_node("VBoxContainer").get_node("HighScore").modulate = Color(0, 0, 0)
			
		spawned_element.target_level = level
		get_node("ScrollContainer").get_node("VBoxContainer").add_child(spawned_element)
