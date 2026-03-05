extends Node2D

var point1: Vector2
var point2: Vector2
var path: PackedVector2Array
var width : int = 10
var color : Color = Color.RED

func _draw() -> void:
	#draw_line(point1, point2 + Vector2(100, 100), color, width)
	if path:
		draw_path(path)

func draw_path(path_array: Array[Vector2]) -> void:
	#print("draw_path", path_array)
	var point_start = %Sprite.position
	for index in range(path_array.size()):
		# to make point_end a global_position we add the gridContainers position
		# to draw mid-cell half a cell widt is added
		var point_end = path_array[index] + %GridContainer.position + Vector2(102, 102)
		draw_line(point_start, point_end, color, width)
		point_start = point_end
	pass

func _process(delta: float) -> void:
	point1 = %Sprite.global_position
	#var mouse_position = get_viewport().get_mouse_position()
	var last_hovered_field_global_position = %GridContainer.get_last_hovered_field_global_position()
	if (last_hovered_field_global_position != point2):
		# as the line should draw in the mid of the cell, half a cell size needs to be added
		point2 = last_hovered_field_global_position
		path = %GridContainer.get_point_path(point1, point2)
		queue_redraw()
