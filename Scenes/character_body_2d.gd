extends CharacterBody2D


const SPEED = 300.0
const max_speed = 10.0

const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) :
	# Add the gravity.
	#if not is_on_floor():
		if velocity.y >-1:
			velocity.y -=1

	# Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
		
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 2
		if Input.is_action_pressed("ui_down"):
			velocity.y += 2
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 2
		if Input.is_action_pressed("ui_right"):
			velocity.x += 2
			
			
		#if velocity.length() > 0:
			#velocity = velocity.normalized()
		## Accelerate toward the input direction
			#velocity = velocity.move_toward(input_dir * max_speed, acceleration * delta)
		#else:
			 ##friction to slow down the character when no input is detected
			#velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

			
			
		var current_speed = velocity.length()
			# Print speed to the console
		print("Current Speed: ", current_speed)
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	# Calculate current speed
		


		move_and_slide()
