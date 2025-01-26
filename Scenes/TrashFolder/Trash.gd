extends RigidBody2D

var picked = false
var collected = false
var picker:Node2D

signal trashCollected(name)

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

	if body.name == "Bubble" and !collected and body.loaded==false:
		print("******** bottle catched ")
		picked = true
		picker = body
		body.pickLitter(self)
		
	if body.name == "Bubble" and !collected and !picked and body.loaded==true :
		body.pop()
		

func collect():
	#$Sprite2D.visible = false
	#$Area2D/smallCollision.visible = false
	print ("bottle - i am collected ", picker.position)
	picked = false
	collected = true
	#$Area2D/smallCollision.disabled = true
	$Sprite2D.visible = false
	self.position = Vector2(-700,-5)
	emit_signal("trashCollected",self)
  
