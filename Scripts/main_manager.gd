extends Node2D
var money: int = 1000
var popularity: int = 70
var risk: int = 1000
var money_per_customer: int = 10

#-------Sounds-----------
const SFX_COIN_DOUBLE_3 = preload("res://Assets/Sounds/sfx_coin_double3.wav")

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
	$NPCSpawner.set_popularity(amount)
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
	
func _on_npc_spawner_customer_entered() -> void:
	add_money(money_per_customer)
	$AudioStreamPlayer2D.stream = SFX_COIN_DOUBLE_3
	$AudioStreamPlayer2D.play()
