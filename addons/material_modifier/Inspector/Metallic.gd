@tool
extends PanelContainer

const METALLIC_DEFAULT = 0
const SPECULAR_DEFAULT = 0.5

var metallicValue = METALLIC_DEFAULT
var specularValue = SPECULAR_DEFAULT

var metallicActive = false
var specularActive = false




func _on_Metallic_toggled(button_pressed):
	metallicActive = button_pressed


func _on_Metallic_Slider_value_changed(value):
	get_node("VBoxContainer/Metallic Value/Metallic_SpinBox").set_value(value)
	metallicValue = value


func _on_Metallic_SpinBox_value_changed(value):
	get_node("VBoxContainer/Metallic Value/Metallic_Slider").set_value(value)
	metallicValue = value


func _on_Specular_toggled(button_pressed):
	specularActive = button_pressed


func _on_Specular_Slider_value_changed(value):
	get_node("VBoxContainer/Specular Value/Specular_SpinBox").set_value(value)
	specularValue = value


func _on_Specular_SpinBox_value_changed(value):
	get_node("VBoxContainer/Specular Value/Specular_Slider").set_value(value)
	specularValue = value

#	Restore defaults on metallic
func _on_Metallic_Reset_pressed():
	metallicValue = METALLIC_DEFAULT
	get_node("VBoxContainer/Metallic Value/Metallic_Slider").set_value(METALLIC_DEFAULT)
	get_node("VBoxContainer/Metallic Value/Metallic_SpinBox").set_value(METALLIC_DEFAULT)

#	Restore defaults on specular
func _on_Specular_Reset_pressed():
	specularValue = SPECULAR_DEFAULT
	get_node("VBoxContainer/Specular Value/Specular_Slider").set_value(SPECULAR_DEFAULT)
	get_node("VBoxContainer/Specular Value/Specular_SpinBox").set_value(SPECULAR_DEFAULT)
