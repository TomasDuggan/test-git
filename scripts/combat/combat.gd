extends Node2D
class_name Combat

@onready var mage = $CanvasLayer/HUD/Characters/HeroesContainer/Mage
@onready var warrior = $CanvasLayer/HUD/Characters/HeroesContainer/Warrior
@onready var enemy = $CanvasLayer/HUD/Characters/EnemiesContainer/Enemy


func _ready():
	CombatEventBus.raise_event_combat_started([mage, warrior, enemy])
