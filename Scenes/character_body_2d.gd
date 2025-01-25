extends CharacterBody2D


const max_speed = 50.0



func _physics_process(delta: float) :
	# Add the gravity.
		velocity = Vector2.ZERO
	
		if velocity.y >-20:
			velocity.y -=1
			
	# Slow down if no movement
		if velocity.x > 0:
			velocity.x -=1
			
		if velocity.x < 0:
			velocity.x +=1

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
		
		if velocity.length() > 0:
			velocity = velocity.normalized() * max_speed
			
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
