#Class to hold information and behavior about the Coins in the game.
#Coins are a collectable to disappear when collected by the player.
class_name Coin
extends Area2D

#Animation that makes a sounds when the coin is collected.
onready var animation_player:AnimationPlayer = $AnimationPlayer
#sends a signal to Player to increase the amount of coins by 1
signal coinCollected

# The Coins only detects collisions with the Player thanks to its collision mask.
# This prevents other characters such as enemies from picking up coins.

# When the player collides with a coin, the coin plays its 'picked' animation.
# The coin is then set to be invisible and no longer able to be collected.
# Click the AnimationPlayer node to see the animation timeline.
#Parameter: _body - the Players body
func _on_body_entered(_body) -> void:
		#Pre conditions:
	#animationPlayer is type AnimationPlayer (Takes care of null check as well)
	assert(animation_player is AnimationPlayer)

	###METHOD BODY  START ###
	if(self.visible):
		#Plays a noise so the user knows it was collected
		animation_player.play("picked")
		#Sends a signal to Player, increasing their amount of coins
		emit_signal("coinCollected")
		
	self.visible = false
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(animation_player is AnimationPlayer)
