extends ScrollContainer

var color_button_scene = preload("res://scenes/color_button.tscn")

func _ready() -> void:
	for i in $HBoxContainer.get_children():
		i.pressed.connect(press.bind(i))
	UiHandler.mode_update.connect(m_update)
	PurchaseManager.reload_colors.connect(refresh)

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

func refresh():
	print("refresh")
	for i in $HBoxContainer.get_children():
		i.queue_free()
	for i in PurchaseManager.bought_colors:
		var new = color_button_scene.instantiate()
		new.color = i
		new.name = var_to_str(i)
		new.toggle_mode = true
		new.pressed.connect(press.bind(new))
		$HBoxContainer.add_child(new)
