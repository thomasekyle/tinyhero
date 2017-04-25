# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var text
var timer
var speed = 350

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	timer = 5
	
	set_process(true)
	pass
	
func _process(delta):
	var o = get_opacity()
	var pos = get_pos()
	
	if (timer < 0):
		set_process(false)
		queue_free()
	var dir = Vector2(1,0)
	pos += dir*delta*speed
	set_pos(pos)
	if (timer < .5):
		set_opacity(o - 0.045)
	timer-=delta

	
func set_text(t):
	text = t