
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
var animation_player
var sound_player
var music_player
var root
var attackers = []
var base
var player
var enemies
var wave
var wave_num
var time
var score
var actions
var ui
var turns = 0

func _ready():
	var anim_p = preload("res://data/anim/animation_player.tscn")
	var sound_p = preload("res://data/audio/se/se.tscn")
	var music_p = preload("res://data/audio/bgm/streamplayer.tscn")
	animation_player = anim_p.instance()
	sound_player = sound_p.instance()
	music_player = music_p.instance()
	add_child(animation_player)
	add_child(sound_player)
	add_child(music_player)
	system.reset_music()
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func set_root():
	var ch = get_tree().get_root().get_node("root").get_children()
	for i in range(ch.size()):
		print(ch[i].get_name())
	root = get_tree().get_root().get_node("root")

func check_movement():
	for i in range(enemies.size()):
		if (enemies[i] != null):
			enemies[i].move_towards(0.01)


func remove_enemy(id):
	for i in range(enemies.size()):
		if (enemies[i].get_instance_ID() == id):
			enemies.remove(i)

func check_attackers():
	var total_dmg = 0
	for i in range(attackers.size()):
		if (attackers[i].status == "normal"):
			total_dmg += Battle.attack(attackers[i].get_atk(), system.base.get_def())
	if (total_dmg > 0):
		base.take_dmg(total_dmg)
		animation_player.play_anim("enemy_attack", base.get_pos())
		if (base.check_death()):
			system.root.show_gameover()
			

func check_ranged_atk():
	pass

func turn_pass(t):
	turns += t
	check_movement()
	check_attackers()
	check_ranged_atk()
	system.root.get_node("level").check_wave()
	system.root.get_node("level").check_spawn()
	print("System Turn Num: ", turns)
	
	ui.update()
	
func get_turns():
	return turns
	
func get_player():
	return player
	
func get_base():
	return base
	
func reset_music():
	var song = preload("res://data/audio/bgm/tiny_hero_just_getting_started.ogg")
	if (music_player.get_stream() == song):
		pass
	else:
		music_player.set_stream(song)
		music_player.play(0.0)
		music_player.set_paused(false)
		
func reset_music2():
	var song = preload("res://data/audio/bgm/tiny_hero_you_can_do_this.ogg")
	if (music_player.get_stream() == song):
		pass
	else:
		music_player.set_stream(song)
		music_player.play(0.0)
		music_player.set_paused(false)
		
func reset_music3():
	var song = preload("res://data/audio/bgm/tiny_hero_getting_closer.ogg")
	if (music_player.get_stream() == song):
		pass
	else:
		music_player.set_stream(song)
		music_player.play(0.0)
		music_player.set_paused(false)
		
func reset_music4():
	var song = preload("res://data/audio/bgm/tiny_hero_almost_there.ogg")
	if (music_player.get_stream() == song):
		pass
	else:
		music_player.set_stream(song)
		music_player.play(0.0)
		music_player.set_paused(false)
		
func boss_music():
	var song = preload("res://data/audio/bgm/tiny_hero_boss.ogg")
	if (music_player.get_stream() == song):
		pass
	else:
		music_player.set_stream(song)
		music_player.play(0.0)
		music_player.set_paused(false)
		
func boss_music2():
	var song = preload("res://data/audio/bgm/tiny_hero_last_boss.ogg")
	if (music_player.get_stream() == song):
		pass
	else:
		music_player.set_stream(song)
		music_player.play(0.0)
		music_player.set_paused(false)
		
func wait(time):
	var t = Timer.new()
	t.set_wait_time(time)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")

func debug_print(childs):
	for i in range(childs.size()):
		print(childs[i])

