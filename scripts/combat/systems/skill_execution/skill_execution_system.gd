extends Object
class_name SkillExecutionSystem

enum SkillEffectType { DAMAGE, HEAL, ARMOR_UP, APPLY_BLEED, }
enum SkillRecoilType { LOSE_HP, }


static func execute_skill(skill_config: SkillConfig, roll: RollResult) -> void:
	var context := SkillExecutionContext.new()
	
	_handle_skill_effects(skill_config.effect_configs, roll, context)
	_handle_recoil_effects(skill_config.recoil_configs, roll, context)

static func _handle_skill_effects(effect_configs: Array[SkillEffectConfig], roll: RollResult, context: SkillExecutionContext) -> void:
	for skill_effect_config: SkillEffectConfig in effect_configs:
		var handler: SkillEffectHandler = SkillEffectHandlerFactory.new_skill_effect_handler(skill_effect_config.get_effect_type())
		handler.handle(skill_effect_config, roll, context)

static func _handle_recoil_effects(recoil_configs: Array[SkillRecoilConfig], roll: RollResult, context: SkillExecutionContext) -> void:
	var filtered_recoils: Array[SkillRecoilConfig] = _filter_recoils_by_outcome(recoil_configs, roll.outcome_type)
	
	for skill_recoil_config: SkillRecoilConfig in filtered_recoils:
		var handler: SkillRecoilHandler = SkillRecoilHandlerFactory.new_skill_recoil_handler(skill_recoil_config.get_recoil_type())
		handler.handle(skill_recoil_config, roll, context)

static func _filter_recoils_by_outcome(recoil_configs: Array[SkillRecoilConfig], outcome_type: RollInterpreterSystem.RollOutcomeType) -> Array[SkillRecoilConfig]:
	return recoil_configs.filter(func(recoil_config: SkillRecoilConfig):
		return recoil_config.trigger_outcome == outcome_type
	)









#
