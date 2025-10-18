@abstract
extends Object
class_name SkillEffectHandler
"""
Maneja el efecto de un skill
"""

@abstract
func handle(config: SkillEffectConfig, cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void
