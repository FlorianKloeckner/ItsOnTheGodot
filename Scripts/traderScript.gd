extends Node2D

var SPEED = 15.0

func _physics_process(delta: float) -> void:
	$CharacterBody2D.velocity.x = -1 * SPEED
	$CharacterBody2D.move_and_slide()

func walk():
	$CharacterBody2D/AnimatedSprite2D.play("walk")

func drop_sack():
	$CharacterBody2D/AnimatedSprite2D.play("sack_drop")
	SPEED = 0
