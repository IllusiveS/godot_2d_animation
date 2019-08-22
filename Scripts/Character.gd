extends KinematicBody2D

export var speed : int
export var turn_speed : float

onready var animation_tree = $AnimationTree
onready var state_machine = animation_tree["parameters/StateMachine/playback"]
var target_direciton : Vector2
var direction : Vector2
var h_flip = 1
var target_h_flip = 1

func _ready():
	target_direciton = Vector2()
	direction = Vector2()
	pass # Replace with function body.

func set_move_target(target : Vector2):
	target_direciton = target * speed
	pass

func _process(delta):
	flip_horizontal(delta)
	target_direciton = move_and_slide(target_direciton)
	direction = target_direciton
	animation_tree["parameters/Movement/blend_position"] = direction.normalized().length()
	pass

func begin_talking():
	state_machine.travel("Talking")
	pass

func flip_horizontal(delta):
	if direction.x > 0:
		target_h_flip = -1
	
	if direction.x < 0:
		target_h_flip = 1
	
	if target_h_flip == 1:
		h_flip += turn_speed * delta
		if h_flip > 1:
			h_flip = 1
	
	if target_h_flip == -1:
		h_flip -= turn_speed * delta
		if h_flip < -1:
			h_flip = -1
	
	print(h_flip)
	$"Polygons".scale.x = h_flip
	$"Skeleton".scale.x = h_flip
	pass
