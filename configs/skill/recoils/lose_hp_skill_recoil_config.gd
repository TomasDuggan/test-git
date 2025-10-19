extends SkillRecoilConfig
class_name LoseHPSkillRecoilConfig

@export var hp_amount: int
@export var pierce_armor: bool
@export var pierce_mr: bool


func get_recoil_type() -> SkillRecoilType:
	return SkillRecoilType.LOSE_HP
