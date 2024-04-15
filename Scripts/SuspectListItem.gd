extends VFlowContainer

class_name SuspectListItem

@export var summoned_button_group : ButtonGroup 
@export var toggle_button_guilty : BaseButton
@export var toggle_button_involved : BaseButton
@export var toggle_button_summoned : BaseButton

@export var suspect_name_label : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	toggle_button_summoned.button_group = summoned_button_group

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
