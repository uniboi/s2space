global function MpS2s
global function GetMalta
global function GetGibraltar
global function GetTrinity
global function GetOLA

const asset MILITIA_DECOY_SHIP_MODEL 	= $"models/vehicles_r2/spacecraft/trinity/s2s_trinity_destroyed.mdl"

const asset FX_DECOY_SHIP_DESTRUCTION 	= $"P_exp_trin_death"
global const asset FX_DECK_FLAP_WIND 			= $"P_s2s_flap_wind"

const float DEF_WORLDCENTERLEADDIST = 5000
const float GRAVITYFRAC = 0.87

const asset MODEL_DAVIS 	= $"models/humans/pilots/sp_medium_stalker_m.mdl"
const asset MODEL_DROZ 		= $"models/humans/pilots/sp_medium_reaper_m.mdl"
const asset MODEL_GATES 	= $"models/humans/pilots/sp_medium_geist_f.mdl"
const asset MODEL_BEAR 		= $"models/humans/pilots/sp_heavy_roog_m.mdl"
const asset MODEL_VIPER_HATCH = $"models/props/titan_northstar_hatch/titan_northstar_hatch_animated.mdl"
const asset MODEL_VIPER_PILOT = $"models/humans/heroes/imc_hero_viper.mdl"
const asset MODEL_BT_ARM	= $"models/props/bt_left_arm/bt_left_arm_animated.mdl"

const asset PLAYER_WIND_FX 	= $"P_wind_cruising"
const asset BOSS_TITAN_DEATH_FX	= $"P_s2s_viper_death_fire"
const asset BOSS_TITAN_EXP_FX	= $"xo_exp_death_s2s"
const asset ION_BALL 		= $"P_ion_moving_proj"
const asset CANNON_FX		= $"P_muzzleflash_MaltaGun"
const asset CANNON_IMPACT	= $"P_exp_flak_s2s"
const asset BREACH_FX1 		= $"p_impact_exp_smll_air"
const asset BREACH_FX_GLASS		= $"P_glass_exp_breach"
const asset BT_FX_GLASS		= $"P_glass_exp_bridge"
const asset BT_FX_GLASS_SML	= $"P_glass_exp_bridge_SML"
const asset SATCHEL_BLINK_FX = $"wpn_satchel_clacker_glow_LG_1"
const asset BRIDGE_GLASS_WIND_FX = $"P_s2s_bridge_wind"
const asset FX_KILLSHOT_BLOODSPRAY = $"P_deathfx_human"
const asset FX_LIFEBOAT_LAUNCH 		= $"P_veh_ePod_launch"
const asset FX_LIFEBOAT_LIGHT 		= $"P_veh_ePod_light"
const asset FX_BT_ARM_DAMAGED 	= $"P_xo_arm_damaged"
const asset FX_BT_ARM_DAMAGED_POP 	= $"P_xo_arm_damaged_pop"
const asset FX_BT_ARM_DAMAGED_POP_SM = $"P_xo_arm_damaged_pop_SM"
const asset FX_BT_VENT_FIRE = $"xo_health_dam_exhaust_fire_1"
const asset FX_VIPER_COCKPIT_DLIGHT = $"P_dlight_cokpit_viper"

const asset VIPER_CORE_EFFECT = $"P_titan_core_atlas_blast"
const asset ARK_LIGHT_FX 		= $"P_s2s_coreroom_core_light"
const asset SHIPFIRE_FX			= $"P_ship_fire_large"

const asset RIG_LAND_SKYBOX = $"models/vistas/s2s_land_attachpoints_neg1000x.mdl"

const asset SE_LAND_A 		= $"models/vistas/s2s_se_a.mdl"
const asset SE_LAND_B 		= $"models/vistas/s2s_se_b.mdl"
const asset SE_LAND_AB 		= $"models/vistas/s2s_se_trans_ab.mdl"
const asset SE_LAND_BA 		= $"models/vistas/s2s_se_trans_ba.mdl"

const asset SE_VISTA_A1		= $"models/vistas/s2s_se_canyon_vista_a.mdl"
const asset SE_VISTA_A2		= $"models/vistas/s2s_se_canyon_vista_c.mdl"
const asset SE_VISTA_A3		= $"models/vistas/s2s_se_canyon_vista_e.mdl"
const asset SE_VISTA_A4		= $"models/vistas/s2s_se_canyon_vista_g.mdl"
const asset SE_VISTA_B1		= $"models/vistas/s2s_se_canyon_vista_b.mdl"
const asset SE_VISTA_B2		= $"models/vistas/s2s_se_canyon_vista_d.mdl"
const asset SE_VISTA_B3		= $"models/vistas/s2s_se_canyon_vista_f.mdl"
const asset SE_VISTA_B4		= $"models/vistas/s2s_se_canyon_vista_h.mdl"

