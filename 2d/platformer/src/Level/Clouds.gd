#Class to edit the color of the clouds in a cyclical fashion similar to
#night and day. As the sky gets darker, so do the clouds.
class_name Clouds
extends ParallaxLayer

#This method is called when the level is loaded. It is always running
#and changing the color of the clouds in a night and day fashion.
func _ready():
	var INTEGER = 1
	var N = 1;
	while(INTEGER !=0):
		modulate = Color(1,1,1,1)
		print("Modulating Clouds(Clouds.gd)")
		yield(get_tree().create_timer(20.0), "timeout")
		for n in range(1,20):
			yield(get_tree().create_timer(5.0), "timeout")
			N = N * 0.6
			modulate = Color(1,1,1,N)
			print("Modulating Clouds(Clouds.gd)")
		yield(get_tree().create_timer(20.0), "timeout")
		for n in range(1,20):
			yield(get_tree().create_timer(5.0), "timeout")
			N = N / 0.6
			modulate = Color(1,1,1,N)
			print("Modulating Clouds(Clouds.gd)")
