
extends Node

# member variables here, example:
# var a=2
# var b="textvar"
var enemy_list= []

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var e = preload("res://data/enemy/enemy.tscn")
	enemy = e.instance()
	enemy.setup("slime", 1000, 15, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 15, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 15, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 15, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 15, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 15, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 15, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 15, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 15, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 15, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 25, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 25, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 25, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 25, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 25, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 25, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 25, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	enemy.setup("slime", 1000, 45, 7, 0, 5, 10, 2)
	enemy_list.append(enemy)
	
func get_enemy_list():
	return enemy_list


