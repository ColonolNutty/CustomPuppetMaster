Scriptname _mindScript extends ReferenceAlias  

Import __NuttyExtensions

	Actor PlayerRef
	ReferenceAlias Property refCharm1 Auto
	ReferenceAlias Property refCharm2 Auto
	ReferenceAlias Property refCharm3 Auto
	ReferenceAlias Property refCharm4 Auto
	ReferenceAlias Property refCharm5 Auto
	ReferenceAlias Property refWait1 Auto
	ReferenceAlias Property refWait2 Auto
	ReferenceAlias Property refWait3 Auto
	ReferenceAlias Property refWait4 Auto
	ReferenceAlias Property refWait5 Auto
	ReferenceAlias Property refFollow1 Auto
	ReferenceAlias Property refFollow2 Auto
	ReferenceAlias Property refFollow3 Auto
	ReferenceAlias Property refFollow4 Auto
	ReferenceAlias Property refFollow5 Auto
	ReferenceAlias Property refFreeze1 Auto
	ReferenceAlias Property refFreeze2 Auto
	ReferenceAlias Property refFreeze3 Auto
	ReferenceAlias Property refFreeze4 Auto
	ReferenceAlias Property refFreeze5 Auto
	ReferenceAlias Property refMarker1 Auto
	ReferenceAlias Property refGoMarker1 Auto
	ReferenceAlias Property refGoMarker2 Auto
	ReferenceAlias Property refGoMarker3 Auto
	ReferenceAlias Property refGoMarker4 Auto
	ReferenceAlias Property refGoMarker5 Auto
	ReferenceAlias Property refTravel1 Auto
	ReferenceAlias Property refTravel2 Auto
	ReferenceAlias Property refTravel3 Auto
	ReferenceAlias Property refTravel4 Auto
	ReferenceAlias Property refTravel5 Auto
	ReferenceAlias Property refTravelMarker1 Auto
	ReferenceAlias Property refTravelMarker2 Auto
	ReferenceAlias Property refTravelMarker3 Auto
	ReferenceAlias Property refTravelMarker4 Auto
	ReferenceAlias Property refTravelMarker5 Auto
	ReferenceAlias Property refBound1 Auto
	ReferenceAlias Property refBound2 Auto
	ReferenceAlias Property refBound3 Auto
	ReferenceAlias Property refBound4 Auto
	ReferenceAlias Property refBound5 Auto
	ReferenceAlias Property refBound6 Auto
	ReferenceAlias Property refBound7 Auto
	ReferenceAlias Property refBound8 Auto
	ReferenceAlias Property refBound9 Auto
	ReferenceAlias Property refBound10 Auto
	
	
	GlobalVariable Property globalMarker Auto
	Keyword Property npcKeyword Auto
	Perk Property mindPerk Auto
	Message Property msgConfidence Auto
	Message Property msgAggression Auto
	ImpactDataSet Property bloodImpact Auto
	ImpactDataSet Property urinateImpact Auto
	ImpactDataSet Property defecateImpact Auto
	Sound Property urinateSound Auto
	Sound Property defecateSound1 Auto
	Sound Property defecateSound2 Auto
	Sound Property defecateSound3 Auto
	Potion Property defecateItem Auto
	SexLabFramework Property SexLab Auto
	Message Property actionMessage Auto
	Idle Property beatdown Auto
	Quest Property configQuest Auto
	GlobalVariable Property globalStop Auto
	Spell[] Property playerSpells Auto
	GlobalVariable Property allowSpells Auto
	Faction Property undressedFaction Auto
	Faction Property boundFaction Auto
	Outfit Property nakedOutfit Auto
	Faction Property decideFaction Auto
	Message[] Property poseMessages Auto

	Actor Property iSexActor1 Auto
	Actor Property iSexActor2 Auto
	Actor Property iSexActor3 Auto
	string Property iSexTag1 Auto
	string Property iSexTag2 Auto
	string Property iSexTag3 Auto
	string Property iSexNoTag Auto
	bool Property iSexStart Auto
	int Property iSexBed Auto
	int Property iTwoOthers Auto
	int Property iAdjustType Auto
	Actor Property iAdjustActor Auto
	Actor Property iPeeActor Auto
	Actor Property iDefecateActor Auto
	Actor Property iBeatActor Auto
	int[] Property iTravel Auto

	int[] aggression
	int[] confidence
	int[] relationship
	int[] morality
	int curBasicKey
	int moveType
	int[] fTime
	int[] fPrev
	int[] charmData
	int istate
	Outfit[] defOutfit
	float[] modSpeed
	int lastPose
	int curPeeType
	int curPeeSound
	int curPeeTimer
	sslThreadController curPeeScene
	ReferenceAlias[] refsCharm
	ReferenceAlias[] refsWait
	ReferenceAlias[] refsFollow
	ReferenceAlias[] refsFreeze
	ReferenceAlias[] refsBound
	ReferenceAlias[] refsTravelMarker
	ReferenceAlias[] refsTravel
	ReferenceAlias[] refsGoMarker

	;/	Charmed flags:
		1 - Is following and we had to set teammate
		2 - I decide what you wear
		4 - I want you to be tough (+100k hp)
	/;
	
	
