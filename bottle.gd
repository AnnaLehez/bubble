extends AnimatedSprite2D

var picked = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	
	print("******** bottle catched ")
	
	print ("body ", body, body_shape_index)
	var bodies = $Area2D.get_overlapping_bodies()
	print(bodies)
	
	if body.name == "Bubble":
		body.pickLitter()
		
	for body1 in bodies:
		print(body.name)
		
	
	pass # Replace with function body.
