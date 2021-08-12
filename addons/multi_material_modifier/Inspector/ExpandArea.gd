@tool
extends Button

@export var ExpandAreaPath: NodePath


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	icon = get_theme_icon('GuiTreeArrowDown', 'EditorIcons')
	set_button_icon(icon)
	var ExpandArea = get_node(ExpandAreaPath)
	ExpandArea.set_visible(true)
#	var font = get_theme_font("default")
#	set_button_font(font)

func _toggled(button_pressed):
	if(button_pressed) == true:
		icon = get_theme_icon('GuiTreeArrowDown', 'EditorIcons')
		set_button_icon(icon)
		var ExpandArea = get_node(ExpandAreaPath)
		ExpandArea.set_visible(true)
	else:
		icon = get_theme_icon('GuiTreeArrowRight', 'EditorIcons')
		set_button_icon(icon)
		var ExpandArea = get_node(ExpandAreaPath)
		ExpandArea.set_visible(false)
