#TODO FIX ugly refernce to customer.set_speed

extends Node2D
var money: int = 1000
var popularity: int = 70
var risk: int = 1000
var money_per_customer: int = 10

#-------Sounds-----------
const SFX_COIN_DOUBLE_3 = preload("res://Assets/Sounds/sfx_coin_double3.wav")

#-------Managers---------
@onready var npc_spawner: Node2D = $NPCSpawner
@onready var trader_manager: Node2D = $TraderManager



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_popularity(10)
	set_money_per_customer(10)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func set_money_per_customer(amount: int):
	money_per_customer = amount
	$"Background/Info Sprites/MoneyPerCustomerSprite/Label".text = str(money_per_customer)
	
	
func set_popularity(amount: int):
	popularity = amount
	npc_spawner.set_popularity(amount)
	$"Background/Info Sprites/PopularitySprite/Label".text = str(popularity)

#adds money, if amount is negative, it subtracts
func add_money(amount: int):
	var tot_money = get_money()
	set_money(tot_money + amount)
	if tot_money + amount < 0:
		return false #for alerting when balance negative

func set_money(amount: int):
	money = amount
	$"Background/Info Sprites/MoneySprite/Label".text = str(amount)

func get_money():
	return money
	
func show_card_screen():
	$Control.visible = true

func hide_card_screen():
	$Control.visible = false
	
func _on_npc_spawner_customer_entered() -> void:
	cash_customer()

func cash_customer():
	add_money(money_per_customer)
	$AudioStreamPlayer2D.stream = SFX_COIN_DOUBLE_3
	$AudioStreamPlayer2D.play()

		

func _on_trader_manager_trader_arrived() -> void:
	npc_spawner.toggle_spawning()
	npc_spawner.freeze_customers()
	for child in $NPCSpawner.get_children():
		if child.get_class() == "Node2D":
			cash_customer()
			await get_tree().create_timer(0.03).timeout
			child.queue_free()
	await get_tree().create_timer(1.5).timeout
	#gradually turn all of the npcs to coin and stop spawning, then show screen
	
	show_card_screen()
