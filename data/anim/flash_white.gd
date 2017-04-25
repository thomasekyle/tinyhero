
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var strength = 100
var duration = 2
var times = 1

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	pass
	
func _process(delta):
	if (times > 0):
		if (duration > 0):
			duration = 2
			times-=1
		else:
			var color = get_parent().get_sprite().get_modulate()
			var mod = (color*delta*strength)
			get_parent().get_sprite().set_modulate(mod)
			duration-=delta
			
	else:
		queue_free()
	


