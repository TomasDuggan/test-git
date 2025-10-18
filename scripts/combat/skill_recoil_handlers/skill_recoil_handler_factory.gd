extends Object
class_name SkillRecoilHandlerFactory

static func new_skill_recoil_handler(type: SkillRecoilConfig.SkillRecoilType) -> SkillRecoilHandler:
	match type:
		SkillRecoilConfig.SkillRecoilType.LOSE_HP:
			return LoseHPSkillRecoilHandler.new()
		_:
			push_error("No deberia llegar aca!!! Handler no encontrado para el type " + EnumsHelper.enum_to_string(SkillRecoilConfig.SkillRecoilType, type))
			return null
