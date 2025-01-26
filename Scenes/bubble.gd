extends CharacterBody2D


const max_speed = 150.0
const loaded_speed = 120.0

var loaded: bool = false
var trash:Node2D
signal poped

func _physics_process(delta: float) :
	# Add the gravity.
		var currentSpeed1 = velocity.length()
		#print("Current Speed start: ", currentSpeed1)

		velocity = Vector2.ZERO
		#print("Current Position: ", self.position)
	
		if velocity.y>-10 and 1>velocity.y and !loaded:
			#print("Current Speed in vertical aligner: ", velocity.length())
			

			velocity.y -=0.05
			#print("Up Speed: ", velocity.y)
			#print("Velocity normalized: ", velocity.normalized())
			
	# Slow down if no movement
		if velocity.x > 0:
			velocity.x -=0.5
			
		if velocity.x < 0:
			velocity.x +=0.5

	
		if Input.is_action_pressed("ui_up"):
			velocity.y -= 2
		if Input.is_action_pressed("ui_down"):
			velocity.y += 2
		if Input.is_action_pressed("ui_left"):
			velocity.x -= 2
		if Input.is_action_pressed("ui_right"):
			velocity.x += 2
		
		
		var speed1 = max_speed
		if loaded:
			speed1 = loaded_speed
		if velocity.length() > 0:
			velocity = velocity.normalized() * speed1
			
		#if velocity.length() > 0:
			#velocity = velocity.normalized()
		## Accelerate toward the input direction
			#velocity = velocity.move_toward(input_dir * max_speed, acceleration * delta)
		#else:
			 ##friction to slow down the character when no input is detected
			#velocity = velocity.move_toward(Vector2.ZERO, friction * delta)

			
			
		var current_speed = velocity.length()
			# Print speed to the console
		#print("Current Speed: ", velocity.length())
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	# Calculate current speed
		

		move_and_slide()
		
func pickLitter(litter:Node2D) :
	loaded = true
	trash = litter
	
	$BigBubble.visible = true
	$Bubble.visible = false
	print("Bubble: *** catched " + litter.name)

func pop():
	releaseLitter()	
	self.position = Vector2(0,-90)
	emit_signal("poped")
	
func releaseLitter() :
	loaded = false
	trash.picked = false
	$BigBubble.visible = false
	$Bubble.visible = true
	
	
