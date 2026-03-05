# Godot - Find path and move along

Find a path to the clicked cell and move along the path to that cell.

## grid_container.gd

This script is attached to the central GridContainer.
The GridContainer is representing the whole grid which holds all the cells (ColorRects).
The `grid_container.gd` provides functions for registering the `last_clicked...` and `last_hovered...` positions as reported by the cells.
In its `_ready` function it sets up the AStarGrid2D object.
It offers the `get_point_path` function that can be used to request a path from one given point to another.

## color_rect.gd

This script is attached to all the ColorRects which form the cells of the 4x4 grid.
Each grid handles the `_gui_input` event (for itself).
When the cell is clicked it reports the `last_clicked_field_global_position` and the `last_clicked_field_id` to the central GridContainer.

## lines.gd

This script holds functions to draw the path as a line when the mouse hovers over grid fields.
It reads the `last_hovered_field_global_position` from the central GridContainer.
It requests a path from the Sprites current `global_position` to the `last_hovered_field_global_position`.
Then it draws a line for each step of the path.

## sprite.gd

The player sprite. This script holds the handling of moving the sprite from its current position to the given (clicked) target position.
The movement goes along the path lines which are requested from the GridContainer.