extends Area





export var key_name = "กุญแจโรงแรม"


func _ready():
	pass





func player_use():
	Global.player.key_found = true
	Global.player.UI.notify(key_name + " เก็บแล้ว", Color(0, 1, 0))
	get_parent().queue_free()
