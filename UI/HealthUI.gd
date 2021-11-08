extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts

onready var heartUIFull = $HeartUIFull
onready var heartUIEmpty = $HeartUIEmpty

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * 15

func set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_hearts * 15

func set_starting_hearts():
	self.max_hearts = PlayerStats.health
	self.hearts = PlayerStats.health

func _on_Retry_restart_issued():
	# TODO not working
	set_starting_hearts()

func _ready():
	set_starting_hearts()
	var error_code_health = PlayerStats.connect("health_changed", self, "set_hearts")
	var error_code_max_health = PlayerStats.connect("max_health_changed", self, "set_max_hearts")
	if error_code_health != 0:
		print("ERROR: ", error_code_health)
	if error_code_max_health != 0:
		print("ERROR: ", error_code_max_health)
