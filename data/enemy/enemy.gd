
extends KinematicBody2D

# member variables here, example:
# var a=2
# var b="textvar"
export var name = "Enemy"
var wait_turn = false
var eid = 0 
export var speed = 1000
export var health = 15
export var max_health = 20
export var atk = 7
var atk_distance = 50
export var def = 0
export var agi = 5
var selected = false
var timer = 0
export var expr = 2
export var gold = 10
var hover_text
var status = "normal"
var status_timer = 0
export var resist_stun = false

func _ready():
	var a = load("res://data/anim/flash_white.tscn")
	var anim = a.instance()
	add_child(anim)
	pass
	
func get_sprite():
	return get_node("spr_enemy")
	
#if an enemy is clicked on call the damage formula, ui popup text, and consume a turn
func _input(event):
	if (wait_turn == false):
		if (Input.is_mouse_button_pressed(BUTTON_LEFT)):
			var damage = Battle.attack(system.player.get_atk(), def)
			get_parent().get_parent().get_node("ui").pop_text(damage, get_pos())
			take_dmg(damage)
			check_death()
			system.player._anim("attack", .25)
			system.animation_player.play_anim("slash", get_pos())
			system.turn_pass(1)
			wait_turn = true
			
		elif(Input.is_mouse_button_pressed(BUTTON_RIGHT) and system.player.get_hp() > 1):
			var damage = Battle.attack(system.player.get_atk()*2, def)
			system.player.use_hp(2)
			get_parent().get_parent().get_node("ui").pop_text(damage, get_pos())
			take_dmg(damage)
			system.wait(2)
			if (resist_stun == false):
				status = "stunned"
				status_timer=randi()%3+1
				system.ui.pop_text("\n+"+status, get_pos())
			check_death()
			system.player._anim("bash", .25)
			system.animation_player.play_anim("bash", get_pos())
			
			system.turn_pass(1)
			
			wait_turn = true
			
	#Event Input Processing continues and any input we need to wait for the user to release the mouse button.
	if (!(Input.is_mouse_button_pressed(BUTTON_LEFT)) and !(Input.is_mouse_button_pressed(BUTTON_RIGHT))):
		wait_turn = false
	

#initialize enemy stats and sprite
func setup(txt, sp, hp, at, de, ag, g, ex):
	var sprite = load("res://data/enemy/" + txt + ".png")
	get_node("spr_enemy").set_texture(sprite)
	name = txt
	speed = sp
	health = hp
	atk = at
	def = de
	agi = ag
	gold = g
	expr = ex
	
func setup_nosprite(txt, sp, hp, at, de, ag, g, ex):
	name = txt
	speed = sp
	health = hp
	atk = at
	def = de
	agi = ag
	gold = g
	expr = ex

#when this method is called move the enemy toward the base
#if the enemy is already at the base it will attack the base
func move_towards(d):
	if (status_timer == 0 and status != "normal"):
		system.ui.pop_text("-"+status, get_pos())
		status = "normal"
	if (status != "normal"):
		system.ui.pop_text("\n\n"+status, get_pos())
		status_timer-=1
	else:
		var base_pos = system.base.get_pos()
		var dir = Vector2(0,0)
		if (base_pos.x < get_pos().x):
			dir += Vector2(-1.0, 0)
		else:
			dir += Vector2(1.0, 0)
		if (base_pos.y < get_pos().y):
			dir += Vector2(0, -1.0)
		else:
			dir += Vector2(0, 1.0)
			
		var com_speed
		if (agi < system.player.get_agi()):
			com_speed = speed / (system.player.get_agi()-agi)
		elif (agi > system.player.get_agi()):
			com_speed = speed * (agi-system.player.get_agi())
		else:
			com_speed = 1000
			
		if (com_speed > 3000):
			com_speed = 3000
		if (com_speed < 500):
			com_speed = 500
		print(com_speed)
		move(dir*(d)*com_speed)

#	if (get_collider().get_instance_ID() == get_parent().get_parent().get_node("building").get_instance_ID()):
#		attack()
	
#attacks the base when the enemy is in range
func attack():
	var damage = 0
	damage += Battle.attack(atk, 5)
	system.base.take_dmg(damage)
	get_parent().get_parent().get_node("ui").pop_text(damage, get_pos())
	pass


func set_health(hp):
	health = hp

func take_dmg(d):
	health -=d


func get_atk():
	return atk

func set_atk(a):
	atk = a

func get_def():
	return def
	
func set_def(d):
	def = d
	
func get_agi():
	return agi

func set_agi(a):
	agi = a

#check if enemy health is less than 0, and if it is play anim and remove
func check_death():
	if (health < 1):
		if (name=="Demon King"):
			system.root.show_gamecomplete()
		#play_death_anim
		#system.remove_enemy(get_instance_ID())
		else:
			get_recvs()
			queue_free()
	

func get_recvs():
	system.player.add_expr(expr)
	system.base.add_gold(gold)
	

#detects when the mouse enters the enemy
func _on_a2d_enemy_mouse_enter():
	print("mouse enter")
	selected = true
	set_process_input(true)
	hover_text(name)
	

#detects when the mouse leaves the enemy
func _on_a2d_enemy_mouse_exit():
	print("mouse leave")
	selected = false
	set_process_input(false)
	remove_child(hover_text)
	
func hover_text(text):
	var pt = preload("res://data/ui/hover_text.tscn")
	hover_text = pt.instance()
	hover_text.set_text(text)
	add_child(hover_text)
