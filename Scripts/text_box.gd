extends TextEdit

func _ready() -> void:
	UiHandler.mode_update.connect(m_update)
	self.grab_focus()

func m_update() -> void:
	if UiHandler.mode == "type":
		self.editable = true
		self.grab_focus()
		
	else:
		self.editable = false