;Begin Initialization
	Function InitReferenceAlias(ReferenceAlias[] referenceAliases, ReferenceAlias one, ReferenceAlias two, ReferenceAlias three, ReferenceAlias four, ReferenceAlias five)
		referenceAliases[0] = one
		referenceAliases[1] = two
		referenceAliases[2] = three
		referenceAliases[3] = four
		referenceAliases[4] = five
	EndFunction

	Function InitReferenceAliases()
		If(!refsCharm)
			refsCharm = new ReferenceAlias[5]
			InitReferenceAlias(refsCharm, refCharm1, refCharm2, refCharm3, refCharm4, refCharm5)
		EndIf
		If(!refsWait)
			refsWait = new ReferenceAlias[5]
			InitReferenceAlias(refsWait, refWait1, refWait2, refWait3, refWait4, refWait5)
		EndIf
		If(!refsFollow)
			refsFollow = new ReferenceAlias[5]
			InitReferenceAlias(refsFollow, refFollow1, refFollow2, refFollow3, refFollow4, refFollow5)
		EndIf
		If(!refsFreeze)
			refsFreeze = new ReferenceAlias[5]
			InitReferenceAlias(refsFreeze, refFreeze1, refFreeze2, refFreeze3, refFreeze4, refFreeze5)
		EndIf
		If(!refsBound)
			refsBound = new ReferenceAlias[10]
			InitReferenceAlias(refsBound, refBound1, refBound2, refBound3, refBound4, refBound5)
			refsBound[5] = refBound6
			refsBound[6] = refBound7
			refsBound[7] = refBound8
			refsBound[8] = refBound9
			refsBound[9] = refBound10
		EndIf
		If(!refsTravelMarker)
			refsTravelMarker = new ReferenceAlias[5]
			InitReferenceAlias(refsTravelMarker, refTravelMarker1, refTravelMarker2, refTravelMarker3, refTravelMarker4, refTravelMarker5)
		EndIf
		If(!refsTravel)
			refsTravel = new ReferenceAlias[5]
			InitReferenceAlias(refsTravel, refTravel1, refTravel2, refTravel3, refTravel4, refTravel5)
		EndIf
		If(!refsGoMarker)
			refsGoMarker = new ReferenceAlias[5]
			InitReferenceAlias(refsGoMarker, refGoMarker1, refGoMarker2, refGoMarker3, refGoMarker4, refGoMarker5)
		EndIf
	EndFunction

	Event OnInit()
		InitReferenceAliases()
		PlayerRef = Game.GetPlayer()
		aggression = new int[5]
		confidence = new int[5]
		relationship = new int[5]
		morality = new int[5]
		iTravel = new int[5]
		fTime = new int[5]
		fPrev = new int[5]
		charmData = new int[5]
		defOutfit = new Outfit[5]
		modSpeed = new float[5]
		lastPose = -1

		curBasicKey = 0
		istate = 0

		int i = 0
		while(i < 5)
			aggression[i] = -1
			confidence[i] = -1
			relationship[i] = -5
			morality[i] = -1
			i += 1
		endwhile

		if(PlayerRef && !PlayerRef.HasPerk(mindPerk))
			PlayerRef.AddPerk(mindPerk)
		endif

		globalStop.SetValue(0)

		RegisterForSingleUpdate(3)
	EndEvent

	Function UpdateRelations(ReferenceAlias[] refAliases)
		int aLength = refAliases.Length
		int i = 0
		While(i < aLength)
			UpdateRelationship(refAliases[i].GetActorRef(), i)
			i += 1
		EndWhile
	EndFunction

	Event OnPlayerLoadGame()
		PlayerRef = Game.GetPlayer()
		InitReferenceAliases()
		UpdateRelations(refsCharm)
	EndEvent
 
	Event OnUpdate()
		CheckAliases()

		if(PlayerRef && !PlayerRef.HasPerk(mindPerk))
			PlayerRef.AddPerk(mindPerk)
		endif

		; TODO: Clean this up a bit
		if(curPeeType < 0 && curPeeScene)
			if(curPeeType > -10)
				; nothing
				if(curPeeType == -2)
					curPeeScene.GoToStage(2)
					curPeeScene.UpdateTimer(60.0)
				endif
			elseif(curPeeType > -30)
				if(curPeeType == -21 || curPeeType == -22)
					curPeeSound = urinateSound.Play(curPeeScene.PositionAlias(0).GetReference())
				elseif(curPeeType == -23)
					PlayFart(curPeeScene.PositionAlias(0).GetReference())
				endif
			elseif(curPeeType > -60)
				if(curPeeType == -53)
					PlayFart(curPeeScene.PositionAlias(0).GetReference())
				endif
			elseif(curPeeType > -70)
				if(curPeeType == -61 || curPeeType == -62)
					Sound.StopInstance(curPeeSound)
					curPeeSound = 0
				elseif(curPeeType == -63)
					; do nothing
				endif
			elseif(curPeeType > -80)
				; do nothing
			else
				curPeeScene.EndAnimation()
				curPeeScene = none
				curPeeType = 10
			endif

			curPeeType -= 10
		elseif(curPeeType > 0)
			curPeeTimer += 1
			if(curPeeTimer >= 5)
				curPeeTimer = 0
				curPeeType = 0
				curPeeScene = none
			endif
		endif

		bool removeSpells = ((allowSpells.GetValue() as int) == 0)
		if(PlayerRef && (istate == 0) != removeSpells)
				int q = 0
			if(removeSpells)
				istate = Math.LogicalAnd(istate, Math.LogicalNot(1))
				Debug.Trace("removing spells")
				while(playerSpells && q < playerSpells.Length)
					if(PlayerRef.HasSpell(playerSpells[q]))
						PlayerRef.RemoveSpell(playerSpells[q])
					endif
					q += 1
				endwhile
			else
				istate = Math.LogicalOr(istate, 1)
				Debug.Trace("adding spells")
				while(playerSpells && q < playerSpells.Length)
					if(!PlayerRef.HasSpell(playerSpells[q]))
						PlayerRef.AddSpell(playerSpells[q], false)
					endif
					q += 1
				endwhile
			endif
		endif

		_mindConfig cfg = GetConfig()
		if(cfg && cfg.basicKey != curBasicKey)
			if(curBasicKey > 1)
				UnregisterForKey(curBasicKey)
			endif
			curBasicKey = cfg.basicKey
			if(curBasicKey > 1)
				RegisterForKey(curBasicKey)
			endif
		endif

		if(iAdjustActor)
			if(IsCharmed(iAdjustActor))
				int confOrAgg
				bool isConfidence = iAdjustType == 1
				bool shouldAdjust = false
				if(isConfidence)
					confOrAgg = msgConfidence.Show()
					shouldAdjust = confOrAgg >= 0 && confOrAgg < 5
				else
					confOrAgg = msgAggression.Show()
					shouldAdjust = confOrAgg >= 0 && confOrAgg < 4
				endif
				if(shouldAdjust)
					SetPersonality(iAdjustActor, !isConfidence, confOrAgg)
				endif
			endif
			iAdjustActor = none
		endif

		if(iSexStart)
			TryStartSex()
			ClearSex()
		endif

		if(iPeeActor)
			Pee(iPeeActor)
			iPeeActor = none
		endif

		if(iDefecateActor)
			Defecate(iDefecateActor)
			iDefecateActor = none
		endif

		if(iBeatActor)
			Beat(GetActorRef(), iBeatActor)
			iBeatActor = none
		endif

		UpdateFreeze()

		if((globalStop.GetValue() as int) == 0)
			RegisterForSingleUpdate(2)
		else
			ResetScript(true)
			if(PlayerRef)
				PlayerRef.RemovePerk(mindPerk)
			endif
			if(curBasicKey > 1)
				UnregisterForKey(curBasicKey)
			endif
			curBasicKey = 0
		endif
	EndEvent

	Event OnKeyUp(int keyCode, float holdTime)
		If(keyCode != curBasicKey || !Game.IsMovementControlsEnabled() || Utility.IsInMenuMode())
			Return
		EndIf
		
		Actor akActor = GetActorRef()
		If(akActor == None)
			Return
		EndIf
		
		int choice = actionMessage.show()
		if(choice == 0)
			Pee(akActor)
		elseif(choice == 1)
			Defecate(akActor)
		elseif(choice == 2)
			DefecateAndPee(akActor)
		elseif(choice == 3)
			Masturbate(akActor)
		elseif(choice == 4)
			Debug.Trace("[CN] Doing Puppet Master Posing")
			Pose(akActor)
		elseif(choice == 5)
			; Nothing was selected
		endif
	EndEvent
	
	Function ManuallyLoot(Actor akTarget)
		if(akTarget != None && PlayerRef != None)
			akTarget.Activate(PlayerRef)
		endif
	EndFunction

	_mindConfig function GetConfig()
		return configQuest as _mindConfig
	endfunction
	
;End Initialization
	
	
	
;Begin Menus
	Function SendShow()
		Debug.Notification("Use show power to target someone.")
	endfunction

	Function SendPuppetList()
		string msg = "Puppets currently under your control:"
		int aLength = refsCharm.Length
		int i = 0
		bool hasPuppets = false
		While i < aLength
			ReferenceAlias refAlias = refsCharm[i]
			string puppetName = GetPuppetString(refAlias.GetActorRef())
			If(puppetName)
				msg = msg + "\n" + puppetName
				hasPuppets = true
			EndIf
			i += 1
		EndWhile
		if(!hasPuppets)
			msg = msg + "\nNo puppets"
		endif
		Debug.MessageBox(msg)
	endfunction

	string Function GetPuppetString(Actor target)
		if(!target)
			return ""
		endif
		
		string name = GetActorName(target)
		if(!name)
			name = "unknown"
		endif

		name = name + " ("
		if(IsFollowing(target))
			name = name + "following"
		elseif(IsWaiting(target))
			name = name + "waiting"
		elseif(IsFrozen(target))
			name = name + "frozen"
		elseif(IsMarker(target))
			name = name + "beacon"
		else
			name = name + "normal routine"
		endif
		name = name + ")"
		if(IsTied(target))
			name = name + " (bound)"
		endif
		return name
	endfunction

;End Menus
	
	
	
;Begin Clothing
	
	Actor[] strippedActors
	Form[] actorOneStrippedItems
	Form[] actorTwoStrippedItems
	Form[] actorThreeStrippedItems

	Function Undress(Actor target)
		if(!target || !IsDressed(target))
			return
		endif

		target.AddToFaction(undressedFaction)
		Form[] strippedItems = SexLab.StripActor(target, DoAnimate = false)
		if(strippedActors == None)
			strippedActors = new Actor[3]
		endif
		
		if(strippedActors[0] == None)
			strippedActors[0] = target
			actorOneStrippedItems = strippedItems
		elseif(strippedActors[1] == None)
			strippedActors[1] = target
			actorTwoStrippedItems = strippedItems
		elseif(strippedActors[2] == None)
			strippedActors[2] = target
			actorThreeStrippedItems = strippedItems
		endif
	endfunction

	Function RedressActor(Actor target, Form[] strippedItems, int indexToClear)
		strippedActors[indexToClear] = None
		SexLab.UnstripActor(target, strippedItems)
	EndFunction

	Function Dress(Actor target)
		if(!target || target.IsDisabled() || target.IsDead())
			return
		endif
		
		if(target.IsInFaction(undressedFaction))
			target.RemoveFromFaction(undressedFaction)
		endif

		if(strippedActors[0] == target)
			RedressActor(target, actorOneStrippedItems, 0)
			actorOneStrippedItems = None
			return
		elseif(strippedActors[1] == target)
			RedressActor(target, actorTwoStrippedItems, 1)
			actorTwoStrippedItems = None
			return
		elseif(strippedActors[2] == target)
			RedressActor(target, actorThreeStrippedItems, 2)
			actorThreeStrippedItems = None
			return
		EndIf

		int wearMask = 0
		int i = 0
		while(i < 32)
			int j = Math.LeftShift(1, i)
			if(target.GetWornForm(j))
				wearMask = Math.LogicalOr(wearMask, j)
			endif
			i += 1
		endwhile
		int itemCount = target.GetNumItems()
		i = itemCount - 1
		Weapon bestWeapon = none
		int bestDamage = 0
		while(i >= 0)
			Form curItem = target.GetNthForm(i)
			if(curItem)
				Armor curArmor = curItem as Armor
				if(curArmor)
					int slotMask = curArmor.GetSlotMask()
					if(Math.LogicalAnd(wearMask, slotMask) == 0)
						wearMask = Math.LogicalOr(wearMask, slotMask)
						target.EquipItem(curItem)
					endif
				else
					Weapon curWeapon = curItem as Weapon
					if(curWeapon)
						int dmg = curWeapon.GetBaseDamage()
						if(dmg > bestDamage)
							bestWeapon = curWeapon
							bestDamage = dmg
						endif
					endif
				endif
			endif
			i -= 1
		endwhile

		if(bestWeapon)
			target.EquipItem(bestWeapon)
		endif
	endfunction

;End Clothing
	
	

;Begin Actions

	Function PlaceMarker()
		if(!PlayerRef)
			return
		endif

		ObjectReference marker = refMarker1.GetReference()
		if(!marker)
			return
		else
			marker.MoveTo(PlayerRef)
		endif
		
		globalMarker.SetValue(1)
		Debug.Notification("Set influence beacon to current position.")
	endfunction

