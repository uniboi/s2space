global function SetupSpawnpoints
global function PlayerRespawnedOnS2s

struct
{
	array<entity> IMC_spawnpoints
	array<entity> IMC_spawnpoints_start
	array<entity> MILITIA_spawnpoints
	array<entity> MILITIA_spawnpoints_start
    string spawnpointGamemodeOverride = ""
}
file

void function SetupSpawnpoints()
{
    // entity malta = GetEntByScriptName( "maltaTemplate" )
    // entity gibraltar = GetEntByScriptName( "gibraltarTemplate" )
    entity malta = GetMalta().mover
    entity gibraltar = GetGibraltar().mover

    array<vector> IMC_spawnpoints =
    [
        < 356.582, 639.906, -303.968 >,
        < 175.646, 497.041, -303.969 >,
        < 122.119, 726.809, -303.975 >,
        < -326.407, 897.857, -127.957 >,
        < 155.975, 1143.95, 104.039>,
        < -582.066, 997.875, 104.041 >,
        < 690.764, 3064.97, -319.969 >,
        < 116.002, 3106.2, -319.969 >,
        < -291.324, 2596.51, -79.9541 >,
        < 116.133, 4012.02, 576.031 >,
        < 6.32813, 4289.64, 864.031 >,
        < 596.223, 128.146, -383.969 >,
        < 109.863, 74.8633, -383.97 >,
        < 1511.85, -2188.58, -111.959 >,
        < 1065.94, -2477.56, -143.97 >,
        < 1485.63, -3812.45, -111.969 >,
        < 1066.34, -4097.79, -143.968 >,
        < 1501.99, -4329.73, -111.969 >,
        < 1398.65, -6401.55, 102.123 >,
        < 1114.14, -6538.69, 96.0313 >,
        < 1776.45, -5909.77, -145.969 >,
        < 1454.33, -5539.16, -111.969 >,
        < 1909.81, -2508.94, -193.969 >
    ]
	array<vector> IMC_spawnpoints_start = 
    [

        < 924.541, 2047.89, -379.931 >,
        < 957.24, 1317.09, -379.957 >,
        < 231.389, 1272.83, -379.956 >,
        < 195.833, 2039.29, -379.959 >,
        < 530.388, 1701.87, -379.966 >,
        < 566.277, 1902.27, -379.954 >,
        < 559.913, 1269.91, -379.954 >,
        < 587.982, 1430.28, -379.954 >,
        < 848.159, 1691.55, -379.968 >,
        < 1035.35, 1899.38, -379.968 >,
        < 1039.19, 1439.81, -379.968 >
    ]
	array<vector> MILITIA_spawnpoints = 
    [
        < -992.478, -4691.59, 176.031 >,
        < -981.674, -5135.12, 176.029 >,
        < -994.005, -5511.65, 176.043 >,
        < -980.235, -5810.54, 176.031 >,
        < -395.772, -5909.7, 350.031 >,
        < -386.814, -6456.25, 350.031 >,
        < -1022.97, -6508.34, 176.031 >,
        < -1423.99, -6020.48, 64.9551 >,
        < 164.412, -1767.62, -623.969 >,
        < 253.434, -1183.14, -575.969 >,
        < -1164.93, -2403.35, -575.969 >,
        < -254.318, -2486.67, -575.969 >,
        < 253.283, 411.525, 96.0313 >,
        < 160.48, -381.681, 76.3652 >,
        < -1160.22, 1732.28, 128.031 >,
        < -1123.17, 2206.05, 128.031 >,
        < -914.115, -534.742, 48.0313 >,
        < -387.307, -540.583, 48.0313 >,
        < 97.6387, -536.923, 76.3672 >,
        < 404.885, 72.1621, 96.0313 >
    ]
	array<vector> MILITIA_spawnpoints_start =
    [
        < -1320.8, -1633.38, -623.967 >,
        < -1397.18, -1968.54, -623.968 >,
        < -1686.36, -1790.94, -623.967 >,
        < -995.533, -6610.4, 176.033 >,
        < -967.645, -6050.78, 176.038 >,
        < -979.18, -5502.07, 176.041 >,
        < -971.691, -4924.59, 176.041 >,
        < -1026.88, -1841.81, -623.971 >,
        < -1027.72, -1598.09, -623.973 >,
        < -977.888, -1980.42, -623.967 >
    ]

    foreach( vector offset in IMC_spawnpoints )
        file.IMC_spawnpoints.append( SetupASpawnpoint( offset, malta ) )
    
    foreach( vector offset in IMC_spawnpoints_start )
        file.IMC_spawnpoints_start.append( SetupASpawnpoint( offset + <0,0,50>, malta ) )
    
    foreach( vector offset in MILITIA_spawnpoints )
        file.MILITIA_spawnpoints.append( SetupASpawnpoint( offset, gibraltar ) )
    
    foreach( vector offset in MILITIA_spawnpoints_start )
        file.MILITIA_spawnpoints_start.append( SetupASpawnpoint( offset, gibraltar ) )
}

