extends ScrollContainer

func _ready() -> void:
	for i in $HBoxContainer.get_children():
		i.pressed.connect(press.bind(i))
	UiHandler.mode_update.connect(m_update)

func press(button: Node):
	button.bshow()
	button.button_pressed = true
	UiHandler.color = button.color
	for i in $HBoxContainer.get_children():
		if i != button:
			i.bhide()

func m_update():
	if UiHandler.mode == "draw":
		self.visible = true
	else:
		self.visible = false
