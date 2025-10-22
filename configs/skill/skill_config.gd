extends Resource
class_name SkillConfig

@export_category("UI")
@export var display_name: String
@export var desc: String
@export var icon: Texture2D

@export_category("Logic")
@export var dice_config: DiceConfig
@export var roll_stat_modifier: StatConfig.StatType
@export var effect_configs: Array[SkillEffectConfig]
@export var recoil_configs: Array[SkillEffectConfig]

func requires_target_selection() -> bool:
	return effect_configs.any(func(e: SkillEffectConfig): 
		return e.target_scope == SkillExecutionSystem.TargetScope.CUSTOM_SELECTION
	)
