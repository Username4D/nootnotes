extends Button

@export var color: Color = Color("cccfc5")

func _ready() -> void:
	$color.modulate = color
	
func bshow():
	$bg.visible = true

func bhide():
	$bg.visible = false
