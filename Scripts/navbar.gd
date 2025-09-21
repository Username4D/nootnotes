extends HBoxContainer

func _ready() -> void:
	$shop.pressed.connect(other_button_pressed.bind($shop))
	$save.pressed.connect(other_button_pressed.bind($save))
	$type.pressed.connect(mode_button_pressed.bind($type))
	$draw.pressed.connect(mode_button_pressed.bind($draw))
	$clear.pressed.connect(mode_button_pressed.bind($clear))
	PurchaseManager.reload_navbar.connect(refresh)
	refresh()
	
func mode_button_pressed(button):
	UiHandler.mode = button.name
	UiHandler.mode_update.emit()
	button.button_pressed = true
	for i in self.get_children():
		if i != button:
			i.button_pressed = false

func other_button_pressed(button):
	match button.name:
		"shop":
			$"../shop".visible = true
		"save":
			self.get_parent().save()

func refresh():
	for i in self.get_children():
		if not PurchaseManager.bought_features.find(i.name) == -1:
			i.visible = true
		else:
			i.visible = false
