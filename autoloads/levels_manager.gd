extends Node

var current_level = "level1"
const COLLECTION_NAME_LEVELS = "levels"
const levels = preload("res://data/levels.gd").Database
const gameplay_scene = preload("res://gameplay/gameplay.tscn")
var is_running = false
var score = 0
var gameplay = gameplay_scene
var unlocked_levels = ["level1"]
var starting_snake_length = Levels.Database[current_level].starting_length

func _ready():
	#gameplay.level_won.connect(complete_level)
	var firestore_collection = Firebase.Firestore.collection(COLLECTION_NAME_LEVELS)
	var query = FirestoreQuery.new().from(COLLECTION_NAME_LEVELS)
	var levels = await Firebase.Firestore.query(query)
	print(levels)

func load_level(target_level):
	current_level = target_level
	is_running = true
	get_tree().reload_current_scene()

func complete_level():
	for level in levels:
		if levels[level]["name"] == levels[current_level]["unlocks"]:
			levels[level]["unlocked"] = true
			
		if level == current_level:
			if levels[current_level]["best_score"] < score:
				levels[current_level]["best_score"] = score
				
	current_level = null
	is_running = false
	score = 0
	
	get_tree().change_scene_to_file("res://menus/level_select.tscn")
	

#func _process(delta):
	#if Input.is_action_just_pressed("exit_level"):
		#complete_level()
	
