
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var max_enemy = 4
var boss_wave = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	if (system.wave_num < 5):
		system.reset_music()
	if (5 <= system.wave_num  and system.wave_num <= 10):
		system.reset_music2()
	if (10 <= system.wave_num  and system.wave_num <= 15):
		system.reset_music3()
	if (15 <= system.wave_num  and system.wave_num <= 20):
		system.reset_music4()
	pass
	
	


