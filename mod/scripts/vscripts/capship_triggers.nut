global function CapshipTriggersInit
global function Give0G
global function Take0G
global function GetAngledBoxCorners
global function GetEntityCorners
global function tptest
global function testc
global function LinePlaneCollision
global table<entity, bool> is0G

struct {
    array<entity> maltaTriggers
    array<entity> gibraltarTriggers
    table<entity, bool functionref(entity, entity)> take0GOnExit

    entity activatorToCompare
    vector lastActicatorPos
} file

void function DrawPersistentTriggers()
{
    #if HAS_QUERSCHNITT
    printt( "[s2s] Querschnitt is not enabled. Debug triggers will only draw on the hosting client." )
    #endif

    while( 1 )
    {
        foreach( entity ent in file.maltaTriggers )
        {
            #if HAS_QUERSCHNITT
                vector[8] corners = GetEntityCorners( ent )
                DrawGlobal( "rotatedbox", ent.GetOrigin(), ent.GetBoundingMins(), ent.GetBoundingMaxs(), ent.GetAngles(), 0, 255, 255, true, 0.1 )
                DrawGlobal( "line", corners[0], corners[5], 255, 255, 0, true, 0.1 )
            #else
                DebugDrawRotatedBox( ent.GetOrigin(), ent.GetBoundingMind(), ent.GetBoundingMaxs(), ent.GetAngles(), 0, 255, 255, true, 0.1 )
            #endif
        }
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
    entity maltaLowerDeckLong = GetEntByScriptName( "maltaLowerDeck" )
    entity maltaLowerDeckEastAngle = GetEntByScriptName( "maltaLowerDeckEastAngle" )
    entity maltaLowerDeckWestAngle = GetEntByScriptName( "maltaLowerDeckWestAngle" )
    file.maltaTriggers = [ maltaHangarLarge, maltaHangarAngled, maltaGunDeck03Front, maltaGunDeck03West, maltaGunDeck03East, maltaGunDeck03Closing, maltaGunDeck03Connecting, maltaGunDeck02Connecting, maltaGunDeck02East, maltaGunDeck02Front, maltaGunDeck01Front, maltaGunDeck01East, maltaGunDeck01Conclusion, /*maltaLiftsAngled,*/ maltaLifts, maltaGunDeck02Top, maltaGunDeck01EastFiller, maltaGunDeck01EastFillerTop, maltaLowerDeckLong, maltaLowerDeckEastAngle, maltaLowerDeckWestAngle ]

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
    file.take0GOnExit[ maltaLowerDeckLong ] <- trigger_local_south_exit
    file.take0GOnExit[ maltaLowerDeckEastAngle ] <- trigger_local_south_exit
    file.take0GOnExit[ maltaLowerDeckWestAngle ] <- trigger_local_south_exit

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

//* local orientation leave triggers

bool function trigger_north_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    return org.x <= corners[3].x && org.y >= corners[1].y && org.y <= corners[0].y && org.z <= corners[4].z && org.z >= corners[0].z
}

// bool function trigger_local_south_exit( entity trigger, entity activator )
// {
//     vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
//     vector org = activator.GetOrigin()
//     vector center = trigger.GetWorldSpaceCenter()

//     vector cmpPoint = corners[3]
//     if( corners[2].y < corners[3].y )
//         cmpPoint = corners[2]

//     float lowestY = corners[3].y
//     if( corners[2].y < corners[3].y )
//         lowestY = corners[2].y

//     float lowestX = corners[3].x
//     if( corners[2].x < corners[3].x )
//         lowestX = corners[2].x

//     bool yNeedsToBeLower = false
//     if( corners[0].y > corners[3].y )
//         yNeedsToBeLower = true
//     bool xNeedsToBeLower = false
//     if( corners[0].x > corners[3].x )
//         xNeedsToBeLower = true

//     array tmp
//     foreach(vector v in corners)
//         tmp.append(v)

//     bool cmpheight = org.z > corners[0].z && org.z < corners[4].z
//     bool cmpY = yNeedsToBeLower ? org.y < lowestY : org.y > lowestY
//     bool cmpX = org.x >= cmpPoint.x && org.x <= lowestX

//     printt("=== corners ===",tmp,"=== center ===",center,"=== activator ===",activator.GetOrigin(),"=== yNeedsToBeLower ===",yNeedsToBeLower,"=== xNeedsToBeLower ===",xNeedsToBeLower,"=== cmpheight ===",cmpheight,"=== cmpY ===",cmpY)

//     return cmpheight && cmpY
//     // return ((org.y >= corners[7].y && org.x <= corners[0].x && org.y >= corners[1].y) || org.x <= corners[2].x) && org.z > corners[0].z && org.z < corners[4].z
// }

bool function trigger_local_north_exit( entity trigger, entity activator )
{
    return GetLocalFaceExitDirection( Normalize( trigger.GetWorldSpaceCenter() - activator.GetOrigin() ) ) == <1,0,0>
}

bool function trigger_local_south_exit( entity trigger, entity activator )
{
    vector[8] corners = GetAngledBoxCorners( trigger.GetOrigin(), trigger.GetBoundingMins(), trigger.GetBoundingMaxs(), trigger.GetAngles() )
    vector org = activator.GetOrigin()
    vector center = trigger.GetWorldSpaceCenter()

    vector c2n = Normalize( corners[2] - center )
    vector c3n = Normalize( corners[3] - center )
    vector c6n = Normalize( corners[6] - center )
    vector c7n = Normalize( corners[7] - center )

    vector cp = Normalize( center - org )

    DrawGlobal( "line", trigger.GetWorldSpaceCenter(), activator.GetOrigin(), 255, 255, 255, true, 5.0 )

    // DrawGlobal( "line", center, corners[2], 184, 101, 237, true, 5.0 )
    // DrawGlobal( "line", center, corners[3], 184, 101, 237, true, 5.0 )
    // DrawGlobal( "line", center, corners[6], 184, 101, 237, true, 5.0 )
    // DrawGlobal( "line", center, corners[7], 184, 101, 237, true, 5.0 )

    // DrawGlobal( "line", corners[2], org, 0, 255, 0, true, 5.0 )
    // DrawGlobal( "line", corners[3], org, 0, 255, 0, true, 5.0 )
    // DrawGlobal( "line", corners[6], org, 0, 255, 0, true, 5.0 )
    // DrawGlobal( "line", corners[7], org, 0, 255, 0, true, 5.0 )

    printt( "corner 2 (bottom right)  " + c2n,
            "corner 3 (bottom left)   " + c3n,
            "corner 6 (top right)     " + c6n,
            "corner 7 (top left)      " + c7n,
            "center -> player         " + cp )

    // return GetLocalFaceExitDirection( Normalize( trigger.GetWorldSpaceCenter() - activator.GetOrigin() ) ) == <(-1),0,0>

    printt( cp.y >= c2n.y, cp.y <= c3n.y, cp.z >= c2n.z, cp.z <= c6n.z )

    
    // plane stuff

    vector c3_c2 = corners[3] - corners[2]
    vector c3_c7 = corners[3] - corners[7]
    vector planeNormal = Normalize( CrossProduct( c3_c2, c3_c7 ) )
    printt( c3_c2, c3_c7, planeNormal )
    vector rayDirection = center - org

    vector collision = LinePlaneCollision( planeNormal, corners[3], rayDirection, center )
    DrawGlobal( "circle", collision, trigger.GetAngles() - <0,90,90>, 20, 255, 255, 50, true, 5.0 )
    printt( collision, trigger.GetAngles() )

    vector center_collision = center - collision
    vector center_origin = center - org
    vector center_corner0 = center - corners[3]
    vector collision_origin = collision - org
    printt( Normalize( center_collision ), Normalize( center_origin ), "0 and 1 are equal: " + (Normalize( center_origin ) == Normalize( center_collision )),
        LengthSqr( center_collision ), LengthSqr( center_origin ), "center -> collision smaller than center -> origin: " + (LengthSqr( center_collision ) < LengthSqr( center_origin )), "center -> collision smaller than center -> lc3: " + (LengthSqr( center_collision ) < LengthSqr( center_corner0 )) )

    return LengthSqr( center_collision ) < LengthSqr( center_origin ) && LengthSqr( center_collision ) < LengthSqr( center_corner0 ) && LengthSqr( collision_origin ) < LengthSqr( center_collision )

    // eop

    // return cp.y >= c2n.y && cp.y <= c3n.y && cp.z >= c2n.z && cp.z <= c6n.z
}

bool function trigger_local_top_exit( entity trigger, entity activator )
{
    return GetLocalFaceExitDirection( Normalize( trigger.GetWorldSpaceCenter() - activator.GetOrigin() ) ) == <0,0,1>
}

bool function trigger_local_bottom_exit( entity trigger, entity activator )
{
    return GetLocalFaceExitDirection( Normalize( trigger.GetWorldSpaceCenter() - activator.GetOrigin() ) ) == <0,0,-1>
}

vector function GetLocalFaceExitDirection( vector exitNormal )
{
    array<float> tmp = [ exitNormal.x, exitNormal.y, exitNormal.z ]

    int biggestIdx
    bool isNeg
    foreach( int i, float f in tmp )
    {
        if( fabs( f ) >= fabs( tmp[ biggestIdx ] ) )
        {
            biggestIdx = i
            isNeg = f < 0
        }
    }
    tmp = [ 0.0, 0.0, 0.0 ]
    tmp[ biggestIdx ] = isNeg ? 1.0 : -1.0

    printt(exitNormal,<tmp[0], tmp[1], tmp[2]>)
    return <tmp[0], tmp[1], tmp[2]>
}

int function GetTriggerFacingExit( entity activator, vector[8] corners )
{
    // if( GetNearestCorners( activator.GetOrigin(), corners ) )
    //     return 0
    
    throw "invalid facing"
    unreachable
}

array<vector> function GetNearestCorners( vector pos, vector[8] corners )
{
    array<vector> dc
    foreach( vector v in corners )
        dc.append( v )
    file.lastActicatorPos = pos

    dc.sort( int function( vector a, vector b ) {
        float al = LengthSqr( file.lastActicatorPos - a )
        float bl = LengthSqr( file.lastActicatorPos - b ) 
        if( al < bl ) return 1
        else if( al > bl ) return -1
        return 0
     } )
     
     return dc.slice( 4 )
}

array<vector> function GetCornerDirections_cc( vector center, vector[8] corners )
{
    array<vector> directions
    foreach( vector v in corners )
        directions.append( Normalize( v - center ) )
    // vector[8] directions
    // directions[0] = Normalize( corners[0] - center )
    // directions[1] = Normalize( corners[1] - center )
    // directions[2] = Normalize( corners[2] - center )
    // directions[3] = Normalize( corners[3] - center )
    // directions[4] = Normalize( corners[4] - center )
    // directions[5] = Normalize( corners[5] - center )
    // directions[6] = Normalize( corners[6] - center )
    // directions[7] = Normalize( corners[7] - center )
    return directions
}

vector[8] function GetCornerDirections( vector[8] corners )
{
    vector center = corners[0] + (corners[2] - corners[0]) / 2 + (corners[4] - corners[0]) / 2
    vector[8] directions
    directions[0] = Normalize( corners[0] - center )
    directions[1] = Normalize( corners[1] - center )
    directions[2] = Normalize( corners[2] - center )
    directions[3] = Normalize( corners[3] - center )
    directions[4] = Normalize( corners[4] - center )
    directions[5] = Normalize( corners[5] - center )
    directions[6] = Normalize( corners[6] - center )
    directions[7] = Normalize( corners[7] - center )
    return directions
}

vector function testc( vector[8] corners )
{
    return corners[0] + (corners[2] - corners[0]) / 2 + (corners[4] - corners[0]) / 2
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

vector function LinePlaneCollision( vector planeNormal, vector planePoint, vector rayDirection, vector rayPoint )
{
    float ndotu = planeNormal.Dot( rayDirection )
    // dings überprüfen ob überhaupt schneiden und so

    vector w = rayPoint - planePoint
    float si = -planeNormal.Dot( w ) / ndotu
    return w + si * rayDirection + planePoint
}