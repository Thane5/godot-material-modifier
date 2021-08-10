tool
extends Button

export(NodePath) var ExpandAreaPath

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	icon = get_icon('GuiTreeArrowDown', 'EditorIcons')
	set_button_icon(icon)
	var ExpandArea = get_node(ExpandAreaPath)
	ExpandArea.set_visible(true)

func _toggled(button_pressed):
	if(button_pressed) == true:
		icon = get_icon('GuiTreeArrowDown', 'EditorIcons')
		set_button_icon(icon)
		var ExpandArea = get_node(ExpandAreaPath)
		ExpandArea.set_visible(true)
	else:
		icon = get_icon('GuiTreeArrowRight', 'EditorIcons')
		set_button_icon(icon)
		var ExpandArea = get_node(ExpandAreaPath)
		ExpandArea.set_visible(false)
