extends Node2D
signal customer_entered
var HAT_MAN = preload("res://Scenes/HatMan.tscn")
var  APRON_GUY = preload("res://Scenes/ApronGuy.tscn")
var WOMAN = preload("res://Scenes/Woman.tscn")

var popularity: int

var spawning = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawning = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spawning: 
		spawn_npc()

func toggle_spawning():
	spawning = not spawning
	

func spawn_npc():
	var rand = RandomNumberGenerator.new()
	var instance
	if rand.randf() < float(popularity)/100.0:
		var npc_num = rand.randi_range(1, 3)
		if npc_num == 1:
			instance = HAT_MAN.instantiate()
		elif npc_num == 2:
			instance = APRON_GUY.instantiate()
		else:
			instance = WOMAN.instantiate()
		add_child(instance)

func set_popularity(amount: int):
	popularity = amount

func freeze_customers():
	for child in get_children():
		if child.get_class() == "Node2D":
			child.get_child(0).set_speed(0)
	


func _on_entrance_hitbox_body_entered(body: Node2D) -> void:
	body.get_parent().queue_free()
	emit_signal("customer_entered")