const asset SE_CLOUDS_A		= $"models/vistas/s2s_se_clouds_front_a.mdl"
const asset SE_CLOUDS_B		= $"models/vistas/s2s_se_clouds_front_b.mdl"
const asset SE_CLOUDS_C		= $"models/vistas/s2s_se_clouds_front_c.mdl"
const asset SE_SPIRE 		= $"models/vistas/s2s_se_spire_a.mdl"

const asset SE_DRACONIS 	= $"models/vehicles_r2/spacecraft/draconis/draconis_flying_1000x.mdl"
const asset SE_MALTA 		= $"models/vehicles_r2/spacecraft/malta/malta_flying_hero_1000x.mdl"

const asset SATCHEL_MODEL 		= $"models/weapons/caber_shot/caber_shot_thrown.mdl"
const asset BRIDGE_GLASS_CRACKED = $"models/s2s/s2s_bridge_glass_cracked.mdl"
const asset BRIDGE_GLASS_CRACKED_V2 = $"models/s2s/s2s_bridge_glass_cracked_v2.mdl"
const asset BRIDGE_GLASS_CRACKED_V3 = $"models/s2s/s2s_bridge_glass_cracked_v3.mdl"
const asset BRIDGE_GLASS_CRACKED_V4 = $"models/s2s/s2s_bridge_glass_cracked_v4.mdl"
const asset BRIDGE_GLASS_CRACKED_V5 = $"models/s2s/s2s_bridge_glass_cracked_v5.mdl"
const asset BRIDGE_GLASS_CRACKED_V6 = $"models/s2s/s2s_bridge_glass_cracked_v6.mdl"

const asset OLA_FLYING_MODEL 	= $"models/vehicles_r2/spacecraft/draconis/draconis_flying_hero.mdl"
const asset CORE_USE_MODEL 		= $"models/containers/pelican_case_large_open.mdl"
const asset ESCAPE_POD_MODEL_CHEAP 	= $"models/vehicle/escape_pod/escape_pod_dyn.mdl"

global const vector Malta_Start = < -5000, 0, 0 >
global const vector Gibraltar_Start = < 5000, 0, 0 >


struct SkyBoxLandSection
{
	//lanes
	table<string,entity> lane
	array<entity> extras
}

struct
{
	ShipStruct& gibraltar
	ShipStruct& barkership
	ShipStruct& malta
	ShipStruct& OLA
	ShipStruct& trinity
	array<ShipStruct> widows

	entity skyRig
	float worldCenterLeadDist
	// viper maybe?
	entity viper
    ShipStruct& viperShip

    //misc
	entity sculptor
	entity objBridgePanel
	float driftWC_MaxSpeed
	float driftWC_MaxAcc
    table<string,table<asset,array<asset> > > landTree
}
file

void function MpS2s()
{
	PrecacheModel( MILITIA_DECOY_SHIP_MODEL )
	PrecacheModel( SE_LAND_A )
	PrecacheModel( SE_LAND_B )
	PrecacheModel( SE_LAND_AB )
	PrecacheModel( SE_LAND_BA )
	PrecacheModel( SE_VISTA_A1 )
	PrecacheModel( SE_VISTA_A2 )
	PrecacheModel( SE_VISTA_A3 )
	PrecacheModel( SE_VISTA_A4 )
	PrecacheModel( SE_VISTA_B1 )
	PrecacheModel( SE_VISTA_B2 )
	PrecacheModel( SE_VISTA_B3 )
	PrecacheModel( SE_VISTA_B4 )
	PrecacheModel( SE_CLOUDS_A )
	PrecacheModel( SE_CLOUDS_B )
	PrecacheModel( SE_CLOUDS_C )
	PrecacheModel( SE_SPIRE )
	PrecacheModel( $"models/props/global_access_panel_button/global_access_panel_button_console.mdl" )
	PrecacheModel( $"models/signs/flag_base_pole_ctf.mdl" )
	
	PrecacheParticleSystem( PLAYER_WIND_FX )
	PrecacheParticleSystem( FX_DECOY_SHIP_DESTRUCTION )
	PrecacheParticleSystem( CANNON_FX )
	PrecacheParticleSystem( CANNON_IMPACT )
	PrecacheParticleSystem( FX_DECK_FLAP_WIND )

	PrecacheWeapon( "sp_weapon_swarm_rockets_s2s" )

	FlagInit( "StopWindFx" )
	FlagInit( "StopDynamicSky" )
	FlagInit( "MaltaDeckClear" )

	RegisterSignal( "landpop" )
	RegisterSignal( "MaltaSideGunAimAtThink" )

	ClassicMP_SetLevelIntro( ClassicMP_DefaultNoIntro_Setup, ClassicMP_DefaultNoIntro_GetLength() )
	
	// AddCallback_EntitiesDidLoad( EntitiesDidLoadFaster )
    S2S_CapShipsInit()
    S2S_CommonInit()
    AddCallback_EntitiesDidLoad( EntitiesDidLoad )
}

