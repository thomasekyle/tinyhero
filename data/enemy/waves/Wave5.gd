
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var max_enemy = 4
var boss_wave = true

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	system.ui.boss_wave()
	if (system.wave_num > 19):
		system.boss_music2()
	else:
		system.boss_music()
	pass
	


