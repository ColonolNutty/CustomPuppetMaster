ScriptName __NuttyExtensions

bool Function IsOneOf(ReferenceAlias[] refAliases, Actor target) global
	if(!target)
		return false
	endif
	
	int aLength = refAliases.Length
	int i = 0
	bool isOne = False
	While i < aLength
		If(refAliases[i].GetActorRef() == target)
			isOne = True
			i = aLength
		EndIf
		i += 1
	EndWhile
	return isOne
EndFunction

Function EquipWeaponsToSource(Actor source, Form leftWeapon, Form rightWeapon) global
	if(leftWeapon)
		source.EquipItemEx(leftWeapon, 2, false, false)
	elseif(rightWeapon)
		source.EquipItemEx(rightWeapon, 1, false, false)
	endif
EndFunction
