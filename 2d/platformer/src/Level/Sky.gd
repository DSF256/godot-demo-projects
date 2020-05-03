#class containing behavior for the sky in the game. The Sky increases and
#decreases brightness to mimic night and day.
class_name GameSky
extends ParallaxLayer

#Called when the player first starts the game. The convertion between
#night and day repeats forever.
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
		modulate = Color(N,N,N)
		#pauses for 20 seconds
		yield(get_tree().create_timer(20.0), "timeout")
		for n in range(1,20):
			#pauses for 5 seconds
			yield(get_tree().create_timer(5.0), "timeout")
			#increases darkness
			N = N * 0.9
			modulate = Color(N,N,N)
		yield(get_tree().create_timer(20.0), "timeout")
		for n in range(1,20):
			yield(get_tree().create_timer(5.0), "timeout")
			#decreases darkness
			N = N / 0.9
			modulate = Color(N,N,N)
			
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(modulate is Color)
	assert(get_tree() != null)
