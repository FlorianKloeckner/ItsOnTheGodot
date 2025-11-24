extends Node2D
var money: int = 0
var popularity: int = 0
var risk: int = 0
var money_per_customer: int = 10

#-------Sounds-----------
const SFX_COIN_DOUBLE_3 = preload("res://Assets/Sounds/sfx_coin_double3.wav")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_npc_spawner_customer_entered() -> void:
	money += money_per_customer
	print(money)
	$AudioStreamPlayer2D.stream = SFX_COIN_DOUBLE_3
	$AudioStreamPlayer2D.play()
	
