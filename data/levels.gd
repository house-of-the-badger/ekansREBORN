class_name Levels


const Database = {
	"level1": {
		"name": "level1",
		"speed": 2000,
		"starting_length": 10,
		"poop_despawn_timer": 5,
		"has_prunes": false,
		'mouse': {
			'has_mouse': false,
			'spawn_timer': null
		},
		'melon': {
			'has_melon': false,
		},
		"best_score": 0,
		"unlocked": true,
		"unlocks": "level2",
	},
	"level2": {
		"name": "level2",
		"speed": 2500,
		"starting_length": 20,
		"poop_despawn_timer": 4.5,
		"has_prunes": true,
		'mouse': {
			'has_mouse': false,
			'spawn_timer': null
		},
		'melon': {
			'has_melon': false,
		},
		"best_score": 0,
		"unlocked": false,
		"unlocks": "level3",
	},
	"level3": {
		"name": "level3",
		"speed": 3000,
		"starting_length": 30,
		"poop_despawn_timer": 4,
		"has_prunes": true,
		'mouse': {
			'has_mouse': true,
			'spawn_timer': 4
		},
		'melon': {
			'has_melon': false,
		},
		"best_score": 0,
		"unlocked": false,
		"unlocks": "level4",
	},
	"level4": {
		"name": "level4",
		"speed": 3500,
		"starting_length": 40,
		"poop_despawn_timer": 3.5,
		"has_prunes": true,
		'mouse': {
			'has_mouse': true,
			'spawn_timer': 3
		},
		'melon': {
			'has_melon': true,
		},
		"best_score": 0,
		"unlocked": false,
		"unlocks": "level5",
	},
	"level5": {
		"name": "level5",
		"speed": 4000,
		"starting_length": 50,
		"poop_despawn_timer": 3,
		"has_prunes": true,
		'mouse': {
			'has_mouse': true,
			'spawn_timer': 2
		},
		'melon': {
			'has_melon': true,
		},
		"best_score": 0,
		"unlocked": false,
		"unlocks": "level6",
	},
	"level6": {
		"name": "level6",
		"speed": 4500,
		"starting_length": 60,
		"poop_despawn_timer": 2.5,
		"has_prunes": true,
		'mouse': {
			'has_mouse': true,
			'spawn_timer': 1
		},
		'melon': {
			'has_melon': true,
		},
		"best_score": 0,
		"unlocked": false,
	},
}
