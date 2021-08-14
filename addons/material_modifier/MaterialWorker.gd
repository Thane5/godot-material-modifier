tool
extends VBoxContainer


const ALBEDO_PANEL_PATH = "MaterialProperties/VBoxContainer/Albedo Panel"
const METALLIC_PANEL_PATH = "MaterialProperties/VBoxContainer/Metallic Panel"
const ROUGHNESS_PANEL_PATH = "MaterialProperties/VBoxContainer/Roughness Panel"
export(NodePath) var MaterialPathArea
export(NodePath) var textEditPath


var albedoPanel
var metallicPanel
var roughnessPanel

var currentResourcePath
var currentResource
var changeCounter = 0


func _on_Modify_pressed():
	if typeof(currentResourcePath) == TYPE_STRING_ARRAY:
		_modify_materials()
	else:
		print("No material selected")

func _modify_materials():
	albedoPanel = get_node(ALBEDO_PANEL_PATH)
	metallicPanel = get_node(METALLIC_PANEL_PATH)
	roughnessPanel = get_node(ROUGHNESS_PANEL_PATH)

	for singlePath in currentResourcePath:
		var currentResource #= SpatialMaterial.new()
		currentResource = load(singlePath)

		#	Apply parameters set through the UI
		if albedoPanel.active == true:
			currentResource.albedo_color = albedoPanel.albedoColor
			changeCounter = changeCounter+1

		if metallicPanel.metallicActive == true:
			currentResource.metallic = metallicPanel.metallicValue
			changeCounter = changeCounter+1

		if metallicPanel.specularActive == true:
			currentResource.metallic_specular = metallicPanel.specularValue
			changeCounter = changeCounter+1

		if roughnessPanel.active == true:
			currentResource.roughness = roughnessPanel.roughness
			changeCounter = changeCounter+1
			
		var textField = get_node(textEditPath)
		var typedProperties = textField.text.strip_edges().split("\n")
		#	Apply parameters set through the command line
		if textField.text == null:
			#print("TextField is empty")
			pass
		else:	
			var properties = textField.text.strip_edges().split("\n")
			for property in typedProperties:
				var propertyArray = (property.split("="))
				var propertyName = propertyArray[0]
				#var propertyValue = propertyArray[1]
				#	alternative way to get propertyValue
				var propertyValue = property.trim_prefix(str(propertyName + "=")) 
				match propertyName:
					"albedo_color": currentResource.albedo_color = Color(propertyValue)
					"albedo_texture": currentResource.albedo_texture = load(propertyValue)
					"anisotropy": currentResource.anisotropy = float(propertyValue)
					"anisotropy_enabled": currentResource.anisotropy_enabled = bool(propertyValue)
					"anisotropy_flowmap": currentResource.anisotropy_flowmap = load(propertyValue)
					"ao_enabled": currentResource.ao_enabled = bool(propertyValue)
					"ao_light_affect": currentResource.ao_light_affect = float(propertyValue)
					"ao_on_uv2": currentResource.ao_on_uv2 = bool(propertyValue)
					"ao_texture": currentResource.ao_texture = load(propertyValue)
					"ao_texture_channel": currentResource.ao_texture_channel = int(propertyValue)
					"clearcoat": currentResource.clearcoat = float(propertyValue)
					"clearcoat_enabled": currentResource.clearcoat_enabled = bool(propertyValue)
					"clearcoat_gloss": currentResource.clearcoat_gloss = float(propertyValue)
					"clearcoat_texture": currentResource.clearcoat_texture = load(propertyValue)
					"depth_deep_parallax": currentResource.depth_deep_parallax = bool(propertyValue)
					"depth_enabled": currentResource.depth_enabled = bool(propertyValue)
					"depth_flip_binormal": currentResource.depth_flip_binormal = bool(propertyValue)
					"depth_flip_tangent": currentResource.depth_flip_tangent = bool(propertyValue)
					"depth_max_layers": currentResource.depth_max_layers = int(propertyValue)
					"depth_min_layers": currentResource.depth_min_layers = int(propertyValue)
					"depth_scale": currentResource.depth_scale = float(propertyValue)
					"depth_texture": currentResource.depth_texture = load(propertyValue)
					"detail_albedo": currentResource.detail_albedo = load(propertyValue)
					"detail_blend_mode": currentResource.detail_blend_mode = int(propertyValue)
					"detail_enabled": currentResource.detail_enabled = bool(propertyValue)
					"detail_mask": currentResource.detail_mask = load(propertyValue)
					"detail_normal": currentResource.detail_normal = load(propertyValue)
					"detail_uv_layer": currentResource.detail_uv_layer = int(propertyValue)
					"distance_fade_max_distance": currentResource.distance_fade_max_distance = float(propertyValue)
					"distance_fade_min_distance": currentResource.distance_fade_min_distance = float(propertyValue)
					"distance_fade_mode": currentResource.distance_fade_mode = int(propertyValue)
					"emission": currentResource.emission = Color(propertyValue)
					"emission_enabled": currentResource.emission_enabled = bool(propertyValue)
					"emission_energy": currentResource.emission_energy = float(propertyValue)
					"emission_on_uv2": currentResource.emission_on_uv2 = bool(propertyValue)
					"emission_operator": currentResource.emission_operator = int(propertyValue)
					"emission_texture": currentResource.emission_texture = load(propertyValue)
					"flags_albedo_tex_force_srgb": currentResource.flags_albedo_tex_force_srgb = bool(propertyValue)
					"flags_disable_ambient_light": currentResource.flags_disable_ambient_light = bool(propertyValue)
					"flags_do_not_receive_shadows": currentResource.flags_do_not_receive_shadows = bool(propertyValue)
					"flags_ensure_correct_normals": currentResource.flags_ensure_correct_normals = bool(propertyValue)
					"flags_fixed_size": currentResource.flags_fixed_size = bool(propertyValue)
					"flags_no_depth_test": currentResource.flags_no_depth_test = bool(propertyValue)
					"flags_transparent": currentResource.flags_transparent = bool(propertyValue)
					"flags_unshaded": currentResource.flags_unshaded = bool(propertyValue)
					"flags_use_point_size": currentResource.flags_use_point_size = bool(propertyValue)
					"flags_use_shadow_to_opacity": currentResource.flags_use_shadow_to_opacity = bool(propertyValue)
					"flags_vertex_lighting": currentResource.flags_vertex_lighting = bool(propertyValue)
					"flags_world_triplanar": currentResource.flags_world_triplanar = bool(propertyValue)
					"metallic": currentResource.metallic = float(propertyValue)					
					"metallic_specular": currentResource.metallic_specular = float(propertyValue)
					"metallic_texture": currentResource.metallic_texture = load(propertyValue)
					"metallic_texture_channel": currentResource.metallic_texture_channel = int(propertyValue)
					"normal_enabled": currentResource.normal_enabled = float(propertyValue)
					"normal_scale": currentResource.normal_scale = float(propertyValue)
					"normal_texture": currentResource.normal_texture = load(propertyValue)				
					"params_alpha_scissor_threshold": currentResource.params_alpha_scissor_threshold = float(propertyValue)
					"params_billboard_keep_scale": currentResource.params_billboard_keep_scale = bool(propertyValue)
					"params_billboard_mode": currentResource.params_billboard_mode = int(propertyValue)
					"params_blend_mode": currentResource.params_blend_mode = int(propertyValue)
					"params_cull_mode": currentResource.params_cull_mode = int(propertyValue)
					"params_depth_draw_mode": currentResource.params_depth_draw_mode = int(propertyValue)
					"params_diffuse_mode": currentResource.params_diffuse_mode = int(propertyValue)
					"params_grow": currentResource.params_grow = bool(propertyValue)
					"params_grow_amount": currentResource.params_grow_amount = float(propertyValue)
					"params_line_width": currentResource.params_line_width = float(propertyValue)
					"params_point_size": currentResource.params_point_size = float(propertyValue)
					"params_specular_mode": currentResource.params_specular_mode = int(propertyValue)
					"params_use_alpha_scissor": currentResource.params_use_alpha_scissor = bool(propertyValue)
					"particles_anim_h_frames": currentResource.particles_anim_h_frames = int(propertyValue)
					"particles_anim_loop": currentResource.particles_anim_loop = bool(propertyValue)
					"particles_anim_v_frames": currentResource.particles_anim_v_frames = int(propertyValue)
					"proximity_fade_distance": currentResource.proximity_fade_distance = float(propertyValue)
					"proximity_fade_enable": currentResource.proximity_fade_enable = bool(propertyValue)
					"refraction_enabled": currentResource.refraction_enabled = bool(propertyValue)
					"refraction_scale": currentResource.refraction_scale = float(propertyValue)
					"refraction_texture": currentResource.refraction_texture = load(propertyValue)
					"refraction_texture_channel": currentResource.refraction_texture_channel = int(propertyValue)
					"rim": currentResource.rim = float(propertyValue)
					"rim_enabled": currentResource.rim_enabled = bool(propertyValue)
					"rim_texture": currentResource.rim_texture = load(propertyValue)
					"rim_tint": currentResource.rim_tint = float(propertyValue)
					"roughness": currentResource.roughness = float(propertyValue)
					"roughness_texture": currentResource.roughness_texture = load(propertyValue)
					"roughness_texture_channel": currentResource.roughness_texture_channel = int(propertyValue)
					"subsurf_scatter_enabled": currentResource.subsurf_scatter_enabled = bool(propertyValue)
					"subsurf_scatter_strength": currentResource.subsurf_scatter_strength = float(propertyValue)
					"subsurf_scatter_texture": currentResource.subsurf_scatter_texture = load(propertyValue)
					"transmission": currentResource.transmission = Color(propertyValue)
					"transmission_enabled": currentResource.transmission_enabled = bool(propertyValue)
					"transmission_texture": currentResource.transmission_texture = load(propertyValue)
					"uv1_offset": 
						var arr = propertyValue.strip_edges().split(",")
						currentResource.uv1_offset = Vector3(arr[0], arr[1], arr[2])
					"uv1_scale": 
						var arr = propertyValue.strip_edges().split(",")
						currentResource.uv1_scale = Vector3(arr[0], arr[1], arr[2])
					"uv1_triplanar": currentResource.uv1_triplanar = bool(propertyValue)
					"uv1_triplanar_sharpness": currentResource.uv1_triplanar_sharpness = float(propertyValue)
					"uv2_offset": 
						var arr = propertyValue.strip_edges().split(",")
						currentResource.uv2_offset = Vector3(arr[0], arr[1], arr[2])
					"uv2_scale": 
						var arr = propertyValue.strip_edges().split(",")
						currentResource.uv2_scale = Vector3(arr[0], arr[1], arr[2])
					"uv2_triplanar": currentResource.uv2_triplanar = bool(propertyValue)
					"uv2_triplanar_sharpness": currentResource.uv2_triplanar_sharpness = float(propertyValue)
					"vertex_color_is_srgb": currentResource.vertex_color_is_srgb = bool(propertyValue)
					"vertex_color_use_as_albedo": currentResource.vertex_color_use_as_albedo = bool(propertyValue)


					_: 
						print("Invalid material parameter: ", propertyName)
						#	subtract 1 so that it reports zero changes at the end
						changeCounter = changeCounter-1
				changeCounter = changeCounter+1

	#	Determine the amound of material changes done by 
	#	dividing the tocal amount of modifications with the amount of materials
	var fileCounter = currentResourcePath.size()
	if fileCounter == 1:
		print("Modified ", changeCounter/fileCounter, " properties on ", currentResourcePath[0].lstrip("res://"))
	else:	
		print("Modified ", changeCounter/fileCounter, " properties on ", fileCounter, " materials")
	changeCounter = 0
		
