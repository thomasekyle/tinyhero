
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var song

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#system.music_player.is_playing(true)
	
	pass


func _on_btn_start_pressed():
	queue_free()
	system.root.show_level()


func _on_Button_pressed():
	system.music_player.play_track(song)


func _on_btn_quit_pressed():
		get_tree().quit()
