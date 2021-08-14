tool
extends PanelContainer

var albedoColor 
var active = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _enter_tree():
	albedoColor = get_node("Albedo Category/Albedo Value/ColorPickerButton").get_pick_color()
	


func _on_Albedo_CheckBox_toggled(button_pressed):
	active = button_pressed


func _on_ColorPickerButton_color_changed(color):
	albedoColor = color


func _on_Color_Reset_pressed():
	albedoColor = Color(1,1,1,1)
	get_node("Albedo Category/Albedo Value/ColorPickerButton").set_pick_color(albedoColor)

