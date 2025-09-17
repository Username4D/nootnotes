extends HBoxContainer

func _ready() -> void:
	$share.pressed.connect(mode_button_pressed.bind($share))
	$exit.pressed.connect(mode_button_pressed.bind($exit))
	$save.pressed.connect(mode_button_pressed.bind($save))
	$type.pressed.connect(mode_button_pressed.bind($type))
	$draw.pressed.connect(mode_button_pressed.bind($draw))
	
func mode_button_pressed(button):
	UiHandler.mode = button.name
	for i in self.get_children():
		if i != button:
			i.button_pressed = false
