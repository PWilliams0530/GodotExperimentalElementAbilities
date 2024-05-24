extends CharacterBody2D

@onready var velocity_component = $VelocityComponent

func _physics_process(delta):
	look_at(get_global_mouse_position())
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity_component.accelerate_in_direction(direction)
	velocity_component.move(self)
	
func get_movement_vector():
	# if movement right isnt pressed, and left is - then its -1 movement
	var x_movement = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	#y is positive - positive goes first
	var y_movement = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	var captured_movement = Vector2(x_movement,y_movement)
	return captured_movement