;End Actions	
	
	
		
;Begin Everything Else
	
	Actor Function CheckAlias(ReferenceAlias refAlias, bool boundAlias = false)
		if(!refAlias || !refAlias.GetReference())
			return None
		endif

		Actor target = refAlias.GetActorRef()
		if(!target || target.IsDisabled() || target.IsDead() || (boundAlias && !IsTied(target)))
			refAlias.Clear()
			if(target == None)
				Return None
			EndIf
			bool charmed = IsReferenceCharmed(refAlias)
			Debug.Trace("Ref Alias is Charmed: " + charmed)
			if(charmed)
				string name = GetActorName(target)
				if(name)
					Debug.Notification(name + " has died.")
				else
					Debug.Notification("Someone under your influence has died.")
				endif
			elseif(boundAlias)
				Debug.Notification(GetActorName(target) + " is no longer bound.")
			endif
		endif
		return target
	endfunction

	Function CheckAliases(bool onlyBound = false)
		if(onlyBound)
			CheckAliasOf(refsBound, true)
			Return
		EndIf
		
		CheckAliasOf(refsCharm, false, true)
		CheckAliasOf(refsFollow)
		CheckAliasOf(refsWait)
		CheckAliasOf(refsFreeze)
		CheckAliasOf(refsTravel)
		CheckAliasOf(refsGoMarker)
	endfunction

	Function CheckAliasOf(ReferenceAlias[] refAliases, bool isBound = false, bool updatePuppets = false)
		int aLength = refAliases.Length
		int i = 0
		While(i < aLength)
			ReferenceAlias refAlias = refAliases[i]
			Actor actorRef = CheckAlias(refAlias, isBound)
			i += 1
			If(updatePuppets && actorRef)
				UpdatePuppet(actorRef, i)
			EndIf
		EndWhile
	EndFunction

	Function UpdatePuppet(Actor target, int index)
		if(!target)
			return
		endif

		if(Math.LogicalAnd(charmData[index], 4) != 0 && !target.IsDead())
			target.RestoreActorValue("health", 100000.0)
		endif
	endfunction

	string Function GetActorName(Actor akTarget)
		if(!akTarget)
			return None
		endif

		ActorBase akBase = akTarget.GetLeveledActorBase()
		if(akBase)
			return akBase.GetName()
		endif
		return None
	endfunction
	
	int Function RememberPackage(Actor target)
		if(!target)
			return 0
		endif

		if(IsFollowing(target))
			return 1
		endif
		if(IsFrozen(target))
			return 2
		endif
		if(IsWaiting(target))
			return 3
		endif
		if(IsMarker(target))
			return 4
		endif
		return 0
	endfunction
	
	Function MoveTogether(int type = 1)
		Actor target1 = iSexActor1
		Actor target2 = iSexActor2
		Actor target3 = iSexActor3

		if(target3)
			if(!target1)
				target1 = target3
				target3 = none
			elseif(!target2)
				target2 = target3
				target3 = none
			endif
		endif

		if((!target1 || !target2) || (target1.IsDisabled() || target1.IsDead()) || (target2.IsDisabled() || target2.IsDead()) || (target3 && (target3.IsDisabled() || target3.IsDead())))
			ClearSex()
			return
		endif
		
		Actor[] targets = new Actor[3]
		targets[0] = target1
		targets[1] = target2
		targets[2] = target3

		float radius = 256.0

		if(target1.GetDistance(target2) <= radius && (!target3 || (target3.GetDistance(target1) <= radius && target3.GetDistance(target2) <= radius)))
			iSexStart = true
			return
		endif

		Actor anchor = none
		
		int i = 0
		while i < targets.Length
			Actor target = targets[i]
			if(target == PlayerRef)
				anchor = target
				i = targets.Length
			EndIf
			i += 1
		EndWhile

		if(!anchor)
			i = 0
			while i < targets.Length
				Actor target = targets[i]
				if(target && IsTied(target))
					anchor = target
					i = targets.Length
				EndIf
				i += 1
			EndWhile
		endif

		if(!anchor)
			i = 0
			while i < targets.Length
				Actor target = targets[i]
				if(target && !IsCharmed(target))
					anchor = target
					i = targets.Length
				EndIf
				i += 1
			EndWhile
		endif

		if(!anchor)
			anchor = target2
		endif

		if(anchor != PlayerRef)
			SetFreeze(anchor, 5)
		endif

		moveType = 1
		if(target3)
			moveType = 2
		endif
		
		i = 0
		while i < targets.Length
			Actor target = targets[i]
			if(target && anchor != target)
				int index = SetTravel(target, anchor)
				if(index >= 0)
					iTravel[index] = type
				endif
			EndIf
			i += 1
		EndWhile
	endfunction
	
	Function OnTravel(int index, Actor target)
		int type = 0
		if(index >= 0 && index < 5)
			type = iTravel[index]
		endif
		
		RemoveAlias(target, true, true)
		if(type == 0)
			return
		endif

		if(type == 1)
			if(moveType == 2)
				moveType = 1
				SetFreeze(target, 4)
			else
				SetFreeze(target, 1)
				TryStartSex()
				ClearSex()
			endif
			return
		endif
	endfunction
	
	Function Pose(Actor target, bool ask = true, int index = -1)
		if(!target)
			return
		endif

		if(!ask)
			if(index == 0)
				index = lastPose
			elseif(index < 0)
				return
			endif

			if(PlayerRef != target)
				Tie(target, index)
				return
			endif

			if(index != lastPose)
				lastPose = index
				Debug.Notification("Set this as selected pose for bind.")
			endif

			if(index == 1)
				Debug.SendAnimationEvent(target, "ZazAPCAO052")
			elseif(index == 2)
				Debug.SendAnimationEvent(target, "ZazAPCAO315")
			elseif(index == 3)
				Debug.SendAnimationEvent(target, "ZazAPCAO304")
			elseif(index == 4)
				Debug.SendAnimationEvent(target, "ZazAPCAO313")
			elseif(index == 5)
				Debug.SendAnimationEvent(target, "ZazAPCAO305")
			elseif(index == 6)
				Debug.SendAnimationEvent(target, "ZazAPC006")
			elseif(index == 7)
				Debug.SendAnimationEvent(target, "ZazAPC008")
			elseif(index == 8)
				Debug.SendAnimationEvent(target, "ZazAPC014")
			elseif(index == 9)
				Debug.SendAnimationEvent(target, "ZazAPC016")
			elseif(index == 10)
				Debug.SendAnimationEvent(target, "ZazAPC018")
			elseif(index == 11)
				Debug.SendAnimationEvent(target, "ZazAPC057")
			elseif(index == 12)
				Debug.SendAnimationEvent(target, "ZazAPC305")
			elseif(index == 13)
				Debug.SendAnimationEvent(target, "ZazAPCAO005")
			elseif(index == 14)
				Debug.SendAnimationEvent(target, "ZazAPCAO006")
			elseif(index == 15)
				Debug.SendAnimationEvent(target, "ZazAPCAO008")
			elseif(index == 16)
				Debug.SendAnimationEvent(target, "ZazAPCAO007")
			endif
		elseif(poseMessages)
			int ret = poseMessages[index + 1].Show()
			if(ret == 5 && index < 1)
				Pose(target, ask, index + 1)
			else
				Pose(target, false, (index + 1) * 5 + (ret + 1))
			endif
		endif
	endfunction

	Function PlayAnim(Actor target, string idleAnimEvent)
		if(!target || !IsNPC(target))
			return
		endif

		Debug.SendAnimationEvent(target, idleAnimEvent)
	endfunction

	Function Beat(Actor source, Actor target, bool blood = true)
		if(!source || !target || !IsNPC(source) || !IsNPC(target) || target.IsDead() || IsEngagedInSex(source) || IsEngagedInSex(target))
			return
		endif

		if(source == PlayerRef)
			Game.DisablePlayerControls(true, true, false, false, true, false, true, false, 0)
		endif

		;source.SheatheWeapon()
		Form wpLeft = source.GetEquippedObject(0)
		Form wpRight = source.GetEquippedObject(1)
		if(wpLeft)
			source.UnequipItemEx(wpLeft, 2)
		elseif(wpRight)
			source.UnequipItemEx(wpRight, 1)
		endif

		int tries = 0
		while(tries < 4)
			if(source.PlayIdleWithTarget(beatdown, target))
				tries = 500
			else
				tries += 1
			endif
			Utility.Wait(0.5)
		endwhile

		if(tries != 500)
			EquipWeaponsToSource(source, wpLeft, wpRight)
			if(source == PlayerRef)
				Game.EnablePlayerControls()
			endif
			return
		endif
		
		Utility.Wait(1.0)
		if(blood)
			CreateBlood(target)
		endif
		Utility.Wait(1.5)

		; to get rid of infinite combat stance at the end
		ResetAnim(source)

		; the following looks bad but is necessary to get rid of combat stance later
		;ResetAnim(target)
		;SetRagdoll(target)
		Debug.SendAnimationEvent(target, "Ragdoll")

		EquipWeaponsToSource(source, wpLeft, wpRight)

		if(source == PlayerRef)
			Game.EnablePlayerControls()
		endif

		target.StopCombat()
	endfunction

	Function CreateBlood(Actor target)
		if(target)
			target.PlayImpactEffect(bloodImpact)
		endif
	endfunction

