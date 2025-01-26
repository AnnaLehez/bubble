extends RigidBody2D

@export var target: Node2D   # Цель, на которую рыба реагирует
@export var detection_radius: float = 300  # Радиус, в пределах которого рыба замечает цель
@export var speed: float = 200  # Скорость движения рыбы
@export var random_direction_interval: float = 2.0  # Частота смены направления (секунды)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