void function EntitiesDidLoadFaster()
{
	SetupDropshipsSpawnsOnGibraltar()
	SetupDropshipsSpawnsOnMalta()
	SetupSpawnpoints()
	AddCallback_OnPlayerRespawned( PlayerRespawnedOnS2s )

	foreach( entity player in GetPlayerArray() )
		PlayerRespawnedOnS2s( player )
}

void function EntitiesDidLoad()
{
	file.malta 		= SpawnMalta( CLVec( Malta_Start ) ) // cool interior design ship :)
	file.gibraltar 	= SpawnGibraltar( CLVec( Gibraltar_Start ) ) // ion gun lmao
	file.OLA        = SpawnOLA( CLVec( < 0, 0, -2500 > ) ) // no man sky like ship
	file.trinity    = SpawnTrinity( CLVec( < -1000, 0, 4000 > ) ) // dropship mother XD

	EntitiesDidLoadFaster()

    file.worldCenterLeadDist = DEF_WORLDCENTERLEADDIST
	//the main ships that are always there

	//setup the lifts
	LiftSetup( file.malta, GetEntByScriptName( "droneBay0" ) )
	LiftSetup( file.malta, GetEntByScriptName( "droneBayReal2" ) )

	//hide the fakes for cube map building
	ShipGeoHide( file.malta, "GEO_CHUNK_BACK_FAKE" )
	ShipGeoHide( file.malta, "GEO_CHUNK_HANGAR_FAKE" )
	ShipGeoHide( file.malta, "GEO_CHUNK_DECK_FAKE" )
	ShipGeoHide( file.OLA, 	"DRACONIS_CHUNK_LOWDEF" )
	ShipGeoHide( file.trinity, "TRINITY_CHUNK_INTERIOR_FAKE" )

	GetEntByScriptName( "MaltaSideClip" ).NotSolid()

	//setup skybox
	// Sky_InitData()
	// SkyAnimatePart1()

	//SE element that gets closer
	// entity ref = GetEntByScriptName( "se_Sculptor" )
	// entity sculptor 	= CreateScriptMover( ref.GetOrigin(), ref.GetAngles() )
	// sculptor.SetModel( ref.GetModelName() )
	// file.sculptor = sculptor
	// ref.Destroy()
	
	//highlight for the bridge controls
	entity panel = GetEntByScriptName( "maltaBridgeControl" )

	file.objBridgePanel = CreatePropScript( panel.GetModelName(), panel.GetOrigin(), panel.GetAngles(), 0, 99999 )
	file.objBridgePanel.SetParent( panel.GetParent(), "", true )

	//the window covers in the back of the bridge
	entity shield = GetEntByScriptName( "bridgeBackShield" )

	//the elevator doors
	// file.malta.lifts[ "droneBayReal2" ][0].doorTopC.Hide()
	// file.malta.lifts[ "droneBayReal2" ][0].doorTopS.Hide()
	// GetEntByScriptName( "maltaGunTurret1" ).Hide()
	// GetEntByScriptName( "maltaGunTurret2" ).Hide()
	// GetEntByScriptName( "maltaGunTurret3" ).Hide()

	InitScript( "scr_trinity_node_1" )
	InitScript( "scr_gibraltar_node_1" )
	InitScript( "scr_malta_node_0" )
	InitScript( "scr_malta_node_1" )
	InitScript( "scr_malta_node_1b" )
	InitScript( "scr_malta_node_2" )
	InitScript( "scr_malta_node_3" )
	InitScript( "scr_malta_node_3b" )
	InitScript( "scr_malta_node_4" )
	InitScript( "scr_malta_node_5" )
	InitScript( "scr_ola_node_1" )
	InitScript( "scr_ola_node_2" )

	EnableScript( file.gibraltar, "scr_gibraltar_node_1" )
	EnableScript( file.malta, "scr_malta_node_0" )
	EnableScript( file.malta, "scr_malta_node_1" )
	EnableScript( file.malta, "scr_malta_node_1b" )
	EnableScript( file.malta, "scr_malta_node_2" )
	EnableScript( file.malta, "scr_malta_node_3" )
	EnableScript( file.malta, "scr_malta_node_3b" )
	// EnableScript( file.malta, "scr_malta_node_4" )
	// EnableScript( file.malta, "scr_malta_node_5" )

	array<entity> guns = []
	guns.append( GetEntByScriptName( "maltaGunTurret1" ) )
	guns.append( GetEntByScriptName( "maltaGunTurret2" ) )
	guns.append( GetEntByScriptName( "maltaGunTurret3" ) )

	foreach ( ent in guns )
	{
		entity clip = ent.GetLinkEnt()
		clip.SetPusher( true )
		clip.SetParent( ent, "muzzle_flash", true, 0 )
	}

	AddCallback_GameStateEnter( eGameState.Playing, FinalSetup )
}

