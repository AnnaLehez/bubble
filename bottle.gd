extends RigidBody2D

var picked = false
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
	var bodies = $Area2D.get_overlapping_bodies()
	
	
	if body.name == "Bubble":
		print("******** bottle catched ")
		picked = true
		picker = body
		body.pickLitter(self)
		