;End Everything Else
	
	
		
;Begin Bathroom
	Function PlayFart(ObjectReference target, int fartId = -1)
		if(!target)
			return
		endif

		if(fartId < 0 || fartId > 2)
			fartId = Utility.RandomInt(0, 2)
		endif

		if(fartId == 0)
			defecateSound1.Play(target)
		elseif(fartId == 1)
			defecateSound2.Play(target)
		else
			defecateSound3.Play(target)
		endif
	endfunction

	ObjectReference Function CreateExcrement(Actor target)
		return target.PlaceAtMe(defecateItem as Form)
	endfunction

	Function CreateDefecate(Actor target, bool onself = false, bool onground = true)
		CreateNasty(target, defecateImpact, onself, onground)
	endfunction

	Function CreateUrine(Actor target, bool onself = false, bool onground = true)
		CreateNasty(target, urinateImpact, onself, onground)
	endfunction

	Function CreateNasty(Actor target, ImpactDataSet data, bool onself = false, bool onground = true)
		if(onself) ; if anyone knows how to make this work let me know please
			target.PlayImpactEffect(data, "NPC L Thigh [LThg]")
			target.PlayImpactEffect(data, "NPC R Thigh [RThg]")
		endif
		if(onground)
			target.PlayImpactEffect(data)
		endif
	EndFunction
	
	Function StartPeeScene(Actor owner, Actor target, bool isPee = true)
		if(!owner || !target || !IsNPC(owner) || !IsNPC(target) || IsEngagedInSex(owner) || IsEngagedInSex(target) || curPeeType != 0)
			return
		endif

		ClearSex()
		iSexActor1 = target
		iSexActor2 = owner
		if(isPee)
			iSexTag1 = "pee"
			if(owner.GetLeveledActorBase() && SexLab.GetGender(owner) == 1)
				iSexTag2 = "Arrok Lesbian"
			else
				iSexTag2 = "AP Skull Fuck"
				iSexActor1 = owner
				iSexActor2 = target
			endif
		else
			iSexTag1 = "defec"
			iSexTag2 = "Arrok Anal"
		endif
		MoveTogether()
	endfunction

	Event peeSceneStart(string EventName, string argString, float argNum, form sender)
		sslThreadController cont = SexLab.HookController(argString)
		if(cont)
			cont.UpdateTimer(60.0)
		endif
		UnregisterForModEvent("AnimationStart_peeScene")
		curPeeType = -curPeeType
		curPeeScene = cont
	EndEvent

	Event peeSceneEnd(string EventName, string argString, float argNum, form sender)
		UnregisterForModEvent("AnimationEnd_peeScene")
	EndEvent

	Function DoBusiness(Actor target, bool isPee, float startDuration = -1.0, float duration = -1.0, float endDuration = -1.0, int standing = 0, bool skipAnimation = false, bool skipSound = false)
		if(!target || !IsNPC(target))
			return
		endif
		
		ActorBase targetBase = target.GetLeveledActorBase()
		if(!targetBase)
			return
		endif

		bool bound = IsTied(target)
		bool tied = false ; wrong
		bool isPlayer = target == PlayerRef
		bool isFemale = SexLab.GetGender(target) == 1
		bool isStanding = standing > 0
		int prevStatus = -1
		
		if(IsEngagedInSex(target) || bound)
			skipAnimation = true
		endif

		_mindConfig cfg = GetConfig()
		if(!cfg)
			return
		endif

		if(isPee)
			if(isFemale)
				isStanding = standing == 0 && cfg.basicWomenUrinateStanding
			Elseif(!isStanding)
				isStanding = standing == 0
			EndIf
			if(startDuration < 0.0)
				startDuration = cfg.basicUrinateDuration1
			endif
			if(duration < 0.0)
				duration = cfg.basicUrinateDuration2
			endif
			if(endDuration < 0.0)
				endDuration = cfg.basicUrinateDuration3
			endif
		Else
			if(startDuration < 0.0)
				startDuration = cfg.basicDefecateDuration1
			endif
			if(duration < 0.0)
				duration = cfg.basicDefecateDuration2
			endif
			if(endDuration < 0.0)
				endDuration = cfg.basicDefecateDuration3
			endif
		EndIf
		
		string anim = ""
		string anim2 = ""
		Form[] removedArmor
		If(!skipAnimation)
			if((isPee && cfg.basicUndressUrinate) || (!isPee && cfg.basicUndressDefecate))
				removedArmor = SexLab.StripActor(target)
			endif
			
			if(isPlayer)
				Game.ForceThirdPerson()
				Game.DisablePlayerControls(true, true, true, false, true, false, true, false, 0)
			else
				prevStatus = RememberPackage(target)
				SetFreeze(target)
				target.AllowPCDialogue(false)
			endif
			
			
			if(isFemale)
				if(isStanding)
					if(bound)
						; nothing just stand
					else
						anim = "ZazAPC203"
						anim2 = "ZazAPCAO103"
					endif
				else
					if(bound)
						anim = "ZazAPC206"
						anim2 = "ZazAPCAO106"
					else
						anim = "ZazAPC202"
						anim2 = "ZazAPCAO102"
					endif
				endif
			else
				if(isStanding)
					if(bound)
						; nothing for anim one just stand
						anim2 = "ZazAPCAO112"
					else
						If(isPee)
							anim = "ZazAPC207"
						Else
							anim = "ZazAPC204"
						EndIf
						anim2 = "ZazAPCAO107"
					endif
				else
					if(bound)
						anim = "ZazAPC206"
						anim2 = "ZazAPCAO106"
					else
						anim = "ZazAPC201"
						anim2 = "ZazAPCAO110"
					endif
				endif
			endif

			if(anim)
				PlayAnim(target, anim)
			endif
			
			If(isPee)
				if(startDuration > 0.0)
					Utility.Wait(startDuration)
				endif

				if(anim2)
					PlayAnim(target, anim2)
				endif
			EndIf
		EndIf
		
		If(isPee)
			CreateUrine(target)
			if(duration > 0.0)
				if(!skipSound)
					int soundId = urinateSound.Play(target)
					Utility.Wait(duration)
					Sound.StopInstance(soundId)
				else
					Utility.Wait(duration)
				endif
			EndIf
		Else
			if(startDuration > 0.0)
				float middle = startDuration * 0.5
				if(middle >= 2.0)
					Utility.Wait(middle)
					PlayFart(target)
					Utility.Wait(middle)
				else
					Utility.Wait(startDuration)
				endif
			endif

			bool firstLoop = true
			while(duration >= 0.0)
				PlayFart(target)
				if(cfg.basicCreateExcrementItem)
					CreateExcrement(target)
				endif
				if(firstLoop)
					CreateDefecate(target)
				endif
				firstLoop = false
				if(duration > 0.0)
					Utility.Wait(3.0)
				endif
				duration -= 3.0
			endwhile
		EndIf

		if(!skipAnimation)
			if(isPee)
				if(anim)
					PlayAnim(target, anim)
				else
					ResetAnim(target)
				endif
			EndIf

			if(endDuration > 0.0)
				Utility.Wait(endDuration)
			endif

			if(removedArmor)
				SexLab.UnstripActor(target, removedArmor)
			endif

			if(isPlayer)
				Game.EnablePlayerControls()
			else
				if(prevStatus >= 0)
					SetPackage(target, prevStatus)
				endif
				target.AllowPCDialogue(true)
			endif

			if(anim)
				ResetAnim(target)
			endif
		endif
	EndFunction
	
	Function Pee(Actor target, float startDuration = -1.0, float duration = -1.0, float endDuration = -1.0, int standing = 0, bool skipAnimation = false, bool skipSound = false)
		DoBusiness(target, true, startDuration, duration, endDuration, standing, skipAnimation, skipSound)
	endfunction

	Function Defecate(Actor target, float startDuration = -1.0, float duration = -1.0, float endDuration = -1.0, int standing = 0, bool skipAnimation = false, bool skipSound = false)
		DoBusiness(target, false, startDuration, duration, endDuration, standing, skipAnimation, skipSound)
	endfunction

	Function DefecateAndPee(Actor target, float startDuration = -1.0, float duration = -1.0, float endDuration = -1.0, int standing = 0, bool skipAnimation = false, bool skipSound = false, bool peeFirst = false)
		if(!target || !IsNPC(target))
			return
		endif

		ActorBase targetBase = target.GetLeveledActorBase()
		if(!targetBase)
			return
		endif

		bool bound = IsTied(target)
		bool tied = false ; wrong
		bool isPlayer = target == PlayerRef
		bool isFemale = SexLab.GetGender(target) == 1
		bool isStanding = standing > 0
		string anim
		string anim2
		int prevStatus = -1

		if(IsEngagedInSex(target) || bound)
			skipAnimation = true
		endif

		Form[] removedArmor

		_mindConfig cfg = GetConfig()
		if(!cfg)
			return
		endif

		float dur1
		float dur2
		float dur3

		if(peeFirst)
			if(startDuration < 0.0)
				dur1 = cfg.basicUrinateDuration1
			else
				dur1 = startDuration
			endif
			if(duration < 0.0)
				dur2 = cfg.basicUrinateDuration2
			else
				dur2 = duration
			endif
			if(endDuration < 0.0)
				dur3 = cfg.basicUrinateDuration3
			else
				dur3 = endDuration
			endif

			if(!skipAnimation)
				if(cfg.basicUndressUrinate || cfg.basicUndressDefecate)
					removedArmor = SexLab.StripActor(target)
				endif

				if(isPlayer)
					Game.ForceThirdPerson()
					Game.DisablePlayerControls(true, true, true, false, true, false, true, false, 0)
				else
					prevStatus = RememberPackage(target)
					SetFreeze(target)
					target.AllowPCDialogue(false)
				endif

				anim = ""
				if(isFemale)
					if(isStanding)
						if(tied)
							; nothing just stand
						else
							anim = "ZazAPC203"
						endif
					else
						if(tied)
							anim = "ZazAPC206"
						else
							anim = "ZazAPC202"
						endif
					endif
				else
					if(isStanding)
						if(tied)
							; nothing just stand
						else
							anim = "ZazAPC207"
						endif
					else
						if(tied)
							anim = "ZazAPC206"
						else
							anim = "ZazAPC201"
						endif
					endif
				endif

				if(anim)
					PlayAnim(target, anim)
				endif

				if(dur1 > 0.0)
					Utility.Wait(dur1)
				endif

				anim2 = ""

				if(isFemale)
					if(isStanding)
						if(tied)
							; TODO find anim for this
						else
							anim2 = "ZazAPCAO103"
						endif
					else
						if(tied)
							anim2 = "ZazAPCAO106"
						else
							anim2 = "ZazAPCAO102"
						endif
					endif
				else
					if(isStanding)
						if(tied)
							anim2 = "ZazAPCAO112"
						else
							anim2 = "ZazAPCAO107"
						endif
					else
						if(tied)
							anim2 = "ZazAPCAO106"
						else
							anim2 = "ZazAPCAO110"
						endif
					endif
				endif

				if(anim2)
					PlayAnim(target, anim2)
				endif
			endif

			CreateUrine(target)
			if(dur2 > 0.0)
				if(!skipSound)
					int soundId = urinateSound.Play(target)
					Utility.Wait(dur2)
					Sound.StopInstance(soundId)
				else
					Utility.Wait(dur2)
				endif
			endif

			if(!skipAnimation)
				if(anim)
					PlayAnim(target, anim)
				else
					ResetAnim(target)
				endif

				if(dur3 > 0.0)
					Utility.Wait(dur3)
				endif
			endif
		endif

		if(startDuration < 0.0)
			dur1 = cfg.basicDefecateDuration1
		else
			dur1 = startDuration
		endif
		if(duration < 0.0)
			dur2 = cfg.basicDefecateDuration2
		else
			dur2 = duration
		endif
		if(endDuration < 0.0)
			dur3 = cfg.basicDefecateDuration3
		else
			dur3 = endDuration
		endif

		if(!skipAnimation)
			if(!removedArmor && (cfg.basicUndressDefecate || cfg.basicUndressUrinate))
				removedArmor = SexLab.StripActor(target)
			endif

			if(!peeFirst)
				if(isPlayer)
					Game.ForceThirdPerson()
					Game.DisablePlayerControls(true, true, true, false, true, false, true, false, 0)
				else
					prevStatus = RememberPackage(target)
					SetFreeze(target)
					target.AllowPCDialogue(false)
				endif
			endif

			anim = ""
			if(isFemale)
				if(isStanding)
					if(tied)
						; nothing just stand
					else
						anim = "ZazAPC203"
					endif
				else
					if(tied)
						anim = "ZazAPC206"
					else
						anim = "ZazAPC202"
					endif
				endif
			else
				if(isStanding)
					if(tied)
						; nothing just stand
					else
						anim = "ZazAPC204"
					endif
				else
					if(tied)
						anim = "ZazAPC206"
					else
						anim = "ZazAPC201"
					endif
				endif
			endif

			if(anim)
				PlayAnim(target, anim)
			endif
		endif

		if(dur1 > 0.0)
			float middle = dur1 * 0.5
			if(middle >= 2.0)
				Utility.Wait(middle)
				PlayFart(target)
				Utility.Wait(middle)
			else
				Utility.Wait(dur1)
			endif
		endif

		bool firstLoop = true
		while(dur2 >= 0.0)
			PlayFart(target)
			if(cfg.basicCreateExcrementItem)
				CreateExcrement(target)
			endif
			if(firstLoop)
				CreateDefecate(target)
			endif
			firstLoop = false
			if(dur2 > 0.0)
				Utility.Wait(3.0)
			endif
			dur2 -= 3.0
		endwhile

		if(!skipAnimation)
			if(dur3 > 0.0)
				Utility.Wait(dur3)
			endif

			if(peeFirst)
				if(removedArmor)
					SexLab.UnstripActor(target, removedArmor)
				endif

				if(isPlayer)
					Game.EnablePlayerControls()
				else
					if(prevStatus >= 0)
						SetPackage(target, prevStatus)
					endif
					target.AllowPCDialogue(true)
				endif

				ResetAnim(target)
			endif
		endif

		if(!peeFirst)
			if(startDuration < 0.0)
				dur1 = cfg.basicUrinateDuration1
			else
				dur1 = startDuration
			endif
			if(duration < 0.0)
				dur2 = cfg.basicUrinateDuration2
			else
				dur2 = duration
			endif
			if(endDuration < 0.0)
				dur3 = cfg.basicUrinateDuration3
			else
				dur3 = endDuration
			endif

			if(!skipAnimation)
				anim = ""
				if(isFemale)
					if(isStanding)
						if(tied)
							; nothing just stand
						else
							anim = "ZazAPC203"
						endif
					else
						if(tied)
							anim = "ZazAPC206"
						else
							anim = "ZazAPC202"
						endif
					endif
				else
					if(isStanding)
						if(tied)
							; nothing just stand
						else
							anim = "ZazAPC207"
						endif
					else
						if(tied)
							anim = "ZazAPC206"
						else
							anim = "ZazAPC201"
						endif
					endif
				endif

				if(anim)
					PlayAnim(target, anim)
				endif

				if(dur1 > 0.0)
					Utility.Wait(dur1)
				endif

				anim2 = ""

				if(isFemale)
					if(isStanding)
						if(tied)
							; TODO find anim for this
						else
							anim2 = "ZazAPCAO103"
						endif
					else
						if(tied)
							anim2 = "ZazAPCAO106"
						else
							anim2 = "ZazAPCAO102"
						endif
					endif
				else
					if(isStanding)
						if(tied)
							anim2 = "ZazAPCAO112"
						else
							anim2 = "ZazAPCAO107"
						endif
					else
						if(tied)
							anim2 = "ZazAPCAO106"
						else
							anim2 = "ZazAPCAO110"
						endif
					endif
				endif

				if(anim2)
					PlayAnim(target, anim2)
				endif
			endif

			CreateUrine(target)
			if(dur2 > 0.0)
				if(!skipSound)
					int soundId = urinateSound.Play(target)
					Utility.Wait(dur2)
					Sound.StopInstance(soundId)
				else
					Utility.Wait(dur2)
				endif
			endif

			if(!skipAnimation)
				if(anim)
					PlayAnim(target, anim)
				else
					ResetAnim(target)
				endif

				if(dur3 > 0.0)
					Utility.Wait(dur3)
				endif

				if(removedArmor)
					SexLab.UnstripActor(target, removedArmor)
				endif

				if(isPlayer)
					Game.EnablePlayerControls()
				else
					if(prevStatus >= 0)
						SetPackage(target, prevStatus)
					endif
					target.AllowPCDialogue(true)
				endif

				ResetAnim(target)
			endif
		endif
	endfunction