void function FinalSetup()
{
	thread HangarLiftPanelsClose( 0.1 )
	thread HangarLiftLower( 10.0, 0.2, 1.0 )

	MaltaSideGunsRandomFire()

	LocalVec origin1 = GetOriginLocal( file.malta.mover )
	origin1.v -= <2000,0,-2000>
	// thread ShipFlyToPos( file.malta, origin1 )
	thread IdleCapshipMovement( file.malta )

	LocalVec origin2 = GetOriginLocal( file.gibraltar.mover )
	origin2.v += <2000,0,2000>
	// ShipFlyToPos( file.gibraltar, origin2 )
	thread IdleCapshipMovement( file.gibraltar )

	DoCustomBehavior( file.malta, Custom_IdleAtTarget )
	
	WarpOutShip( file.OLA )

	GetEntByScriptName( "MaltaSideClip" ).Solid() //the boss missiles should be passed by now
	GetEntByScriptName( "MaltaSideClip" ).kv.CollisionGroup = TRACE_COLLISION_GROUP_BLOCK_WEAPONS//this it shootable but not have phys collision

	ShipStruct trinity = file.trinity
	entity mover = trinity.mover
	entity model = trinity.model

	entity decoyShip = CreateEntity( "script_mover" )
	decoyShip.kv.solid = 0
	decoyShip.SetModel( MILITIA_DECOY_SHIP_MODEL )
	decoyShip.kv.SpawnAsPhysicsMover = 0
	DispatchSpawn( decoyShip )

	decoyShip.SetOrigin( model.GetOrigin() )
	decoyShip.SetAngles( model.GetAngles() )
	LocalVec startOrigin = WorldToLocalOrigin( model.GetOrigin() )

	Ship_CleanDelete( trinity )
	SetOriginLocal( decoyShip, startOrigin )

	vector fwd = decoyShip.GetForwardVector()
	vector pos = GetOriginLocal( decoyShip ).v + < 0, -80000, -10000 >
	LocalVec shipEndPos = CLVec( pos )

	EmitSoundOnEntity( decoyShip, "Hermes_Explode_Temp" )

	string attachAlias = "Explosion_LG_Impact"
	int attachID = decoyShip.LookupAttachment( attachAlias )
	vector attachOrg = decoyShip.GetAttachmentOrigin( attachID )

	//Main Death Explosion
	entity destroyFX = StartParticleEffectOnEntity( decoyShip, GetParticleSystemIndex( FX_DECOY_SHIP_DESTRUCTION ), FX_PATTACH_POINT_FOLLOW, attachID )

	string crashAnim = "s2s_trinity_destroyed_explode"
	float animtime = 20//decoyShip.GetSequenceDuration( crashAnim )
	thread PlayAnim( decoyShip, crashAnim, decoyShip )

	//decoyShip.NonPhysicsMoveTo( shipEndPos, animtime, 0, 0 )
	NonPhysicsMoveToLocal( decoyShip, shipEndPos, animtime, 15, 0 )

	wait animtime - 4

	if ( IsValid( decoyShip ) )
		decoyShip.Destroy()
	
	WaitSignal( file.malta, "Goal" )
}

/************************************************************************************************\

███████╗██╗  ██╗██╗   ██╗██████╗  ██████╗ ██╗  ██╗
██╔════╝██║ ██╔╝╚██╗ ██╔╝██╔══██╗██╔═══██╗╚██╗██╔╝
███████╗█████╔╝  ╚████╔╝ ██████╔╝██║   ██║ ╚███╔╝
╚════██║██╔═██╗   ╚██╔╝  ██╔══██╗██║   ██║ ██╔██╗
███████║██║  ██╗   ██║   ██████╔╝╚██████╔╝██╔╝ ██╗
╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═════╝  ╚═════╝ ╚═╝  ╚═╝

\************************************************************************************************/

