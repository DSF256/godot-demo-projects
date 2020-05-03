extends Control


onready var resume_button = $VBoxContainer/ResumeButton


func _ready():
	print("_ready function(PauseMenu.gd)")
	visible = false


func close():
	print("close function(PauseMenu.gd)")
	visible = false


func open():
	print("open function(PauseMenu.gd)")
	visible = true
	resume_button.grab_focus()
	print("open function(resume_button.grab_focus")


func _on_ResumeButton_pressed():
	print("_on_ResumeButton_pressed function(PauseMenu.gd)")
	get_tree().paused = false
	visible = false
	print("resume button = invisible")


func _on_QuitButton_pressed():
	print("_on_QuitButton_pressed function(PauseMenu.gd)")
	get_tree().quit()
	print("Quit tree for quit button")
