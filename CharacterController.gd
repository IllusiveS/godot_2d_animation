extends Node

export var character_controlled : NodePath
var character_to_control : Character

var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	character_to_control = get_node(character_controlled)
	pass # Replace with function body.

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	if Input.is_action_pressed('left'):
		velocity.x -= 1
	if Input.is_action_pressed('down'):
		velocity.y += 1
	if Input.is_action_pressed('up'):
		velocity.y -= 1
	velocity = velocity.normalized()
	character_to_control.set_move_target(velocity)


func _process(delta):
	get_input()
	pass
