
extends Node2D

var name
export var level = 1
export var hero_power = 10
export var max_hero_power = 10
export var atk = 5
export var def = 5
export var agi = 5
export var expr = 0
export var expr_next = 20
var expr_curv = 3
var stat_points = 0
var costs = [2,2,2]
var anim_timer = 0


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _process(delta):
	if (anim_timer > 0):
		anim_timer-= delta
	else:
		get_node("spr_player").set_animation("default")
		
func _anim(anim, t):
	anim_timer = t
	get_node("spr_player").set_animation(anim)
	set_process(true)
	
func setup(n, l, hp, at,  de, ag):
	name = n
	level = l
	hero_power = hp
	atk = at
	def = de
	agi = ag

func get_expr():
	return expr
	
func add_expr(e):
	expr+=e
	while (expr >= expr_next):
		expr_next+= (20*(level-1))+20
		level_up()
		system.ui.pop_text("Level Up!", get_pos())
		system.animation_player.play_anim("level_up", get_pos())
		
		
	
func get_expr_next():
 return expr_next

func level_up():
	stat_points+=(5+(level-1)) 
	level+=1
	

func get_level():
	return level

func get_statpoints():
	return stat_points

func add_hp(h):
	if (stat_points >= (costs[0]/2)):
		stat_points-=(costs[0]/2)
		max_hero_power+=h
		hero_power+=h
		costs[0]+=1

func add_hp_clear():
	hero_power += (max_hero_power/2)
	if (hero_power > max_hero_power):
		hero_power = max_hero_power
	
func get_hp():
	return hero_power

func use_hp(h):
	hero_power-=h

func get_hp_cost():
	return costs[0]/2
	
func add_max_hp(h):
	max_hero_power+=h

func get_max_hp():
	return max_hero_power

func add_atk(a):
	if (stat_points >= (costs[1]/2)):
		stat_points-=(costs[1]/2)
		atk+=a
		costs[1]+=1
	
func get_atk():
	return atk

func get_atk_cost():
	return costs[1]/2

func add_agi(a):
	if (stat_points >= (costs[2]/2)):
		stat_points-=(costs[2]/2)
		agi+=a
		costs[2]+=1
	
func get_agi():
	return agi

func get_agi_cost():
	return costs[2]/2

