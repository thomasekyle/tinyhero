# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var text
var timer
var speed = 40

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	get_node("lbl_text").set_text(str(text))
	timer = 2
	set_process(true)
	pass
	
func _process(delta):
	var o = get_opacity()
	var pos = get_pos()
	
	if (timer < 0):
		queue_free()
	var dir = Vector2(0,-1)
	pos += dir*delta*speed
	set_pos(pos)
	set_opacity(o - (delta/timer))
	timer-=delta

	
func set_text(t):
	text = t