;End Bathroom
	
	
	
;Begin Frozen

	Function UpdateFreeze()
		int aLength = refsFreeze.Length
		int i = 0
		While i < aLength
			if(fTime[i] > 0)
				Unfreeze(refsFreeze[i], i)
			EndIf
			i += 1
		EndWhile
	endfunction

	Function SetFreeze(Actor target, int duration = 0)
		if(!target)
			return
		endif
		
		int aLength = refsFreeze.Length
		int i = 0
		While i < aLength
			ReferenceAlias refAlias = refsFreeze[i]
			if(!refAlias.GetReference())
				Freeze(refAlias, i, target, duration)
				i = aLength
			EndIf
			i += 1
		EndWhile
	endfunction

	Function Freeze(ReferenceAlias ref, int position, Actor target, int duration)
		fPrev[position] = RememberPackage(target)
		fTime[position] = duration
		RemoveAlias(target, false, false)
		RemoveAlias(target, false, true)
		ref.ForceRefTo(target)
		target.EvaluatePackage()
	EndFunction

	Function Unfreeze(ReferenceAlias ref, int position)
		fTime[position] = fTime[position] - 1
		if(fTime[position] == 0)
			Actor target = ref.GetActorRef()
			if(target)
				;Unfreeze
				ref.Clear()
				SetPackage(target, fPrev[position])
				fTime[position] = 0
			EndIf
		endif
	endfunction

;End Frozen
	
		
	
