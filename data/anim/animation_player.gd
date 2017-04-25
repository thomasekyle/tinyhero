
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var level_up = preload("res://data/anim/level_up.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func play_anim(anim, pos):
	var path = "res://data/anim/" + str(anim) + ".tscn"
	var anim = load(path)
	var a = anim.instance()
	a.set_pos(pos)
	add_child(a)


