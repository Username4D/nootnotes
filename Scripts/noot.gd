extends AnimatedSprite2D

func _input(event):
	if event is InputEventKey and event.pressed:
		self.frame = 0
		self.play("default")