;Begin Charmed

	int Function GetCharmedIndex(Actor target)
		if(!target)
			return -1
		endif
		
		int aLength = refsCharm.Length
		int i = 0
		int index = -1
		While i < aLength
			if(refsCharm[i].GetActorRef() == target)
				index = i
				i = aLength
			EndIf
			i += 1
		EndWhile
		return index
	endfunction

	Function SetCharmedToFollow()
		ReferenceAlias[] refAliases = refsCharm
		int aLength = refAliases.Length
		int i = 0
		int made = 0
		While i < aLength
			Actor charmed = refAliases[i].GetActorRef()
			if(charmed && (!IsFollowing(charmed) || charmed.GetActorValue("WaitingForPlayer") != 0.0))
				SetFollow(charmed)
				made += 1
			endif
			i += 1
		EndWhile

		if(made != 1)
			Debug.Notification("Made " + made + " influenced targets follow you.")
		else
			Debug.Notification("Made 1 influenced target follow you.")
		endif
	EndFunction

	Function SetCharmedToWait()
		ReferenceAlias[] refAliases = refsCharm
		int aLength = refAliases.Length
		int i = 0
		int made = 0
		While i < aLength
			Actor charmed = refAliases[i].GetActorRef()
			if(charmed && !IsWaiting(charmed))
				SetWait(charmed)
				made += 1
			endif
			i += 1
		EndWhile
		
		if(made != 1)
			Debug.Notification("Made " + made + " influenced targets wait.")
		else
			Debug.Notification("Made 1 influenced target wait.")
		endif
	EndFunction

	Function SetCharmedGoToBeacon()
		if((globalMarker.GetValue() as int) == 0)
			Debug.Notification("You have to place a beacon somewhere first.")
			return
		endif
		
		ReferenceAlias[] refAliases = refsCharm
		int aLength = refAliases.Length
		int i = 0
		int made = 0
		While i < aLength
			Actor charmed = refAliases[i].GetActorRef()
			if(charmed && !IsMarker(charmed))
				SetMarker(charmed)
				made += 1
			endif
			i += 1
		EndWhile
		
		if(made != 1)
			Debug.Notification("Made " + made + " influenced targets go to beacon.")
		else
			Debug.Notification("Made 1 influenced target go to beacon.")
		endif
	EndFunction

	Function TeleportCharmedToPlayer()
		ReferenceAlias[] refAliases = refsCharm
		int aLength = refAliases.Length
		int i = 0
		int made = 0
		float playerX = 120.0 * Math.Sin(PlayerRef.GetAngleZ()) 
		float playerY = 120.0 * Math.Cos(PlayerRef.GetAngleZ())
		While i < aLength
			Actor charmed = refAliases[i].GetActorRef()
			if(charmed)
				charmed.MoveTo(PlayerRef, playerX, playerY)
				made += 1
			endif
			i += 1
		EndWhile
		
		if(made != 1)
			Debug.Notification("Teleported " + made + " targets to you.")
		else
			Debug.Notification("Teleported 1 target to you.")
		endif
	EndFunction

;End Charmed
	
	
	
;Begin Setters

	Function UpdateRelationship(Actor target, int index)
		if(!target || !PlayerRef)
			return
		endif

		if(target.GetActorValue("assistance") < 1.0)
			target.SetActorValue("assistance", 1.0)
		endif
		if(target.GetActorValue("morality") != 0.0)
			target.SetActorValue("morality", 0.0)
		endif

		if(target.GetRelationshipRank(PlayerRef) < 3)
			target.SetRelationshipRank(PlayerRef, 3)
		endif

		int aggressionRank = aggression[index]
		if(aggressionRank >= 0 && (target.GetActorValue("aggression") as int) != aggressionRank)
			target.SetActorValue("aggression", aggressionRank as float)
		endif
		int confidenceRank = confidence[index]
		if(confidenceRank >= 0 && (target.GetActorValue("confidence") as int) != confidenceRank)
			target.SetActorValue("confidence", confidenceRank as float)
		endif

		target.SetNotShowOnStealthMeter(true)
		if(IsNPC(target))
			target.SetNoBleedoutRecovery(false)
			if(Math.LogicalAnd(charmData[index], 2) != 0)
				target.SetOutfit(nakedOutfit)
			endif
		endif
	endfunction

	Function SetPersonality(Actor target, bool agg, int level)
		if(!target)
			return
		endif

		int index = -1
		if((refCharm1.GetActorRef()) == target)
			index = 0
		elseif((refCharm2.GetActorRef()) == target)
			index = 1
		elseif((refCharm3.GetActorRef()) == target)
			index = 2
		elseif((refCharm4.GetActorRef()) == target)
			index = 3
		elseif((refCharm5.GetActorRef()) == target)
			index = 4
		endif

		if(index >= 0)
			if(agg)
				aggression[index] = level
			else
				confidence[index] = level
			endif

			UpdateRelationship(target, index)
		endif
	endfunction

	Function SetTough(Actor target, bool apply = true)
		if(!target || target.IsDead())
			return
		endif

		int index = GetCharmedIndex(target)
		if(index < 0)
			return
		endif
		float healthAmount = 100000.0
		int data = charmData[index]
		if(apply)
			if(Math.LogicalAnd(data, 4) != 0)
				return
			endif

			charmData[index] = Math.LogicalOr(data, 4)
			target.ModActorValue("health", healthAmount)
		else
			if(Math.LogicalAnd(data, 4) == 0)
				return
			endif

			charmData[index] = Math.LogicalAnd(data, Math.LogicalNot(4))
			target.RestoreActorValue("health", healthAmount)
			target.ModActorValue("health", -healthAmount)
		endif
	endfunction

	Function SetFastMove(Actor target, bool apply = true)
		if(!target)
			return
		endif

		int index = GetCharmedIndex(target)
		if(index < 0)
			return
		endif

		if(apply)
			if(modSpeed[index] > 0.0)
				SetFastMove(target, false)
			endif

			float speed = 100.0
			float mspeed = target.GetActorValue("speedmult")
			if(PlayerRef)
				speed = PlayerRef.GetActorValue("speedmult")
			endif
			speed += 20.0

			if(mspeed < speed)
				mspeed = speed - mspeed
				modSpeed[index] = mspeed
				target.ModActorValue("speedmult", mspeed)
			endif
		else
			float mspeed = modSpeed[index]
			if(mspeed > 0.0)
				target.ModActorValue("speedmult", -mspeed)
				modSpeed[index] = 0.0
			endif
		endif
	endfunction

	Function SetPackage(Actor target, int packageType)
		if(!target)
			return
		endif

		if(packageType == 1)
			SetFollow(target)
		elseif(packageType == 2)
			SetFreeze(target)
		elseif(packageType == 3)
			SetWait(target)
		elseif(packageType == 4)
			SetMarker(target)
		else
			SetNone(target)
		endif
	endfunction

	Function SetDecideWear(Actor target, bool apply = true)
		if(!target || target.IsDisabled() || !IsNPC(target) || target.IsDead())
			return
		endif

		ActorBase levBase = target.GetLeveledActorBase()
		if(!levBase)
			return
		endif

		int index = GetCharmedIndex(target)
		if(index >= 0)
			if(apply)
				if(Math.LogicalAnd(charmData[index], 2) != 0)
					return
				endif

				defOutfit[index] = levBase.GetOutfit()
				charmData[index] = Math.LogicalOr(charmData[index], 2)
				target.SetOutfit(nakedOutfit)
				if(!target.IsInFaction(decideFaction))
					target.AddToFaction(decideFaction)
				endif
			else
				charmData[index] = Math.LogicalAnd(charmData[index], Math.LogicalNot(2))
				if(target.IsInFaction(decideFaction))
					target.RemoveFromFaction(decideFaction)
				endif
				if(!defOutfit[index])
					return
				endif

				target.SetOutfit(defOutfit[index])
			endif
		endif
	endfunction
	
	Function SetCharmed(Actor target, bool apply = true)
		if(!target)
			return
		endif

		if(apply && target.IsChild())
			Debug.Notification("You can't influence children.")
			return
		endif

		Actor me = GetActorRef()
		if(!me)
			return
		endif

		_mindConfig cfg = GetConfig()
		if(!cfg)
			return
		endif

		if(apply)
			if(IsCharmed(target))
				return
			endif
			
			int aLength = refsCharm.Length
			int i = 0
			While i < aLength
				ReferenceAlias refAlias = refsCharm[i]
				If(!refAlias.GetReference())
					refAlias.ForceRefTo(target)
					defOutfit[i] = none
					charmData[i] = 0
					aggression[i] = -1
					confidence[i] = -1
					relationship[i] = target.GetRelationshipRank(me)
					morality[i] = target.GetActorValue("morality") as int
					UpdateRelationship(target, i)
					i = aLength
				EndIf
				i += 1
			EndWhile
			
			string name = GetActorName(target)
			if(name)
				Debug.Notification(name + " is now under your influence.")
			else
				Debug.Notification("You have influenced someone.")
			endif
			
			target.StopCombat()

			if((!target.HasKeyword(npcKeyword) && cfg.basicFollowAnimals) || cfg.basicFollowHumans)
				SetFollow(target)
			endif
			return
		else
			int aLength = refsCharm.Length
			int i = 0
			bool successfulUncharm = False
			While i < aLength
				ReferenceAlias refAlias = refsCharm[i]
				if((refAlias.GetActorRef()) == target)
					int relationshipRank = relationship[i]
					if(relationshipRank > -5)
						target.SetRelationshipRank(me, relationshipRank)
						relationship[i] = -5
					endif
					int moralityRank = morality[i]
					if(moralityRank >= 0)
						target.SetActorValue("morality", moralityRank as float)
						morality[i] = -1
					endif
					SetFastMove(target, false)
					SetTough(target, false)
					refAlias.Clear()
					SetNone(target)

					Outfit setOutFit = defOutfit[i]
					if(setOutFit)
						if(target.IsEnabled() && !target.IsDead())
							target.SetOutfit(setOutFit)
						endif
						defOutfit[i] = none
					endif
					successfulUncharm = true
					i = aLength
				endif
				i += 1
			EndWhile

			If(successfulUncharm)
				if(target.IsEnabled() && !target.IsDead() && !IsDressed(target))
					Dress(target)
				endif

				string name = GetActorName(target)
				if(name)
					Debug.Notification(name + " is no longer under your influence.")
				else
					Debug.Notification("Someone is released from your influence.")
				endif
			EndIf
		endif
	endfunction

	Function SetFollow(Actor target)
		if(!target)
			return
		endif

		RemoveAlias(target, false)

		_mindConfig cfg = GetConfig()
		if(!cfg)
			return
		endif

		if(cfg.basicSpeed)
			SetFastMove(target, true)
		endif
		
		int aLength = refsFollow.Length
		int i = 0
		While i < aLength
			ReferenceAlias refAlias = refsFollow[i]
			if(!refAlias.GetReference())
				refAlias.ForceRefTo(target)
				if(target.IsPlayerTeammate() || !cfg.basicTeammate)
					charmData[i] = Math.LogicalAnd(charmData[i], Math.LogicalNot(1))
				else
					charmData[i] = Math.LogicalOr(charmData[i], 1)
					target.SetPlayerTeammate(true, true)
				endif
				i = aLength
			endif
			i += 1
		EndWhile
		target.EvaluatePackage()
	endfunction

	Function SetWait(Actor target)
		if(!target)
			return
		endif

		RemoveAlias(target, false)
		
		int aLength = refsWait.Length
		int i = 0
		While i < aLength
			ReferenceAlias refAlias = refsWait[i]
			if(!refAlias.GetReference())
				refAlias.ForceRefTo(target)
				target.EvaluatePackage()
				i = aLength
			endif
			i += 1
		EndWhile
	endfunction

	; Needs rework
	Function SetMarker(Actor target)
		if(!target)
			return
		endif

		RemoveAlias(target, false)
		
		int aLength = refsGoMarker.Length
		int i = 0
		While i < aLength
			ReferenceAlias refAlias = refsGoMarker[i]
			if(!refAlias.GetReference())
				refAlias.ForceRefTo(target)
				target.EvaluatePackage()
				i = aLength
			endif
			i += 1
		EndWhile
	endfunction

	; Needs rework
	int Function SetTravel(Actor target, ObjectReference marker)
		if(!target || !marker)
			return -1
		endif

		RemoveAlias(target, false, true)
		
		if(IsCharmed(target))
			SetWait(target)
		endif
		
		int aLength = refsTravel.Length
		int i = 0
		int whichOne = 4
		While i < aLength
			ReferenceAlias refTravel = refsTravel[i]
			If(!refTravel.GetReference())
				ObjectReference markerRef = refsTravelMarker[i].GetReference()
				markerRef.MoveTo(marker)
				refTravel.ForceRefTo(target)
				target.EvaluatePackage()
				iTravel[i] = 0
				whichOne = i
				i = aLength
			EndIf
			i += 1
		EndWhile
		return whichOne
	endfunction

	Function SetFavor(Actor target)
		if(!target)
			return
		endif

		target.SetDoingFavor(true)
	endfunction

	Function SetRagdoll(Actor target, ObjectReference origin = none, float force = 0.1)
		if(!origin)
			origin = PlayerRef
		endif

		if(target)
			origin.PushActorAway(target, force)
		endif
	endfunction

