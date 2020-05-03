#Class that contains information and behavior for Orbs. 
#It's a Collectible that disappears when the player touches it.
class_name Orb
extends Area2D

#Animation that makes a sounds when the coin is collected.
onready var animation_player:AnimationPlayer = $AnimationPlayer
signal orbCollected

# The Orbs only detects collisions with the Player thanks to its collision mask.
# This prevents other characters such as enemies from picking up orbs.

# When the player collides with an orb, the orb plays its 'picked' animation.
# The orb is then set to be invisible and unable to be collected again by the
# player.
func _on_body_entered(_body):
	if(self.visible):
		animation_player.play("picked")
		print("_on_body_entered function(Orb.gd)")
		emit_signal("orbCollected")
		
	self.visible = false;
	print("_on_body_entered function(Orb.gd) visible = false")
