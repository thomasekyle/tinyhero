
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
export var enemy_a = "res://data/enemy/enemy.tscn"
var spawn_pos =[]
export var spawn_pos_taken = [true,true,true,true,true,true]
var wave_list

func _ready():
	if (system.music_player.is_paused()):
		system.reset_music()
	spawn_pos.append(Vector2(495,102))
	spawn_pos.append(Vector2(150,72))
	spawn_pos.append(Vector2(114,308))
	spawn_pos.append(Vector2(440,302))
	spawn_pos.append(Vector2(270,302))
	spawn_pos.append(Vector2(354,40))
	system.wave_num = 1
	system.ui = get_node("ui")
	load_wave()
	system.base = get_node("building")
	system.player = get_node("player")
	system.wave = get_node("Wave1").get_children()
	
	system.time = 0
	system.enemies = get_node("enemies").get_children()
	system.ui.update()
	set_process(true)
	system.turn_pass(1)
	system.ui.show_wave()

	pass

func _process(delta):
	system.enemies = get_node("enemies").get_children()
	system.wave = get_node("Wave" + str(system.wave_num)).get_children()
	system.base = get_node("building")
	system.ui = get_node("ui")
	get_node("player").set_pos(get_global_mouse_pos())
	system.player = get_node("player")
	if (system.enemies.size() == 0 and system.wave.size() == 0):
		check_wave()

	
func load_wave():
	var w = load("res://data/enemy/waves/Wave" + str(system.wave_num) + ".tscn")
	var wave = w.instance()
	wave.set_pos(Vector2(-500,-500))
	add_child(wave)
	wave_list =  get_node("Wave" + str(system.wave_num)).get_children()
	
func check_wave():
	print("Enemies: ", system.enemies.size(), "Enemies in Wave: ", get_node("Wave" + str(system.wave_num)).get_children().size())
	if (system.enemies.size() == 0 and system.wave.size() == 0):
		system.ui.remove_wave()
		#system.ui.wave_complete()
		system.wave_num+=1
		system.ui.show_wave()
		system.player.add_hp_clear()
		system.base.add_health_clear()
		system.ui.update()
		load_wave()
		check_spawn()
		
	
##Check to see if any enemy can move towards the base.
func check_movement():
	var enemies = get_node("enemies").get_children()
	for i in range(enemies.size()):
		enemies[i].move_towards(0.01)
		
func check_enemies():
	system.enemies = get_node("enemies").get_children()

func check_spawn():
	print("Wave Size:", get_node("Wave" + str(system.wave_num)).get_children().size())
	for i in range(spawn_pos.size()):
		if (get_node("enemies").get_children().size() < get_node("Wave" + str(system.wave_num)).max_enemy):
			if (spawn_pos_taken[i] == false):
				if (get_node("Wave" + str(system.wave_num)).get_children().size() > 0):
					var move = get_node("Wave" + str(system.wave_num)).get_child(0)
					get_node("Wave" + str(system.wave_num)).remove_child(move)
					move.set_pos(spawn_pos[i])
					get_node("enemies").add_child(move)
					system.animation_player.play_anim("appear", move.get_pos())
					spawn_pos_taken[i] = true
				

func _on_Button_pressed():
	system.turn_pass(1)

func _on_Button1_pressed():
	check_spawn()
	
	
	
	

###########
# For seeing if enemy spawns are takn
######
func _on_a2d_spawn1_body_enter( body ):
	print("Position1 taken by: ", body)
	spawn_pos_taken[0] = true
	
func _on_a2d_spawn1_body_exit( body ):
	print("Position1 Free")
	spawn_pos_taken[0] = false


func _on_a2d_spawn2_body_enter( body ):
	print("Position2 taken by: ", body)
	spawn_pos_taken[1] = true


func _on_a2d_spawn2_body_exit( body ):
	print("Position2 Free")
	spawn_pos_taken[1] = false


func _on_a2d_spawn3_body_enter( body ):
	print("Position3 taken by: ", body)
	spawn_pos_taken[2] = true


func _on_a2d_spawn3_body_exit( body ):
	print("Position3 Free")
	spawn_pos_taken[2] = false


func _on_a2d_spawn4_body_enter( body ):
	print("Position4 taken by: ", body)
	spawn_pos_taken[3] = true


func _on_a2d_spawn4_body_exit( body ):
	print("Position4 Free")
	spawn_pos_taken[3] = false


func _on_a2d_spawn5_body_enter( body ):
	print("Position5 taken by: ", body)
	spawn_pos_taken[4] = true


func _on_a2d_spawn5_body_exit( body ):
	print("Position5 Free")
	spawn_pos_taken[4] = false


func _on_a2d_spawn6_body_enter( body ):
	print("Position6 taken by: ", body)
	spawn_pos_taken[5] = true


func _on_a2d_spawn6_body_exit( body ):
	print("Position6 Free")
	spawn_pos_taken[5] = false