;End Setters
	
	

;Begin Bind Actions

	Function Tie(Actor target, int type = 0, Form eqItem = none)
		if(!target || target.IsDisabled() || target.IsDead() || !IsNPC(target))
			return
		endif

		Untie(target)

		if(type == 0)
			type = lastPose
		endif

		if(type < 1)
			Return
		EndIf
		
		target.AddToFaction(boundFaction)
		target.SetFactionRank(boundFaction, type)
		
		bool boundATarget = false
		int aLength = refsBound.Length
		int i = 0
		While i < aLength
			ReferenceAlias refAlias = refsBound[i]
			if(!refAlias.GetReference())
				refAlias.ForceRefTo(target)
				boundATarget = true
				i = aLength
			endif
			i += 1
		EndWhile
		
		If(!boundATarget)
			ReferenceAlias refAlias = refsBound[refsBound.Length - 1]
			if(refAlias.GetReference())
				Untie(refAlias.GetActorRef())
			endif
			refAlias.ForceRefTo(target)
		EndIf
		
		target.EvaluatePackage()
		Debug.Notification("You have bound " + GetActorName(target) + ".")
	endfunction

	Function TieCharmed()
		ReferenceAlias[] refAliases = refsCharm
		int aLength = refAliases.Length
		int i = 0
		int made = 0
		While i < aLength
			Actor charmed = refAliases[i].GetActorRef()
			if(charmed && !IsTied(charmed))
				Tie(charmed)
				made += 1
			endif
			i += 1
		EndWhile

		if(made == 0)
			Debug.Notification("Didn't bind anyone.")
		Else
			Debug.Notification("Tied " + made + " influenced targets")
		EndIf
	EndFunction

	bool Function Untie(Actor target)
		if(!target)
			return false
		endif

		if(target.IsInFaction(boundFaction))
			target.RemoveFromFaction(boundFaction)
			CheckAliases(true)
			if(target.Is3DLoaded())
				SetRagdoll(target)
			endif
			return true
		endif

		return false
	endfunction

	Function UntiePuppets()
		ReferenceAlias[] refAliases = refsCharm
		int aLength = refAliases.Length
		int i = 0
		int made = 0
		While i < aLength
			Actor charmed = refAliases[i].GetActorRef()
			if(charmed && IsTied(charmed))
				Untie(charmed)
				made += 1
			endif
			i += 1
		EndWhile
		
		if(made != 1)
			Debug.Notification("Released " + made + " targets from binds.")
		else
			Debug.Notification("Released 1 target from binds.")
		endif
	EndFunction

