class_name Clouds
extends ParallaxLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	var INTEGER = 1
	var N = 1;
	while(INTEGER !=0):
		modulate = Color(1,1,1,1)
		yield(get_tree().create_timer(20.0), "timeout")
		for n in range(1,20):
			yield(get_tree().create_timer(5.0), "timeout")
			N = N * 0.6
			modulate = Color(1,1,1,N)
		yield(get_tree().create_timer(20.0), "timeout")
		for n in range(1,20):
			yield(get_tree().create_timer(5.0), "timeout")
			N = N / 0.6
			modulate = Color(1,1,1,N)

