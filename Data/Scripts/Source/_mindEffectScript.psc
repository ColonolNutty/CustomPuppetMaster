Scriptname _mindEffectScript extends activemagiceffect  

int Property effectType Auto
ReferenceAlias Property scriptAlias Auto

int effectTypeFollow = 1
int effectTypeCharm = 2
int effectTypeWait = 3
int effectTypeResetScript = 4
int effectTypePlaceMarker = 5
int effectTypeGoToBeacon = 6
int effectTypeSetTargetForSex = 7
int effectTypeDisplayPuppetList = 8
int effectTypeToggleSpeechWithPlayer = 9
int effectTypeTie = 10
int effectTypeUntie = 11
int effectTypeTeleportToPlayer = 12

event OnEffectStart(Actor akTarget, Actor akCaster)
	_mindScript script = scriptAlias as _mindScript
	if(!script || (script.globalStop.GetValue() as int) != 0)
		return
	endif

	if(effectType == effectTypeFollow)
		script.SetCharmedToFollow()
	elseif(effectType == effectTypeCharm)
		script.SetCharmed(akTarget, true)
	elseif(effectType == effectTypeWait)
		script.SetCharmedToWait()
	elseif(effectType == effectTypeResetScript)
		script.ResetScript()
	elseif(effectType == effectTypePlaceMarker)
		script.PlaceMarker()
	elseif(effectType == effectTypeGoToBeacon)
		script.SetCharmedGoToBeacon()
	elseif(effectType == effectTypeSetTargetForSex)
		script.SetTargetForSex(akTarget)
	elseif(effectType == effectTypeDisplayPuppetList)
		script.SendPuppetList()
	elseif(effectType == effectTypeToggleSpeechWithPlayer)
		akTarget.AllowPCDialogue(false)
	elseif(effectType == effectTypeTie)
		script.TieCharmed()
	elseif(effectType == effectTypeUntie)
		script.UntiePuppets()
	elseif(effectType == effectTypeTeleportToPlayer)
		script.TeleportCharmedToPlayer()
	endif
endevent

event OnEffectFinish(Actor akTarget, Actor akCaster)
	if(effectType == effectTypeToggleSpeechWithPlayer)
		akTarget.AllowPCDialogue(true)
	endif
endevent
