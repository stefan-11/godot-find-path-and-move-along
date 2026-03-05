extends GridContainer

var last_clicked_field_id: Vector2i
var last_clicked_field_global_position: Vector2
var last_hovered_field_id: Vector2i
var last_hovered_field_global_position: Vector2
var astar_grid: AStarGrid2D

func get_last_clicked_field_id() -> Vector2i:
	return last_clicked_field_id

func get_last_clicked_field_global_position() -> Vector2:
	return last_clicked_field_global_position

func get_last_hovered_field_id() -> Vector2i:
	return last_clicked_field_id

func get_last_hovered_field_global_position() -> Vector2:
	return last_hovered_field_global_position

func get_point_path(from_id: Vector2i, to_id: Vector2i) -> PackedVector2Array:
	var point_array: PackedVector2Array = []
	#point_array.push_back(Vector2(100,100))
	#point_array.push_back(Vector2(100,200))
	#point_array.push_back(Vector2(200,200))
	
	point_array = astar_grid.get_point_path(last_clicked_field_id, last_hovered_field_id)
	
	return point_array


func _ready() -> void:
	astar_grid = AStarGrid2D.new()
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	#astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ALWAYS
	#astar_grid.region = Rect2i(0, 0, 4, 4)
	#astar_grid.cell_size = Vector2(100, 100)
	#astar_grid.offset = Vector2(50, 50)
	astar_grid.region = Rect2i(0, 0, %GridContainer.columns, 4)
	astar_grid.cell_size = Vector2(204, 204) #Vector2(%GridContainer.size) / %GridContainer.columns
	print("cell size: ", astar_grid.cell_size)
	#astar_grid.offset = astar_grid.cell_size / 2
	astar_grid.update()

	# set_point_solid expects an id, it is called after update because update deletes point data
	#astar_grid.set_point_solid(Vector2i(1, 1), true)
	#astar_grid.set_point_weight_scale(Vector2i(1,1), 1.1)
	print(astar_grid.get_id_path(Vector2i(0, 0), Vector2i(3, 3))) # Prints [(0, 0), (1, 1), (2, 2), (3, 3), (3, 4)]
	print(astar_grid.get_point_path(Vector2i(0, 0), Vector2i(3, 3))) # Prints [(0, 0), (16, 16), (32, 32), (48, 48), (48, 64)]
	
	# for testing output child count (4x4=16)
	print(get_child_count(false))
	# as we know the columns we can find the cell
	var cellId = Vector2i(1, 0)
	var cellIndex = columns * cellId.x + cellId.y
	print(cellIndex, get_child(cellIndex, false).name)
	