const int MAXLANDTAGS = 8
void function SkyAnimatePart1()
{
	//wait 0.1
	entity skyRig 	= CreateSkyRig()
	//thread PlayAnimTeleport( skyRig, "vs_canyon_run_loop" )
	skyRig.Anim_Play( "vs_canyon_run_loop" )
	array<SkyBoxLandSection> landModels = Sky_CreateInitialLandScape( skyRig )
	thread DynamicSkyThink( skyRig , landModels )

	#if DEV
		if ( DEV_DRAWSKYRIG )
			thread DEV_DrawSkyRig( skyRig, landModels )
	#endif
}

void function Sky_InitData()
{
	//create a tree of options that tell the script what next piece we can go too
	file.landTree[ "center" ] 	<- {}
	file.landTree[ "left" ] 	<- {}
	file.landTree[ "right" ] 	<- {}

	file.landTree[ "center" ][ SE_LAND_A ] 		<- [ SE_LAND_A, SE_LAND_AB ]
	file.landTree[ "center" ][ SE_LAND_B ] 		<- [ SE_LAND_B, SE_LAND_BA ]
	file.landTree[ "center" ][ SE_LAND_AB ] 	<- [ SE_LAND_B ]
	file.landTree[ "center" ][ SE_LAND_BA ] 	<- [ SE_LAND_A ]
	file.landTree[ "left" ][ SE_VISTA_A1 ] 		<- [ SE_VISTA_A2 ]
	file.landTree[ "left" ][ SE_VISTA_A2 ] 		<- [ SE_VISTA_A3 ]
	file.landTree[ "left" ][ SE_VISTA_A3 ] 		<- [ SE_VISTA_A4 ]
	file.landTree[ "left" ][ SE_VISTA_A4 ] 		<- [ SE_VISTA_A1 ]
	file.landTree[ "right" ][ SE_VISTA_B1 ] 	<- [ SE_VISTA_B2 ]
	file.landTree[ "right" ][ SE_VISTA_B2 ] 	<- [ SE_VISTA_B3 ]
	file.landTree[ "right" ][ SE_VISTA_B3 ] 	<- [ SE_VISTA_B4 ]
	file.landTree[ "right" ][ SE_VISTA_B4 ] 	<- [ SE_VISTA_B1 ]
}

void function DynamicSkyThink( entity skyRig, array<SkyBoxLandSection> landModels )
{
	if ( Flag( "StopDynamicSky" ) )
		return
	FlagEnd( "StopDynamicSky" )
	//the last one is the first one
	int prevLandTag = 0

	//bring in new land pieces
	while( 1 )
	{
		skyRig.WaitSignal( "landpop" )
		int nextLandTag = Sky_PrepareNextLandPiece( prevLandTag, landModels, skyRig )
		prevLandTag = nextLandTag

		#if DEV
			if ( DEV_DRAWSKYRIG && GetMoDevState() )
				DebugDrawText( skyRig.GetOrigin() + < 500,1500,200 >, "Last Land Tag: " + ( prevLandTag + 1 ), true, 8.0 )
		#endif
	}
}

int function Sky_PrepareNextLandPiece( int prevLandTag, array<SkyBoxLandSection> landModels, entity skyRig )
{
	int nextLandTag = Sky_GetNextLandTag( prevLandTag )
	SkyBoxLandSection nextLandSection = landModels[ nextLandTag ]
	SkyBoxLandSection prevLandSection = landModels[ prevLandTag ]

	//destroy the extras that were on it
	if ( nextLandSection.extras.len() )
	{
		foreach( element in nextLandSection.extras )
			element.Destroy()
		nextLandSection.extras = []
	}

	//prepare a new land piece
	foreach ( lane, landModel in nextLandSection.lane )
	{
		asset prevLandAsset = prevLandSection.lane[ lane ].GetModelName()
		asset nextLandAsset = file.landTree[ lane ][ prevLandAsset ].getrandom()
		nextLandSection.lane[ lane ].SetModel( nextLandAsset )
	}

	//options for extras

	//always have clouds
	array<asset> cloudModels = [ SE_CLOUDS_A, SE_CLOUDS_B, SE_CLOUDS_C ]
	entity clouds = CreatePropDynamic( cloudModels.getrandom() )
	string tagIndex = "LAND_" + ( nextLandTag + 1 )
	clouds.SetParent( skyRig, tagIndex, false, 0 )
	nextLandSection.extras.append( clouds )

	return nextLandTag
}

int function Sky_GetNextLandTag( int prevLandTag )
{
	int nextLandTag = prevLandTag - 1
	if ( nextLandTag < 0 )
		nextLandTag = MAXLANDTAGS - 1

	return nextLandTag
}

