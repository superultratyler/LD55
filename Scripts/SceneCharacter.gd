extends TextureButton

@export var character_name = "Default Name"
@export var timeline_name = ""
@export var text_label: RichTextLabel
@export var audio_barks : Array[AudioStreamOggVorbis]

# Called when the node enters the scene tree for the first time.
func _ready():
	text_label.clear()
	text_label.add_text(character_name)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _pressed():
	# check if a dialog is already running
	if Dialogic.current_timeline != null:
		return
	
	# Check if the Timeline exists
	var timeline = DialogicResourceUtil.get_timeline_resource(timeline_name)
	if timeline == null:
		print("[Scene Character] No timeline exists with the name " + timeline_name)
		return
	
	# Start the Timeline if it exists
	Dialogic.start(timeline_name)
	
	# Play AudioStream
	if audio_barks.size() > 0:
		var random_index = randi() % audio_barks.size()
		var audio = audio_barks[random_index]
		Main.instance.audio_stream.stream = audio
		Main.instance.audio_stream.play(0)
