# fireball_spell.gd
extends SpellBase

class_name FireballSpell

func _init():
	name = "Fireball"
	element = "Fire"
	power = 10
	cooldown = 1
	aoe_radius = 10
	aoe_damage = 10
	missle_size = 1
	missle_speed = 100

func cast(caster,target_position: Vector2):
	print("Casting Fireball at position: %s" % target_position)
	# Implement Fireball specific casting logic
	deal_damage(caster,target_position)
	if aoe_radius > 0:
		apply_aoe(caster,target_position)

func deal_damage(caster,target_position: Vector2):
	# Logic to deal initial damage to the target
	print("Dealing initial damage of %d to target at position: %s" % [power, target_position])
	# Assume there's an enemy at the target position and apply damage
	var enemy = find_enemy_at_position(caster,target_position)
	if enemy:
		enemy.take_damage(power)

func find_enemy_at_position(caster, position: Vector2):
	var enemies = caster.get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		if position.distance_to(enemy.position) <= 10:  # Assuming a small threshold for hit detection
			return enemy
	return null
