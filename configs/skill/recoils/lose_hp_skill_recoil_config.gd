extends SkillRecoilConfig
class_name LoseHPSkillRecoilConfig

@export var hp_amount: int


func get_recoil_type() -> SkillRecoilType:
	return SkillRecoilType.LOSE_HP
