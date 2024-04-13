extends TextureButton

@export var character_name = "Default Name"
@export var timeline_name = ""
@export var text_label: RichTextLabel

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
		print("[Dialogic] No timeline exists with the name" + timeline_name)
		return
	
	# Start the Timeline if it exists
	Dialogic.start(timeline_name)
