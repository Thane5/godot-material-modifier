@tool
extends HBoxContainer

@export var fileDialogPath: NodePath
@export var MatModifier: NodePath



func _on_OpenButton_pressed():
	var fileDialog = get_node(fileDialogPath)
	fileDialog.popup_centered()


func _on_FileDialog_Mat_files_selected(paths):
	#print(get_node("..").name) #Parent loads fine...

	#print("Selected files: ", paths)
	get_node(MatModifier).currentResourcePath = paths

	if paths.size() == 1:
		print("Selected material: ", paths)
		get_node("LoadPath").set_text(paths[0])


	else:
		
		print("Selected " , paths.size(), " materials: ", paths)
		var lastSlash = paths[0].rfind("/")
		var text = paths[0].rstrip(paths[0].substr(lastSlash+1))
		
#		get_node("LoadPath").set_text(text + " [Multiple]")
		get_node("LoadPath").set_text(text + " [" + var_to_str(paths.size()) + " Selected]")


##	In case the user wants to manually paste in a path
#func _on_LoadPath_text_changed(path):
#	print("Selected files: ", path)
#	var pathArray = []
#	pathArray.append(path)
#	get_node(MatModifier).currentResourcePath = pathArray
