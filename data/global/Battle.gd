
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
	result = atk-def+randi()%2+1
	if (result < 1):
		result = randi()%2+1
	return result


