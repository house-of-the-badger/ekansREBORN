extends Node

const  CELL_SIZE:int = 32

var save_data:SaveData

var counter = 0




func _ready():
	save_data = SaveData.load_or_create()
