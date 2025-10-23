extends Resource
class_name SkillConfig

@export_category("UI")
@export var display_name: String
@export var desc: String
@export var icon: Texture2D

@export_category("Logic")
@export var dice_config: DiceConfig
@export var roll_stat_modifier: StatConfig.StatType
@export var outcome_configs: Dictionary[RollInterpreterSystem.RollOutcomeType, SkillOutcomeConfig] = {
	RollInterpreterSystem.RollOutcomeType.FAIL: null,
	RollInterpreterSystem.RollOutcomeType.PARTIAL: null,
	RollInterpreterSystem.RollOutcomeType.SUCCESS: null,
	RollInterpreterSystem.RollOutcomeType.CRITICAL_SUCCESS: null,
}


func get_outcome_config_by_type(type: RollInterpreterSystem.RollOutcomeType) -> SkillOutcomeConfig:
	return outcome_configs.get(type, null)

func requires_target_selection() -> bool:
	var flattened_effects: Array[SkillEffectConfig] = []
	
	for outcome_config: SkillOutcomeConfig in outcome_configs.values():
		flattened_effects.append_array(outcome_config.effects)
	
	return flattened_effects.any(func(e: SkillEffectConfig): 
		return e.target_scope == SkillEffectConfig.TargetScope.CUSTOM_SELECTION
	)
