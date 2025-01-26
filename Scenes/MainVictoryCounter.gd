extends Sprite2D

var victoryPoints = 0
var bagCollected = 0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if victoryPoints>=2:
		print("\n You win, you can swim with the fish now, little trash \n")
	


func _on_bottle_trash_collected(name: Variant) -> void:
	$Trashbar/Bottle.visible = true
	victoryPoints+=1
	pass # Replace with function body.
	


func _on_boot_trash_collected(name: Variant) -> void:
	$Trashbar/Boot.visible = true
	victoryPoints+=1
	pass # Replace with function body.
	



func _on_phone_trash_collected(name: Variant) -> void:
	$Trashbar/Phone.visible = true
	pass # Replace with function body.


func _on_bag_2_trash_collected(name: Variant) -> void:
	
	bagCollected+=1
	if bagCollected<2:
		$Trashbar/Bag1.visible=true
	else :
		$Trashbar/Bag2.visible=true
	victoryPoints+=1


func _on_bag_1_trash_collected(name: Variant) -> void:
	bagCollected+=1

	if bagCollected<2:
		$Trashbar/Bag1.visible=true
	else :
		$Trashbar/Bag2.visible=true
	victoryPoints+=1
	
	pass # Replace with function body.
