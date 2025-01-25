extends RigidBody2D

var picked = false
var collected = false
var picker:Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if picked == true:
		self.position = picker.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if picked == true:
		self.position = picker.position
		


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	
	print ("body ", body, body_shape_index)

	
	if body.name == "Bubble" and !collected:
		print("******** bottle catched ")
		picked = true
		picker = body
		body.pickLitter(self)
		

func collect():
	#$Sprite2D.visible = false
	#$Area2D/smallCollision.visible = false
	print ("bottle - i am collected ", picker.position)
	picked = false
	collected = true
	$Area2D/smallCollision.disabled = true
	$Sprite2D.visible = false
	self.position = Vector2(-5,-5)
  
