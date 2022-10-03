global function PseudoTriggersInit

// global table<entity, bool> inTriggerZone

struct TriggerZone {
	array<entity> bounds
	void functionref(TriggerZone, entity) enterCallback
	void functionref(TriggerZone, entity) leaveCallback
	array<entity> playersInZone
}

struct {
	array<TriggerZone> triggers
	// table<entity, bool> inTriggerZone
	// table<entity, bool> is0G
} file

void function PseudoTriggersInit()
{
	// AddCallBack_OnSpecificMapLoaded( "mp_s2s", DrawDebugTriggers )
	// AddCallback_GameStateEnter( eGameState.Playing, SetupTriggers )
}

void function SetupTriggers()
{
	// DrawGlobal("sphere",GetEntByScriptName("hangarhelmet").GetOrigin(),250.0, 255, 0, 0, true, 1000)
	PlaceMaltaBoxes()
	thread CheckPlayerClips()
}

void function PlaceMaltaBoxes()
{
	entity maltaMover = GetMalta().mover
	// Hangar main top
	entity p = CreatePropDynamic( $"models/weapons/bullets/triple_threat_projectile.mdl", maltaMover.GetOrigin() )
	p.SetOrigin(maltaMover.GetOrigin() + <1200,-300,500>)
	p.SetParent( maltaMover )

	// Hangar main bottom
	entity p1 = CreatePropDynamic( $"models/weapons/bullets/triple_threat_projectile.mdl", maltaMover.GetOrigin() )
	p1.SetOrigin(maltaMover.GetOrigin() + <1500,3100,-700>)
	p1.SetParent( maltaMover )

	array<entity> trigger1 = [p, p1]
	TriggerZone t1
	t1.bounds = trigger1
	t1.enterCallback = MALTA_HANGAR_PlayerEntersTrigger
	t1.leaveCallback = MALTA_HANGAR_PlayerLeavesTrigger
	file.triggers.append(t1)

	// Hangar corner bottom floor
	entity p2 = CreatePropDynamic( $"models/weapons/bullets/triple_threat_projectile.mdl", maltaMover.GetOrigin() )
	p2.SetOrigin(maltaMover.GetOrigin() + <1000,-300,-480>)
	p2.SetScriptName("TEST")
	p2.SetParent( maltaMover )

	entity p3 = CreatePropDynamic( $"models/weapons/bullets/triple_threat_projectile.mdl", maltaMover.GetOrigin() )
	p3.SetOrigin(maltaMover.GetOrigin() + <1400,0,-700>)
	p3.SetScriptName("TEST1")
	p3.SetParent( maltaMover )

	array<entity> trigger2 = [p2, p3]
	TriggerZone t2
	t2.bounds = trigger2
	t2.enterCallback = MALTA_HANGAR_CORNER_BOTTOM_PlayerEntersTrigger
	t2.leaveCallback = MALTA_HANGAR_CORNER_BOTTOM_PlayerLeavesTrigger
	file.triggers.append(t2)
}

void function MALTA_HANGAR_PlayerEntersTrigger( TriggerZone triggerZone, entity player )
{
	Give0G( player )
}

void function MALTA_HANGAR_PlayerLeavesTrigger( TriggerZone triggerZone, entity player )
{
	printt(
	is0G[player],
	triggerZone.bounds[0].GetOrigin().x < player.GetOrigin().x ,
	//
	triggerZone.bounds[0].GetOrigin(),
	player.GetOrigin()
	)
	// if( is0G[player] && triggerZone.bounds[0].GetOrigin().x < player.GetOrigin().x && triggerZone.bounds[1].GetOrigin().z <= player.GetOrigin().z )
	if( triggerZone.bounds[0].GetOrigin().x < player.GetOrigin().x )
		Give0G( player )
	else
		Take0G( player )
}

void function MALTA_HANGAR_CORNER_BOTTOM_PlayerEntersTrigger( TriggerZone triggerZone, entity player )
{
	printt("ENTERING")
	Give0G( player )
}

void function MALTA_HANGAR_CORNER_BOTTOM_PlayerLeavesTrigger( TriggerZone triggerZone, entity player )
{
	printt("LEAVING")
	if( triggerZone.bounds[0].GetOrigin().z < player.GetOrigin().z )
		Take0G( player )
	else
		Give0G( player )
}

void function CheckPlayerClips()
{
	while( 1 )
	{
		foreach( entity player in GetPlayerArray() )
		{
			// if ( !(player in inTriggerZone) )
			// 	inTriggerZone[player] <- false
			if ( !(player in is0G) )
				is0G[player] <- false
			vector org = player.GetOrigin()
			foreach( TriggerZone triggerZone in file.triggers )
			{
				array<entity> triggerBounds = triggerZone.bounds
				if( org.x >= triggerBounds[0].GetOrigin().x && org.x <= triggerBounds[1].GetOrigin().x 
					&& org.y >= triggerBounds[0].GetOrigin().y && org.y <= triggerBounds[1].GetOrigin().y
					&& org.z <= triggerBounds[0].GetOrigin().z && org.z >= triggerBounds[1].GetOrigin().z)
					{
						if( triggerZone.playersInZone.find( player ) < 0 )
						{
							triggerZone.playersInZone.append( player )
							PlayerEntersTrigger( triggerZone, player )
						}
						// if( !inTriggerZone[player])
						// {
						// 	inTriggerZone[player] = true
						// 	PlayerEntersTrigger( triggerZone, player )
						// }
					}
				else
				{
					int idx = triggerZone.playersInZone.find( player )
					if( idx >= 0 )
					{
						PlayerLeavesTrigger( triggerZone, player )
						triggerZone.playersInZone.remove( idx )
					}
					// if( inTriggerZone[player] )
					// {
					// 	PlayerLeavesTrigger( triggerZone, player )
					// 	inTriggerZone[player] = false
					// }
				}
			}
		}
		WaitFrame()
	}
}

void function PlayerEntersTrigger( TriggerZone triggerZone, entity player )
{
	if( triggerZone.enterCallback != null )
		triggerZone.enterCallback( triggerZone, player )
	else
		if( is0G[player] )
			Take0G( player )
		else
			Give0G( player )
}

void function PlayerLeavesTrigger( TriggerZone triggerZone, entity player )
{
	if( triggerZone.leaveCallback != null )
		triggerZone.leaveCallback( triggerZone, player )
	else
		if( is0G[player] )
			Give0G( player )
		else
			Take0G( player )
}