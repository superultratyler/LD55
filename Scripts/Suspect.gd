extends Node
class_name Suspect

@export var character : DialogicCharacter
@export var guilty : bool
@export var involved : bool
@export var summoned : bool

var player_selected_guilty : bool = false
var player_selected_involved : bool = false
var player_selected_summoned : bool = false
