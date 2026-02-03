extends Area





export var line = "ตื่นเถอะแกะ."


func _ready():
	pass





func player_use():
	Global.player.UI.message(line, true)
