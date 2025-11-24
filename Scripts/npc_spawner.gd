extends Node2D
signal customer_entered
var HAT_MAN = preload("res://Scenes/HatMan.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var rand = RandomNumberGenerator.new()
	if rand.randf() < 0.05 :
		var instance = HAT_MAN.instantiate()
		add_child(instance)
	
	


func _on_entrance_hitbox_body_entered(body: Node2D) -> void:
	body.queue_free()
	emit_signal("customer_entered")
