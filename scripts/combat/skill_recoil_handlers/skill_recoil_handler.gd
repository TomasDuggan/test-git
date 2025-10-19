@abstract
extends Object
class_name SkillRecoilHandler
"""
Los Skills pueden pegar 'culatazos' dependiendo el RollInterpreterSystem.RollOutcomeType
"""

@abstract
func handle(config: SkillRecoilConfig, targets: Array[Character], cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void
