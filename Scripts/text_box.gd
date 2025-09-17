extends TextEdit

func _ready() -> void:
	UiHandler.mode_update.connect(m_update)

func m_update() -> void:
	if UiHandler.mode == "type":
		self.editable = true
		self.grab_focus()
		
	else:
		self.editable = false
