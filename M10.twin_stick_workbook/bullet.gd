extends Area2D

var travelled_distance = 0

var damage = 10

func _physics_process(delta):
	const SPEED = 1000
	const RANGE = 1200
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()

func _ready() -> void:
	body_entered.connect(func (body: Node) -> void:
		if body is Mob:
			body.health -= damage
	)
	
	


func _on_body_entered(body: Node2D) -> void:
	queue_free()
	if body.has_method("take_damge"):
		body.take_damage()
		
