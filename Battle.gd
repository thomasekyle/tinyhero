
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
var result

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func attack(atk, def):
	if (atk-def < 1):
		result = atk - def
	else:
		result = 1


