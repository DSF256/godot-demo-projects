class_name Jump
extends Area2D
# Collectible that disappears when the player touches it.

onready var animation_player = $AnimationPlayer

onready var jumpHigher = 1

# The jump boost icon only detects collisions with the Player thanks to its collision mask.
# This prevents other characters such as enemies from picking up The jump boost.

# When the player collides with a The jump boost, the The jump boost plays its 'picked' animation.
# The animation takes cares of making the The jump boost disappear, but also deactivates its
# collisions and frees it from memory, saving us from writing more complex code.
# Click the AnimationPlayer node to see the animation timeline.
func _on_body_entered(_body):
	animation_player.play("picked")
