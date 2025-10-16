extends Control
class_name CharacterHP

signal died()
signal damage_received()

var _max_hp: int
var _current_hp: int


func initialize(hp: int) -> void:
	_max_hp = hp
	_current_hp = hp

func receive_damage(damage: int) -> void:
	_current_hp = max(_current_hp - damage, 0)
	
	if _current_hp == 0:
		died.emit()
	else:
		damage_received.emit()



#
