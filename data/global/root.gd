
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
var splash
var title = preload("res://data/ui/title.tscn")
var gameover = preload("res://data/ui/gameover.tscn")
var level = preload("res://data/level/level.tscn")
var gamecomplete = preload("res://data/ui/gamecomplete.tscn")

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	show_title()
	system.set_root()

	pass
	
func show_splash_screen():
	pass
	
func show_title():
	remove_current()
	var t = title.instance()
	add_child(t)

	
func show_level():
	remove_current()
	var l = level.instance()
	add_child(l)
	pass

func show_gameover():
	remove_current()
	var g = gameover.instance()
	add_child(g)
	
func show_gamecomplete():
	remove_current()
	var gc = gamecomplete.instance()
	add_child(gc)
	
func remove_current():
	var scenes =get_children()
	for i in range(scenes.size()):
		scenes[i].queue_free()


