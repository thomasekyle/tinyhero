
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	system.reset_music()
	pass




func _on_btn_retry_pressed():
	system.root.show_level()


func _on_btn_quit_pressed():
	system.root.show_title()
