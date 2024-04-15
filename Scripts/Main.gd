extends Node2D
class_name Main

static var instance : Main

@export var screen_manager : ScreenManager
@export var audio_stream : AudioStreamPlayer
@export var audio_stream_bgm : AudioStreamPlayer
@export var bgm_audiostream = AudioStreamMP3
@export var suspects : Array[Suspect]

# Called when the node enters the scene tree for the first time.
func _ready():
	instance = self
	screen_manager.load_screen("res://Scenes/Screens/TitleScreen.tscn")
	audio_stream_bgm.stream = bgm_audiostream
	audio_stream_bgm.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
