extends Node2D

@export var fish_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnFish()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawnFish() ->void:
		# Create a new instance of the Fish scene.
	var fish = fish_scene.instantiate()

		# Choose a random location on Path2D.
	var fish_spawn_location = $FishPath/FishSpawnLocation
	fish_spawn_location.progress_ratio = randf()
	
		# Set the fish direction perpendicular to the path direction.
	var direction = fish_spawn_location.rotation + PI / 2
	
	# Set the mob's position to a random location.
	fish.position = fish_spawn_location.position

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	fish.rotation = direction
	
		# Choose the velocity for the mob.
	var velocity = Vector2(30, 0.0)
	fish.linear_velocity = velocity.rotated(direction)
	
		# Spawn the mob by adding it to the Main scene.
	add_child(fish)
	
