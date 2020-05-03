#Contains information and behavior for the Title Screen. The Title Screen
#is the first thing the user sees when the game is launched. It has a 'Start'
#and 'Exit' buttons for the user to click.
class_name titleScreen
extends Node

#Member Variables
#Start Button - When clicked, the user begins the game from level 1
onready var _startBtn: Button  = $MarginContainer/VBoxContainer/VBoxContainer/StartBtn
#Exit Button - When clicked, the game closes.
onready var _exitBtn: Button = $MarginContainer/VBoxContainer/VBoxContainer/ExitBtn

#Loads the screen and sets the Start Button as the default choice.
func _ready() -> void:
	#PreConditions
	#StartBtn != null
	assert(_startBtn != null)
	###METHOD BODY  START ###
	
	_startBtn.grab_focus()

	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(_startBtn != null)
	
	
#Processes what the user does before they click on a button. If either button
#is hovered over, the focus goes to that button, until another button is
#hovered over.
#Parameter: _delta - Not used 
func _physics_process(_delta: float) ->void:
	#PreConditions
	#StartBtn and ExitBtn != null
	assert(_startBtn != null)
	assert(_exitBtn != null)
	###METHOD BODY  START ###
	
	if (_startBtn.is_hovered()):
		#Highlight StartButton
		_startBtn.grab_focus()
	if (_exitBtn.is_hovered()):
		#Highlight ExitButton
		_exitBtn.grab_focus()
		
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(_startBtn != null)
	assert(_exitBtn != null)

#Start Button action - Loads Level 1
func _on_StartBtn_pressed():
	#Pre Conditions 
	#Get_Tree is not null
	#Level1 is not null
	assert(get_tree() != null)
	assert(ResourceLoader.exists("res://src/Main/Game.tscn"))
	###METHOD BODY  START ###
	
	get_tree().change_scene("res://src/Main/Game.tscn")
	
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(get_tree() != null)
	assert(ResourceLoader.exists("res://src/Main/Game.tscn"))
	

#Exit Button - closes the application
func _on_exitBtn_pressed() -> void:
	#Pre Conditions 
	#Get_Tree is not null
	assert(get_tree() != null)
	###METHOD BODY  START ###
	
	get_tree().quit()
	
	###METHOD BODY  END ###
	#Post Checks to confirm the pre conditions are still met
	assert(get_tree() != null)
