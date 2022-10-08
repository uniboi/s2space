global function CapshipTriggersInit
global function Give0G
global function Take0G
global function GetAngledBoxCorners
global function GetEntityCorners
global function tptest
global table<entity, bool> is0G

struct {
    array<entity> maltaTriggers
    array<entity> gibraltarTriggers
    table<entity, bool functionref(entity, entity)> take0GOnExit
} file

void function DrawPersistentTriggers()
{
    #if HAS_QUERSCHNITT
    printt( "[s2s] Querschnitt is not enabled. Debug triggers will only draw on the hosting client." )
    #endif

    while( 1 )
    {
        foreach( entity ent in file.maltaTriggers )
        #if HAS_QUERSCHNITT
            DrawGlobal( "rotatedbox", ent.GetOrigin(), ent.GetBoundingMins(), ent.GetBoundingMaxs(), ent.GetAngles(), 0, 255, 255, true, 0.1 )
        #else
            DebugDrawRotatedBox( ent.GetOrigin(), ent.GetBoundingMind(), ent.GetBoundingMaxs(), ent.GetAngles(), 0, 255, 255, true, 0.1 )
        #endif
        WaitFrame()
    }
}

void function CapshipTriggersInit()
{
    AddCallback_GameStateEnter( eGameState.Playing, SetupCapshipTriggers )
    AddCallback_OnClientConnecting( PlayerConnectRegister )
}

void function PlayerConnectRegister( entity player )
{
    if( !(player in is0G) )
        is0G[player] <- false
}

void function SetupCapshipTriggers()
{
    // todo: iwas besseres ausdenken
    entity maltaHangarLarge = GetEntByScriptName( "maltaTriggerHangar" )
    entity maltaHangarAngled = GetEntByScriptName( "maltaTriggerAngledHangar" )
    entity maltaGunDeck03Front = GetEntByScriptName( "maltaGunDeck03Front" )
    entity maltaGunDeck03West = GetEntByScriptName( "maltaGunDeck03WestAngle" )
    entity maltaGunDeck03East = GetEntByScriptName( "maltaGunDeck03EastAngle" )
    entity maltaGunDeck03Closing = GetEntByScriptName( "maltaGunDeck03Closing" )
    entity maltaGunDeck03Connecting = GetEntByScriptName( "maltaGunDeck03Connection" )
    entity maltaGunDeck02Connecting = GetEntByScriptName( "maltaGunDeck02Connection" )
    entity maltaGunDeck02East = GetEntByScriptName( "maltaGunDeck02EastAngle" )
    entity maltaGunDeck02Front = GetEntByScriptName( "maltaGunDeck02Front" )
    entity maltaGunDeck01Front = GetEntByScriptName( "maltaGunDeck01Front" )
    entity maltaGunDeck01East = GetEntByScriptName( "maltaGunDeck01EastAngle" )
    entity maltaGunDeck01Conclusion = GetEntByScriptName( "maltaGunDeck01Conclusion" )
    // entity maltaLiftsAngled = GetEntByScriptName( "maltaLiftsAngled" )
    entity maltaLifts = GetEntByScriptName( "maltaLifts" )
    entity maltaGunDeck02Top = GetEntByScriptName( "maltaGunDeck02Top" )
    entity maltaGunDeck01EastFiller = GetEntByScriptName( "maltaGunDeck01EastAngleFiller" )
    entity maltaGunDeck01EastFillerTop = GetEntByScriptName( "maltaGunDeck01EastAngleTopFiller" )
    file.maltaTriggers = [ maltaHangarLarge, maltaHangarAngled, maltaGunDeck03Front, maltaGunDeck03West, maltaGunDeck03East, maltaGunDeck03Closing, maltaGunDeck03Connecting, maltaGunDeck02Connecting, maltaGunDeck02East, maltaGunDeck02Front, maltaGunDeck01Front, maltaGunDeck01East, maltaGunDeck01Conclusion, /*maltaLiftsAngled,*/ maltaLifts, maltaGunDeck02Top, maltaGunDeck01EastFiller, maltaGunDeck01EastFillerTop ]

    foreach( entity trigger in file.maltaTriggers )
        thread TriggerCheck( trigger )

    file.take0GOnExit[ maltaHangarLarge ] <- malta_hangar_large_exit
    file.take0GOnExit[ maltaHangarAngled ] <- malta_hangar_angled_exit
    file.take0GOnExit[ maltaGunDeck03Front ] <- malta_gundeck03_front_exit
    file.take0GOnExit[ maltaGunDeck03West ] <- malta_gundeck03_west_exit
    file.take0GOnExit[ maltaGunDeck03East ] <- malta_gundeck03_east_exit
    file.take0GOnExit[ maltaGunDeck03Closing ] <- malta_gundeck03_closing_exit
    file.take0GOnExit[ maltaGunDeck03Connecting ] <- malta_gundeck03_connection_exit
    file.take0GOnExit[ maltaGunDeck02Connecting ] <- malta_gundeck03_connection_exit
    file.take0GOnExit[ maltaGunDeck02East ] <- malta_gundeck02_east_exit
    file.take0GOnExit[ maltaGunDeck02Front ] <- malta_gundeck03_front_exit
    file.take0GOnExit[ maltaGunDeck01Front ] <- malta_gundeck03_front_exit
    file.take0GOnExit[ maltaGunDeck01East ] <- malta_gundeck01_east_exit
    file.take0GOnExit[ maltaGunDeck01Conclusion ] <- malta_gundeck01_conclusion_exit
    // file.take0GOnExit[ maltaLiftsAngled ] <- malta_gundeck01_east_exit
    file.take0GOnExit[ maltaLifts ] <- malta_lifts_exit
    file.take0GOnExit[ maltaGunDeck02Top ] <- malta_gundeck02_top_exit
    file.take0GOnExit[ maltaGunDeck01EastFiller ] <- malta_gundeck01_east_filler_exit
    file.take0GOnExit[ maltaGunDeck01EastFillerTop ] <- malta_gundeck01_east_exit

    if( GetConVarBool( "s2s_strip_debug" ) )
    {
        thread DrawPersistentTriggers()
    }
}