entity function CreateSkyRig()
{
	entity skycam = GetEnt( "skybox_cam_level" )
	skycam.DisableHibernation()

	entity skyRig = CreateExpensiveScriptMoverModel( RIG_LAND_SKYBOX, skycam.GetOrigin(), CONVOYDIR )
	skyRig.DisableHibernation()

	skyRig.EnableDebugBrokenInterpolation()

	file.skyRig = skyRig

	return skyRig
}

array<SkyBoxLandSection> function Sky_CreateInitialLandScape( entity skyRig )
{
	array<SkyBoxLandSection> landModels = []

	for ( int i = 0; i < MAXLANDTAGS; i++ )
	{
		string tagIndex = "LAND_" + ( i + 1 )
		SkyBoxLandSection landSection
		entity model

		model = CreatePropDynamic( SE_LAND_A )
		model.SetParent( skyRig, tagIndex, false, 0 )
		landSection.lane[ "center" ] <- model

		model = CreatePropDynamic( SE_VISTA_A1 )
		model.SetParent( skyRig, tagIndex, false, 0 )
		landSection.lane[ "left" ] <- model

		model = CreatePropDynamic( SE_VISTA_B2 )
		model.SetParent( skyRig, tagIndex, false, 0 )
		landSection.lane[ "right" ] <- model

		landModels.append( landSection )
	}

	//once it's built, randomize it using the regular path
	for ( int prevLandTag = MAXLANDTAGS-1; prevLandTag >= 0; prevLandTag-- )
		Sky_PrepareNextLandPiece( prevLandTag, landModels, skyRig )

	return landModels
}

const float DRIFT_WORLD_CENTER_MAXSPEED = 100
const float DRIFT_WORLD_CENTER_ACC 		= 10
void function DriftWorldCenterWithPlayer( entity player )
{
	player.EndSignal( "OnDestroy" )

	DriftWorldSettingsReset()

	while( 1 )
	{
		FlagWait( "DriftWorldCenter" )
		thread DriftWorldCenterWithPlayerThread( player )

		FlagWaitClear( "DriftWorldCenter" )
		WORLD_CENTER.NonPhysicsStop()
	}
}

void function DriftWorldSettingsReset()
{
	file.driftWC_MaxSpeed 	= DRIFT_WORLD_CENTER_MAXSPEED
	file.driftWC_MaxAcc 	= DRIFT_WORLD_CENTER_ACC
	file.worldCenterLeadDist = DEF_WORLDCENTERLEADDIST
}

void function DriftWorldCenterWithPlayerThread( entity player )
{
	player.EndSignal( "OnDestroy" )
	FlagClearEnd( "DriftWorldCenter" )

	float currSpeed = 0
	vector moveVec = AnglesToForward( -CONVOYDIR )

	//these are the bounds that control how close the player gets to the sculptor
	float sculptorStartY = 6500
	float sculptorEndY 	= 2000
	float sculptorStartZ = file.sculptor.GetOrigin().z - 100
	float sculptorEndZ 	= file.sculptor.GetOrigin().z
	float worldStart 	= -10000
	float worldEnd  	= -45000

	float sculptorX 	= file.sculptor.GetOrigin().x
	file.sculptor.DisableHibernation()

	while( 1 )
	{
		float distToGoal 	= max( 0, player.GetOrigin().y + file.worldCenterLeadDist )

		//do we need to slow down?
		float decelerateDist = pow( currSpeed, 2 ) / ( 2 * file.driftWC_MaxAcc )
		if ( distToGoal < decelerateDist )
		{
			currSpeed = max( 0, currSpeed - file.driftWC_MaxAcc * FRAME_INTERVAL )
		}
		else
		{
			float maxDesiredSpeed = distToGoal / FRAME_INTERVAL
			currSpeed = min( currSpeed + file.driftWC_MaxAcc * FRAME_INTERVAL, maxDesiredSpeed )
		}

		currSpeed = min( currSpeed, file.driftWC_MaxSpeed )
		vector newVel = moveVec * currSpeed
		vector nextFramePos = WORLD_CENTER.GetOrigin() + newVel * FRAME_INTERVAL * 1.5

		WORLD_CENTER.NonPhysicsMoveTo( nextFramePos, FRAME_INTERVAL * 1.5, 0, 0 )

		//move the sculptor up
		float sculptorY = GraphCapped( nextFramePos.y, worldStart, worldEnd, sculptorStartY, sculptorEndY )
		float sculptorZ = GraphCapped( nextFramePos.y, worldStart, worldEnd, sculptorStartZ, sculptorEndZ )
		file.sculptor.NonPhysicsMoveTo( < sculptorX, sculptorY, sculptorZ >, FRAME_INTERVAL * 1.5, 0, 0 )

		WaitFrame()
	}
}

