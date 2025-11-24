extends CharacterBody2D


const SPEED = 50


func _physics_process(delta: float) -> void:
	# Add the gravity.
	velocity.x = SPEED
	move_and_slide()

	
