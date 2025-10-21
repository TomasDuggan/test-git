extends Control
class_name CharacterHP

@export_category("Editor Dependencies")
@export var _hp_bar: CharacterHPBar

signal died()
signal damage_received()
signal healed()

var _max_hp: int
var _current_hp: int


func initialize(hp: int) -> void:
	_max_hp = hp
	_current_hp = hp
	
	_hp_bar.update_hp_bar(_current_hp, _max_hp)

func receive_damage(info: DamageInfo) -> int:
	_current_hp = max(_current_hp - info.damage, 0)
	_hp_bar.update_hp_bar(_current_hp, _max_hp)
	
	if _current_hp == 0:
		died.emit()
	else:
		damage_received.emit()
	
	return info.damage

func heal(heal_amount: int) -> int:
	var total_heal_done := heal_amount
	
	_current_hp = min(_current_hp + total_heal_done, _max_hp)
	_hp_bar.update_hp_bar(_current_hp, _max_hp)
	healed.emit()
	
	return total_heal_done


#
