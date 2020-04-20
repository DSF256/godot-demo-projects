extends ParallaxLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


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
		 # Replace with function body.
		
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
