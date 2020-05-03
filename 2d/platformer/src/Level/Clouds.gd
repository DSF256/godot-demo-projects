#Class to edit the color of the clouds in a cyclical fashion similar to
#night and day. As the sky gets darker, so do the clouds.
class_name Clouds
extends ParallaxLayer

#This method is called when the level is loaded. It is always running
#and changing the color of the clouds in a night and day fashion.
func _ready():
	#Pre conditions
	#Module is of type Color
	#get_tree() is not null
	assert(modulate is Color)
	assert(get_tree() != null)
	
	
	###METHOD BODY  START ###
	var INTEGER = 1
	var N = 1;
	while(INTEGER !=0):
		modulate = Color(1,1,1,1)
		#pauses for 20 seconds
		yield(get_tree().create_timer(20.0), "timeout")
		for n in range(1,20):
			#pauses for 5 seconds
			yield(get_tree().create_timer(5.0), "timeout")
			#increases darkness
			N = N * 0.6
			modulate = Color(1,1,1,N)
		yield(get_tree().create_timer(20.0), "timeout")
		for n in range(1,20):
			yield(get_tree().create_timer(5.0), "timeout")
			#decreases darkness
			N = N / 0.6
			modulate = Color(1,1,1,N)
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(modulate is Color)
	assert(get_tree() != null)
