extends Node2D

@onready var _telephone: Aread2D = %Teleporter 

func _ready() -> void:
	_teleporter.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			_end_menu.open()
	)

var _start_times