/************************************************************************************************\

 █████╗ ██╗██████╗     ██████╗  █████╗ ████████╗████████╗██╗     ███████╗
██╔══██╗██║██╔══██╗    ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██║     ██╔════╝
███████║██║██████╔╝    ██████╔╝███████║   ██║      ██║   ██║     █████╗
██╔══██║██║██╔══██╗    ██╔══██╗██╔══██║   ██║      ██║   ██║     ██╔══╝
██║  ██║██║██║  ██║    ██████╔╝██║  ██║   ██║      ██║   ███████╗███████╗
╚═╝  ╚═╝╚═╝╚═╝  ╚═╝    ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚══════╝

\************************************************************************************************/


/************************************************************************************************\

███╗   ███╗ █████╗ ██╗  ████████╗ █████╗      ██████╗ ██╗   ██╗███╗   ██╗███████╗    ████████╗███████╗ ██████╗██╗  ██╗
████╗ ████║██╔══██╗██║  ╚══██╔══╝██╔══██╗    ██╔════╝ ██║   ██║████╗  ██║██╔════╝    ╚══██╔══╝██╔════╝██╔════╝██║  ██║
██╔████╔██║███████║██║     ██║   ███████║    ██║  ███╗██║   ██║██╔██╗ ██║███████╗       ██║   █████╗  ██║     ███████║
██║╚██╔╝██║██╔══██║██║     ██║   ██╔══██║    ██║   ██║██║   ██║██║╚██╗██║╚════██║       ██║   ██╔══╝  ██║     ██╔══██║
██║ ╚═╝ ██║██║  ██║███████╗██║   ██║  ██║    ╚██████╔╝╚██████╔╝██║ ╚████║███████║       ██║   ███████╗╚██████╗██║  ██║
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝   ╚═╝  ╚═╝     ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚══════╝       ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝

\************************************************************************************************/
void function MaltaSideGunsRandomFire()
{
	entity gun1 	= GetEntByScriptName( "maltaGunTurret1" )
	entity gun2 	= GetEntByScriptName( "maltaGunTurret2" )
	entity gun3 	= GetEntByScriptName( "maltaGunTurret3" )

	thread MaltaSideGunAimThink( gun1 )
	thread MaltaSideGunAimThink( gun2 )
	thread MaltaSideGunAimThink( gun3 )
}


void function MaltaSideGunAimThink( entity gun )
{

	entity node1 	= gun.GetParent()

	OnThreadEnd(
	function() : ( gun )
		{
			//move gun back to zero position
			int yawID 		= gun.LookupPoseParameterIndex( "aim_yaw" )
			int pitchID 	= gun.LookupPoseParameterIndex( "aim_pitch" )
			gun.SetPoseParameterOverTime( pitchID, 0, 1.0 )
			gun.SetPoseParameterOverTime( yawID, 0, 1.0 )
		}
	)

	thread PlayAnim( gun, "s2s_malta_gun_idle", node1, "REF" )

	int fxID = GetParticleSystemIndex( CANNON_FX )
	int attachID = gun.LookupAttachment( "muzzle_flash" )

	while( 1 )
	{
		float x = RandomFloatRange( 0, 2 )
		float y = RandomFloatRange( 10, 20 )

		if ( CoinFlip() )
			x *= -1.0
		if ( CoinFlip() )
			y *= -1.0

		vector angles = <x,y,0>
		vector dir = AnglesToForward( angles )

		thread MaltaSideGunAimAtThink( gun, dir )

		wait RandomFloatRange( 2.5, 4.5 )

		int num = RandomInt( 5 ) + 5
		for ( int i = 0; i < num; i++ )
		{
			StartParticleEffectOnEntity( gun, fxID, FX_PATTACH_POINT_FOLLOW, attachID )
			delaythread( 0.4 ) MaltaSideGunImpact( gun.GetAttachmentOrigin( attachID ), gun.GetAttachmentAngles( attachID ) )

			// if ( Flag( "MaltaLiftDoorsOpen" ) )
			// 	EmitSoundOnEntity( gun, "o2_core_meltdown_explosion" )
			// else
			EmitSoundOnEntity( gun, "s2s_scr_malta_guns_muffled_01" )

			thread PlayAnim( gun, "s2s_malta_gun_fire", node1, "REF" )
			wait 0.5
		}
		WaittillAnimDone( gun )

		EmitSoundOnEntity( gun, "s2s_scr_malta_guns_reload" )

		thread PlayAnim( gun, "s2s_malta_gun_idle", node1, "REF" )

		wait 0.5
	}

}

