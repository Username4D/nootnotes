extends Button

var start_pos = Vector2.ZERO
var new_line
func _ready() -> void:
	self.visible = false
	UiHandler.mode_update.connect(m_update)

func m_update():
	if UiHandler.mode == "draw" or UiHandler.mode == "clear":
		self.visible = true
	else:
		self.visible = false

func _on_pressed():
	if UiHandler.mode == "draw":
		start_pos = get_viewport().get_mouse_position() + Vector2(-32, $"../ScrollContainer".scroll_vertical - 96)
		new_line = Line2D.new()
		new_line.width =24.0
		new_line.modulate.a = 0.2
		new_line.default_color = UiHandler.color
		new_line.add_point(start_pos)
		new_line.add_point(start_pos)
		$"../ScrollContainer/Control/TextEdit".add_child(new_line)
	else:
		for i in $"../ScrollContainer/Control/TextEdit".get_children():
			if i.points[0].x > i.points[1].x and get_viewport().get_mouse_position().x < i.points[0].x + 32 and get_viewport().get_mouse_position().x > i.points[1].x + 32:
				if i.points[0].y + $"../ScrollContainer".scroll_vertical + 88 < get_viewport().get_mouse_position().y and get_viewport().get_mouse_position().y< i.points[0].y + $"../ScrollContainer".scroll_vertical + 24 + 88:
					i.queue_free()
			if i.points[0].x < i.points[1].x and get_viewport().get_mouse_position().x > i.points[0].x + 32 and get_viewport().get_mouse_position().x < i.points[1].x + 32:
				if i.points[0].y + $"../ScrollContainer".scroll_vertical + 88 < get_viewport().get_mouse_position().y and get_viewport().get_mouse_position().y< i.points[0].y + $"../ScrollContainer".scroll_vertical + 24 + 88:
					i.queue_free()
func _on_button_up() -> void:
	if UiHandler.mode == "draw":
		new_line.modulate.a = 0.3
		new_line = null

func _process(delta: float) -> void:
	if new_line:
		new_line.set_point_position(1, Vector2(get_viewport().get_mouse_position().x - 32,new_line.points[0].y))

func make_line(x, y, z):
	start_pos = x
	var xnew_line = Line2D.new()
	xnew_line.width =24.0
	xnew_line.modulate.a = 0.3
	xnew_line.default_color = z
	xnew_line.add_point(start_pos)
	xnew_line.add_point(y)
	$"../ScrollContainer/Control/TextEdit".add_child(xnew_line)
