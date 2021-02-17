extends Control

func _ready():
	var prompts = ["Dylan", "hates", "tomatoes", "strange", "fried tomato with onions", "delicious"]
	var story = "My friend %s %s %s, which is %s, since he used to think %s is %s"
	$VBoxContainer/DisplayText.text = story % prompts

func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)

func update_DisplayText(words):
	$VBoxContainer/DisplayText.text = words
	$VBoxContainer/PlayerText.clear();
