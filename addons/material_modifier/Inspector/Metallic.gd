tool
extends PanelContainer

var metallicValue = 1
var specularValue = 0.5
var metallicActive = false
var specularActive = false
enum VALUE_MODES {
	floatMode,
	colorMode,
	textureMode
}
export(VALUE_MODES ) var currentMode
export(String) var valueName



func _on_Metallic_toggled(button_pressed):
	metallicActive = button_pressed


func _on_Metallic_Slider_value_changed(value):
	get_node("Metallic Category/Metallic Value/Metallic_SpinBox").set_value(value)
	metallicValue = value


func _on_Metallic_SpinBox_value_changed(value):
	get_node("Metallic Category/Metallic Value/Metallic_Slider").set_value(value)
	metallicValue = value


func _on_Specular_toggled(button_pressed):
	specularActive = button_pressed


func _on_Specular_Slider_value_changed(value):
	get_node("VBoxContainer/Specular Value/Specular_SpinBox").set_value(value)
	specularValue = value


func _on_Specular_SpinBox_value_changed(value):
	get_node("VBoxContainer/Specular Value/Specular_Slider").set_value(value)
	specularValue = value


func _on_Metallic_Reset_pressed():
	get_node("VBoxContainer/Metallic Value/Metallic_Slider").set_value(1)
	get_node("VBoxContainer/Metallic Value/Metallic_SpinBox").set_value(1)


func _on_Specular_Reset_pressed():
	get_node("VBoxContainer/Specular Value/Specular_Slider").set_value(0.5)
	get_node("VBoxContainer/Specular Value/Specular_SpinBox").set_value(0.5)