void function TriggerCheck( entity trigger )
{
    while( 1 )
    {
        table entryResults = trigger.WaitSignal( "OnStartTouch" )
        Give0G( expect entity( entryResults.activator ) )
        table exitResults = trigger.WaitSignal( "OnEndTouchAll" )
        if( file.take0GOnExit[ trigger ]( trigger, expect entity( exitResults.activator ) ) )
            Take0G( expect entity( exitResults.activator ) )
    }
}

void function Give0G( entity player )
{
	player.kv.gravity = 0.000001
	RemovePlayerAirControl( player )
	is0G[player] = true
}

void function Take0G( entity player )
{
	player.kv.gravity = 0
	RestorePlayerAirControl( player )
	is0G[player] = false
}

////////////////////////////////////////
//// TRIGGER EXIT CONTROL FUNCTIONS ////
////////////////////////////////////////

bool function malta_hangar_large_exit( entity trigger, entity activator )
{
    return activator.GetOrigin().x <= (trigger.GetOrigin() + trigger.GetBoundingMins()).x 
}

bool function malta_hangar_angled_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    return activator.GetOrigin().y > corners[2].y && activator.GetOrigin().x < corners[3].x 
}

bool function malta_gundeck03_front_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    return activator.GetOrigin().x < corners[2].x && activator.GetOrigin().z < corners[4].z && activator.GetOrigin().z > corners[0].z 
}

bool function malta_gundeck03_west_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return org.y <= corners[3].y && org.y >= corners[2].y && org.x <= corners[2].x && org.z < corners[4].z && org.z > corners[0].z
}

bool function malta_gundeck03_east_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return ((org.x <= corners[0].x && org.y >= corners[3].y) || (org.x <= corners[2].x && org.y <= corners[3].y)) && org.z < corners[4].z && org.z > corners[0].z && !GetEntByScriptName( "maltaGunDeck03Connection" ).IsTouching( activator )
}

bool function malta_gundeck03_closing_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return org.y <= corners[1].y && org.z >= corners[0].z && org.z <= corners[4].z
}

bool function malta_gundeck03_connection_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return (org.y <= corners[1].y || org.y >= corners[0].y) && org.z >= corners[0].z && org.z <= corners[4].z
}

bool function malta_gundeck02_east_exit( entity trigger, entity activator )
{
    // east 03
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return ((org.x <= corners[0].x && org.y >= corners[3].y) || (org.x <= corners[2].x && org.y <= corners[3].y)) && org.z < corners[4].z && org.z > corners[0].z && !GetEntByScriptName( "maltaGunDeck02Connection" ).IsTouching( activator )
}

bool function malta_gundeck02_top_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return org.z <= corners[0].z
}

bool function malta_gundeck01_east_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return org.y >= corners[7].y && org.x <= corners[0].x && org.y >= corners[1].y && org.z > corners[0].z && org.z < corners[4].z
}

bool function malta_gundeck01_east_filler_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return ((org.y >= corners[7].y && org.x <= corners[0].x && org.y >= corners[1].y) || org.x <= corners[2].x) && org.z > corners[0].z && org.z < corners[4].z && !GetEntByScriptName( "maltaLifts" ).IsTouching( activator )
}

bool function malta_gundeck01_conclusion_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return org.y >= corners[0].y && org.z >= corners[0].z && org.z <= corners[4].z
}

bool function malta_lifts_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return org.y <= corners[0].y && org.y >= corners[2].y && org.z >= corners[0].z && org.z <= corners[4].z && org.x <= corners[0].x && !GetEntByScriptName( "maltaGunDeck01EastAngle" ).IsTouching( activator )
}

vector[8] function GetAngledBoxCorners( vector origin, vector mins, vector maxs, vector angles )
{
	vector forward = AnglesToForward( angles )
	vector right = -AnglesToRight( angles )
	vector up = AnglesToUp( angles )
    vector[8] corners
	corners[0] = origin + (forward * maxs.x) + (right * maxs.y) + (up * mins.z)
	corners[1] = origin + (forward * maxs.x) + (right * mins.y) + (up * mins.z)
	corners[2] = origin + (forward * mins.x) + (right * mins.y) + (up * mins.z)
	corners[3] = origin + (forward * mins.x) + (right * maxs.y) + (up * mins.z)
	corners[4] = corners[0] + (up * (maxs.z - mins.z))
	corners[5] = corners[1] + (up * (maxs.z - mins.z))
	corners[6] = corners[2] + (up * (maxs.z - mins.z))
	corners[7] = corners[3] + (up * (maxs.z - mins.z))
    return corners
}

vector[8] function GetEntityCorners( entity ent )
{
    return GetAngledBoxCorners( ent.GetOrigin(), ent.GetBoundingMins(), ent.GetBoundingMaxs(), ent.GetAngles() )
}

void function tptest(entity player, entity trigger, int corner = 0)
{
    vector[8] v = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    player.SetOrigin(v[corner])
}