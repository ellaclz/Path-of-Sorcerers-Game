@tool 
class_name Pickup extends Area2D

@export var item: Item = null: set = set_item

@onready var _sprite_2d: Sprite2D = %Sprite2D
@onready var _audio_stream_player: AudioStreamPlayer2D = %AudioStreamPlayer2D
@onready var _animation_player: AnimationPlayer = %AnimationPlayer

func _ready() -> void:
	set_item(item)
	
	_animation_player.plau("idle")
	body_entered.connect(func (body: Node2D) -> void:
		if body is Player:
			item.use(body)
		_animation_player.play("destroy")
		set_deferred("monitoring", false)
		_audio_stream_player.play()
		_animation_player.animation_finished.connect(func (_animation_name: String) -> void:
			queue_free()
		)
	)

func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	if item == null:
		warnings.append("The pickup has no item assigned. Please Assign an item to the pickup in the inspector")
	return warnings 
	

func set_item(value: Item) -> void:
	item 
