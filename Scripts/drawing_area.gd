extends Button

var start_pos = Vector2.ZERO
var new_line
func _ready() -> void:
	self.visible = false
	UiHandler.mode_update.connect(m_update)

func m_update():
	if UiHandler.mode == "draw":
		self.visible = true
	else:
		self.visible = false

func _on_pressed():
	start_pos = get_viewport().get_mouse_position() + Vector2(-32, $"../ScrollContainer".scroll_vertical - 96)
	new_line = Line2D.new()
	new_line.width =24.0
	new_line.modulate.a = 0.2
	new_line.default_color = UiHandler.color
	new_line.add_point(start_pos)
	new_line.add_point(start_pos)
	$"../ScrollContainer/Control/TextEdit".add_child(new_line)

func _on_button_up() -> void:
	new_line.modulate.a = 0.3
	new_line = null

func _process(delta: float) -> void:
	if new_line:
		new_line.set_point_position(1, Vector2(get_viewport().get_mouse_position().x - 32,new_line.points[0].y))
