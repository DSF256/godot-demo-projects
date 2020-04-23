class_name Coin
extends Area2D
# Collectible that disappears when the player touches it.

onready var animation_player = $AnimationPlayer
signal coinCollected

# The Coins only detects collisions with the Player thanks to its collision mask.
# This prevents other characters such as enemies from picking up coins.

# When the player collides with a coin, the coin plays its 'picked' animation.
# The animation takes cares of making the coin disappear, but also deactivates its
# collisions and frees it from memory, saving us from writing more complex code.
# Click the AnimationPlayer node to see the animation timeline.
func _on_body_entered(_body):
	if(self.visible):
		animation_player.play("picked")
		
	self.visible = false;
	emit_signal("coinCollected")
