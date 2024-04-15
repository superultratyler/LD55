extends Screen
class_name EndingScreen

@export var ending_narration : AudioStreamMP3


# Called when the node enters the scene tree for the first time.
func _ready():
	Main.instance.audio_stream.stream = ending_narration
	Main.instance.audio_stream.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
