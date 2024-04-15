extends Node2D
class_name Main

static var instance : Main

@export var screen_manager : ScreenManager
@export var audio_stream : AudioStreamPlayer
@export var suspects : Array[Suspect]

# Called when the node enters the scene tree for the first time.
func _ready():
	instance = self
	screen_manager.load_screen("res://Scenes/Screens/TitleScreen.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
