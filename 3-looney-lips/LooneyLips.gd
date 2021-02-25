extends Control

var player_words = []
#var prompts = ["Dylan", "hates", "tomatoes", "strange", "fried tomato with onions", "delicious"]
var prompts = ["a name", "a way you feel about something (verb)", "noun", "adjective", "noun", "adjective"]
var story = "My friend %s %s %s, which is %s, since he used to think %s is %s"

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	display_introduction()
	check_player_words_length()
	PlayerText.grab_focus()

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()

func _on_TextureButton_pressed():
	
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()	
	
func display_introduction():
	DisplayText.text = "Welcome to game of madlibs! You'll be prompted to add specific types of words in the input below and when done you'll be shown a funny story.   "

func add_to_player_words():
#	clear words and show prompt if a story is completed
	if is_story_done():
		player_words = []
		DisplayText.text=""
		prompt_player()
	else:
		player_words.append(PlayerText.text)
		DisplayText.text=""
		PlayerText.clear()
		check_player_words_length()

func is_story_done():
	return player_words.size() == prompts.size()
	
func check_player_words_length():
	if is_story_done():
#		tell_story()
		end_game()
		
			
	else:
		prompt_player()
#		tell_story()
	
func tell_story():
	DisplayText.text = story % player_words
	

func prompt_player():
	DisplayText.text += "May I have " + prompts[player_words.size()] + " please?"
	
func end_game():
	PlayerText.queue_free()
	$VBoxContainer/HBoxContainer/Label.text = 'Again!'
	tell_story()
	pass
