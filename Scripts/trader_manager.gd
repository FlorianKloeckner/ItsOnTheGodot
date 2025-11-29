extends Node2D

signal trader_arrived

const TRAIDER_JOE = preload("res://Scenes/TraiderJoe.tscn")
var trader


func _ready():
	instantiate_trader()
#instantiate Trader
func instantiate_trader():
	trader = TRAIDER_JOE.instantiate()
	trader.transform = $TraderSpawnLocation.transform
	add_child(trader)
	
#make trader move
func _on_trader_hitbox_body_entered(body: Node2D) -> void:
	trader.drop_sack()
	trader_arrived.emit()