void function MaltaSideGunImpact( vector pos, vector angles )
{

	vector dir = AnglesToForward( AnglesCompose( angles, <0,-5,0>) )
	array<entity> ignore

	vector start = pos + dir * 1000
	vector end = pos + dir * 50000
	TraceResults traceResult = TraceLine( start, end, ignore, TRACE_MASK_SHOT, TRACE_COLLISION_GROUP_NONE )

	if ( traceResult.fraction < 1.0 )
	{
		vector origin = traceResult.endPos + dir * -200
		int fxID = GetParticleSystemIndex( CANNON_IMPACT )
		StartParticleEffectInWorld( fxID, origin, CONVOYDIR )
	}
}

void function MaltaSideGunAimAtThink2( entity gun, vector dir )
{
	gun.Signal( "MaltaSideGunAimAtThink" )
	gun.EndSignal( "MaltaSideGunAimAtThink" )

	int yawID 		= gun.LookupPoseParameterIndex( "aim_yaw" )
	int pitchID 	= gun.LookupPoseParameterIndex( "aim_pitch" )

	while( 1 )
	{
		vector forward = gun.GetForwardVector()
		float dot = DotProduct( forward, dir )
		float pitch = DotToAngle( dot )
		if ( DotProduct( forward, <0,0,1> ) < 0 )
			pitch *= -1.0

		gun.SetPoseParameterOverTime( pitchID, pitch * 2.0, 0.15 )

		WaitFrame()
	}
}

void function MaltaSideGunAimAtThink( entity gun, vector dir )
{
	gun.Signal( "MaltaSideGunAimAtThink" )
	gun.EndSignal( "MaltaSideGunAimAtThink" )

	int yawID 		= gun.LookupPoseParameterIndex( "aim_yaw" )
	int pitchID 	= gun.LookupPoseParameterIndex( "aim_pitch" )
	vector forward 	= < 1, 0, 0 >
	vector up 		= < 0,0,1 >
	vector right 	= < 0,-1,0 >

	float scalarUp 		= DotProduct( up, dir )
	float scalarRight 	= DotProduct( right, dir )
	float scalarForward = DotProduct( forward, dir )
	vector vecUp 		= Normalize( ( forward * scalarForward ) + ( up * scalarUp ) )
	vector vecRight 	= Normalize( ( forward * scalarForward ) + ( right * scalarRight ) )

	while( 1 )
	{
		float dotP 	= DotProduct( file.malta.model.GetRightVector(), vecUp )
		float pitch = min( DotToAngle( dotP ) * 2.0, 40 )

		float dotY 	= DotProduct( file.malta.model.GetRightVector(), vecRight )
		float yaw 	= min( DotToAngle( dotY ) * 2.0, 40 )

		if ( DotProduct( up, vecUp ) > 0 )
			pitch *= -1.0

		if ( DotProduct( right, vecRight ) > 0 )
			yaw *= -1.0

		float time = 2.0
		gun.SetPoseParameterOverTime( pitchID, pitch, time )
		gun.SetPoseParameterOverTime( yawID, yaw, time )

	//	printt( "P: " + pitch + ", Y: " + yaw )
	//	vector origin = gun.GetOrigin() + <0,0,220>
	//	DebugDrawLine( origin, origin + ( dir * 500 ), 255, 100, 100, true, FRAME_INTERVAL )
	//	DebugDrawLine( origin, origin + ( vecUp * 500 ), 100, 255, 100, true, FRAME_INTERVAL )
	//	DebugDrawLine( origin, origin + ( vecRight * 500 ), 100, 100, 255, true, FRAME_INTERVAL )

	//	DebugDrawLine( origin, origin + up * 200, 0, 255, 0, true, FRAME_INTERVAL )
	//	DebugDrawLine( origin, origin + right * 200, 0, 0, 255, true, FRAME_INTERVAL )
	//	DebugDrawLine( origin, origin + forward * 200, 255, 0, 0, true, FRAME_INTERVAL )

		wait 0.3
	}
}

/************************************************************************************************\

██╗   ██╗████████╗██╗██╗     ██╗████████╗██╗   ██╗
██║   ██║╚══██╔══╝██║██║     ██║╚══██╔══╝╚██╗ ██╔╝
██║   ██║   ██║   ██║██║     ██║   ██║    ╚████╔╝
██║   ██║   ██║   ██║██║     ██║   ██║     ╚██╔╝
╚██████╔╝   ██║   ██║███████╗██║   ██║      ██║
 ╚═════╝    ╚═╝   ╚═╝╚══════╝╚═╝   ╚═╝      ╚═╝

\************************************************************************************************/

ShipStruct function GetMalta()
{
	return file.malta
}

ShipStruct function GetGibraltar()
{
	return file.gibraltar
}

ShipStruct function GetTrinity()
{
	return file.trinity
}

ShipStruct function GetOLA()
{
	return file.OLA
}