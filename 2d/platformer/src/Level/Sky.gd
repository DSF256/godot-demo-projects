#class containing behavior for the sky in the game. The Sky increases and
#decreases brightness to mimic night and day.
class_name GameSky
extends ParallaxLayer

#Called when the player first starts the game. The convertion between
#night and day repeats forever.
func _ready():
	var INTEGER = 1
	var N = 1;
	while(INTEGER !=0):
		modulate = Color(N,N,N)
		print("Modulating Sky(Sky.gd)")
		yield(get_tree().create_timer(20.0), "timeout")
		for n in range(1,20):
			yield(get_tree().create_timer(5.0), "timeout")
			N = N * 0.9
			modulate = Color(N,N,N)
			print("Modulating Sky(Sky.gd)")
		yield(get_tree().create_timer(20.0), "timeout")
		for n in range(1,20):
			yield(get_tree().create_timer(5.0), "timeout")
			N = N / 0.9
			modulate = Color(N,N,N)
			print("Modulating Sky(Sky.gd)")
