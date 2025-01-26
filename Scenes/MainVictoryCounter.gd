extends Sprite2D

const victoryPoints = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bottle_trash_collected(name: Variant) -> void:
	$Trashbar/Bottle.visible = true
	pass # Replace with function body.
