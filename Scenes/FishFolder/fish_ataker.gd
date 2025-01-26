extends RigidBody2D

@export var detection_radius: float = 200  # Радиус обнаружения цели
@export var speed: float = 70  # Скорость движения
@export var max_speed: float = 110  # Скорость движения
@export var random_direction_interval: float = 3.0  # Время смены случайного направления

var target: Node2D  # Цель, которая будет найдена динамически
var current_direction: Vector2 = Vector2.ZERO  # Текущее случайное направление
var random_direction_timer: float = 0.0

func _ready():
			# Попытка найти target динамически
	var parent_scene = get_parent()  # Получаем родительскую сцену (море)
	if parent_scene:
		target = parent_scene.get_node_or_null("MainLevel/Area2D/Bubble")  # Ищем узел bubble
		if target:
			print("Target (bubble) найден:", target.name)
		else:
			print("Target (bubble) не найден.")
	
	$Area2D.connect("body_entered", Callable(self, "_on_body_collision"))

func _physics_process(delta):
	
	if target:
		var distance_to_target = global_position.distance_to(target.global_position)
		if distance_to_target <= detection_radius:
			react_to_target(delta)
		else:
			move_randomly(delta)
	else:
		random_direction_interval
		move_randomly(delta)

func react_to_target(delta):
	var direction = (target.global_position - global_position).normalized()
	rotate_towards(direction)
	linear_velocity = direction * max_speed  # Двигаемся к цели

func move_randomly(delta):
	random_direction_timer -= delta
	if random_direction_timer <= 0:
		# Смена случайного направления
		current_direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()
		random_direction_timer = random_direction_interval

	# Движение в случайном направлении
	linear_velocity = current_direction * speed
	rotate_towards(current_direction)

func rotate_towards(direction: Vector2):
	# Устанавливаем поворот рыбы
	rotation = atan2(direction.y, direction.x)
	
	# Убираем перевороты "пузом вверх" (ограничиваем поворот только горизонтальными ориентациями)
	if rotation > PI / 2 or rotation < -PI / 2:
		$Sprite2D.flip_h = false
		rotation += PI  # Разворачиваем рыбу
	else:
		$Sprite2D.flip_h = true

func _integrate_forces(state):
	if linear_velocity.length() < speed * 0.8:  # Если столкнулись с препятствием
		# Меняем направление случайным образом
		current_direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()
		random_direction_timer = random_direction_interval

func _on_body_collision(body):
	if body == target:
		print("Коллизия с целью!")
		if target.has_method("pop"):
			target.pop()
			self.position = Vector2(-90,0)
