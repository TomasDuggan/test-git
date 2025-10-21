extends ProgressBar
class_name CharacterHPBar

const TWEEN_HP_BAR_DURATION := 0.5


func update_hp_bar(current_hp: int, max_hp: int)  -> void:
	var tween: Tween = create_tween()
	var normalized_current_hp: float = current_hp / float(max_hp)
	
	tween.tween_property(self, "value", normalized_current_hp, TWEEN_HP_BAR_DURATION)
	tween.finished.connect(func(): tween.kill(), CONNECT_ONE_SHOT)
