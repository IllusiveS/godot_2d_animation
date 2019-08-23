extends Node

export var character_controlled : NodePath
var character_to_control

var velocity = Vector2()

func _ready():
	character_to_control = get_node(character_controlled)
	pass

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	if Input.is_action_pressed('ui_select'):
		character_to_control.begin_talking()
	velocity = velocity.normalized()
	character_to_control.set_move_target(velocity)


func _process(delta):
	get_input()
	pass
