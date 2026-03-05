extends ColorRect

@export var color_default: Color = Color(1.00, 1, 0.33, 1)
@export var color_highlighted: Color = Color(0.608, 0.0, 0.0, 1.0)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		#print("gui input", event)
		#print(self.global_position)
		#print(self.position)
		#print(self.name)
		#print(self.size)
		# tell the GridConteiner the clicked field id and its position
		%GridContainer.last_clicked_field_global_position = self.global_position
		%GridContainer.last_clicked_field_id = self.position / 204

	if event is InputEventMouseMotion:
		self.color = color_highlighted
		# tell the GridContainer the hovered field id and its position
		%GridContainer.last_hovered_field_global_position = self.global_position
		%GridContainer.last_hovered_field_id = self.position / 204
		#get_viewport().set_input_as_handled()
		
		
		
	#print("gui input", event)

func _on_mouse_exited() -> void:
	self.color = color_default
