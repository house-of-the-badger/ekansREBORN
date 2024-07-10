extends Timer

var level = Levels.Database[Global.current_level]

# Called when the node enters the scene tree for the first time.
func _ready():
	wait_time = level.poop_despawn_timer
