extends RigidBody2D

@export var detection_radius: float = 100  # Радиус обнаружения цели
@export var initial_speed: float = 50  # Начальная скорость
@export var flee_speed: float = 150  # Скорость при убегании
@export var flee_duration: float = 2.0  # Время убегания после обнаружения цели
@export var random_direction_interval: float = 3.0  # Время смены случайного направления

var target: Node2D  # Цель, которая будет найдена динамически
var current_direction: Vector2 = Vector2.ZERO  # Текущее случайное направление
var random_direction_timer: float = 0.0
var flee_timer: float = 0.0  # Таймер для времени убегания

func _ready():
	# Устанавливаем начальную скорость
	linear_velocity = Vector2.ZERO
	set_speed(initial_speed)
	
	# Попытка найти target динамически
	var parent_scene = get_parent()  # Получаем родительскую сцену (море)
	if parent_scene:
		target = parent_scene.get_node_or_null("Base1/Area2D/Bubble")  # Ищем узел bubble
		if target:
			print("Target (bubble) найден:", target.name)
		else:
			print("Target (bubble) не найден.")

func _physics_process(delta):
	if target:
		var distance_to_target = global_position.distance_to(target.global_position)
		if distance_to_target <= detection_radius:
			flee_from_target(delta)  # Начинаем убегать
		elif flee_timer > 0:
			flee_timer -= delta  # Таймер убегания отсчитывает время
			flee_from_target(delta)  # Продолжаем убегать
		else:
			move_randomly(delta)  # Случайное движение, если рыба не убегает
	else:
		move_randomly(delta)

func flee_from_target(delta):
	# Вычисляем направление от цели
	current_direction = (global_position - target.global_position).normalized()
	rotate_towards(current_direction)  # Поворачиваемся от цели
	
	# Устанавливаем скорость убегания
	set_speed(flee_speed)
	
	# Двигаемся от цели
	linear_velocity = current_direction * flee_speed
	
	# Сброс таймера на убегание (сначала рыба будет убегать по направлению от цели)
	if flee_timer == 0:
		flee_timer = flee_duration  # Устанавливаем таймер убегания на заданное время

func move_randomly(delta):
	random_direction_timer -= delta
	if random_direction_timer <= 0:
		# Смена случайного направления
		current_direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()
		random_direction_timer = random_direction_interval

		# Движение в случайном направлении
	set_speed(initial_speed)  # Устанавливаем начальную скорость
	linear_velocity = current_direction * initial_speed
	
	rotate_towards(current_direction)

func set_speed(speed: float):
	# Устанавливаем скорость
	linear_velocity = linear_velocity.normalized() * speed

func rotate_towards(direction: Vector2):
	# Устанавливаем поворот рыбы
	rotation = atan2(direction.y, direction.x)
	
	# Убираем перевороты "пузом вверх" (ограничиваем поворот только горизонтальными ориентациями)
	if rotation > PI / 2 or rotation < -PI / 2:
		$Sprite2D.flip_h = true
		rotation += PI  # Разворачиваем рыбу
	else:
		$Sprite2D.flip_h = false

func _integrate_forces(state):
	if linear_velocity.length() < initial_speed * 0.8:  # Если столкнулись с препятствием
		# Меняем направление случайным образом
		current_direction = Vector2(randf() * 2 - 1, randf() * 2 - 1).normalized()
		random_direction_timer = random_direction_interval
		flee_timer = 0
