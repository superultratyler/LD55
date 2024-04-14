extends Node2D
class_name Main

@export var screen_manager : ScreenManager
@export var audio_stream : AudioStreamPlayer
static var AUDIO_STREAM_GLOBAL : AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	AUDIO_STREAM_GLOBAL = audio_stream
	screen_manager.load_screen("res://Scenes/Screens/SuspectsScreen.tscn")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
