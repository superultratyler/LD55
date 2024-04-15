extends Screen
class_name SuspectSelectionScreen

@export var button_click_catcher : BaseButton
@export var button_close : BaseButton
@export var button_submit : BaseButton
@export var suspect_list : Control
@export var suspect_list_item_template : PackedScene

@export var timeline_incorrect : String
@export var timeline_correct : String


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Create list items for all the suspects using the template list item
	for i in range(Main.instance.suspects.size()):
		var li = suspect_list_item_template.instantiate() as SuspectListItem
		li.set_suspect(Main.instance.suspects[i])
		suspect_list.add_child(li)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func did_win():
	for i in range(Main.instance.suspects.size()):
		if(Main.instance.suspects[i].player_selected_guilty != Main.instance.suspects[i].guilty):
				return false
		if(Main.instance.suspects[i].player_selected_involved != Main.instance.suspects[i].involved):
				return false
		if(Main.instance.suspects[i].player_selected_summoned != Main.instance.suspects[i].summoned):
				return false
	return true

func end_game():
	Main.instance.screen_manager.load_screen("res://Scenes/Screens/EndingScreen.tscn")
	if(current_screen_state == SCREEN_STATE.OPEN):
		exit()

func exit():
	Main.instance.screen_manager.close_modal(self as Screen)

func play_timeline_with_callback(timeline_name: String, callable: Callable):
		play_timeline(timeline_name)
		Dialogic.timeline_ended.connect(callable)


func play_timeline(timeline_name: String):
	# Check if the Timeline exists
	var timeline = DialogicResourceUtil.get_timeline_resource(timeline_name)
	if timeline == null:
		print("[Scene Character] No timeline exists with the name " + timeline_name)
		return false
	
	# Start the Timeline if it exists
	Dialogic.start(timeline_name)


func _on_end_timeline_ended():
	end_game()

func _on_button_submit_pressed():
	if(did_win()):
		play_timeline_with_callback(timeline_correct, _on_end_timeline_ended)
		exit()
	else:
		play_timeline(timeline_incorrect)
		exit()

func _on_button_back_pressed():
	exit()

func _on_button_click_catcher_pressed():
	exit()
