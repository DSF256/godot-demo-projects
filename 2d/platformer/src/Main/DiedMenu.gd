extends Control

#Timer for display time of menu.
onready var displayTimer = $DisplayTimer

func _ready():
	visible = false



func close():
	visible = false


func open():
	visible = true
	self.displayTimer.start()