entity function SetupASpawnpoint( vector offset, entity ref )
{
    entity info_point = CreateEntity( "info_player_start" )
    info_point.SetScriptName( "info_player_start" )
    SetTargetName( info_point, "info_player_start" )
    info_point.SetOrigin( offset + ref.GetOrigin() )
    info_point.SetAngles( <0,0,0> )
    DispatchSpawn( info_point )
    info_point.SetParent( ref )

    return info_point
}

void function PlayerRespawnedOnS2s( entity player )
{
	array<entity> spawnpoints_imc = file.IMC_spawnpoints_start
	array<entity> spawnpoint_militia = file.MILITIA_spawnpoints_start
    array<entity> spawnpoints

	if ( GetGameState() == eGameState.Playing )
	{
		spawnpoints_imc =  file.IMC_spawnpoints
        spawnpoint_militia=  file.MILITIA_spawnpoints_start
	}

    int team = player.GetTeam()
	if ( HasSwitchedSides() )
		team = GetOtherTeam( team )
    
    if ( team == TEAM_IMC )
    {
        spawnpoints = spawnpoints_imc
        player.SetAngles( <0,0,0> )
    }
    else
    {
        spawnpoints = spawnpoint_militia
        player.SetAngles( <0,180,0> )
    }

    print( spawnpoints_imc.len() )
    print( spawnpoint_militia.len() )
    print( file.MILITIA_spawnpoints_start.len() )
    print( file.IMC_spawnpoints_start.len() )

    entity spawnpoint = GetBestSpawnpoint( player, spawnpoints )

    player.SetOrigin( spawnpoint.GetOrigin() )
}

entity function GetBestSpawnpoint( entity player, array<entity> spawnpoints )
{
	// not really 100% sure on this randomisation, needs some thought
	array<entity> validSpawns
	foreach ( entity spawnpoint in spawnpoints )
	{
		if ( IsSpawnpointValid( spawnpoint, player.GetTeam() ) )
		{
			validSpawns.append( spawnpoint )
			
			if ( validSpawns.len() == 10 ) // arbitrary small sample size
				break
		}
	}

	if ( validSpawns.len() == 0 )
	{
		// no valid spawns, very bad, so dont care about spawns being valid anymore
		print( "found no valid spawns! spawns may be subpar!" )
		foreach ( entity spawnpoint in spawnpoints )
		{
			validSpawns.append( spawnpoint )
			
			if ( validSpawns.len() == 10 ) // arbitrary small sample size
				break
		}
	}
	
	// last resort
	if ( validSpawns.len() == 0 )
	{
		print( "map has literally 0 spawnpoints, as such everything is fucked probably, attempting to use info_player_start if present" )
		entity start = GetEnt( "info_player_start" )
		
		// if ( IsValid( start ) )
		// {
		// 	start.s.lastUsedTime <- -999
		// 	validSpawns.append( start )
		// }
	}
	
	return validSpawns[ RandomInt( validSpawns.len() ) ] // slightly randomize it
}

bool function IsSpawnpointValid( entity spawnpoint, int team )
{
	if ( !spawnpoint.HasKey( "ignoreGamemode" ) || ( spawnpoint.HasKey( "ignoreGamemode" ) && spawnpoint.kv.ignoreGamemode == "0" ) ) // used by script-spawned spawnpoints
	{
		if ( file.spawnpointGamemodeOverride != "" )
		{
			string gamemodeKey = "gamemode_" + file.spawnpointGamemodeOverride
			if ( spawnpoint.HasKey( gamemodeKey ) && ( spawnpoint.kv[ gamemodeKey ] == "0" || spawnpoint.kv[ gamemodeKey ] == "" ) )
				return false
		}
		else if ( GameModeRemove( spawnpoint ) )
			return false
	}
	
	int compareTeam = spawnpoint.GetTeam()
	if ( HasSwitchedSides() && ( compareTeam == TEAM_MILITIA || compareTeam == TEAM_IMC ) )
		compareTeam = GetOtherTeam( compareTeam )
		
	// foreach ( bool functionref( entity, int ) customValidationRule in file.customSpawnpointValidationRules )
	// 	if ( !customValidationRule( spawnpoint, team ) )
	// 		return false
		
	if ( spawnpoint.GetTeam() > 0 && compareTeam != team && !IsFFAGame() )
		return false
	
	// if ( spawnpoint.IsOccupied() )
	// 	return false
		
	// if ( Time() - spawnpoint.s.lastUsedTime <= 10.0 )
	// 	return false
		
	// foreach ( k, NoSpawnArea noSpawnArea in file.noSpawnAreas )
	// {
	// 	if ( Distance( noSpawnArea.position, spawnpoint.GetOrigin() ) > noSpawnArea.radius )
	// 		continue
			
	// 	if ( noSpawnArea.blockedTeam != TEAM_INVALID && noSpawnArea.blockedTeam == team )
	// 		return false
			
	// 	if ( noSpawnArea.blockOtherTeams != TEAM_INVALID && noSpawnArea.blockOtherTeams != team )
	// 		return false
	// }

	array<entity> projectiles = GetProjectileArrayEx( "any", TEAM_ANY, TEAM_ANY, spawnpoint.GetOrigin(), 600 )
	foreach ( entity projectile in projectiles )
		if ( projectile.GetTeam() != team )
			return false
	
	// los check
	// return !spawnpoint.IsVisibleToEnemies( team )
    return true
}