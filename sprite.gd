extends Sprite2D


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() == true:
		print(event)
		## move directly to targetPoint
		## as the targetPoint should be the mid of the cell we need to add half a cell-size
		#var targetPoint = %GridContainer.get_last_clicked_field_global_position() + Vector2(100, 100)
		## prepare tween
		#var tween = get_tree().create_tween()
		#tween.set_parallel(false)
		#tween.set_ease(Tween.EASE_IN_OUT)
		## move to targetPoint
		#tween.tween_property(self, "global_position", targetPoint, 0.2)
		
		# move along the path to targetPoint
		var targetPoint = %GridContainer.get_last_clicked_field_global_position() #+ Vector2(100, 100)
		var sourcePoint = self.global_position #+ Vector2(100, 100)
		var pathPointsArray = %GridContainer.get_point_path(sourcePoint, targetPoint)
		# remove the first element as we're already there
		pathPointsArray.remove_at(0)
		print("pathPointsArray: ", pathPointsArray)

		# prepare tween
		var tween = get_tree().create_tween()
		tween.set_parallel(false)
		tween.set_ease(Tween.EASE_IN_OUT)
		# now iterate through the path points and move to each point, one after another
		for currTargetPoint in pathPointsArray:
			print("currTargetPoint: ", currTargetPoint)
			var point_end = currTargetPoint + %GridContainer.position + Vector2(102, 102)
			# move to targetPoint (this registers the tweens)
			tween.tween_property(self, "global_position", point_end, 0.5)
		# optionally we can wait for the tweens to finish
		await tween.finished
		print("tween done")
