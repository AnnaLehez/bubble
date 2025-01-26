extends Sprite2D

var victoryPoints = 0
var FishStress =0
var bagCollected = 0
var showWictory = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	if victoryPoints>=5:
		print("\n You win, you little trash, you can swim with the fish now \n")
		$HappySeal.visible = true
		

func _on_bottle_trash_collected(name: Variant) -> void:
	$Trashbar/Bottle.visible = true
	victoryPoints+=1
	pass # Replace with function body.
	


func _on_boot_trash_collected(name: Variant) -> void:
	$Trashbar/Boot.visible = true
	victoryPoints+=1



func _on_phone_trash_collected(name: Variant) -> void:
	$Trashbar/Phone.visible = true
	victoryPoints+=1



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
	


func _on_bubble_poped() -> void:
	if victoryPoints<5
		$UnhappySeals/SealNeedHelp.visible=!$UnhappySeals/SealNeedHelp.visible
		$UnhappySeals/SealDisapointed.visible=!$UnhappySeals/SealDisapointed.visible
		$UnhappySeals.visible=true
		$UnhappySeals/Timer.start()
	#var tween = create_tween()
	#tween.tween_property($UnhappySeals)
	
	


func _on_timer_timeout() -> void:
	$UnhappySeals.visible=false
	
