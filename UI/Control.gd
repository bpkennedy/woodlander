extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts

onready var label = $Label

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)

func set_max_hearts(value):
	max_hearts = max(value, 1)
	
func set_starting_hearts():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health

func _ready():
	set_starting_hearts()
