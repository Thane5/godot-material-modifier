@tool
extends Button

@export var ExpandAreaPath: NodePath


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _enter_tree():
#	icon = get_theme_icon('GuiTreeArrowDown', 'EditorIcons')
#	set_button_icon(icon)
#	var ExpandArea = get_node(ExpandAreaPath)
#	ExpandArea.set_visible(true)
	
func _enter_tree():
	icon = get_theme_icon('GuiTreeArrowDown', 'EditorIcons')
	set_button_icon(icon)
	var ExpandArea = get_node(ExpandAreaPath)
	ExpandArea.set_visible(true)
	var textColor = get_theme_color("font_color", "Editor")
	
	self.add_theme_color_override("font_color", textColor)
	self.add_theme_color_override("font_hover_color", textColor)
	self.add_theme_color_override("font_pressed_color", textColor)
	
	self.add_theme_color_override("icon_color", textColor)
	self.add_theme_color_override("icon_hover_color", textColor)	
	self.add_theme_color_override("icon_pressed_color", textColor)

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
