
extends Node2D

var text
var timer
var speed = 0


func _ready():
	system.sound_player.play_sound("enemy_appear")
	timer = .5
	set_process(true)
	pass
	
func _process(delta):
	var o = get_opacity()
	var pos = get_pos()
	
	if (timer < 0):
		queue_free()
	var dir = Vector2(0,0)
	pos += dir*delta*speed
	set_pos(pos)
	set_opacity(o - (delta/timer))
	timer-=delta