;End Bind Actions
	
	
	
	
;Begin Sex Actions

	Function SetTargetForSex(Actor akTarget)
		if(iSexActor1 == akTarget || iSexActor2 == akTarget || iSexActor3 == akTarget)
			Return
		EndIf
		
		if(!iSexActor1)
			iSexActor1 = akTarget
		elseif(!iSexActor2)
			iSexActor2 = akTarget
		else
			iSexActor3 = akTarget
		endif
		
		if(akTarget.GetLeveledActorBase())
			Debug.Notification("Targeted " + GetActorName(akTarget) + ".")
		endif
		
		if(!IsNPC(akTarget))
			if(!iSexTag1)
				iSexTag1 = "Creature"
			elseif(!iSexTag2)
				iSexTag2 = "Creature"
			elseif(!iSexTag3)
				iSexTag3 = "Creature"
			endif
		endif
		if(iSexActor1 && iSexActor2 && (iTwoOthers == 0 || iSexActor3))
			MoveTogether()
		else
			Debug.Notification("Use the ability again to target another participant.")
		endif
	EndFunction

	bool Function TryStartSex(string hookName = "", bool actor1IsVictim = false, bool actor2IsVictim = false, bool actor3IsVictim = false)
		Actor man = iSexActor1
		Actor woman = iSexActor2
		Actor third = iSexActor3
		bool isAggressive = actor1IsVictim || actor2IsVictim || actor3IsVictim

		Actor plr = GetActorRef()

		;Debug.Notification("Trying to start.")

		if(!man || !plr)
			return false
		endif

		;sslThreadModel make = SexLab.NewThread()

		bool hasPlayer = man == plr || woman == plr || third == plr
		int actorCount = 1
		if(third && woman)
			actorCount = 3
		elseif(third || woman)
			actorCount = 2
		endif

		if(IsTied(man))
			Untie(man)
		endif
		if(woman && IsTied(woman))
			Untie(woman)
		endif
		if(third && IsTied(third))
			Untie(third)
		endif

		if(man == none)
			Debug.Trace("Man was None")
		endif
		if(woman == none)
			Debug.Trace("Woman was None")
		endif
		if(third == none)
			Debug.Trace("Third was None")
		endif

		Actor[] positions
		positions = SexLab.MakeActorArray(man, woman, third)
		Debug.Trace("position count comes to " + positions.Length)
		
		Actor victim
		
		if(actor1IsVictim)
			victim = man
		elseif(actor2IsVictim)
			victim = woman
		elseif(actor3IsVictim)
			victim = third
		endif
		
		sslBaseAnimation[] anims
		Debug.Trace("Getting animations using tags 1: " + iSexTag1 + " 2: " + iSexTag2 + " 3: " + iSexTag3 + " No: " + iSexNoTag)
		if(iSexTag1 == "pee" || iSexTag1 == "defec")
			hookName = "peeScene"
			anims = new sslBaseAnimation[1]
			anims[0] = SexLab.GetAnimationByName(iSexTag2)
			if(iSexTag2 == "Arrok Lesbian")
				curPeeType = 2
			elseif(iSexTag1 == "pee")
				curPeeType = 1
			else
				curPeeType = 3
			endif
			curPeeTimer = 0
		else
			anims = SexLab.PickAnimationsByActors(positions, 64, isAggressive); SexLab.GetAnimationsByTag(actorCount, iSexTag1, iSexTag2, iSexTag3, iSexNoTag)
		endif
		
		
		bool bedding

		if(iSexBed >= 0)
			bedding = true
		else
			bedding = false
		endif
		
		if(hookName)
			Debug.Trace("CN: Using Hook with Name " + hookName)
			RegisterForModEvent("AnimationStart_" + hookName, hookName + "Start")
			RegisterForModEvent("AnimationEnd_" + hookName, hookName + "End")
		endif
		
		if(!SexLab.StartWithController(positions, anims, victim, none, bedding, hookName))
			string msg = "Failed to start Sex"
			If anims == None || anims.Length == 0
				msg = "Failed to start Sex because no anims were found"
			EndIf
			Debug.MessageBox(msg)
			return false
		endif
		return true
	endfunction

	Function Masturbate(Actor target)
		if(!target || !IsNPC(target) || target.IsDead() || IsEngagedInSex(target))
			return
		endif

		Actor[] sexActors = SexLab.MakeActorArray(target)

		sslBaseAnimation[] anims = GetAnimationsWithTag(SexLab.PickAnimationsByActors(sexActors, 64), "Masturbation")
		if(anims[0] == None)
			Debug.MessageBox("Failed to Start Masturbation due to not finding an animation")
			Return
		EndIf
		sslBaseAnimation[] masturbationAnims = new sslBaseAnimation[1]
		int pickedAnim = Utility.RandomInt(0, anims.Length)
		masturbationAnims[0] = anims[pickedAnim]
		SexLab.StartSex(sexActors, masturbationAnims, allowBed = target == PlayerRef)
	endfunction
	
	sslBaseAnimation[] Function GetAnimationsWithTag(sslBaseAnimation[] anims, string tag)
		sslBaseAnimation[] taggedAnims = new sslBaseAnimation[64]
		int currentTaggedIdx = 0
		string[] tags = new string[1]
		tags[0] = tag
		int i = 0
		while i < anims.Length
			sslBaseAnimation anim = anims[i]
			If(anim.HasOneTag(tags))
				taggedAnims[currentTaggedIdx] = anim
				currentTaggedIdx += 1
			EndIf
			i += 1
		endWhile
		return taggedAnims
	EndFunction

	Function Necro(Actor source, Actor target)
		if(!source || !target || !target.IsDead() || source.IsDead())
			return
		endif

		if(IsEngagedInSex(source) || IsEngagedInSex(target))
			return
		endif
		
		ClearSex()

		ActorBase sourceBase = source.GetLeveledActorBase()
		ActorBase targetBase = target.GetLeveledActorBase()

		if(!sourceBase || !targetBase)
			return
		endif

		bool isWoman = SexLab.GetGender(source) == 1

		target.Resurrect()
		Debug.Trace("[_mindscript] Attempting to animated necro")

		float waited = 4.0
		while(!target.Is3DLoaded() && waited >= 0.0)
			Utility.Wait(0.1)
			waited -= 0.1
		endwhile

		if(source.IsWeaponDrawn())
			source.SheatheWeapon()
		endif

		if(!IsNPC(target))
			iSexTag1 = "Creature"
		endif
		iSexActor1 = source
		iSexActor2 = target
		
		iSexBed = 0
		
		if(!TryStartSex("Necro", false, true, false))
			target.KillEssential()
		endif
	endfunction

	Event NecroStart(string EventName, string argString, Float argNum, form sender)
		Debug.Trace("Starting Necro with target being " + argString)
		Actor target = SexLab.HookVictim(argString)
		if(target)
			target.SetActorValue("Paralysis", 0.0)
		endif
		UnregisterForModEvent("AnimationStart_Necro")
	EndEvent

	Event NecroEnd(string EventName, string argString, Float argNum, form sender)
		Debug.Trace("Ending Necro with target being " + argString)
		Actor target = SexLab.HookVictim(argString)
		if(target)
			Debug.SendAnimationEvent(target, "Ragdoll")
			target.KillEssential()
		endif
		UnregisterForModEvent("AnimationEnd_Necro")
	EndEvent

;End Sex Actions



;Begin Boolean Checks
	
	bool Function IsNPC(Actor target, bool allowPlayer = true)
		if(!target)
			return false
		endif

		return (allowPlayer && target == PlayerRef) || target.HasKeyword(npcKeyword)
	endfunction

	bool Function IsCharmed(Actor target)
		return IsOneOf(refsCharm, target)
	endfunction

	bool Function IsFollowing(Actor target)
		return IsOneOf(refsFollow, target)
	endfunction

	bool Function IsMarker(Actor target)
		return IsOneOf(refsGoMarker, target)
	endfunction

	bool Function IsWaiting(Actor target)
		return IsOneOf(refsWait, target)
	endfunction

	bool Function IsFrozen(Actor target)
		return IsOneOf(refsFreeze, target)
	endfunction

	bool Function IsTravel(Actor target)
		return IsOneOf(refsTravel, target)
	endfunction

	bool Function IsTied(Actor target)
		if(!target)
			return false
		endif

		return target.IsInFaction(boundFaction)
	endfunction

	bool function IsDressed(Actor target)
		if(!target)
			return true
		endif

		return !target.IsInFaction(undressedFaction)
	endfunction

	bool Function IsEngagedInSex(Actor target)
		return SexLab.IsActorActive(target)
	EndFunction
	
	;Is engaged in sex
	bool Function IsSex(Actor target)
		return IsEngagedInSex(target)
	endfunction

	bool Function IsReferenceCharmed(ReferenceAlias refAlias)
		return refsCharm.Find(refAlias) < 0
	EndFunction
	
;End Boolean Checks
	
	
	
;Begin Clean Up
	
	Function RemoveAliasOf(ReferenceAlias[] refAliases, Actor target, bool clearTeammate = false, bool setTime = false)
		int aLength = refAliases.Length
		int i = 0
		While i < aLength
			ReferenceAlias refAlias = refAliases[i]
			If((refAlias.GetActorRef()) == target)
				refAlias.Clear()
				If(clearTeammate)
					int data = charmData[i]
					If(Math.LogicalAnd(data, 1) != 0)
						target.SetPlayerTeammate(false, false)
						charmData[i] = Math.LogicalAnd(data, Math.LogicalNot(1))
					EndIf
				EndIf
				If(setTime)
					fTime[i] = 0
				EndIf
				i = aLength
			EndIf
			i += 1
		EndWhile
	EndFunction

	Function RemoveAlias(Actor target, bool calculate = true, bool travel = false)
		if(!target)
			return
		endif
		
		if(travel)
			RemoveAliasOf(refsTravel, target)
		Else
			target.SetDoingFavor(false)
			target.SetActorValue("WaitingForPlayer", 0.0)
			
			RemoveAliasOf(refsFollow, target, true)
			RemoveAliasOf(refsWait, target)
			RemoveAliasOf(refsFreeze, target, false, true)
			RemoveAliasOf(refsGoMarker, target)
		endif
		if(calculate)
			target.EvaluatePackage()
		endif
	endfunction

	Function SetNone(Actor target)
		RemoveAlias(target, true)
	endfunction

	Function ResetRefs(ReferenceAlias[] refAliases, bool isBound = false, bool isCharmed = false)
		int aLength = refAliases.Length
		int i = 0
		While i < aLength
			ReferenceAlias refAlias = refAliases[i]
			Actor actorRef = refAlias.GetActorRef()
			If(isBound)
				Untie(actorRef)
			ElseIf(isCharmed)
				SetCharmed(actorRef, false)
			Else
				SetNone(actorRef)
			EndIf
			refAlias.Clear()
			i += 1
		EndWhile
	EndFunction

	Function ResetAnim(Actor target)
		if(!target)
			return
		endif

		Untie(target)
		Debug.SendAnimationEvent(target, "IdleForceDefaultState")
	endfunction

	; Needs rework
	Function ResetScript(bool silent = false)
		ClearSex()

		ResetRefs(refsBound, true)
		ResetRefs(refsCharm, false, true)
		ResetRefs(refsFreeze)
		ResetRefs(refsWait)
		ResetRefs(refsFollow)
		ResetRefs(refsTravel)
		ResetRefs(refsGoMarker)

		if(!silent)
			Debug.Notification("All targets have been released and untied!")
		endif
	endfunction

	Function ClearSex()
		iSexActor1 = none
		iSexActor2 = none
		iSexActor3 = none
		iSexTag1 = ""
		iSexTag2 = ""
		iSexTag3 = ""
		iSexBed = 0
		iSexNoTag = ""
		iSexStart = false
		iTwoOthers = 0
	endfunction

;End Clean Up