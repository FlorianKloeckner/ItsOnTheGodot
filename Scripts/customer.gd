extends CharacterBody2D


var speed = 50


func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity.x = speed
	move_and_slide()

func set_speed(amount: int):
	speed = amount

	
