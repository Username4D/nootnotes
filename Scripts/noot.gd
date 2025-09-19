extends AnimatedSprite2D

func _input(event):
	if event is InputEventKey and event.pressed and not event.is_echo():
		self.frame = 0
		self.play("default")
		UiHandler.coins += 1

func _process(delta: float) -> void:
	$Label.text = var_to_str(UiHandler.coins) + " Coins"
