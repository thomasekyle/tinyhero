
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"
var type
var max_health = 27
var health = 27
var def = 5
var costs = 100
var gold = 0
var town_costs = [100,100]

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func get_health():
	return health
	
func add_health_clear():
	health+=(max_health/2)
	if (health > max_health):
		health = max_health

func get_max_health():
	return max_health

func add_max_health():
	if (gold >= town_costs[0]):
		system.ui.pop_text("+hp", get_pos())
		health+=5
		max_health+=5
		gold-=town_costs[0]
		town_costs[0]+=100
	
func get_hp_upgradecost():
	return town_costs[0]

func add_def():
	if (gold >= town_costs[1]):
		system.ui.pop_text("+def", get_pos())
		def+=3
		gold-=town_costs[1]
		town_costs[1]+=100

func get_def():
	return def
	
func get_def_upgradecost():
	return town_costs[1]

func add_gold(g):
	gold+=g

func get_gold():
	return gold

func take_dmg(d):
	get_parent().get_node("ui").pop_text(d, get_pos())
	health-=d
	if (health < 0):
		health = 0
	
func check_death():
	return (health < 1)
	
func _on_a2d_bulding_body_enter( body ):
	var node = get_node(body.get_path())
	if (node.get_instance_ID() != get_instance_ID()):
		print("Attacker Close to base: ", node, "Attack: ", node.get_atk())
		system.attackers.append(node)
	pass

func _on_a2d_bulding_body_exit( body ):
	print("Attacker removed from base: ", body)
	var node = get_node(body.get_path())
	var index = system.attackers.find(node)
	if (index > -1):
		system.attackers.remove(index)
