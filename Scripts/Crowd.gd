extends YSort

export var min_delay = 3.0
export var max_delay = 5.0

var characters = []

func _ready():
	for node in get_children():
		if node is Character and node.is_in_group("crowd"):
			characters.append(node)
			continue_talking(node)
			pass
	pass

func continue_talking(character : Character):
	var animation_player = character.get_node("AnimationPlayer")
	character.begin_talking()
	var wait_time = randf() * max_delay + min_delay
	yield(get_tree().create_timer(wait_time), "timeout")
	continue_talking(character)
	pass
