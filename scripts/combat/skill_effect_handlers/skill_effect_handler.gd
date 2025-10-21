@abstract
extends Object
class_name SkillEffectHandler
"""
Organizan y luego delegan la activacion de una parte del skill a su caster.
"""

@abstract
func handle(config: SkillEffectConfig, targets: Array[Character], cast_context: SkillCastContext, execution_context: SkillExecutionContext) -> void





#
