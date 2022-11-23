untyped

global function ClassicMP_s2space_Setup

global const float S2SPACE_INTRO_LENGTH = 12.0

void function ClassicMP_s2space_Setup()
{
	AddCallback_OnClientConnected( ClassicMP_s2space_SpawnPlayer )
	AddCallback_GameStateEnter( eGameState.Prematch, ClassicMP_s2space_Start )
}

void function ClassicMP_s2space_Start()
{
	ClassicMP_OnIntroStarted()

	foreach ( entity player in GetPlayerArray() )
		ClassicMP_s2space_SpawnPlayer( player )

    thread PlayDecoyShipIntro()
		
	wait S2SPACE_INTRO_LENGTH
	
	foreach ( entity player in GetPlayerArray() )
	{
		if ( !IsPrivateMatchSpectator( player ) )
		{
			player.UnfreezeControlsOnServer()
			RemoveCinematicFlag( player, CE_FLAG_CLASSIC_MP_SPAWNING )
		}
		
		TryGameModeAnnouncement( player )
	}
	
	ClassicMP_OnIntroFinished()
}

void function ClassicMP_s2space_SpawnPlayer( entity player )
{
	if ( GetGameState() != eGameState.Prematch )
		return
	
	if ( IsPrivateMatchSpectator( player ) ) // private match spectators use custom spawn logic
	{
		RespawnPrivateMatchSpectator( player )
		return
	}
	
	if ( IsAlive( player ) )
		player.Die()
	
    thread ClassicMP_s2space_PilotSpawnPlayer( player )
}


// spawn as pilot for intro
void function ClassicMP_s2space_PilotSpawnPlayer( entity player )
{
	RespawnAsPilot( player )
	player.FreezeControlsOnServer()
	AddCinematicFlag( player, CE_FLAG_CLASSIC_MP_SPAWNING )
	ScreenFadeFromBlack( player, 0.5, 0.5 )
}