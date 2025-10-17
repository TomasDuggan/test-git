extends Control
class_name CharacterHP

@export_category("Editor Dependencies")
@export var _hp_bar: ProgressBar

signal died()
signal damage_received()
signal healed()

var _max_hp: int
var _current_hp: int

const TWEEN_HP_BAR_DURATION := 0.5


func initialize(hp: int) -> void:
	_max_hp = hp
	_current_hp = hp
	
	_update_hp_bar()

func receive_damage(damage: int) -> void:
	_current_hp = max(_current_hp - damage, 0)
	
	if _current_hp == 0:
		died.emit()
	else:
		damage_received.emit()
	
	_update_hp_bar()

func heal(heal_amount: int) -> void:
	_current_hp = min(_current_hp + heal_amount, _max_hp)
	_update_hp_bar()
	healed.emit()

func _update_hp_bar()  -> void:
	var tween: Tween = create_tween()
	var normalized_current_hp: float = _current_hp / float(_max_hp)
	
	tween.tween_property(_hp_bar, "value", normalized_current_hp, TWEEN_HP_BAR_DURATION)
	tween.finished.connect(func(): tween.kill(), CONNECT_ONE_SHOT)


#
