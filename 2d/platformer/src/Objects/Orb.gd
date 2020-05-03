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
#Parameter: _body - the Players body
func _on_body_entered(_body):
	#Pre conditions:
	#animationPlayer is type AnimationPlayer (Takes care of null check as well)
	assert(animation_player is AnimationPlayer)

	###METHOD BODY  START ###
	if(self.visible):
		#Plays a noise so the user knows it was collected
		animation_player.play("picked")
		#Sends a signal to Player, increasing their amount of coins
		emit_signal("orbCollected")
		
	self.visible = false;
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(animation_player is AnimationPlayer)
