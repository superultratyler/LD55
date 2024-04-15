extends VFlowContainer

class_name SuspectListItem

@export var summoned_button_group : ButtonGroup 
@export var toggle_button_guilty : BaseButton
@export var toggle_button_involved : BaseButton
@export var toggle_button_summoned : BaseButton

@export var suspect_name_label : RichTextLabel

var _suspect : Suspect

# Called when the node enters the scene tree for the first time.
func _ready():
	toggle_button_summoned.button_group = summoned_button_group
	#toggle_button_guilty.connect("toggled",_on_button_toggled_guilty)
	#toggle_button_involved.connect("toggled",_on_button_toggled_involved)
	#toggle_button_summoned.connect("toggled",_on_button_toggled_summoned)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func set_suspect(suspect : Suspect):
	_suspect = suspect
	toggle_button_guilty.set_pressed_no_signal(_suspect.player_selected_guilty)
	toggle_button_involved.set_pressed_no_signal(_suspect.player_selected_involved)
	toggle_button_summoned.set_pressed_no_signal(_suspect.player_selected_summoned)
	suspect_name_label.text = _suspect.character.display_name

func _on_button_toggled_guilty(toggle : bool):
	if(_suspect):
		_suspect.player_selected_guilty = toggle;

func _on_button_toggled_involved(toggle : bool):
	if(_suspect):
		_suspect.player_selected_involved = toggle;

func _on_button_toggled_summoned(toggle : bool):
	if(_suspect):
		_suspect.player_selected_summoned = toggle;
