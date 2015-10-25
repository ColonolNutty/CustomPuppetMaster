Scriptname _mindBeingCharmed extends activemagiceffect  

ReferenceAlias Property scriptAlias Auto

int punchCooldown = 0

event OnEffectStart(Actor akTarget, Actor akCaster)
	punchCooldown = 0
endevent

event OnEffectFinish(Actor akTarget, Actor akCaster)
	UnregisterForUpdate()
endevent

event OnUpdate()
	punchCooldown = 0
endevent

event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if(punchCooldown != 0 || !abPowerAttack || akAggressor != Game.GetPlayer())
		return
	endif

	_mindScript script = scriptAlias as _mindScript
	if(!script || (script.globalStop.GetValue() as int) != 0)
		return
	endif

	_mindConfig cfg = script.GetConfig()
	if(cfg && cfg.basicKnockout)
		Actor me = GetTargetActor()
		Actor plr = akAggressor as Actor
		if(me && plr)
			punchCooldown = 1
			float force = cfg.basicForce
			if(force < 0.1)
				force = 0.1
			endif
			script.SetRagdoll(me, plr, force)
			if(!me.IsDead())
				RegisterForSingleUpdate(5)
			endif
		endif
	endif
endevent
