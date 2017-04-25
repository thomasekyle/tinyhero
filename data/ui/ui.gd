
extends Node2D

# member variables here, example:
# var a=2
# var b="textvar"
var wave
var boss_wave

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func show_wave():
	var w = preload("res://data/ui/show_wave.tscn")
	wave = w.instance()
	add_child(wave)
	
func remove_wave():
	remove_child(wave)
	
func boss_wave():
	var b = preload("res://data/ui/boss_wave.tscn")
	boss_wave = b.instance()
	add_child(boss_wave)
	
func pop_text(text, pos):
		var pt = preload("res://data/anim/pop_text.tscn")
		var pop_text = pt.instance()
		pop_text.set_pos(pos)
		pop_text.set_text(text)
		add_child(pop_text)
	



func update():
	get_node("Control").get_node("lbl_townhealth").set_text("HP:" + str(system.base.get_health()) + "/" + str(system.base.get_max_health()))
	get_node("Control").get_node("lbl_defense").set_text("Def:" + str(system.base.get_def()))
	get_node("Control").get_node("lbl_heropower").set_text("AP:" + str(system.player.get_hp()) + "/" + str(system.player.get_max_hp()))
	get_node("Control").get_node("lbl_attack").set_text("Atk:" + str(system.player.get_atk()))
	get_node("Control").get_node("lbl_agi").set_text("Agi:" + str(system.player.get_agi()))
	get_node("Control").get_node("lbl_exp").set_text("Exp:" + str(system.player.get_expr()) +  "/" + str(system.player.get_expr_next()))
	get_node("Control").get_node("lbl_gold").set_text("Gold:" + str(system.base.get_gold()))
	get_node("Control").get_node("lbl_level").set_text("Lvl:" + str(system.player.get_level()))
	get_node("Control").get_node("lbl_statpoints").set_text("Stat Points:" + str(system.player.get_statpoints()))
	get_node("Control")
	get_node("Control")


# TOWN HP UPGRADE METHODS
func _on_btn_upgrade_hp_mouse_enter():
	get_node("Control").get_node("btn_upgrade_hp").set_text(str(system.base.get_hp_upgradecost()) + "g")


func _on_btn_upgrade_hp_mouse_exit():
	get_node("Control").get_node("btn_upgrade_hp").set_text("Upgrade")

func _on_btn_upgrade_hp_pressed():
	system.base.add_max_health()
	get_node("Control").get_node("btn_upgrade_hp").set_text(str(system.base.get_hp_upgradecost()) + "g")
	update()

# TOWN DEF UPGRADE METHODS
func _on_btn_upgrade_def_mouse_enter():
	get_node("Control").get_node("btn_upgrade_def").set_text(str(system.base.get_def_upgradecost()) + "g")

func _on_btn_upgrade_def_mouse_exit():
	get_node("Control").get_node("btn_upgrade_def").set_text("Upgrade")

func _on_btn_upgrade_def_pressed():
	system.base.add_def()
	get_node("Control").get_node("btn_upgrade_def").set_text(str(system.base.get_def_upgradecost()) + "g")
	update()


func _on_btn_upgrade_agi_mouse_enter():
	get_node("Control").get_node("btn_upgrade_agi").set_text(str(system.player.get_agi_cost()) + " point(s)")


func _on_btn_upgrade_agi_mouse_exit():
	get_node("Control").get_node("btn_upgrade_agi").set_text("+")

func _on_btn_upgrade_agi_pressed():
	system.player.add_agi(1)
	get_node("Control").get_node("btn_upgrade_agi").set_text(str(system.player.get_agi_cost()) + " point(s)")
	update()


func _on_btn_upgrade_atk_mouse_enter():
	get_node("Control").get_node("btn_upgrade_atk").set_text(str(system.player.get_atk_cost()) + " point(s)")


func _on_btn_upgrade_atk_mouse_exit():
	get_node("Control").get_node("btn_upgrade_atk").set_text("+")


func _on_btn_upgrade_atk_pressed():
	system.player.add_atk(1)
	get_node("Control").get_node("btn_upgrade_atk").set_text(str(system.player.get_atk_cost()) + " point(s)")
	update()


func _on_btn_upgrade_ap_mouse_enter():
	get_node("Control").get_node("btn_upgrade_ap").set_text(str(system.player.get_hp_cost()) + " point(s)")


func _on_btn_upgrade_ap_mouse_exit():
	get_node("Control").get_node("btn_upgrade_ap").set_text("+")


func _on_btn_upgrade_ap_pressed():
	system.player.add_hp(5)
	get_node("Control").get_node("btn_upgrade_ap").set_text(str(system.player.get_hp_cost()) + " point(s)")
	update()
