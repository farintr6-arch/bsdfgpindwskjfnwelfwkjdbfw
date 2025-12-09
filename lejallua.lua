


require("zxcmodule")

/*

i eat soda 
i eat pizza

*/



local ultimate                          = {}
local me          			            = LocalPlayer()


surface.CreateFont( "tbfont", {	font = "Open Sans", extended = false,size = 15,weight = 100,additive = false,} )
surface.CreateFont( "veranda", { font = "Verdana", size = 12, antialias = false, outline = true } )
surface.CreateFont( "veranda_s", { font = "Verdana", size = 12, antialias = false, shadow = true } )
//surface.CreateFont( "test", { font = "Windows", size = 12, antialias = false, shadow = true } )
surface.CreateFont( "veranda_scr", { font = "Verdana", size = ScreenScale( 9 ), antialias = false, outline = true } )
surface.CreateFont( "thug", { font = "DS Cloister Black", size = 18, antialias = false, shadow = false } ) 
surface.CreateFont( "veranda_scr", { font = "Verdana", size = ScreenScale( 9 ), antialias = false, outline = true } )
surface.CreateFont( "arial", { font = "Arial", size = 15, antialias = true, shadow = false, outline = false  } ) 

ultimate.Colors = {}

for i = 0,255 do
    ultimate.Colors[i] = Color( i, i, i )
end


ultimate.Colors["Red"] = Color(255, 0, 0, 255 )

ultimate.accent = Color( 255, 255, 255 )



surface.CreateFont( "DermaSmall", {
	font = "Open Sans",
	size = 15,
} )


local pLocalPlayer = LocalPlayer()

local screenWidth = ScrW()
local screenHeight = ScrH()

local traceResult = {}
local traceStruct = { output = traceResult }

local flTickInterval = engine.TickInterval()

ultimate.cached = {}

ultimate.Materials = {}


ultimate.Materials["Gradient"] = Material("gui/gradient_up", "noclamp smooth")
ultimate.Materials["Gradient down"] = Material("gui/gradient_down", "noclamp smooth")
ultimate.Materials["Gradient right"] = Material("gui/gradient", "noclamp smooth")
ultimate.Materials["Alpha grid"] = Material("gui/alpha_grid.png", "noclamp smooth")
ultimate.Materials["Blur"] = Material("pp/blurscreen")
ultimate.Materials["Pila"] = Material("custom/pila.png", "noclamp smooth")
ultimate.Materials["Mellstroy"] = Material("custom/mellstroy.png", "noclamp smooth")

ultimate.blur = Material("pp/blurscreen")




ultimate.cfg = {}
ultimate.binds = {}
ultimate.colors = {}
ultimate.presets = {}

ultimate.cfg["enable_aimbot"]              = false
ultimate.binds["aim_on_key"]                = 0

ultimate.cfg["silent_aim"]                 = true
ultimate.cfg["player_info"]                 = true
ultimate.cfg["p_silent"]                    = false

ultimate.cfg["auto_reload"]                = false
ultimate.cfg["auto_fire"]                  = false
ultimate.cfg["rapid_fire"]                 = false
ultimate.cfg["alt_rapid_fire"]             = false
ultimate.cfg["bullet_time"]                = false

ultimate.cfg["nospread"]                   = false
ultimate.cfg["disable_visuals_recoil"]     = false
ultimate.cfg["force_seed"]                 = false
ultimate.cfg["wait_for_seed"]              = false
ultimate.cfg["norecoil"]                   = false
ultimate.cfg["swb_type"]                   = 1
ultimate.cfg["hitchance"]                  = false
ultimate.cfg["hitchance_value"]            = 75

ultimate.cfg["extrapolation"]              = false
ultimate.cfg["tpose"]                      = false
ultimate.cfg["bone_fix"]                   = false
ultimate.cfg["update_client_anim_fix"]     = false
ultimate.cfg["taunt_disabler"]             = false
ultimate.cfg["wait_for_simtime_update"]    = false
ultimate.cfg["disable_interpolation"]      = true
ultimate.cfg["disable_sequence_interpolation"] = false

ultimate.cfg["target_selection"]           = 2
ultimate.cfg["ignores-friends"]            = false
ultimate.cfg["ignores-steam friends"]      = false
ultimate.cfg["ignores-teammates"]          = false
ultimate.cfg["ignores-admins"]             = false
ultimate.cfg["ignores-bots"]               = false
ultimate.cfg["ignores-big velocity"]       = false
ultimate.cfg["ignores-frozen"]             = false
ultimate.cfg["ignores-nodraw"]             = false
ultimate.cfg["ignores-nocliping"]          = false
ultimate.cfg["ignores-god_time"]           = false
ultimate.cfg["ignores-head_unhitable"]     = false
ultimate.cfg["ignores-driver"]             = false
ultimate.cfg["ignores-legits"]             = false
ultimate.cfg["wallz"]                      = false

ultimate.cfg["max_targets"]                = 0

ultimate.cfg["hitbox_selection"]           = 1
ultimate.cfg["hitscan"]                    = false
ultimate.cfg["hitscan_groups_head"]        = false
ultimate.cfg["hitscan_groups_chest"]       = false
ultimate.cfg["hitscan_groups_stomach"]     = false
ultimate.cfg["hitscan_groups_arms"]        = false
ultimate.cfg["hitscan_groups_legs"]        = false
ultimate.cfg["hitscan_groups_generic"]     = false
ultimate.cfg["multipoint"]                 = false
ultimate.cfg["multipoint_scale_min"]           = 0.5
ultimate.cfg["multipoint_scale_max"]           = 0.8
ultimate.cfg["multipoint_groups_head"]     = false
ultimate.cfg["multipoint_groups_chest"]    = false
ultimate.cfg["multipoint_groups_stomach"]  = false
ultimate.cfg["multipoint_groups_arms"]     = false
ultimate.cfg["multipoint_groups_legs"]     = false
ultimate.cfg["multipoint_groups_generic"]  = false

ultimate.cfg["adjust_tickcount"]           = false
ultimate.cfg["lerptime_adjust"]            = false
ultimate.cfg["gun_switch"]                 = false
ultimate.cfg["auto_detonator"]             = false
ultimate.cfg["autod_distance"]             = 96

ultimate.cfg["backtrack"]                  = false
ultimate.cfg["always_backtrack"]           = false
ultimate.cfg["backtrack_mode"]             = 1
ultimate.cfg["sampling_interval"]          = 0
ultimate.cfg["backtrack_time"]             = 200
ultimate.cfg["show_records"]               = false

ultimate.cfg["fov_limit"]                  = false
ultimate.cfg["aimbot_fov"]                 = 30
ultimate.cfg["show_fov"]                   = false
ultimate.colors["show_fov"]                 = "255 255 0 255"

ultimate.cfg["aimbot_snapline"]                   = false
ultimate.colors["aimbot_snapline"]                 = "255 128 0 255"
ultimate.cfg["aimbot_marker"]                   = false
ultimate.cfg["aimbot_marker_mode"]              = 1
ultimate.colors["aimbot_marker"]                 = "255 255 255 255"
ultimate.cfg["melee_circle"] = false
ultimate.colors["melee_circle"] = "255 255 255 255"
ultimate.cfg["land_pos"] = false
ultimate.colors["land_pos"] = "255 255 255 255"



ultimate.cfg["trigger_bot"]                = false
ultimate.binds["trigger_bot"]               = 0

ultimate.cfg["knifebot"]                   = false
ultimate.cfg["knifebot_mode"]              = 1
ultimate.presets["knifebot_mode"] = { "Damage", "Fast", "Fatal" }

ultimate.cfg["facestab"]                   = false

ultimate.cfg["auto_gun"]                   = false
ultimate.cfg["gun_selection"]              = 1
ultimate.presets["gun_selection"]           = { "m9k_svu", "m9k_minigun", "m9k_m416", "m9k_ak74", "swb_awp"}







// Resolver

ultimate.cfg["resolver"] = false
ultimate.cfg["pitch_resolver"] = false
ultimate.cfg["taunt_resolver"] = false




// Tickbase
ultimate.cfg["tickbase_shift"] = false
ultimate.cfg["wait_for_unlag"] = false

ultimate.cfg["fakelag_comp"] = 2

ultimate.cfg["skip_fire_tick"] = false
ultimate.cfg["double_tap"] = false
ultimate.cfg["dodge_projectiles"] = false
ultimate.cfg["passive_recharge"] = false

ultimate.cfg["auto_recharge"] = false
ultimate.cfg["wait_for_charge"] = false
ultimate.cfg["warp_on_peek"] = false

ultimate.cfg["charge_ticks"] = 48
ultimate.cfg["shift_ticks"] = 48
ultimate.binds["tickbase_shift"] = 0
ultimate.binds["auto_recharge"] = 0


ultimate.cfg["anti_aim"]                   = false
ultimate.cfg["yaw_randomisation"]          = false


ultimate.cfg["custom_real"]                = 75
ultimate.cfg["custom_fake"]                = 180
ultimate.cfg["custom_pitch"]               = 89
ultimate.cfg["spin_speed"]                 = 30
ultimate.cfg["lby_min_delta"]              = 100
ultimate.cfg["lby_break_delta"]            = 120
ultimate.cfg["sin_delta"]                  = 89
ultimate.cfg["sin_add"]                    = 11
ultimate.cfg["jitter_delta"]               = 45





ultimate.cfg["yaw_base"]                   = 1
ultimate.presets["yaw_base"] = { "Viewangles", "At targets", "Custom" }
ultimate.cfg["yaw"]                        = 1
ultimate.presets["yaw"] = {
    "Backward", "Fake Forward", "Legit Delta",
    "Sideways","rl sideways jitter", "Half Sideways",
    "Fake Spin", "LBY", "LBY Breaker",
    "Sin Sway", "Pendulum Sway", "Lag Sway",
    "Fake Jitter", "Kappa Jitter", "Abu Jitter",
    "Satanic Spin", "Custom",
    "Hand Block", "Low delta",
    "Fake Switch", "Tank AA",
    "test"
}

ultimate.cfg["pitch"]                      = 1
ultimate.presets["pitch"] = {
    "Down", "Up", "Zero",
    "Fake down", "Fake fake down",
    "Fake jitter", "Kizaru", "legit",
    "Custom", "New pitch test"
}
ultimate.cfg["custom_yaw"]                 = 90

ultimate.binds["anti_aim"]                   = 0






ultimate.cfg["antiaim_material"] = 1
ultimate.cfg["antiaim_fullbright"] = false
ultimate.colors["real_chams"] = "128 128 255 255"

// Anim breakers

ultimate.cfg["handjob"] = false
ultimate.cfg["handjob_mode"] = 1


ultimate.cfg["micromovement"] = false
ultimate.cfg["on_shot_aa"] = false
ultimate.cfg["on_shot_aa_mode"] = 1
ultimate.cfg["on_shot_jitter"] = 15
ultimate.cfg["on_shot_random"] = 30
ultimate.cfg["freestanding"] = false
ultimate.binds["freestand"] = 0
ultimate.cfg["inverter"] = false
ultimate.binds["inverter"] = 0
ultimate.cfg["anti_aim_chams"] = false





ultimate.cfg["free_standing"] = false
ultimate.cfg["taunt_spam"] = false
ultimate.cfg["taunt"] = 1
ultimate.cfg["taunt_speed"] = 1.0
ultimate.cfg["taunt_act"] = 1
ultimate.cfg["alt_taunt"] = false
ultimate.cfg["alt_taunt_act"] = 1
ultimate.cfg["alt_taunt_speed"] = 1.0


// fake lag
ultimate.cfg["fake_lag"] = false

ultimate.cfg["fake_lag_options_disable_on_ladder"] = false
ultimate.cfg["fake_lag_options_disable_in_attack"] = false
ultimate.cfg["fake_lag_options_on_peek"] = false
ultimate.cfg["fake_lag_options_randomise"] = false
ultimate.cfg["on_peek_factor"] = 1

ultimate.cfg["lag_mode"] = 1

ultimate.cfg["lag_limit"] = 1
ultimate.cfg["lag_randomisation"] = 1

ultimate.cfg["fake_duck"] = false
ultimate.binds["fake_duck"] = 0



// Sequence manip
ultimate.cfg["sequence_manip"] = false
ultimate.cfg["outsequence"] = 500
ultimate.binds["sequence_manip"] = 0
ultimate.cfg["sequence_min_random"] = false
ultimate.cfg["sequence_min"] = 1


ultimate.binds["animation_freezer"] = 0
ultimate.cfg["animation_freezer"] = false

ultimate.cfg["freeze_on_peek"] = false

ultimate.cfg["allah_walk"] = false
ultimate.binds["allahwalk"] = 0

// Animfix

ultimate.cfg["interpolation_disable_interpolation"] = false
ultimate.cfg["interpolation_fast_sequences"] = false


// Movement
ultimate.cfg["bhop"] = false
ultimate.cfg["sprint"] = false
ultimate.cfg["safe_hop"] = false
ultimate.cfg["edge_jump"] = false
ultimate.cfg["air_duck"] = false



ultimate.cfg["air_strafer"] = false
ultimate.cfg["strafe_mode"] = 1
ultimate.cfg["ground_strafer"] = false
ultimate.cfg["fast_stop"] = false
ultimate.cfg["z_hop"] = false
ultimate.binds["z_hop"] = 0


ultimate.cfg["water_jump"] = false

ultimate.cfg["auto_peak"] = false
ultimate.binds["auto_peak"] = 0
ultimate.cfg["auto_peak_tp"] = false

ultimate.cfg["circle_strafe"] = false
ultimate.binds["circle_strafe"] = 0
ultimate.cfg["cstrafe_ticks"] = 64
ultimate.cfg["cstrafe_angle_step"] = 1
ultimate.cfg["cstrafe_angle_max_step"] = 10
ultimate.cfg["cstrafe_ground_diff"] = 10
ultimate.cfg["circle_strafe_mode"] = 1

ultimate.cfg["name_convar"] = ""
ultimate.cfg["disconnect_reason"] = "VAC banned from secure server"
ultimate.cfg["name_stealer"] = false
ultimate.cfg["name_generator"] = false
ultimate.cfg["name_generator_mode"] = 1



ultimate.cfg["chat_spammer"]       = false
ultimate.cfg["chat_mode"]          = 1
ultimate.cfg["chat_group"]         = 1
ultimate.cfg["chat_delay"]         = 1

ultimate.cfg["killsay"]            = false
ultimate.cfg["killsay_mode"]          = 1
ultimate.cfg["killsay_group"]         = 1

ultimate.cfg["cheat_advert"] = false
ultimate.cfg["cheat_advert_mode"] = 1
ultimate.cfg["cheat_advert_group"] = 1
ultimate.cfg["cheat_advert_function"] = 1

ultimate.cfg["target_spammer"] = false
ultimate.cfg["target_spammer_prefix"] = 1
ultimate.presets["target_spammer_prefix"] = { "!", "//", "/pm" }
ultimate.cfg["target_spammer_steamid"] = ""
ultimate.cfg["target_spammer_message"] = ""
ultimate.cfg["target_spammer_delay"] = 1

ultimate.cfg["retry_on_handcuff"] = false

// Player visuals
ultimate.cfg["player_line"]    = false
ultimate.cfg["player_hat"]    = false

ultimate.cfg["velocity_indicator"] = false
ultimate.colors["velocity_indicator"] = "128 0 128 255"



// crossi
ultimate.cfg["crosshair"] = false
ultimate.cfg["crosshair_type"] = 1
ultimate.cfg["uber_alles_scale"] = 16
ultimate.cfg["uber_alles_speed"] = 192
ultimate.colors["crosshair_color"] = "255 0 0 255"
ultimate.colors["crosshair_outline"] = "0 0 0 255"


// ESP
ultimate.cfg["box_esp"]                    = false
ultimate.cfg["box_style"]                  = 1
ultimate.cfg["box_flag_style"]             = 1  // 1 = Russia, 2 = Ukraine

ultimate.cfg["box_fill"] = false
ultimate.cfg["box_alpha"] = 255

ultimate.cfg["esp_font"]                  = 1

ultimate.cfg["box_gradient"]   = false

ultimate.colors["box_esp"]      = "255 0 255 255"
ultimate.colors["box_gradient"] = "0 255 255 255"

ultimate.cfg["box_team_color"] = false

ultimate.cfg["name"] = false
ultimate.cfg["name_pos"] = 1
ultimate.cfg["steam_names"] = false

ultimate.cfg["distance"] = false
ultimate.cfg["distance_pos"] = 2

ultimate.cfg["typing"] = false
ultimate.cfg["typing_pos"] = 1

ultimate.cfg["simtime_updated"] = false
ultimate.cfg["simtime_pos"] = 2

ultimate.cfg["usergroup"] = false
ultimate.cfg["usergroup_pos"] = 1

ultimate.cfg["team"] = false
ultimate.cfg["team_pos"] = 1

ultimate.cfg["show_priority"]  = false
ultimate.cfg["priority_box"]  = false

ultimate.cfg["pitch_player"] = false
ultimate.cfg["pitch_player_pos"] = 3

ultimate.cfg["fake_pitch"] = false
ultimate.cfg["fake_pitch_pos"] = 1
ultimate.colors["fake_pitch"] = "255 0 0 255"

ultimate.cfg["target"] = false
ultimate.cfg["target_pos"] = 1
ultimate.colors["target"] = "255 255 0 255"

ultimate.cfg["health"] = false
ultimate.cfg["health_bar"] = false
ultimate.cfg["health_bar_gradient"] = false
ultimate.cfg["health_pos"] = 4
ultimate.colors["health"] = "0 255 0 255"
ultimate.colors["health_bar_gradient"] = "255 45 0 255"



ultimate.cfg["armor"] = false
ultimate.cfg["armor_bar"] = false
ultimate.cfg["armor_bar_gradient"] = false
ultimate.cfg["armor_pos"] = 4
ultimate.colors["armor"] = "0 150 255 255"
ultimate.colors["armor_bar_gradient"] = "72 255 72 255"

ultimate.cfg["darkrp_money"] = false
ultimate.cfg["money_pos"] = 1

ultimate.cfg["weapon"] = false
ultimate.cfg["weapon_pos"] = 1

ultimate.cfg["show_ammo"] = false
ultimate.cfg["weapon_printname"] = false
ultimate.cfg["show_reloading"] = false

ultimate.cfg["steam_id"] = false
ultimate.cfg["steam_id_pos"] = 1

ultimate.cfg["simtime_updated"] = false
ultimate.cfg["simtime_pos"] = 1

ultimate.cfg["ping"] = false
ultimate.cfg["ping_pos"] = 1



ultimate.colors["skeleton"] = "255 255 255 255"
ultimate.cfg["skeleton"] = false

ultimate.cfg["player_flags"] = false
ultimate.colors["player_flags"] = "100 200 255 255"
ultimate.cfg["flags_pos"] = 1
ultimate.cfg["hitbox"] = false
ultimate.colors["hitbox"] = "255 255 255 255"

ultimate.cfg["kill_hitbox"] = false
ultimate.colors["kill_hitbox"] = "255 0 0 255"
ultimate.cfg["hit_hitbox"] = false
ultimate.colors["hit_hitbox"] = "0 255 0 255"

ultimate.cfg["indicators"] = false
ultimate.cfg["github_sync"] = false




// Chams
ultimate.cfg["visible_chams"] = false
ultimate.cfg["visible_chams_w"] = false
ultimate.cfg["visible_mat"] = 1
ultimate.colors["visible_chams"] = "0 255 255 255"

ultimate.cfg["invisible_chams"] = false
ultimate.cfg["invisible_chams_w"] = false
ultimate.cfg["invisible_mat"] = 1
ultimate.colors["invisible_chams"] = "255 255 0 255"

ultimate.cfg["supress_lighting"] = false

ultimate.cfg["self_chams"] = false
ultimate.cfg["self_chams_w"] = false
ultimate.cfg["self_mat"] = 1
ultimate.colors["self_chams"] = "255 0 255 255"

ultimate.cfg["supress_self_lighting"] = false

ultimate.cfg["backtrack_chams"] = false
ultimate.cfg["backtrack_material"] = 1
ultimate.cfg["backtrack_fullbright"] = false
ultimate.colors["backtrack_chams"] = "255 128 255 255"




ultimate.cfg["on_screen_logs"] = false

ultimate.colors["on_screen_logs"] = "69 255 69 255"
ultimate.colors["miss_lagcomp"] = "69 69 255 255"
ultimate.colors["miss_spread"] = "255 255 69 255"
ultimate.colors["miss_fail"] = "255 69 69 255"

ultimate.cfg["entity_chams"] = false
ultimate.cfg["entity_material"] = 1
ultimate.cfg["entity_fullbright"] = false
ultimate.colors["entity_chams"] = "255 89 89 255"

ultimate.cfg["player_outline"] = false
ultimate.cfg["entity_outline"] = false
ultimate.colors["player_outline"] = "45 255 86 255"
ultimate.colors["entity_outline"] = "255 86 45 255"

ultimate.cfg["outline_style"] = 1

ultimate.cfg["esp_distance"] = 3500

// Entity Esp
ultimate.binds["ent_add"] = 0
ultimate.cfg["ent_box"] = false
ultimate.cfg["ent_box_style"] = 1
ultimate.cfg["ent_class"] = false
ultimate.cfg["ent_esp_distance"] = 3500

// Hitmarker
ultimate.cfg["hitmarker"] = false
ultimate.cfg["hit_particles"] = false

ultimate.cfg["hitsound"] = false
ultimate.cfg["killsound"] = false
ultimate.cfg["miss_sound"]  = false

ultimate.cfg["hitsound_str"] = "phx/hmetal1.wav"
ultimate.cfg["killsound_str"] = "ambient/levels/canals/windchime2.wav"
ultimate.cfg["miss_sound_str"]  = "common/wpn_denyselect.wav"

ultimate.colors["hit_particles"] = "255 128 235 255"
ultimate.colors["hitmarker"] = "255 155 25 255"
ultimate.colors["hitnumbers"] = "255 255 255 255"
ultimate.colors["hitnumbers_krit"] = "255 35 35 255"

// Name hide / visual misc

ultimate.cfg["hide_name"] = false
ultimate.cfg["custom_name"] = "Your mom"
ultimate.cfg["disable_sensivity_adjustment"] = false
ultimate.cfg["screengrab_image"] = false


// Visuals
ultimate.cfg["tickbase_indicator"] = false
ultimate.cfg["target_name"] = false
ultimate.colors["target_name"] = "255 255 255 255"
ultimate.cfg["spectator_list"] = false
ultimate.cfg["keybind_list"] = false
ultimate.colors["keybind_list"] = "0 0 0 255"


// World
ultimate.cfg["custom_sky"] = GetConVar("sv_skyname"):GetString()
ultimate.cfg["sky_color"] = false
ultimate.colors["sky_color"] = "145 185 245 255"
ultimate.cfg["wall_color"] = false
ultimate.colors["wall_color"] = "50 45 65 255"
ultimate.cfg["fullbright"] = false
ultimate.binds["fullbright"] = 0
ultimate.cfg["fog_changer"] = false
ultimate.colors["fog_changer"] = "255 255 255 255"
ultimate.cfg["fog_start"] = 1500
ultimate.cfg["fog_end"] = 3000
ultimate.cfg["novosibirskaya_igra"] = false
ultimate.cfg["mellstroy.game"] = false

// Effects
ultimate.cfg["bullet_tracers"] = false
ultimate.colors["bullet_tracers"] = "255 0 0 255"
ultimate.cfg["bullet_tracers_material"] = "sprites/tp_beam001"
ultimate.cfg["tracers_die_time"] = 5
ultimate.cfg["bullet_tracers_muzzle"] = false

// View
ultimate.cfg["third_person"] = false
ultimate.binds["third_person"] = 0
ultimate.cfg["third_person_collision"] = false
ultimate.cfg["third_person_smoothing"] = false
ultimate.cfg["third_person_smooth_factor"] = 10
ultimate.cfg["third_person_distance"] = 150

ultimate.cfg["free_camera"] = false
ultimate.binds["free_camera"] = 0
ultimate.cfg["free_camera_speed"] = 25
ultimate.cfg["ghetto_free_cam"] = false

ultimate.cfg["override_view"] = true


ultimate.cfg["fov_override"] = GetConVar("fov_desired"):GetFloat()

ultimate.cfg["aspect_ratio"] = 0

ultimate.cfg["viewmodel_changer"] = false

ultimate.cfg["viewmodel_fov"] = GetConVar("viewmodel_fov"):GetInt()

ultimate.cfg["viewmodel_position"] = false

ultimate.cfg["viewmodel_disabler"] = false

ultimate.cfg["calcviewmodelview"] = 1

ultimate.cfg["viewmodel_chams"] = false
ultimate.colors["viewmodel_chams"] = "75 95 128 255"
ultimate.cfg["viewmodel_chams_type"] = 1

ultimate.cfg["fullbright_viewmodel"] = false

ultimate.cfg["viewmodel_x"]= 0
ultimate.cfg["viewmodel_y"]= 0
ultimate.cfg["viewmodel_z"]= 0
ultimate.cfg["viewmodel_pitch"]= 0
ultimate.cfg["viewmodel_yaw"]= 0
ultimate.cfg["viewmodel_roll"]= 0

ultimate.cfg["ghost_follower"] = false
ultimate.cfg["gfid"] = "SteamID"

// Misc

ultimate.cfg["vape_spam"] = false
ultimate.cfg["flashlight_spam"] = false
ultimate.cfg["auto_gta"] = false
ultimate.cfg["fast_lockpick"] = false


// Config



ultimate.cfg["config_name"] = "new"
ultimate.cfg["selected_config"] = 1

ultimate.cfg["watermark_xxx"] = false
ultimate.cfg["watermark_xxx_style"] = 1
ultimate.cfg["watermark_text"] = "Kremlin hack Neo-Nazism edition beta alpha live supremacy paste v1"
ultimate.cfg["custom_background"] = false
ultimate.cfg["custom_background_path"] = ""
ultimate.cfg["foreground_height"] = 25
ultimate.cfg["custom_cheatname"] = ""
ultimate.cfg["cheat_text"] = 1
ultimate.presets["cheat_text"] = {
    "Kremlin hack Neo-Nazism edition beta alpha live supremacy paste v1",
    "Ultimate for Garry's mod (x64)",
    "ULTIMATE V666 DEMON EDITION",
    "НОВОСИБИРСКАЯ ИГРА НАЧИНАЕТСЯ",
    "begemotik.hack - private lua cheat",
    "ЧИТ ПО КОНТРАКТУ",
    "министерство обороны.рф",
    "femboyhack",
    "ultimate old",
    "voidhook",
    "custom"
}
ultimate.cfg["rainbow_text"]   = false
ultimate.cfg["style"] = 1

ultimate.cfg["custom_disconnect_reason"] = 1
ultimate.presets["custom_disconnect_reason"] = {
    "Disconnect by user.",
    "Connection timed out",
    "Connection closing",
    "Server shutting down",
    "Steam auth timeout",
    "Client timed out",
    "Lost connection to server",
    "VAC banned from secure server",
    "Kicked by Console",
    "Server full",
    "Pure server: client file does not match server",
    "Map missing from client",
    "Bad password",
    "Server is hibernating",
    "Network connection interrupted",
    "Connection rejected by game",
    "Failed to authenticate with Steam",
    "Segregation",
    "Disconnect By Spinner BETA"
}

ultimate.cfg.friends = {}
ultimate.cfg.ents = {}

do
    local maxshift = GetConVar("sv_maxusrcmdprocessticks"):GetInt() - 1
    local tickrate = tostring(math.Round(1 / flTickInterval))

    RunConsoleCommand("cl_cmdrate", tickrate)
    RunConsoleCommand("cl_updaterate", tickrate)

    RunConsoleCommand("cl_interp", "0")
    RunConsoleCommand("cl_interp_ratio", "0")

    ultimate.cfg["shift_ticks"] = maxshift
    ultimate.cfg["charge_ticks"] = maxshift

    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )
    ded.EnableAnimFix( false )
end

function ultimate.TIME_TO_TICKS(time)
    return math.floor(0.5 + (time / flTickInterval))
end

function ultimate.TICKS_TO_TIME(ticks)
    return ticks * flTickInterval
end

function ultimate.GetLerpTime()
    local lerpRatio = GetConVar("cl_interp_ratio"):GetFloat()
    if lerpRatio == 0 then lerpRatio = 1 end

    local lerpAmount = GetConVar("cl_interp"):GetFloat()
    if lerpAmount == 0 then lerpAmount = 0.015 end

    local updateRate = GetConVar("cl_updaterate"):GetFloat()
    if updateRate == 0 then updateRate = 66 end

    return math.max(lerpAmount, lerpRatio / updateRate)
end




ultimate.onScreenLogs = {}
ultimate.firedShots = 0
ultimate.HitLogsWhite = Color( 225, 225, 225 )
ultimate.MissReasons = {
	[1] = {str = "spread", var = "miss_spread"},
	[2] = {str = "occlusion", var = "miss_spread"},
	[3] = {str = "prediction", var = "miss_lagcomp"},
	[4] = {str = "lagcomp", var = "miss_lagcomp"},
	[5] = {str = "resolver", var = "miss_fail"},
	[6] = {str = "backtrack", var = "miss_fail"},
	[7] = {str = "hitbox", var = "miss_fail"},
	[8] = {str = "animation", var = "miss_fail"},
	[9] = {str = "velocity", var = "miss_lagcomp"},
	[10] = {str = "jitter", var = "miss_fail"},
	[11] = {str = "fakelag", var = "miss_lagcomp"},
	[12] = {str = "extrapolation", var = "miss_lagcomp"},
	[13] = {str = "multipoint", var = "miss_fail"},
	[14] = {str = "tickbase", var = "miss_lagcomp"},
	[15] = {str = "unknown", var = "miss_fail"}
	--[16] = {str = "bone", var = "miss_fail"}
}

ultimate.lastShotData = {
	target = nil,
	hitbox = nil,
	backtrack_tick = 0,
	velocity = Vector(),
	angle = Angle(),
	position = Vector(),
	predicted = false,
	multipoint = false,
	time = 0
}






// Config save / load

if not file.Exists( "autohook", "DATA" ) then
    file.CreateDir("autohook", "DATA")
end

if not file.Exists( "autohook/default.txt", "DATA" ) then
    local defaultData = {
        cfg = ultimate.cfg,
        binds = ultimate.binds,
        colors = ultimate.colors
    }
    file.Write( "autohook/default.txt", util.TableToJSON( defaultData, false ), "DATA" )
end

ultimate.cfgTable = {}

function ultimate.fillConfigTable()
    local ftbl = file.Find("autohook/*.txt", "DATA")
    ultimate.cfgTable = {}

    if not ftbl or #ftbl == 0 then
        ultimate.cfgTable[1] = "default"
        return
    end

    for i = 1, #ftbl do
        local str = ftbl[i]
        local len = string.len(str)
        local f = string.sub(str, 1, len - 4) -- Remove .txt extension

        ultimate.cfgTable[#ultimate.cfgTable + 1] = f
    end
end

ultimate.fillConfigTable()

function ultimate.SaveConfig()
    local selectedIndex = ultimate.cfg["selected_config"] or 1
    local str = ultimate.cfgTable[selectedIndex]

    if not str then return end

    local saveData = {
        cfg = ultimate.cfg,
        binds = ultimate.binds,
        colors = ultimate.colors
    }

    local tojs = util.TableToJSON(saveData, false)
    if not tojs or tojs == "" then return end

    file.Write("autohook/" .. str .. ".txt", tojs, "DATA")
end

function ultimate.LoadConfig()
    local selectedIndex = ultimate.cfg["selected_config"] or 1
    local str = ultimate.cfgTable[selectedIndex]

    if not str or not file.Exists("autohook/" .. str .. ".txt", "DATA") then return end

    local read = file.Read("autohook/" .. str .. ".txt", "DATA")
    if not read or read == "" then return end

    local totbl = util.JSONToTable(read)
    if not totbl then return end

    local ConfigName = ultimate.cfg["config_name"]
    local SelectedConfig = ultimate.cfg["selected_config"]

    for k, v in pairs(totbl) do
        if k == "cfg" and type(v) == "table" then
            for key, value in pairs(v) do
                ultimate.cfg[key] = value
            end
        elseif k == "binds" and type(v) == "table" then
            for key, value in pairs(v) do
                ultimate.binds[key] = value
            end
        elseif k == "colors" and type(v) == "table" then
            for key, value in pairs(v) do
                ultimate.colors[key] = value
            end
        end
    end

    ultimate.cfg["config_name"] = ConfigName
    ultimate.cfg["selected_config"] = SelectedConfig

    ded.SetInterpolation(ultimate.cfg["disable_interpolation"])
    ded.EnableAnimFix(ultimate.cfg["update_client_anim_fix"])
    ded.EnableBoneFix(ultimate.cfg["bone_fix"])

    ded.SetMaxShift(ultimate.cfg["charge_ticks"])
    ded.SetMinShift(ultimate.cfg["shift_ticks"])
    ded.EnableTickbaseShifting(ultimate.cfg["tickbase_shift"])
end

function ultimate.CreateConfig()
    local configName = ultimate.cfg["config_name"]

    if not configName or configName == "" then return end

    local saveData = {
        cfg = ultimate.cfg,
        binds = ultimate.binds,
        colors = ultimate.colors
    }

    local tojs = util.TableToJSON(saveData, false)
    if not tojs or tojs == "" then return end

    file.Write("autohook/" .. configName .. ".txt", tojs, "DATA")
    ultimate.fillConfigTable()

    for i, name in ipairs(ultimate.cfgTable) do
        if name == configName then
            ultimate.cfg["selected_config"] = i
            break
        end
    end

    if ultimate.initTab then
        ultimate.initTab("Config")
    end
end

function ultimate.DeleteConfig()
    local selectedConfigId = ultimate.cfg["selected_config"]
    local str = ultimate.cfgTable[selectedConfigId]

    if str then
        file.Delete("autohook/" .. str .. ".txt", "DATA")

        table.remove(ultimate.cfgTable, selectedConfigId)

        if #ultimate.cfgTable > 0 then
            ultimate.cfg["selected_config"] = 1
        else
            ultimate.cfg["selected_config"] = nil
        end

        ultimate.fillConfigTable()
        ultimate.initTab("Config")
    else
        print("Error: Selected config not found.")
    end
end

function ultimate.ROUND_TO_TICK(time)
    return ultimate.TICKS_TO_TIME(ultimate.TIME_TO_TICKS(time))
end


/*


    pidors elements

    --------------------------

    KLEVI AIMBOT

    ---------------------------

    не ну экстраполяция сама себя не сделает

    ---------------------------

    крутые резольверы как бы да

    ---------------------------

    RESOLVER FIX 2026 MEGA SUPER ULTIMATE EDITION

    ---------------------------

    драг эн дроп залупа, не буду делть

    --------------------------

    DOYLEZ EXPLOIT

    --------------------------

    кружки я как бы сделал с ultimate_old_1337.dll.lua.exe

    --------------------------

    сука зачем верни мод меню стендоф, мод меню гмод

    --------------------------

    щас зайду, безик шрифт пофикси, гпт помощи попроси. Так лоадим луашку, конфиг тест.........

    --------------------------

    стёпа терол говорю стоять

    пиздееееец

    САБАЧКА MICRODEFENDER — 4:08 PM

    халылылы халылылы халылылыл

    такие звуки приятные

    как мать маквина ебут

    кстати

    я вас в рот ебал всех

    @Source Code Leak тебя особенно

    --------------------------

    ну я тыкаю и ничего не просходит

    еблан?

    я в боди стреляю если что

    таааак... я не знаю как узнать этот,... стим айдишник

    --------------------------

    https://linkenc.net/d?l=FCklm55afGza2UAp0~60Sj23Lm-zHeLQBHQmsGmpKHaMfOWMEMMB1wCWDVZL6dT~6yPcse~NG7lmA-hrn8buc~xIIZHo6.T3dARe0Dp6hWAjN45.j9FvKfcBnNgHHX5y-lIy84BYF68SvHaulQ7R5PfqV8oYo3pBIY~gw3lDV52~L7c2bqn-eUfc4nk.~JcEQZSb0I5lq21BT2hOKudRalilT51RBVo06OhI1D-FUBUR5rEuEMK0UbJFyYH6dG7maziC1lIdExtc.oBhHgalb7Kq2-L8jduP3C~mvIKLA!

    я не ебу что оно делает в коде, но пусть лежит

    пароль если что 1234

    --------------------------

    оранжулзыд — Yesterday at 10:18 PM

    булькает водичка

    булькает води чка

    буль бульк

*/



local function surface_SimpleRect(x,y,w,h,c)
	surface.SetDrawColor(c)
	surface.DrawRect(x,y,w,h)
end

local function surface_SimpleText(x,y,s,c)
	surface.SetTextColor(c)
	surface.SetTextPos(x,y)
	surface.DrawText(s)
end

local Utility = {}

function Utility.TimeToTicks( flTime )
    return math.floor( 0.5 + flTime / flTickInterval )
end

/*
    Materials
*/

ultimate.chamsMaterials = {
    "Flat",
    "Wireframe",
    "Selfillum",
    "Selfillum additive",
    "Metallic",
    "Glass",
    "Glowing glass"
}

ultimate.crosshairTypes = {
    "Lines",
    "Rotating Circles"
}


/*
    Detours
*/
do
    local PLAYER = FindMetaTable("Player")
    if not PLAYER then return end

    local Name_     = PLAYER.Name
    local Nick_     = PLAYER.Nick
    local GetName_  = PLAYER.GetName

    if not Name_ or not Nick_ or not GetName_ then return end

    function PLAYER:Name()
        if not IsValid(self) then return Name_(self) end
        if not ultimate or not ultimate.cfg then return Name_(self) end
        if not ultimate.cfg["hide_name"] then return Name_(self) end
        if self ~= pLocalPlayer then return Name_(self) end
        if not ultimate.cfg["custom_name"] then return Name_(self) end

        return tostring(ultimate.cfg["custom_name"])
    end

    function PLAYER:Nick()
        if not IsValid(self) then return Nick_(self) end
        if not ultimate or not ultimate.cfg then return Nick_(self) end
        if not ultimate.cfg["hide_name"] then return Nick_(self) end
        if self ~= pLocalPlayer then return Nick_(self) end
        if not ultimate.cfg["custom_name"] then return Nick_(self) end

        return tostring(ultimate.cfg["custom_name"])
    end

    function PLAYER:GetName()
        if not IsValid(self) then return GetName_(self) end
        if not ultimate.cfg then return GetName_(self) end
        if not ultimate.cfg["hide_name"] then return GetName_(self) end
        if self ~= pLocalPlayer then return GetName_(self) end
        if not ultimate.cfg["custom_name"] then return GetName_(self) end

        return tostring(ultimate.cfg["custom_name"])
    end

    ultimate.RestoreDetours = function()
        if PLAYER and Name_ and Nick_ and GetName_ then
            PLAYER.Name = Name_
            PLAYER.Nick = Nick_
            PLAYER.GetName = GetName_
        end
    end
end









ultimate.ui = {}

ultimate.validsnd = false 


ultimate.activetab = "Aimbot"
ultimate.multicombo = false


ultimate.ribbonH = 24

ultimate.ribbonTop = 0
ultimate.ribbonMarginX = 0


ultimate.hint = false
ultimate.hintText = ""
ultimate.hintX = 0
ultimate.hintY = 0

do
    StoredCursorPos = {}

    function RememberCursorPosition()

        local x, y = input.GetCursorPos()

        if ( x == 0 && y == 0 ) then return end

        StoredCursorPos.x, StoredCursorPos.y = x, y

    end

    function RestoreCursorPosition()

        if ( !StoredCursorPos.x || !StoredCursorPos.y ) then return end
        input.SetCursorPos( StoredCursorPos.x, StoredCursorPos.y )

    end
end
do
    local PANEL = {}
    local background_material = Material("custom/anime.png")
    PANEL.FadeTime = 0

    function PANEL:Init()
        self:SetFocusTopLevel(true)
        self:SetSize(800, 600)

        self:SetPaintBackgroundEnabled(false)
        self:SetPaintBorderEnabled(false)

        self:DockPadding(5, 0, 5, 5)

        self:MakePopup()
        self:Center(true)


        PANEL.TopPanel = self:Add("DPanel")
        PANEL.TopPanel:SetPos(0, 0)
        PANEL.TopPanel:SetSize(0, 0)
        PANEL.TopPanel:SetVisible(false)
        function PANEL.TopPanel:Paint(w, h) end


        self.RibbonOverlay = vgui.Create("DPanel", self)
        self.RibbonOverlay:Dock(NODOCK)
        self.RibbonOverlay:SetPos(0, 0)
        self.RibbonOverlay:SetSize(self:GetWide(), (ultimate.ribbonTop or 0) + (ultimate.ribbonH or 24) + 3)
        self.RibbonOverlay:SetZPos(9999)
        self.RibbonOverlay:SetMouseInputEnabled(false)
        self.RibbonOverlay:SetKeyboardInputEnabled(false)
        self.RibbonOverlay:SetDrawOnTop(true)
        self.RibbonOverlay:SetParent(self)
        self.RibbonOverlay:SetVisible(true)
        self.RibbonOverlay.Paint = function(_, w, h)
            local ribbonH = ultimate.ribbonH or 24
            local ribbonTop = ultimate.ribbonTop or 0
            local ribbonMarginX = ultimate.ribbonMarginX or 0



           
            
        end
    end    

    function PANEL:Think()
        local x,y = input.GetCursorPos()
        local mousex = math.Clamp( x, 1, screenWidth - 1 )
        local mousey = math.Clamp( y, 1, screenHeight - 1 )

        if ( self.Dragging ) then

            local x = mousex - self.Dragging[1]
            local y = mousey - self.Dragging[2]

            self:SetPos( x, y )

        end

        self:SetCursor( "arrow" )

        ultimate.accent = HSVToColor(  ( CurTime() * 25 ) % 360, 1, 1 )

        ultimate.accent.r = math.Clamp( ultimate.accent.r, 128, 255 )
        ultimate.accent.g = math.Clamp( ultimate.accent.g, 128, 255 )
        ultimate.accent.b = math.Clamp( ultimate.accent.b, 128, 255 )
    end

    function PANEL:IsActive()

        if ( self:HasFocus() ) then return true end
        if ( vgui.FocusedHasParent( self ) ) then return true end

        return false

    end


    function PANEL:OnMousePressed()
        local x,y = input.GetCursorPos()
        local screenX, screenY = self:LocalToScreen( 0, 0 )

        if (  y < ( screenY + 850 ) ) then
            self.Dragging = { x - self.x, y - self.y }
            self:MouseCapture( true )
            return
        end

    end

    function PANEL:OnMouseReleased()

        self.Dragging = nil
        self.Sizing = nil
        self:MouseCapture( false )

    end

    function PANEL:Paint(w, h)
        if ultimate.cfg["custom_background"] ~= false then
            local current_time = CurTime()

            if current_time - last_update > 0.1 then
                local style = ultimate.cfg["style"] or 1
                local path

                if style == 1 then
                    path = "custom/anime.png"
                elseif style == 2 then
                    path = "custom/anime1.png"
                elseif style == 3 then
                    path = "custom/anime2.png"
                elseif style == 4 then
                    path = "custom/krik.png"
                elseif style == 5 then
                    path = "custom/cick.png"
                elseif style == 6 then
                    path = "custom/ripper.png"
                elseif style == 7 then
                    path = "custom/demon.png"
                elseif style == 8 then
                    path = "custom/chromeware_new.png"
                elseif style == 9 then
                    path = "custom/begemotik.png"
                elseif style == 10 then
                    path = "custom/zanoza.png"
                elseif style == 11 then
                    path = "custom/russia.png"
                elseif style == 12 then
                    path = ultimate.cfg["custom_background_path"]
                elseif style == 13 then
                    path = "custom/pila.png"
                end

                background_material = Material(path)
                last_update = current_time
            end

            if background_material and not background_material:IsError() then
                surface.SetMaterial(background_material)
                surface.SetDrawColor(255, 255, 255, 255)
                surface.DrawTexturedRect(0, 0, w, h)
            else
                surface.SetDrawColor( ultimate.Colors[24] )
                surface.DrawRect( 0, 25, w, h )
                surface.SetDrawColor( ultimate.Colors[54] )
                surface.DrawRect( 0, 0, w, ultimate.cfg["foreground_height"] )
            end
        else
            surface.SetDrawColor( ultimate.Colors[24] )
            surface.DrawRect( 0, 25, w, h )
            surface.SetDrawColor( ultimate.Colors[54] )
            surface.DrawRect( 0, 0, w, ultimate.cfg["foreground_height"] )
        end

        surface.SetFont("DermaSmall")

        local textOption = ultimate.cfg["cheat_text"] or 1
        local tabText

        if textOption == 1 then
            tabText = "Kremlin hack Neo-Nazism edition beta alpha live supremacy paste v1"
        elseif textOption == 2 then
            tabText = "Ultimate for Garry's mod (x64)"
        elseif textOption == 3 then
            tabText = "ULTIMATE V666 DEMON EDITION"
        elseif textOption == 4 then
            tabText = "НОВОСИБИРСКАЯ ИГРА НАЧИНАЕТСЯ"
        elseif textOption == 5 then
            tabText = "begemotik.hack - private lua cheat"
        elseif textOption == 6 then
            tabText = "ЧИТ ПО КОНТРАКТУ"
        elseif textOption == 7 then
            tabText = "министерство обороны.рф"
        elseif textOption == 8 then
            tabText = "femboyhack"
        elseif textOption == 9 then
            tabText = "⛤ ULTIMATE VIP BY M'Y DICK"
        elseif textOption == 10 then
            tabText = "VoidHook.Tech return"
        else
            tabText = ultimate.cfg["custom_cheatname"]
        end

        local time = RealTime()

        if textOption == 9 or ultimate.cfg["rainbow_text"] then
            local rainbowColor = HSVToColor( ( CurTime() * 25 ) % 360, 1, 1 )
            rainbowColor.r = math.Clamp( rainbowColor.r, 128, 255 )
            rainbowColor.g = math.Clamp( rainbowColor.g, 128, 255 )
            rainbowColor.b = math.Clamp( rainbowColor.b, 128, 255 )
            surface.SetTextColor( rainbowColor )
        elseif textOption == 3 or textOption == 4 then
            surface.SetTextColor( 255, 0, 0 )
        elseif textOption == 6 or textOption == 7 then
            surface.SetTextColor( 255, 255, 255 )
        else
            surface.SetTextColor( ultimate.Colors[165] )
        end

        surface.SetTextPos( 8, 4 )
        surface.DrawText( tabText )
    end

    function PANEL:GetTopPanel()
        return PANEL.TopPanel
    end

    vgui.Register( "UFrame", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )

        local vbar = self.VBar
        vbar:SetWide(3)

        vbar.Paint = nil
        vbar.btnUp.Paint = nil
        vbar.btnDown.Paint = nil

        function vbar.btnGrip:Paint( w, h )
            surface.SetDrawColor( ultimate.Colors[54] )
            surface.DrawRect( 0, 0, w, h )
        end
    end

    function PANEL:Paint( w, h )
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    vgui.Register( "UScroll", PANEL, "DScrollPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.ItemPanel = vgui.Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 23, 3, 3 )

        self.ItemPanel.Paint = nil

        function self.ItemPanel:OnMousePressed()
            ultimate.frame:OnMousePressed()
        end

        function self.ItemPanel:OnMouseReleased()
            ultimate.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )

        surface.SetFont( "DermaSmall" )

        surface.SetTextColor( ultimate.Colors[165] )
        surface.SetTextPos( 8, 3 )
        surface.DrawText( self.txt )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawRect( 6, 20, w - 12, 1 )
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end

    vgui.Register( "UPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawRect( 0, 0, w, h )
    end

    vgui.Register( "UPaintedPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( TOP )
        self:DockMargin( 4, 4, 4, 0 )
        self:SetTall( 18 )
    end

    function PANEL:Paint( w, h )

    end

    vgui.Register( "UCBPanel", PANEL, "DPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.Label:SetFont("DermaSmall")
        self.Label:SetTextColor(ultimate.Colors[165])

        self.Button:SetSize( 18, 18 )

        function self.Button:Paint(w,h)
            local v = self:GetChecked()

            surface.SetDrawColor(ultimate.Colors[54])
            surface.DrawOutlinedRect(0,0,w,h,1)

            if not v and not self:IsHovered() then return end

            if v then
                surface.SetDrawColor(ultimate.Colors[54])
            else
                surface.SetDrawColor(ultimate.Colors[40])
            end

            surface.DrawRect(3,3,w-6,h-6)
        end
    end

    function PANEL:PerformLayout()

        local x = self.m_iIndent || 0

        self.Button:SetSize( 18, 18 )
        self.Button:SetPos( x, math.floor( ( self:GetTall() - self.Button:GetTall() ) / 2 ) )

        self.Label:SizeToContents()
        self.Label:SetPos( x + self.Button:GetWide() + 9, math.floor( ( self:GetTall() - self.Label:GetTall() ) / 2 ) )

    end

    vgui.Register( "UCheckboxLabel", PANEL, "DCheckBoxLabel" )
end

do
    local PANEL = {}
    AccessorFunc(PANEL, "Value", "Value")
    AccessorFunc(PANEL, "SlideX", "SlideX")
    AccessorFunc(PANEL, "Min", "Min")
    AccessorFunc(PANEL, "Decimals", "Decimals")
    AccessorFunc(PANEL, "Max", "Max")
    AccessorFunc(PANEL, "Dragging", "Dragging")

    function PANEL:Init()
        self:SetMouseInputEnabled(true)

        self.Min = 0
        self.Max = 1
        self.SlideX = 0
        self.Decimals = 0

        self:SetValue(self.Min)
        self:SetSlideX(0)

        self:SetTall(15)
    end

    function PANEL:OnCursorMoved(x, y)
        if not self.Dragging then return end

        local w, h = self:GetSize()

        x = math.Clamp(x, 0, w) / w
        y = math.Clamp(y, 0, h) / h

        local value = self.Min + (self.Max - self.Min) * x
        value = math.Round(value, self:GetDecimals())

        self:SetValue(value)
        self:SetSlideX(x)

        self:OnValueChanged(value)

        self:InvalidateLayout()
    end

    function PANEL:OnMousePressed(mcode)
        self:SetDragging(true)
        self:MouseCapture(true)

        local x, y = self:CursorPos()
        self:OnCursorMoved(x, y)
    end

    function PANEL:OnMouseReleased(mcode)
        self:SetDragging(false)
        self:MouseCapture(false)
    end

    function PANEL:OnValueChanged(value)

    end

    function PANEL:Paint(w,h)
        local min, max = self:GetMin(), self:GetMax()

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawRect(2, 2, self:GetSlideX()*w-4, h-4)
    end

    vgui.Register("USlider", PANEL, "Panel")
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(4,4,4,0)

        self:SetTextColor(ultimate.Colors[165])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        if self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[35])
            surface.DrawRect(0, 0, w, h)
        end

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

    vgui.Register( "UButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(1,1,1,0)

        self:SetTextColor(ultimate.Colors[245])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        if self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[35])
            surface.DrawRect(0, 0, w, h)
        end
    end

    vgui.Register( "UESPPButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetTall(20)
        self.DropButton.Paint = nil
    end

    function PANEL:Paint(w,h)
        surface.SetDrawColor(ultimate.Colors[25])
        surface.DrawRect(0,0,w,h)

        surface.SetDrawColor(ultimate.Colors[32])
        surface.DrawRect(w-25,0,25,25)

        surface.SetTextColor(ultimate.Colors[222])
        surface.SetTextPos(w-20,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText("▼")

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h)
    end

    function PANEL:OpenMenu( pControlOpener )

        if ( pControlOpener && pControlOpener == self.TextEntry ) then
            return
        end

        -- Don't do anything if there aren't any options..
        if ( #self.Choices == 0 ) then return end

        -- If the menu still exists and hasn't been deleted
        -- then just close it and don't open a new one.
        if ( IsValid( self.Menu ) ) then
            self.Menu:Remove()
            self.Menu = nil
        end

        -- If we have a modal parent at some level, we gotta parent to that or our menu items are not gonna be selectable
        local parent = self
        while ( IsValid( parent ) && not parent:IsModal() ) do
            parent = parent:GetParent()
        end
        if ( not IsValid( parent ) ) then parent = self end

        self.Menu = DermaMenu( false, parent )

        function self.Menu:Paint(w,h)
            surface.SetDrawColor(ultimate.Colors[24])
            surface.DrawRect(0,0,w,h)
            surface.SetDrawColor(ultimate.Colors[54])
            surface.DrawOutlinedRect(0,-1,w,h+1)
        end

        for k, v in ipairs( self.Choices ) do
            local option = self.Menu:AddOption( v, function() self:ChooseOption( v, k ) end )
            option.txt = v
            option:SetText("")

            function option:Paint(w,h)
                if self:IsHovered() then
                    surface.SetDrawColor(ultimate.Colors[32])
                    surface.DrawRect(1,1,w-2,h-2)
                end

                surface.SetFont("DermaSmall")
                surface.SetTextColor(ultimate.Colors[165])
                surface.SetTextPos(10, 4)
                surface.DrawText(option.txt)
            end

            if ( self.Spacers[ k ] ) then
                self.Menu:AddSpacer()
            end
        end


        local x, y = self:LocalToScreen( 0, self:GetTall() )

        self.Menu:SetMinimumWidth( self:GetWide() )
        self.Menu:Open( x, y, false, self )

        self:OnMenuOpened( self.Menu )

    end

    function PANEL:PerformLayout(s)
        self:SetTextColor(ultimate.Colors[165])
        self:SetFont("DermaSmall")
    end

    vgui.Register( "UComboBox", PANEL, "DComboBox" )
end

do
	local PANEL = {}

	PANEL.lifeTime = 0

	function PANEL:Paint( w, h )
		surface.SetDrawColor( ultimate.Colors[32] )
		surface.DrawRect( 0, 0, w, h )

		surface.SetDrawColor( ultimate.Colors[54] )
		surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	end

	function PANEL:Init()
		self:RequestFocus()
		self:MakePopup()
	end

	function PANEL:Think()
		if not self:IsHovered() then
			self.lifeTime = self.lifeTime + FrameTime()
		else
			self.lifeTime = 0
		end

		if self.lifeTime > 0.5 then
			self:Remove()
		end
	end

	vgui.Register( "ULifeTimeBase", PANEL, "Panel" )
end

do
    local PANEL = {}

    AccessorFunc( PANEL, "m_iSelectedNumber", "SelectedNumber" )

    function PANEL:Init()

        self:SetSelectedNumber( 0 )
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 75 )

    end

    function PANEL:UpdateText()

        local keyNum = self:GetSelectedNumber()
        if not keyNum then keyNum = 0 end
        local str = input.GetKeyName( keyNum )
        if ( not str ) then str = "" end

        str = language.GetPhrase( str )

        self:SetText( "["..str.."]" )
        self:SetTextColor(ultimate.Colors[165])
        self:SetFont("DermaSmall")
    end

    function PANEL:Paint(w,h)
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

    function PANEL:DoClick()

        self:SetText( "PRESS A KEY" )
        input.StartKeyTrapping()
        self.Trapping = true

    end

    function PANEL:DoRightClick()

        self:SetText( "[]" )
        self:SetValue( 0 )

    end

    function PANEL:SetSelectedNumber( iNum )

        self.m_iSelectedNumber = iNum
        self:UpdateText()
        self:OnChange( iNum )

    end

    function PANEL:Think()

        if ( input.IsKeyTrapping() && self.Trapping ) then

            local code = input.CheckKeyTrapping()
            if ( code ) then

                if ( code == KEY_ESCAPE ) then

                    self:SetValue( self:GetSelectedNumber() )

                else

                    self:SetValue( code )

                end

                self.Trapping = false

            end

        end

    end

    function PANEL:SetValue( iNumValue )

        self:SetSelectedNumber( iNumValue )

    end

    function PANEL:GetValue()

        return self:GetSelectedNumber()

    end

    function PANEL:OnChange()
    end

    vgui.Register( "UBinder", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.Color = Color(255,255,255,255)

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall(18)
        self:SetWide(18)

        self:SetText("")
    end

    function PANEL:Paint(w,h)
        if self.Color.a < 255 then
            surface.SetDrawColor( ultimate.Colors[255] )
            surface.SetMaterial( ultimate.Materials["Alpha grid"] )
            surface.DrawTexturedRect( 0, 0, w, h )
        end

        surface.SetDrawColor(self.Color)
        surface.DrawRect(0,0,w,h)
    end

    vgui.Register( "UCPicker", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.lifeTime = 0

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[25] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    function PANEL:Init()
        self:RequestFocus()
        self:MakePopup()
    end

    function PANEL:Think()
        if self.lifeTime < 15 then self.lifeTime = self.lifeTime + 1 end

        if not self:HasFocus() and self.lifeTime >= 14 then
            self:Remove()
        end
    end

    vgui.Register( "ULifeTimeBase", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetSize(200,200)
    end

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[25] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui.Register( "UColorPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )
        self:DockPadding(5, 5, 5, 5)
        self:SetPalette( false )
        self:SetWangs( false )
    end

    vgui.Register( "UColorMixer", PANEL, "DColorMixer" )
end

do
    local PANEL = {}

    AccessorFunc( PANEL, "m_bDirty", "Dirty", FORCE_BOOL )
    AccessorFunc( PANEL, "m_bSortable", "Sortable", FORCE_BOOL )

    AccessorFunc( PANEL, "m_iHeaderHeight", "HeaderHeight" )
    AccessorFunc( PANEL, "m_iDataHeight", "DataHeight" )

    AccessorFunc( PANEL, "m_bMultiSelect", "MultiSelect" )
    AccessorFunc( PANEL, "m_bHideHeaders", "HideHeaders" )

    function PANEL:Init()
        self:SetSortable( true )
        self:SetMouseInputEnabled( true )
        self:SetMultiSelect( true )
        self:SetHideHeaders( false )

        self:SetPaintBackground( true )
        self:SetHeaderHeight( 16 )
        self:SetDataHeight( 17 )

        self.Columns = {}

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

        self.pnlCanvas = vgui.Create( "Panel", self )

        self.VBar = vgui.Create( "DVScrollBar", self )
        self.VBar:SetZPos( 20 )
    end

    function PANEL:DisableScrollbar()

        if ( IsValid( self.VBar ) ) then
            self.VBar:Remove()
        end

        self.VBar = nil

    end

    function PANEL:GetLines()
        return self.Lines
    end

    function PANEL:GetInnerTall()
        return self:GetCanvas():GetTall()
    end

    function PANEL:GetCanvas()
        return self.pnlCanvas
    end

    function PANEL:AddColumn( strName, iPosition )

        if ( iPosition ) then
            if ( iPosition <= 0 ) then
                ErrorNoHaltWithStack( "Attempted to insert column at invalid position ", iPosition )
                return
            end

            if ( IsValid( self.Columns[ iPosition ] ) ) then
                ErrorNoHaltWithStack( "Attempted to insert duplicate column." )
                return
            end
        end

        local pColumn = nil

        if ( self.m_bSortable ) then
            pColumn = vgui.Create( "DListView_Column", self )
        else
            pColumn = vgui.Create( "DListView_ColumnPlain", self )
        end

        pColumn:SetName( strName )
        pColumn:SetZPos( 10 )

        if ( iPosition ) then

            table.insert( self.Columns, iPosition, pColumn )

            local i = 1
            for id, pnl in pairs( self.Columns ) do
                pnl:SetColumnID( i )
                i = i + 1
            end

        else

            local ID = table.insert( self.Columns, pColumn )
            pColumn:SetColumnID( ID )

        end

        self:InvalidateLayout()

        return pColumn

    end

    function PANEL:RemoveLine( LineID )

        local Line = self:GetLine( LineID )
        local SelectedID = self:GetSortedID( LineID )

        self.Lines[ LineID ] = nil
        table.remove( self.Sorted, SelectedID )

        self:SetDirty( true )
        self:InvalidateLayout()

        Line:Remove()

    end

    function PANEL:ColumnWidth( i )

        local ctrl = self.Columns[ i ]
        if ( not ctrl ) then return 0 end

        return ctrl:GetWide()

    end

    function PANEL:FixColumnsLayout()

        local NumColumns = table.Count( self.Columns )
        if ( NumColumns == 0 ) then return end

        local AllWidth = 0
        for k, Column in pairs( self.Columns ) do
            AllWidth = AllWidth + math.ceil( Column:GetWide() )
        end

        local ChangeRequired = self.pnlCanvas:GetWide() - AllWidth
        local ChangePerColumn = math.floor( ChangeRequired / NumColumns )
        local Remainder = ChangeRequired - ( ChangePerColumn * NumColumns )

        for k, Column in pairs( self.Columns ) do

            local TargetWidth = math.ceil( Column:GetWide() ) + ChangePerColumn
            Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

        end

        local TotalMaxWidth = 0

        -- If there's a remainder, try to palm it off on the other panels, equally
        while ( Remainder ~= 0 ) do

            local PerPanel = math.floor( Remainder / NumColumns )

            for k, Column in pairs( self.Columns ) do

                Remainder = math.Approach( Remainder, 0, PerPanel )

                local TargetWidth = math.ceil( Column:GetWide() ) + PerPanel
                Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

                if ( Remainder == 0 ) then break end

                TotalMaxWidth = TotalMaxWidth + math.ceil( Column:GetMaxWidth() )

            end

            -- Total max width of all the columns is less than the width of the DListView, abortnot
            if ( TotalMaxWidth < self.pnlCanvas:GetWide() ) then break end

            Remainder = math.Approach( Remainder, 0, 1 )

        end

        -- Set the positions of the resized columns
        local x = 0
        for k, Column in pairs( self.Columns ) do

            Column.x = x
            x = x + math.ceil( Column:GetWide() )

            Column:SetTall( math.ceil( self:GetHeaderHeight() ) )
            Column:SetVisible( not self:GetHideHeaders() )

        end

    end

    function PANEL:PerformLayout()

        -- Do Scrollbar
        local Wide = self:GetWide()
        local YPos = 0

        if ( IsValid( self.VBar ) ) then

            self.VBar:SetPos( self:GetWide() - 16, 0 )
            self.VBar:SetSize( 16, self:GetTall() )
            self.VBar:SetUp( self.VBar:GetTall() - self:GetHeaderHeight(), self.pnlCanvas:GetTall() )
            YPos = self.VBar:GetOffset()

            if ( self.VBar.Enabled ) then Wide = Wide - 16 end

        end

        if ( self.m_bHideHeaders ) then
            self.pnlCanvas:SetPos( 0, YPos )
        else
            self.pnlCanvas:SetPos( 0, YPos + self:GetHeaderHeight() )
        end

        self.pnlCanvas:SetSize( Wide, self.pnlCanvas:GetTall() )

        self:FixColumnsLayout()

        --
        -- If the data is dirty, re-layout
        --
        if ( self:GetDirty() ) then

            self:SetDirty( false )
            local y = self:DataLayout()
            self.pnlCanvas:SetTall( y )

            -- Layout again, since stuff has changed..
            self:InvalidateLayout( true )

        end

    end

    function PANEL:OnScrollbarAppear()

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:OnRequestResize( SizingColumn, iSize )

        -- Find the column to the right of this one
        local Passed = false
        local RightColumn = nil
        for k, Column in pairs( self.Columns ) do

            if ( Passed ) then
                RightColumn = Column
                break
            end

            if ( SizingColumn == Column ) then Passed = true end

        end

        -- Alter the size of the column on the right too, slightly
        if ( RightColumn ) then

            local SizeChange = SizingColumn:GetWide() - iSize
            RightColumn:SetWide( RightColumn:GetWide() + SizeChange )

        end

        SizingColumn:SetWide( iSize )
        self:SetDirty( true )

        -- Invalidating will munge all the columns about and make it right
        self:InvalidateLayout()

    end

    function PANEL:DataLayout()

        local y = 0
        local h = self.m_iDataHeight

        local alt = false
        for k, Line in ipairs( self.Sorted ) do

            if ( not Line:IsVisible() ) then continue end

            Line:SetPos( 1, y )
            Line:SetSize( self:GetWide() - 2, h )
            Line:DataLayout( self )

            Line:SetAltLine( alt )
            alt = not alt

            y = y + Line:GetTall()

        end

        return y

    end

    PANEL.Cur = true
    function PANEL:AddLine( ... )

        self.Cur = not self.Cur

        self:SetDirty( true )
        self:InvalidateLayout()

        local Line = vgui.Create( "DListView_Line", self.pnlCanvas )
        local c = self.Cur and 48 or 32

        function Line:Paint( w, h )

            surface.SetDrawColor( c, c, c )
            surface.DrawRect( 0, 0, w, h )
        end

        local ID = table.insert( self.Lines, Line )

        Line:SetListView( self )
        Line:SetID( ID )

        -- This assures that there will be an entry for every column
        for k, v in pairs( self.Columns ) do
            Line:SetColumnText( k, "" )
        end

        for k, v in pairs( {...} ) do
            Line:SetColumnText( k, v )
        end

        -- Make appear at the bottom of the sorted list
        local SortID = table.insert( self.Sorted, Line )

        if ( SortID % 2 == 1 ) then
            Line:SetAltLine( true )
        end

        return Line

    end

    function PANEL:OnMouseWheeled( dlta )

        if ( not IsValid( self.VBar ) ) then return end

        return self.VBar:OnMouseWheeled( dlta )

    end

    function PANEL:ClearSelection( dlta )

        for k, Line in pairs( self.Lines ) do
            Line:SetSelected( false )
        end

    end

    function PANEL:GetSelectedLine()

        for k, Line in pairs( self.Lines ) do
            if ( Line:IsSelected() ) then return k, Line end
        end

    end

    function PANEL:GetLine( id )

        return self.Lines[ id ]

    end

    function PANEL:GetSortedID( line )

        for k, v in pairs( self.Sorted ) do

            if ( v:GetID() == line ) then return k end

        end

    end

    function PANEL:OnClickLine( Line, bClear )

        local bMultiSelect = self:GetMultiSelect()
        if ( not bMultiSelect && not bClear ) then return end

        --
        -- Control, multi select
        --
        if ( bMultiSelect && input.IsKeyDown( KEY_LCONTROL ) ) then
            bClear = false
        end

        --
        -- Shift block select
        --
        if ( bMultiSelect && input.IsKeyDown( KEY_LSHIFT ) ) then

            local Selected = self:GetSortedID( self:GetSelectedLine() )
            if ( Selected ) then

                local LineID = self:GetSortedID( Line:GetID() )

                local First = math.min( Selected, LineID )
                local Last = math.max( Selected, LineID )

                -- Fire off OnRowSelected for each non selected row
                for id = First, Last do
                    local line = self.Sorted[ id ]
                    if ( not line:IsLineSelected() ) then self:OnRowSelected( line:GetID(), line ) end
                    line:SetSelected( true )
                end

                -- Clear the selection and select only the required rows
                if ( bClear ) then self:ClearSelection() end

                for id = First, Last do
                    local line = self.Sorted[ id ]
                    line:SetSelected( true )
                end

                return

            end

        end

        --
        -- Check for double click
        --
        if ( Line:IsSelected() && Line.m_fClickTime && ( not bMultiSelect || bClear ) ) then

            local fTimeDistance = SysTime() - Line.m_fClickTime

            if ( fTimeDistance < 0.3 ) then
                self:DoDoubleClick( Line:GetID(), Line )
                return
            end

        end

        --
        -- If it's a new mouse click, or this isn't
        -- multiselect we clear the selection
        --
        if ( not bMultiSelect || bClear ) then
            self:ClearSelection()
        end

        if ( Line:IsSelected() ) then return end

        Line:SetSelected( true )
        Line.m_fClickTime = SysTime()

        self:OnRowSelected( Line:GetID(), Line )

    end

    function PANEL:SortByColumns( c1, d1, c2, d2, c3, d3, c4, d4 )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( not IsValid( a ) ) then return true end
            if ( not IsValid( b ) ) then return false end

            if ( c1 && a:GetColumnText( c1 ) ~= b:GetColumnText( c1 ) ) then
                if ( d1 ) then a, b = b, a end
                return a:GetColumnText( c1 ) < b:GetColumnText( c1 )
            end

            if ( c2 && a:GetColumnText( c2 ) ~= b:GetColumnText( c2 ) ) then
                if ( d2 ) then a, b = b, a end
                return a:GetColumnText( c2 ) < b:GetColumnText( c2 )
            end

            if ( c3 && a:GetColumnText( c3 ) ~= b:GetColumnText( c3 ) ) then
                if ( d3 ) then a, b = b, a end
                return a:GetColumnText( c3 ) < b:GetColumnText( c3 )
            end

            if ( c4 && a:GetColumnText( c4 ) ~= b:GetColumnText( c4 ) ) then
                if ( d4 ) then a, b = b, a end
                return a:GetColumnText( c4 ) < b:GetColumnText( c4 )
            end

            return true
        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SortByColumn( ColumnID, Desc )

        table.Copy( self.Sorted, self.Lines )

        table.sort( self.Sorted, function( a, b )

            if ( Desc ) then
                a, b = b, a
            end

            local aval = a:GetSortValue( ColumnID ) || a:GetColumnText( ColumnID )
            local bval = b:GetSortValue( ColumnID ) || b:GetColumnText( ColumnID )

            -- Maintain nicer sorting for numbers
            if ( isnumber( aval ) && isnumber( bval ) ) then return aval < bval end

            return tostring( aval ) < tostring( bval )

        end )

        self:SetDirty( true )
        self:InvalidateLayout()

    end

    function PANEL:SelectItem( Item )

        if ( not Item ) then return end

        Item:SetSelected( true )
        self:OnRowSelected( Item:GetID(), Item )

    end

    function PANEL:SelectFirstItem()

        self:ClearSelection()
        self:SelectItem( self.Sorted[ 1 ] )

    end

    function PANEL:DoDoubleClick( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowSelected( LineID, Line )

        -- For Override

    end

    function PANEL:OnRowRightClick( LineID, Line )

        -- For Override

    end

    function PANEL:Clear()

        for k, v in pairs( self.Lines ) do
            v:Remove()
        end

        self.Lines = {}
        self.Sorted = {}

        self:SetDirty( true )

    end

    function PANEL:GetSelected()

        local ret = {}

        for k, v in pairs( self.Lines ) do
            if ( v:IsLineSelected() ) then
                table.insert( ret, v )
            end
        end

        return ret

    end

    function PANEL:SizeToContents()

        self:SetHeight( self.pnlCanvas:GetTall() + self:GetHeaderHeight() )

    end

    vgui.Register( "UListView", PANEL, "DPanel" )
end


do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[24] )
        surface.DrawRect( 0, 0, w, h )

        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui.Register( "UultimatePanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( RIGHT )
        self:DockMargin( 4, 0, 0, 0 )
        self:SetTall( 18 )
        self:SetWide( 18 )
        self:SetText( "..." )
    end

    vgui.Register( "USPanelButton", PANEL, "UButton" )
end

do
    local PANEL = {}

    function PANEL:Init()

        self.ButtonPanel = vgui.Create( "DPanel", self )
        self.ButtonPanel:Dock( TOP )
        self.ButtonPanel:DockMargin(3,3,3,2)
        self.ButtonPanel:SetTall(18)

        self.ItemPanel = vgui.Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 0, 3, 3 )

        self.ButtonPanel.Paint = nil
        self.ItemPanel.Paint = nil

        self.ActiveTab = "NIL"

        function self.ItemPanel:OnMousePressed()
            ultimate.frame:OnMousePressed()
        end

        function self.ItemPanel:OnMouseReleased()
            ultimate.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface.SetDrawColor( ultimate.Colors[54] )
        surface.DrawOutlinedRect( 0, 0, w, h, 1 )

        surface.SetFont( "DermaSmall" )

        surface.SetTextColor( ultimate.Colors[165] )
        surface.SetTextPos( 8, 3 )
        surface.DrawText( self.txt )

        surface.SetDrawColor( ultimate.Colors[ 54 ] )
        surface.DrawRect( 6, 20, w - 12, 1 )
    end

    function PANEL:OnMousePressed()
        ultimate.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ultimate.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end

    function PANEL:GetButtonPanel()
        return self.ButtonPanel
    end

    vgui.Register( "UButtonBarPanel", PANEL, "Panel" )
end




// GUI FUNCS

ultimate.ui.ColorWindow = false
ultimate.ui.ultimatePan = false
multicomboP = false

function ultimate.ui.RemovePanel( pan )
    if not pan then return end

    pan:Remove()
    pan = false
end

function binder( cfg, par )
    local b = vgui.Create( "UBinder", par )
    b:SetValue( ultimate.binds[ cfg ] or 0 )

    function b:OnChange()
        ultimate.binds[ cfg ] = b:GetValue()
    end

    return b
end

function colorpicker( cfg, par, onChange )
    local b = vgui.Create( "UCPicker", par )

    if not ultimate.colors[cfg] then
        ultimate.colors[cfg] = "255 255 255 255"
    end

    function b:DoClick()
        local x, y = self:LocalToScreen( 0, self:GetTall() )

        ultimate.ui.RemovePanel( ultimate.ui.ColorWindow )

        ultimate.ui.ColorWindow = vgui.Create( "UColorPanel" )
        ultimate.ui.ColorWindow:SetPos( x+25, y-100 )

        local c = vgui.Create( "UColorMixer", ultimate.ui.ColorWindow )
        c:SetColor( string.ToColor( ultimate.colors[cfg] or "255 255 255 255" ) )

        c.HSV.Knob:SetSize( 5, 5 )

        function c.HSV.Knob:Paint( w, h )
            local col = c:GetColor()
            surface.SetDrawColor( col.r, col.g, col.b, col.a )
            surface.DrawRect( 0, 0, w, h )

            surface.SetDrawColor( 255, 255, 255, 255 )
            surface.DrawOutlinedRect( 0, 0, w, h, 1 )
        end

        function c:ValueChanged( col )
            if IsValid(b) then
                b.Color = col
            end
            ultimate.colors[cfg] = tostring(col.r) .. " " .. tostring(col.g) .. " " .. tostring(col.b) .. " " .. tostring(col.a)
            if onChange then onChange( col ) end
        end

    end

    b.Color = string.ToColor( ultimate.colors[cfg] or "255 255 255 255" )
end

function spanel( func, p )
    local b = vgui.Create( "USPanelButton", p )

    function b:DoClick()
        local mx, my = input.GetCursorPos()

        ultimate.ui.RemovePanel( ultimate.ui.ultimatePan )

        ultimate.ui.ultimatePan = vgui.Create( "UultimatePanel" )
        ultimate.ui.ultimatePan:SetPos( mx+25, my-10 )

        func()
    end
end

function label( pan, str, postCreate )
    local p = vgui.Create( "UCBPanel", pan )

    local lbl = vgui.Create( "DLabel", p )
    lbl:SetText( str )
    lbl:SetFont( "DermaSmall" )
    lbl:SetTextColor( ultimate.Colors[165] )
    lbl:Dock( LEFT )
    lbl:DockMargin( 4, 2, 4, 0 )
    lbl:SizeToContents()

    if postCreate then postCreate( p ) end
end

function checkbox( par, lbl, cfg, hint, bind, color, spanel, onToggle, postCreate )
    local p = vgui.Create( "UCBPanel", par )

    local c = vgui.Create( "UCheckboxLabel", p )
    c:SetText( lbl )
    c:SetPos( 0, 0 )
    c:SetValue( ultimate.cfg[cfg] )

    function c:OnChange( bval )
        ultimate.cfg[cfg] = bval

        if onToggle then onToggle(bval) end
    end

    if postCreate then postCreate( p ) end

    if bind then binder( cfg, p ) end
    if color then colorpicker( cfg, p ) end
    if spanel then
        local b = vgui.Create( "USPanelButton", p )
        function b:DoClick()
            local mx, my = input.GetCursorPos()
            ultimate.ui.RemovePanel( ultimate.ui.ultimatePan )
            ultimate.ui.ultimatePan = vgui.Create( "UultimatePanel" )
            ultimate.ui.ultimatePan:SetPos( mx+25, my-10 )
            spanel()
        end
    end

    if hint then
        function c.Label:Paint()
            if self:IsHovered() then
                local x, y = input.GetCursorPos()

                ultimate.hint = true
                ultimate.hintText = hint
                ultimate.hintX = x + 45
                ultimate.hintY = y - 5
            end
        end
    end
end

function slider( p, str, cfg, min, max, dec, onChange )
    local pan = vgui.Create( "DPanel", p )
    pan:Dock( TOP )
    pan:DockMargin( 4, 2, 4, 0 )
    pan:SetTall( 20 )

    function pan:Paint( w, h )
        surface.SetFont("DermaSmall")

        local s = ultimate.cfg[cfg] or 0
        local tw, th = surface.GetTextSize(tostring(s))

        surface.SetTextColor( ultimate.Colors[165] )

        surface.SetTextPos( 2, 4 )
        surface.DrawText( str )

        surface.SetTextPos( w - tw - 2, 4 )
        surface.DrawText( tostring(ultimate.cfg[cfg] or 0) )
    end

    local c = vgui.Create( "USlider", p )
    c:Dock( TOP )
    c:DockMargin( 4, 2, 4, 0 )
    c:SetMax( max )
    c:SetMin( min )
    c:SetDecimals( dec )

    c:SetValue( ultimate.cfg[cfg] or min )

    local value, min, max = c:GetValue(), c:GetMin(), c:GetMax()

	c:SetSlideX((value - min) / (max - min))

    function c:OnValueChanged( val )
        ultimate.cfg[cfg] = val

        if onChange then onChange(val) end
    end
end

function button( str, func, p )
    local b = vgui.Create( "UButton", p )
    b:SetText( str )

    function b:DoClick()
        func()
    end
end

function textentry( str, cfg, pan, chars, postCreate )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,2,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local p = vgui.Create("DPanel",pan)
    p:SetTall(25)
    p:Dock(TOP)
    p:DockMargin(4,2,4,0)

    p.Paint = function(s,w,h)
        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

	local txt = vgui.Create("DTextEntry",p)
	txt:Dock(FILL)
	txt:DockMargin(4,4,4,4)
	txt:IsMultiline( false )
	txt:SetMaximumCharCount(chars)
	txt:SetPlaceholderText(str)
	txt:SetFont( "DermaSmall" )
    txt:SetPaintBackground(false)
    txt:SetTextColor(ultimate.Colors[165])

	if ultimate.cfg[cfg] ~= nil and ultimate.cfg[cfg] ~= "" then
		txt:SetValue(ultimate.cfg[cfg])
	end

	function txt.Think()
		if txt:IsEditing() then return end
        if ultimate.cfg[cfg] == txt:GetValue() then return end

		ultimate.cfg[cfg] = txt:GetValue()
	end

	function txt.OnValueChange()
		ultimate.cfg[cfg] = txt:GetValue()
	end

    if postCreate then postCreate(p) end
end

function ultimate.ui.dropdownButton( str, v, p, a )
    local b = p:Add("DButton")
    b:Dock(TOP)
    b:SetTall(20)
    b:DockMargin(2,2,2,0)
    b:SetText("")

    function b:Paint(w,h)
        if self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[32])
            surface.DrawRect(1, 1, w-2, h-2)
        end

        surface.SetTextColor(ultimate.Colors[165])

        if ultimate.cfg[str.."-"..v] then
            surface.SetTextColor(ultimate.Colors[235])
        end

        surface.SetTextPos(5,3)
        surface.SetFont("DermaSmall")
        surface.DrawText(v)
    end

    function b:DoClick()
        ultimate.cfg[str.."-"..v] = not ultimate.cfg[str.."-"..v]
    end
end

function combo( pan, str, cfg, choices )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local dropdown = vgui.Create("UComboBox",pan)
    dropdown:Dock(TOP)
    dropdown:DockMargin(4,1,4,0)

    if ultimate.presets[ cfg ] then
        choices = ultimate.presets[ cfg ]
    end

    for k, v in ipairs( choices ) do
        dropdown:AddChoice( v )
    end

    dropdown:SetSortItems(false)

    if ultimate.cfg[cfg] and ultimate.cfg[cfg] <= #choices then
        dropdown:ChooseOptionID(ultimate.cfg[cfg])
    else
        dropdown:ChooseOptionID(1)
    end

    function dropdown:OnSelect(index, value, data)
        ultimate.cfg[cfg] = index
    end

    return lbl, dropdown
end

function multicombo( pan, str, choices )
    local lbl = vgui.Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("DermaSmall")
    lbl:SetColor(ultimate.Colors[165])

    local d = vgui.Create("DButton",pan)
    d:Dock(TOP)
    d:DockMargin(4,1,4,0)
    d:SetTall(20)
    d:SetText("")

    d.preview = {}

    function d:Paint(w,h)
        local preview = ""

        for k, v in pairs(choices) do
            if ultimate.cfg[str.."-"..v] == true and (d.preview[v] == false or d.preview[v] == nil) and not table.HasValue(d.preview, v) then
                table.insert(d.preview,v)
            elseif ultimate.cfg[str.."-"..v] == false and (d.preview[v] == true or d.preview[v] == nil) and table.HasValue(d.preview, v) then
                table.RemoveByValue(d.preview,v)
            elseif d.preview[v] == false then
                table.RemoveByValue(d.preview,v)
            end
        end

        preview = table.concat(d.preview,", ")

        surface.SetDrawColor(ultimate.Colors[25])
        surface.DrawRect(0,0,w,h)

        surface.SetTextColor(ultimate.Colors[165])
        surface.SetTextPos(8,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText(preview)

        surface.SetDrawColor(ultimate.Colors[32])
        surface.DrawRect(w-25,0,25,25)

        surface.SetTextColor(ultimate.Colors[165])
        surface.SetTextPos(w-20,20/2-15/2)
        surface.SetFont("DermaSmall")
        surface.DrawText("▼")

        surface.SetDrawColor(ultimate.Colors[54])
        surface.DrawOutlinedRect(0,0,w,h,1)
    end

    function d:DoClick()
        local x,y = self:LocalToScreen( 0, self:GetTall() )

        ultimate.ui.RemovePanel( ultimate.ui.MultiComboP )

        local ctoh = #choices

        ultimate.ui.MultiComboP = vgui.Create( "ULifeTimeBase" )
        ultimate.ui.MultiComboP:SetPos( x, y - 1 )
        ultimate.ui.MultiComboP:SetSize( 243, ctoh * 22 + 2 )

        for k, v in pairs(choices) do
            ultimate.ui.dropdownButton( str, v, ultimate.ui.MultiComboP, d.preview )
        end
    end
end

function ultimate.ui.InitMT( p, postCreate )
    p.ItemPanel:Remove()

    p.ItemPanel = vgui.Create( "DPanel", p )
    p.ItemPanel:Dock( FILL )
    p.ItemPanel:DockMargin( 3, 0, 3, 3 )

    p.ItemPanel.Paint = nil

    if postCreate then postCreate( p.ItemPanel ) end
end

function ultimate.ui.MTButton( p, str, postCreate )
    surface.SetFont("DermaSmall")
    local w, h = surface.GetTextSize(str)

    local fw = w + 5

    local tx, ty = fw/2 - w/2, 18 / 2-h / 2 - 1

    local b = p:GetButtonPanel():Add("DButton")
    b:Dock(RIGHT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")

    function b:DoClick()
        p.ActiveTab = str
        ultimate.ui.InitMT( p, postCreate )
    end

    function b:Paint(width,height)
        if p.ActiveTab == str then
            surface.SetTextColor(235,235,235,255)
        else
            surface.SetTextColor(165,165,165,255)
        end

        surface.DrawRect(0,0,width,height)

        surface.SetFont("DermaSmall")
        surface.SetTextPos(tx,ty)
        surface.DrawText(str)
    end

    p.ActiveTab = str
    ultimate.ui.InitMT( p, postCreate )
end

ultimate.pty = { 5, 5, 5 }
do
    local xt = {
        [1] = 5,
        [2] = 267,
        [3] = 529
    }

    function ultimate.itemPanel( str, tbl, h )
        local p = vgui.Create( "UPanel", ultimate.scrollpanel )
        p:SetPos( xt[tbl], ultimate.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        ultimate.pty[ tbl ] = ultimate.pty[ tbl ] + h + 5

        return p
    end

    function ultimate.itemPanelB( str, tbl, h, buttonsFunc )
        local p = vgui.Create( "UButtonBarPanel", ultimate.scrollpanel )
        p:SetPos( xt[tbl], ultimate.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        if buttonsFunc then buttonsFunc( p ) end

        ultimate.pty[ tbl ] = ultimate.pty[ tbl ] + h + 5

        return p
    end

end
/*
    Drag n drop
*/

ultimate.espposes = {"Up","Down","Right","Left"}
ultimate.espelements = {"name_pos","mark_pos","usergroup_pos","health_pos","armor_pos","money_pos","weapon_pos","team_pos","simtime_pos","ping_pos","pitch_player_pos","steam_id_pos","typing_pos","flags_pos","fake_pitch_pos","target_pos"}
ultimate.lastdrag = ""
ultimate.esppans = {}

ultimate.esppansposes = {
    [1] = {
        x = 85,
        y = 25,
    },
    [2] = {
        x = 85,
        y = 225,
    },
    [3] = {
        x = 170,
        y = 125,
    },
    [4] = {
        x = 0,
        y = 125,
    },
}

for i = 1, 4 do
    ultimate.esppans[i] = {}
end

function ultimate.DoDrop( self, panels, bDoDrop, Command, x, y )
    if ( bDoDrop ) then
        local newpos = self.pos

        for i = 1, #panels do
            local v = panels[i]

            ultimate.cfg[ v:GetText() ] = newpos
            v:SetParent( self )
        end
    end
end

ultimate.spfuncs = {}

// PANEL CREATION

ultimate.frame = vgui.Create("UFrame")
ultimate.scrollpanel = vgui.Create("UScroll",ultimate.frame)

ultimate.tabs = {}

// Aimbot

ultimate.spfuncs[30] = function()
    ultimate.ui.ultimatePan:SetSize(250,80)

    checkbox( ultimate.ui.ultimatePan, "Force seed", "force_seed" )
    checkbox( ultimate.ui.ultimatePan, "Wait for seed", "wait_for_seed" )


end

ultimate.spfuncs[77777] = function()
    ultimate.ui.ultimatePan:SetSize(250,150)

    multicombo( ultimate.ui.ultimatePan, "multipoint_groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    slider( ultimate.ui.ultimatePan, "Multipoint scale min", "multipoint_scale_min", 0.5, 1, 1 )
    slider( ultimate.ui.ultimatePan, "Multipoint scale max", "multipoint_scale_max", 0.5, 1, 1 )
end

ultimate.spfuncs[77776] = function()
    ultimate.ui.ultimatePan:SetSize(250,90)

    multicombo( ultimate.ui.ultimatePan, "hitscan_groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
end

function ultimate.tabs.Aimbot()

    local p = ultimate.itemPanel("Main",1,225):GetItemPanel()

    checkbox( p, "Aimbot", "enable_aimbot", false, false, false, false, false, function( p ) binder( "aim_on_key", p ) end )
    checkbox( p, "Silent", "silent_aim" )
    checkbox( p, "pSilent", "p_silent", "Make aim completely invisible." )
    checkbox( p, "Auto fire", "auto_fire", "Automatically fires when targets can be damaged.", false, false, ultimate.spfuncs[2] )
    checkbox( p, "Auto reload", "auto_reload", "Automatically reloads weapon when clip is empty." )
    checkbox( p, "Fov limit", "fov_limit" )
    slider( p, "Aimbot FOV", "aimbot_fov", 0, 180, 0 )
    checkbox( p, "Wallz", "wallz" )

    local p = ultimate.itemPanel( "Accuracy", 1, 160 ):GetItemPanel()

    checkbox( p, "nospread", "norecoil" )
    checkbox( p, "nospread", "nospread", "Supported HL2, M9K, FAS2, CW2, SWB", false, false, ultimate.spfuncs[30] )
    checkbox( p, "Sync tickount", "adjust_tickcount" )
    checkbox( p, "Disable visuals recoil", "disable_visuals_recoil" )
    combo( p, "SWB Type", "swb_type", { "HvH", "RusEliteRP" } )

    local p = ultimate.itemPanel( "Misc", 1, 115 ):GetItemPanel()

    checkbox( p, "Auto detonator", "auto_detonator" )
    slider( p, "Detonation distance", "autod_distance", 16, 128, 0 )
    checkbox( p, "Melee Bot", "knifebot", false, false, false, ultimate.spfuncs[3] )

    local p = ultimate.itemPanel( "Target", 2, 160 ):GetItemPanel()

    combo( p, "Target selection", "target_selection", { "Distance", "FOV" } )
    multicombo( p, "ignores", { "friends", "steam friends", "teammates", "driver", "head_unhitable", "god_time", "nocliping", "nodraw", "frozen", "bots", "big velocity", "admins", "legits" } )
    slider( p, "Max targets", "max_targets", 0, 10, 0 )

    local p = ultimate.itemPanel( "Hitbox", 2, 120 ):GetItemPanel()

    combo( p, "Hitbox selection", "hitbox_selection", { "Head", "Chest", "Stomach" } )
    checkbox( p, "Hitscan", "hitscan", false, false, false, ultimate.spfuncs[77776] )
    checkbox( p, "Multipoint", "multipoint", false, false, false, ultimate.spfuncs[77777] )

    local p = ultimate.itemPanel( "Tickbase", 2, 65 ):GetItemPanel()

    checkbox( p, "Enable tickbase", "tickbase_shift", false, true, false, ultimate.spfuncs[2282], function(b) ded.EnableTickbaseShifting(b) end )
      
-- local p = ultimate.itemPanel( "Auto use panel", 2, 100):GetItemPanel()
--
--    checkbox( p, "Use weapon after spawn", "auto_gun")
--    combo( p, "Gun Selection", "gun_selection" )

    local p = ultimate.itemPanel( "HvH", 3, 205 ):GetItemPanel()

    checkbox( p, "Interpolation", "disable_interpolation", false, false, false, false, function( bval ) ded.SetInterpolation( bval ) end )
    checkbox( p, "Sequence interpolation", "disable_sequence_interpolation" )
    checkbox( p, "Extrapolation", "extrapolation" )
    checkbox( p, "Disable taunts", "taunt_disabler" )
    checkbox( p, "Bone fix", "bone_fix", false, false, false, false, function( bval ) ded.EnableBoneFix( bval ) end )
    checkbox( p, "Update Client Anim fix", "update_client_anim_fix", false, false, false, false, function( bval ) ded.EnableAnimFix( bval ) end )
    checkbox( p, "Lerptime adjust", "lerptime_adjust" )

    local p = ultimate.itemPanel( "Position adjustment", 3, 220 ):GetItemPanel()

    checkbox( p, "Backtrack", "backtrack" )
    combo( p, "Backtrack mode", "backtrack_mode", { "Last ticks", "Closest", "Scan" } )
    slider( p, "Sampling interval", "sampling_interval", 0, 200, 0 )
    slider( p, "Backtrack time", "backtrack_time", 0, 1000, 0 )
    checkbox( p, "Always backtrack", "always_backtrack" )
    checkbox( p, "Show records", "show_records" )

    local p = ultimate.itemPanel( "Resolver", 3, 110 ):GetItemPanel()

    checkbox( p, "Resolver", "resolver" )
    checkbox( p, "Pitch resolver", "pitch_resolver" )
    checkbox( p, "Taunt resolver", "taunt_resolver" )
end





ultimate.spfuncs[22] = function()
    ultimate.ui.ultimatePan:SetSize(250,240)

    slider( ultimate.ui.ultimatePan, "Lag limit","lag_limit",1,23,0 )
    slider( ultimate.ui.ultimatePan, "Random min","lag_randomisation",1,23,0 )
    slider( ultimate.ui.ultimatePan, "On peek Factor","on_peek_factor",1,30,0 )
    combo( ultimate.ui.ultimatePan, "Lag mode", "lag_mode", {"Static","Adaptive"})
    multicombo( ultimate.ui.ultimatePan, "fake_lag_options", {"Disable on ladder","Disable in attack","Randomise","On peek"} )
end

ultimate.spfuncs[36] = function()
    ultimate.ui.ultimatePan:SetSize(250,200)
    combo( ultimate.ui.ultimatePan, "Material", "antiaim_material", ultimate.chamsMaterials)
    checkbox( ultimate.ui.ultimatePan, "Fullbright", "antiaim_fullbright" )
end

ultimate.spfuncs[35] = function( p )
    local mdl = vgui.Create( "DModelPanel", p )
    mdl:SetPos(85,125)
    mdl:SetSize(85,125)
    mdl:SetModel( "models/props_vehicles/truck001a.mdl" )
    mdl:SetCamPos(Vector(0,0,148))
    mdl.LayoutEntity = function() end

    local panelCount = #ultimate.esppansposes
    for i = 1, panelCount do
        local pos = ultimate.esppansposes[i]
        local pan = vgui.Create( "UPaintedPanel", p )
        pan:SetPos(pos.x, pos.y)
        pan:SetSize(85,125)
        pan:Receiver( "SwagCock$", ultimate.DoDrop )
        pan.pos = i
        ultimate.esppans[i].panel = pan
    end

    local elementCount = #ultimate.espelements
    for i = 1, elementCount do
        local element = ultimate.espelements[i]
        local panelIdx = ultimate.cfg[element]

        if panelIdx and panelIdx <= panelCount then
            local btn = vgui.Create("UESPPButton")
            btn:SetText( element )
            btn:SetSize( 36, 24 )
            btn:Dock( TOP )
            btn:Droppable( "SwagCock$" )
            btn:SetParent( ultimate.esppans[panelIdx].panel )
        end
    end
end

ultimate.spfuncs[148888] = function(p)
    checkbox( p, "Anti-Aim", "anti_aim", false, true )
    checkbox( p, "Inverter", "inverter", false, true )
    combo( p, "Yaw base", "yaw_base" )
    combo( p, "Yaw", "yaw" )
    combo( p, "Pitch", "pitch" )
    slider( p, "Yaw base custom", "custom_yaw", -180, 180, 0 )
end

ultimate.spfuncs[14888] = function(p)
    checkbox( p, "taunt spam", "taunt_spam" )
    combo(p, "taunt", "taunt", ultimate.actCommands)
    combo(p, "act selection", "taunt_act", { "act", "act2" } )
    slider(p, "speed", "taunt_speed", 0.1, 3.0, 1 )
    checkbox( p, "alt taunt", "alt_taunt")
    combo( p, "taunt", "alt_taunt_act", ultimate.actCommands2 )
    slider( p, "speed", "alt_taunt_speed", 0.1, 10.0, 1 )
    checkbox( p, "handjob", "handjob" )
    combo( p, "handjob mode", "handjob_mode", {"Up","Parkinson","Ultra cum"} )
end

ultimate.spfuncs[1488] = function(p)

    slider( p, "Custom real","custom_real", -180, 180, 0 )
    slider( p, "Custom fake","custom_fake", -180, 180, 0 )
    slider( p, "Custom pitch","custom_pitch", -360, 360, 0 )
    slider( p, "Spin speed","spin_speed", -50, 50, 0 )
    slider( p, "Min Lby Delta","lby_min_delta", 0, 360, 0 )
    slider( p, "Break Lby Delta","lby_break_delta", 0, 360, 0 )
    slider( p, "Sin delta","sin_delta", -360, 360, 0 )
    slider( p, "Sin add","sin_add", -180, 180, 0 )
    slider( p, "Jitter delta","jitter_delta", -180, 180, 0 )
end

function ultimate.tabs.Rage()

    local function func( p )
        ultimate.ui.MTButton( p, "angles", ultimate.spfuncs[1488] )
        ultimate.ui.MTButton( p, "Anim breaker", ultimate.spfuncs[14888] )
        ultimate.ui.MTButton( p, "Anti-Aim", ultimate.spfuncs[148888] )
    end

    ultimate.itemPanelB( "Anti-Aim", 1, 400, func )





    local p = ultimate.itemPanel( "Fake lag",2,80 ):GetItemPanel()

    checkbox( p, "Fake lag", "fake_lag", false, false, false, ultimate.spfuncs[22] )
    checkbox( p, "Fake duck", "fake_duck", false, true )

    local p = ultimate.itemPanel( "Visualisation", 2,120 ):GetItemPanel()

    checkbox( p, "Fake angle chams", "anti_aim_chams", false, false, false, ultimate.spfuncs[36], false, function( p ) colorpicker( "real_chams", p ) end )
    checkbox( p, "Hitbox", "hitbox",false,false,true )
    checkbox( p, "Kill hitbox", "kill_hitbox",false,false,true )
    checkbox( p, "Hit hitbox", "hit_hitbox",false,false,true )

    local p = ultimate.itemPanel( "Tweaks", 3, 140 ):GetItemPanel()

    checkbox( p, "On shot aa", "on_shot_aa" )
    checkbox( p, "Yaw randomisation", "yaw_randomisation" )
    checkbox( p, "Freestanding", "freestanding" )
    checkbox( p, "Micromovement", "micromovement" )

    local p = ultimate.itemPanel("Auto peak",3,90):GetItemPanel()

    checkbox( p, "Auto peak", "auto_peak", false, true )
    checkbox( p, "Auto teleport back", "auto_peak_tp" )



end

ultimate.spfuncs[2282] = function()
    ultimate.ui.ultimatePan:SetSize(250,230)

    combo( ultimate.ui.ultimatePan, "Fakelag comp", "fakelag_comp", {"Disable","Compensate"} )
    checkbox( ultimate.ui.ultimatePan, "Warp on peek", "warp_on_peek" )
    checkbox( ultimate.ui.ultimatePan, "Double tap", "double_tap" )
    checkbox( ultimate.ui.ultimatePan, "Dodge projectiles", "dodge_projectiles" )
    checkbox( ultimate.ui.ultimatePan, "Auto recharge", "auto_recharge", false, true )

    slider( ultimate.ui.ultimatePan, "Shift ticks", "shift_ticks", 1, 99, 0, function( val ) ded.SetMinShift(val) end )
    slider( ultimate.ui.ultimatePan, "Charge ticks", "charge_ticks", 1, 99, 0, function( val ) ded.SetMaxShift(val) end )

end

ultimate.spfuncs[2] = function()
    ultimate.ui.ultimatePan:SetSize(250,160)

    checkbox( ultimate.ui.ultimatePan, "Rapid fire", "rapid_fire", "Allows to quickly fire semi-automatic weapons." )
    checkbox( ultimate.ui.ultimatePan, "Bullet time", "bullet_time", "Aim will not work until weapon can fire." )
    checkbox( ultimate.ui.ultimatePan, "Wait for simtime update", "wait_for_simtime_update" )
    checkbox( ultimate.ui.ultimatePan, "Hitchance", "hitchance" )
    slider( ultimate.ui.ultimatePan, "Hitchance value", "hitchance_value", 1, 100, 0 )
    checkbox( ultimate.ui.ultimatePan, "Alt Rapid fire", "alt_rapid_fire" )
end

//checkbox( ultimate.ui.ultimatePan, "Shoot delay", "shoot_delay" )
//slider( ultimate.ui.ultimatePan, "Shoot delay time", "shoot_delay_time", 0, 10, 1 )

ultimate.spfuncs[3] = function()
    ultimate.ui.ultimatePan:SetSize( 250, 68 )

    combo( ultimate.ui.ultimatePan, "Knifebot mode", "knifebot_mode"  )
    checkbox( ultimate.ui.ultimatePan, "Facestab", "facestab" )
end

ultimate.spfuncs[4] = function()
    ultimate.ui.ultimatePan:SetSize( 250, 85 )

    slider( ultimate.ui.ultimatePan, "Smooth amount", "smoothing", 0, 1, 2 )
end


ultimate.spfuncs[11] = function()
    ultimate.ui.ultimatePan:SetSize(250,280)

    checkbox( ultimate.ui.ultimatePan, "Team color", "box_team_color" )
    checkbox( ultimate.ui.ultimatePan, "Gradient", "box_gradient" )
    combo( ultimate.ui.ultimatePan, "Style", "box_style", { "Default", "Corner", "Hex", "Poly", "3D", "Flag" })
    checkbox( ultimate.ui.ultimatePan, "Fill", "box_fill" )
    slider( ultimate.ui.ultimatePan, "Alpha", "box_alpha", 0, 255, 0 )
    combo( ultimate.ui.ultimatePan, "Flag", "box_flag_style", { "Russia", "Ukraine" })


end

ultimate.spfuncs[7777] = function()
    ultimate.ui.ultimatePan:SetSize(250,66)

    checkbox( ultimate.ui.ultimatePan, "Steam Names", "steam_names" )
end


ultimate.spfuncs[999] = function()
    ultimate.ui.ultimatePan:SetSize(250,66)

    checkbox( ultimate.ui.ultimatePan, "Priority box", "priority_box" )

end

ultimate.spfuncs[12] = function()
    ultimate.ui.ultimatePan:SetSize(250,48)

    checkbox( ultimate.ui.ultimatePan, "Health bar", "health_bar" )
    checkbox( ultimate.ui.ultimatePan, "Gradient", "health_bar_gradient" )
end

ultimate.spfuncs[666] = function()
    ultimate.ui.ultimatePan:SetSize(250,48)

    checkbox( ultimate.ui.ultimatePan, "Armor bar", "armor_bar" )
    checkbox( ultimate.ui.ultimatePan, "Gradient", "armor_bar_gradient" )
end

ultimate.spfuncs[254] = function()
    ultimate.ui.ultimatePan:SetSize(250, 100)

    checkbox( ultimate.ui.ultimatePan, "Backshoot", "backshoot" )
    checkbox( ultimate.ui.ultimatePan, "Fakelag comp new", "fakelag_comp_new" )
end


ultimate.spfuncs[19] = function()
    ultimate.ui.ultimatePan:SetSize(250,256)

    combo( ultimate.ui.ultimatePan, "Material", "viewmodel_chams_type", ultimate.chamsMaterials)

    checkbox( ultimate.ui.ultimatePan, "Fullbright", "fullbright_viewmodel" )

end

ultimate.spfuncs[23333] = function()
    ultimate.ui.ultimatePan:SetSize(280,180)

    combo( ultimate.ui.ultimatePan, "Type", "crosshair_type", ultimate.crosshairTypes)
    slider( ultimate.ui.ultimatePan, "Scale", "uber_alles_scale", 1, 50, 0 )
    slider( ultimate.ui.ultimatePan, "Speed", "uber_alles_speed", 1, 500, 0 )
    label( ultimate.ui.ultimatePan, "Crosshair Color", function( p ) colorpicker( "crosshair_color", p ) end )
    label( ultimate.ui.ultimatePan, "Crosshair Outline", function( p ) colorpicker( "crosshair_outline", p ) end )
end



ultimate.spfuncs[20] = function()
    ultimate.ui.ultimatePan:SetSize(250,256)

    checkbox( ultimate.ui.ultimatePan, "Smoothing", "third_person_smoothing" )
    checkbox( ultimate.ui.ultimatePan, "Collision", "third_person_collision" )
    slider( ultimate.ui.ultimatePan, "Smoothing", "third_person_smooth_factor", 1, 10, 0 )
    slider( ultimate.ui.ultimatePan, "Distance","third_person_distance",50,220,0 )
end


ultimate.spfuncs[21] = function()
    ultimate.ui.ultimatePan:SetSize(250,256)

    slider( ultimate.ui.ultimatePan, "Freecam speed","free_camera_speed",5,100,0 )
    checkbox( ultimate.ui.ultimatePan, "Ghetto mode", "ghetto_free_cam" )
end

ultimate.spfuncs[233] = function()
    ultimate.ui.ultimatePan:SetSize(250,256)

    slider( ultimate.ui.ultimatePan, "Viewmodel X","viewmodel_x",-50,50,1 )
    slider( ultimate.ui.ultimatePan, "Viewmodel Y","viewmodel_y",-50,50,1 )
    slider( ultimate.ui.ultimatePan, "Viewmodel Z","viewmodel_z",-50,50,1 )
    slider( ultimate.ui.ultimatePan, "Viewmodel Pitch","viewmodel_pitch",-50,50,1 )
    slider( ultimate.ui.ultimatePan, "Viewmodel Yaw","viewmodel_yaw",-50,50,1 )
    slider( ultimate.ui.ultimatePan, "Viewmodel Roll","viewmodel_roll",-50,50,1 )

end

ultimate.spfuncs[4444] = function( p )

    checkbox( p, "Box", "box_esp", false, false, true, ultimate.spfuncs[11] )

    checkbox( p, "Name", "name", false, false, false, ultimate.spfuncs[7777] )
    combo( p, "Name pos", "name_pos", {"Up","Down","Right","Left"} )

    checkbox( p, "Mark", "show_priority", false, false, false, ultimate.spfuncs[999] )

    checkbox( p, "Usergroup", "usergroup" )
    combo( p, "Usergroup pos", "usergroup_pos", {"Up","Down","Right","Left"} )

    checkbox( p, "Health", "health", false, false, true, ultimate.spfuncs[12], false, function(p) colorpicker( "health_bar_gradient", p ) end )
    combo( p, "Health pos", "health_pos", {"Up","Down","Right","Left"} )

    checkbox( p, "Armor", "armor", false, false, true, ultimate.spfuncs[666], false, function(p) colorpicker( "armor_bar_gradient", p ) end )
    combo( p, "Armor pos", "armor_pos", {"Up","Down","Right","Left"} )

    checkbox( p, "Weapon", "weapon", false, false, false, ultimate.spfuncs[33] )
    combo( p, "Weapon pos", "weapon_pos", {"Up","Down","Right","Left"} )

    checkbox( p, "Team", "team" )
    combo( p, "Team pos", "team_pos", {"Up","Down","Right","Left"} )

    checkbox( p, "Money", "darkrp_money" )
    combo( p, "Money pos", "money_pos", {"Up","Down","Right","Left"} )

    checkbox( p, "Lag compensation", "break_lc" )
    combo( p, "LC indicator pos", "break_lc_pos", {"Up","Down","Right","Left"} )

    checkbox( p, "Packets ( Fake lag )", "simtime_updated" )
    combo( p, "Simulation time update", "simtime_pos", {"Up","Down","Right","Left"} )

    checkbox( p, "Skeleton", "skeleton" )

    slider( p, "Max distance","esp_distance",0,50000,0 )
end

ultimate.spfuncs[55040] = function( p )

    checkbox( p, "Typing", "typing", false, false, false, false, false, function(p) local lbl, drop = combo( p, "", "typing_pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    checkbox( p, "Pitch Player", "pitch_player", false, false, false, false, false, function(p) local lbl, drop = combo( p, "", "pitch_player_pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    checkbox( p, "Steam id", "steam_id", false, false, false, false, false, function(p) local lbl, drop = combo( p, "", "steam_id_pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    checkbox( p, "Ping", "ping", false, false, false, false, false, function(p) local lbl, drop = combo( p, "", "ping_pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    checkbox( p, "Distance", "distance", false, false, false, false, false, function(p) local lbl, drop = combo( p, "", "distance_pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    checkbox( p, "Flags", "player_flags", false, false, true, false, false, function(p) local lbl, drop = combo( p, "", "flags_pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    checkbox( p, "Fake pitch", "fake_pitch", false, false, true, false, false, function(p) local lbl, drop = combo( p, "", "fake_pitch_pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) colorpicker( "fake_pitch", p ) end )
    checkbox( p, "Target", "target", false, false, true, false, false, function(p) local lbl, drop = combo( p, "", "target_pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) colorpicker( "target", p ) end )

end


ultimate.spfuncs[33] = function()
    ultimate.ui.ultimatePan:SetSize(250,256)

    checkbox( ultimate.ui.ultimatePan, "Show ammo", "show_ammo" )
    checkbox( ultimate.ui.ultimatePan, "Print name", "weapon_printname" )
    checkbox( ultimate.ui.ultimatePan, "Show reloading", "show_reloading" )

end

function ultimate.tabs.ESP()

    local function func( p )
        ultimate.ui.MTButton( p, "Preview", ultimate.spfuncs[35] )
        ultimate.ui.MTButton( p, "Indicators", ultimate.spfuncs[55040] )
        ultimate.ui.MTButton( p, "ESP", ultimate.spfuncs[4444] )
    end

    ultimate.itemPanelB( "Player", 1, 720, func )

    local p = ultimate.itemPanel("Player models",2,250):GetItemPanel()

    checkbox( p, "Visible chams", "visible_chams", false, false, true, false, false, function(pan) colorpicker( "visible_chams_color", pan ) end )
    checkbox( p, "Weapon chams", "visible_chams_w" )
    combo( p, "Material", "visible_mat", ultimate.chamsMaterials)
    checkbox( p, "Fullbright models", "supress_lighting" )

    checkbox( p, "InVisible chams", "invisible_chams", false, false, true, false, false, function(pan) colorpicker( "invisible_chams", pan ) end )
    checkbox( p, "Weapon chams", "invisible_chams_w" )
    combo( p, "Material", "invisible_mat", ultimate.chamsMaterials)
    checkbox( p, "Fullbright models", "supress_lighting_invis" )

    local p = ultimate.itemPanel("Self",2,150):GetItemPanel()

    checkbox( p, "Self chams", "self_chams", false, false, true, false, false, function(pan) colorpicker( "self_chams_color", pan ) end )
    checkbox( p, "Weapon chams", "self_chams_w" )
    combo( p, "Material", "self_mat", ultimate.chamsMaterials)
    checkbox( p, "Fullbright models", "supress_self_lighting" )

    local p = ultimate.itemPanel("Backtrack",2,150):GetItemPanel()

    checkbox( p, "Show records", "show_records" )
    checkbox( p, "Backtrack chams", "backtrack_chams", false, false, true, false, false, function(pan) colorpicker( "backtrack_chams_color", pan ) end )
    combo( p, "Material", "backtrack_material", ultimate.chamsMaterials)
    checkbox( p, "Fullbright model", "backtrack_fullbright" )

    local p = ultimate.itemPanel("Entity",3,185):GetItemPanel()

    checkbox( p, "Box", "ent_box" )
    checkbox( p, "Class", "ent_class" )
    combo( p, "Style", "ent_box_style", { "Default", "Corner", "3D" })
    slider( p, "Max distance","ent_esp_distance",0, 20000,0 )
    label( p, "Add entity key", function( p ) binder( "ent_add", p ) end )


    local p = ultimate.itemPanel("Effects",3,125):GetItemPanel()

    checkbox( p, "Player outline", "player_outline", false, false, true )
    checkbox( p, "Entity outline", "entity_outline", false, false, true )
    combo( p, "Style", "outline_style", { "Default", "Subtractive", "Additive" } )

end

function ultimate.tabs.Visuals()

    local p = ultimate.itemPanel( "Aimbot visuals", 1, 160 ):GetItemPanel()

    checkbox( p, "FOV Circle", "show_fov", false, false, true, ultimate.spfuncs[911] )
    checkbox( p, "Snapline", "aimbot_snapline", false, false, true, ultimate.spfuncs[912] )
    checkbox( p, "Melee bot circle", "melee_circle", false, false, true)
    checkbox( p, "Marker", "aimbot_marker", false, false, true )
    combo( p, "Figure", "aimbot_marker_mode", { "Square", "Circle" } )

    local p = ultimate.itemPanel("Screen",1,80):GetItemPanel()

    checkbox( p, "Velocity Indicator", "velocity_indicator", false, false, true )
    checkbox( p, "Crosshair", "crosshair", false, false, false, ultimate.spfuncs[23333] )

    local p = ultimate.itemPanel("ultimate",1,200):GetItemPanel()

    checkbox( p, "Hide name", "hide_name" )
    textentry( "Custom name", "custom_name", p, 999 )
    checkbox( p, "Disable sensivity adjustment", "disable_sensivity_adjustment" )
    checkbox( p, "Screengrab image", "screengrab_image" )
    combo( p, "ESP Font", "esp_font", { "Outlined", "Shadow", "Thug", "Arial" } )

    local p = ultimate.itemPanel("Local Player",2,100):GetItemPanel()

    checkbox( p, "Player Line", "player_line", "Visual Line" )
    checkbox( p, "China Hat", "player_hat", "Visual Hat" )
    checkbox( p, "Land pos", "land_pos", false, false, true)

    local p = ultimate.itemPanel( "Indicators", 2, 120 ):GetItemPanel()

    checkbox( p, "On screen logs", "on_screen_logs", false, false, true, false, false, function(p) colorpicker( "miss_lagcomp", p ) colorpicker( "miss_spread", p ) colorpicker( "miss_fail", p ) end )
    checkbox( p, "Spectator list", "spectator_list" )
    checkbox( p, "Tickbase", "tickbase_indicator" )
    checkbox( p, "Indicators", "indicators" )

    local p = ultimate.itemPanel( "Hitmarker", 2, 80 ):GetItemPanel()

    checkbox( p, "Hitmarker", "hitmarker", false, false, true )
    checkbox( p, "Hitnumbers", "hitnumbers", false, false, true, false, false, function(p) colorpicker( "hitnumbers_krit", p ) end )

    local p = ultimate.itemPanel("Misc",2, 120):GetItemPanel()

    checkbox( p, "Enable kadilakandporshe databaze", "github_sync", "https://github.com/kadilakandproshe/GoidaBaza/main/Baze")
    checkbox( p, "KeyBind List", "keybind_list", false,false,true )
    checkbox( p, "Target Name", "target_name", false,false,true)



    local p = ultimate.itemPanel("View",3,180):GetItemPanel()

    checkbox( p, "Override view", "override_view" )
    checkbox( p, "Third person", "third_person", false, true, false, ultimate.spfuncs[20] )
    checkbox( p, "Free camera", "free_camera", false, true, false, ultimate.spfuncs[21] )
    slider( p, "Fov override","fov_override",75,160,0 )
    slider( p, "Aspect ratio","aspect_ratio",0,2,3,function(val) RunConsoleCommand("r_aspectratio",val) end )

    local p = ultimate.itemPanel("Viewmodel",3,155):GetItemPanel()

    checkbox( p, "Viewmodel position", "viewmodel_position", false, false, false, ultimate.spfuncs[233] )

    checkbox( p, "Viewmodel changer", "viewmodel_changer" )
    slider( p, "Fov","viewmodel_fov",50,180,0 )
    checkbox( p, "Viewmodel chams", "viewmodel_chams", false, false, true, ultimate.spfuncs[19], false )
    checkbox( p, "viewmodel disabler", "viewmodel_disabler" )
end

function ultimate.tabs.World()

    local p = ultimate.itemPanel("World",1,280):GetItemPanel()

    textentry( "Skybox texture", "custom_sky", p, 420 )
    checkbox( p, "Sky color", "sky_color", false, false, true )
    checkbox( p, "Wall color", "wall_color", false, false, true )

    checkbox( p, "Fullbright", "fullbright", false, true )

    checkbox( p, "Fog changer", "fog_changer", false, false, true )
    slider( p, "Fog start","fog_start", 1, 4200, 0 )
    slider( p, "Fog end","fog_end", 1, 9000, 0 )

    local p = ultimate.itemPanel("Effects",2,170):GetItemPanel()

    checkbox( p, "Bullet tracers", "bullet_tracers", false, false, true )
    slider( p, "Die time","tracers_die_time",1,10,0 )
    checkbox( p, "Bullet tracers muzzle", "bullet_tracers_muzzle" )
    textentry( "Material", "bullet_tracers_material", p, 420 )

end

ultimate.spfuncs[25] = function()
    ultimate.ui.ultimatePan:SetSize(250,256)

    combo( ultimate.ui.ultimatePan, "Strafe mode", "strafe_mode", {"legit", "rage", "directional"})
    checkbox( ultimate.ui.ultimatePan, "Ground strafer", "ground_strafer" )
    checkbox( ultimate.ui.ultimatePan, "Sin ( snake ) strafe", "z_hop", false, true )
end

ultimate.spfuncs[26] = function()
    ultimate.ui.ultimatePan:SetSize(250,256)

    slider( ultimate.ui.ultimatePan, "Predict ticks", "CStrafe ticks", 16, 128, 0 )
    slider( ultimate.ui.ultimatePan, "Angle step", "CStrafe angle step", 1, 10, 0 )
    slider( ultimate.ui.ultimatePan, "Angle max step", "CStrafe angle max step", 5, 50, 0 )
    slider( ultimate.ui.ultimatePan, "Ground diff", "CStrafe ground diff", 1, 65, 0 )
    combo( ultimate.ui.ultimatePan, "Circle strafe mode", "circle_strafe_mode", {"Silent", "Default"})
end

function ultimate.tabs.Misc()


    local p = ultimate.itemPanel("Movement",1,145):GetItemPanel()

    checkbox( p, "Bunny hop", "bhop" )
    checkbox( p, "Air strafer", "air_strafer", false, false, false, ultimate.spfuncs[25] )
    checkbox( p, "Circle strafe", "circle_strafe", false, true, false, ultimate.spfuncs[26] )
    checkbox( p, "Edge jump", "edge_jump" )
    checkbox( p, "Fast stop", "fast_stop" )

    local p = ultimate.itemPanel("Spam",1,105):GetItemPanel()

    checkbox( p, "Use spam", "use_spam" )
    checkbox( p, "Flashlight spam", "flashlight_spam" )
    checkbox( p, "Retry on handcuff", "retry_on_handcuff" )

    local p = ultimate.itemPanel( "Sounds", 1, 255 ):GetItemPanel()

    checkbox( p, "Hitsound", "hitsound" )
    textentry( "Sound path", "hitsound_str", p, 420 )
    checkbox( p, "Killsound", "killsound" )
    textentry( "Sound path", "killsound_str", p, 420 )
    checkbox( p, "Miss sound", "miss_sound" )
    textentry( "Sound path", "miss_sound_str", p, 420 )

    local p = ultimate.itemPanel("Chat",2,652):GetItemPanel()

    checkbox( p, "Spammer", "chat_spammer" )
    combo( p, "Mode", "chat_mode", { "Лучшие 22-23", "Спермотоксикоз", "ultimate v4", "nato", "Nazi SS", "Femboy", "ultimate", "Russian", "English", "Russian HvH", "English HvH", "English HvH 2", "skamhack" })
    combo( p, "Group", "chat_group", { "Default", "OOC", "Advert", "PM", "ULX" })
    slider( p, "Delay", "chat_delay", 0,20,0 )

    checkbox( p, "Killsay", "killsay" )
    combo( p, "Mode", "killsay_mode", { "Лучшие 22-23", "Спермотоксикоз", "ultimate v4", "nato", "Nazi SS", "Femboy", "ultimate", "Russian", "English", "Russian HvH", "English HvH", "English HvH 2", "skamhack" })
    combo( p, "Group", "killsay_group", { "Default", "OOC", "Advert", "PM", "ULX" })

    checkbox( p, "Cheat advert", "cheat_advert" )
    combo( p, "Function", "cheat_advert_function", { "Spammer", "Killsay" })
    combo( p, "Mode", "cheat_advert_mode", { "Exechack.cc", "Fatality", "Noxis", "ultimate" })
    combo( p, "Group", "cheat_advert_group", { "Default", "OOC", "Advert", "PM", "ULX" })

    checkbox( p, "Target spammer", "target_spammer" )
    combo( p, "Prefix", "target_spammer_prefix", { "!", "//", "/pm" } )
    textentry( "Steam ID", "target_spammer_steamid", p, 420 )
    textentry( "Message", "target_spammer_message", p, 420 )
    slider( p, "Delay", "target_spammer_delay", 0, 10, 0 )
    button( "Send message to the target", function()
        local cmd = ultimate.presets["target_spammer_prefix"][ultimate.cfg["target_spammer_prefix"]]
        RunConsoleCommand( "say", cmd .. " " .. ultimate.cfg["target_spammer_steamid"] .. " " .. ultimate.cfg["target_spammer_message"])
    end, p )

    local p = ultimate.itemPanel( "Net channel", 3, 320 ):GetItemPanel()

    checkbox( p, "Sequence manip", "sequence_manip", false, true )
    slider( p, "Out Sequence", "outsequence", 1, 500, 0 )
    checkbox( p, "Randomise", "sequence_min_random" )
    slider( p, "Min sequence", "sequence_min", 1, 500, 0 )
    textentry( "Name", "name_convar", p, 320 )
    button( "Change name", function() ded.NetSetConVar("name",ultimate.cfg["name_convar"]) end, p )
    checkbox( p, "Name stealer", "name_stealer" )
    textentry( "Disconnect reason", "disconnect_reason", p, 250 )
    button( "Disconnect", function() ded.NetDisconnect(ultimate.cfg["disconnect_reason"]) end, p )

    local p = ultimate.itemPanel("Misc",3,210):GetItemPanel()

    checkbox( p, "Follow Player", "ghost_follower" )
    textentry( "Steam ID", "gfid", p, 500 )
    checkbox( p, "tpoZ RusEliteRP", "tpose" )
    checkbox( p, "Animation freezer", "animation_freezer", false, true )
    checkbox( p, "Name generator", "name_generator" )
    combo( p, "Name generator mode", "name_generator_mode", { "Random", "Meme", "English", "Russian", "Arabic", "Japanese", "Chinese", "Korean", "German" } )
end

function ultimate.tabs.Players()
    if not ultimate.trackedPlayers then ultimate.trackedPlayers = {} end
    if not ultimate.cfg.friends then ultimate.cfg.friends = {} end

    if not IsValid(ultimate.scrollpanel) then return end
    ultimate.scrollpanel:Clear()

    local playerlist = player.GetAll()
    if not playerlist then return end

    for i = 1, #playerlist do
        local pEntity = playerlist[i]
        if not IsValid(pEntity) then continue end

        local pButton = vgui.Create("Panel", ultimate.scrollpanel)
        if not IsValid(pButton) then continue end

        pButton:SetTall(22)
        pButton:Dock(TOP)

        local steamId = pEntity:SteamID()
        if not steamId then continue end

        function pButton:Paint(w, h)
            if not IsValid(pEntity) then
                self:Remove()
                return
            end

            surface.SetDrawColor(ultimate.Colors[54] or Color(50, 50, 50))
            surface.DrawOutlinedRect(0, 0, w, h, 1)

            surface.SetFont("DermaSmall")

            local isTracked = ultimate.trackedPlayers and ultimate.trackedPlayers[steamId]
            local isFriend = ultimate.cfg.friends and ultimate.cfg.friends[steamId]

            if isTracked then
                surface.SetTextColor(245, 0, 0)
            elseif isFriend then
                surface.SetTextColor(0, 255, 0)
            else
                surface.SetTextColor(245, 245, 245)
            end

            surface.SetTextPos(5, 4)
            surface.DrawText(pEntity:Name() or "Unknown")

            if ultimate.GetTeam then
                local teamIndex, teamName, teamColor = ultimate.GetTeam(pEntity)
                if teamName then
                    local textWidth = surface.GetTextSize(teamName)
                    surface.SetTextColor(teamColor or Color(255, 255, 255))
                    surface.SetTextPos(w / 2 - textWidth / 2, 4)
                    surface.DrawText(teamName)
                end
            end

            if ultimate.GetUserGroup then
                local userGroup = ultimate.GetUserGroup(pEntity)
                if userGroup then
                    local textWidth = surface.GetTextSize(userGroup)
                    surface.SetTextColor(245, 245, 245)
                    surface.SetTextPos(w - textWidth - 5, 4)
                    surface.DrawText(userGroup)
                end
            end
        end

        function pButton:OnMousePressed(mouseCode)
            if not IsValid(pEntity) then
                self:Remove()
                return
            end

            if not steamId then return end

            if mouseCode == MOUSE_LEFT then
                if not ultimate.cfg.friends then ultimate.cfg.friends = {} end
                ultimate.cfg.friends[steamId] = not ultimate.cfg.friends[steamId]
                if not ultimate.cfg.friends[steamId] then
                    ultimate.cfg.friends[steamId] = nil
                end
            elseif mouseCode == MOUSE_RIGHT then
                if not ultimate.trackedPlayers then ultimate.trackedPlayers = {} end
                if ultimate.trackedPlayers[steamId] then
                    ultimate.trackedPlayers[steamId] = nil
                else
                    ultimate.trackedPlayers[steamId] = true
                end
            elseif mouseCode == MOUSE_MIDDLE then
                SetClipboardText(steamId)
            end
        end
    end
end

function ultimate.tabs.Config()
    local p = ultimate.itemPanel("Config", 1, 250):GetItemPanel()

    textentry( "Config name", "config_name", p, 32 )

    button( "Save", function()
        pcall(ultimate.SaveConfig)
    end, p )

    button( "Load", function()
        local success = pcall(ultimate.LoadConfig)
        if success then
            ultimate.initTab(ultimate.activetab)
        end
    end, p )

    button( "Create", function()
        ultimate.CreateConfig()
    end, p )

    button( "Delete", function()
        local selectedIndex = ultimate.cfg["selected_config"] or 1
        local configName = ultimate.cfgTable[selectedIndex]

        if configName and configName ~= "default" then
            file.Delete("autohook/" .. configName .. ".txt", "DATA")
            ultimate.fillConfigTable()
            ultimate.cfg["selected_config"] = 1
            ultimate.LoadConfig()
        end
    end, p )

    combo( p, "Select Config", "selected_config", ultimate.cfgTable )

end

/*
TODO:
ben laden mode
topovi aimbot
lgbt text
сербская игра
NIGGERCMD PASTE MOMENTS FOR 2028
*/



function ultimate.tabs.Settings()

    local p = ultimate.itemPanel("custom background and fun features", 1, 340):GetItemPanel()

    checkbox( p, "Custom Background", "custom_background" )
    slider( p, "Foreground Height", "foreground_height", 0, 25, 0 )
    checkbox( p, "LGBT TEXT", "rainbow_text" )
    combo( p, "set cheat text", "cheat_text" )
    combo( p, "set background image", "style", {"anime.png", "anime1.png", "anime2.png", "krik.png", "cick.png", "ripper.png", "demon.png", "chromeware_new.png", "begemotik", "zanoza", "russia", "custom", "pila.png"} )
    textentry( "background path", "custom_background_path", p, 300 )
    textentry( "custom cheat name", "custom_cheatname", p, 300 )
    checkbox( p, "НОВОСИБИРСКАЯ ИГРА", "novosibirskaya_igra", false, false, false, false, function(bval)
        if bval then
            ultimate.novosibirsk_backup = ultimate.novosibirsk_backup or {}
            ultimate.novosibirsk_backup.text = ultimate.cfg["cheat_text"]
            ultimate.novosibirsk_backup.style = ultimate.cfg["style"]

            ultimate.cfg["cheat_text"] = 4
            ultimate.cfg["style"] = 13
            ultimate.cfg["custom_background"] = true
            surface.PlaySound("pila.mp3")
        else
            if ultimate.novosibirsk_backup then
                ultimate.cfg["cheat_text"] = ultimate.novosibirsk_backup.text
                ultimate.cfg["style"] = ultimate.novosibirsk_backup.style
                ultimate.cfg["custom_background"] = false
                ultimate.novosibirsk_backup = nil
            end
            RunConsoleCommand("stopsound")
        end
    end)

    checkbox( p, "МЕЛЛСТРОЙ MODE", "mellstroy.game", false, false, false, false, function(bval)
        if bval then
            surface.PlaySound("mellstroy_44k.mp3")
        else
            RunConsoleCommand("stopsound")
        end
    end)

    local p = ultimate.itemPanel("Network", 2, 280):GetItemPanel()

    textentry( "Custom Command", "custom_command", p, 300 )
    button( "Execute Command", function()
        if ultimate.cfg["custom_command"] and ultimate.cfg["custom_command"] ~= "" then
            LocalPlayer():ConCommand(ultimate.cfg["custom_command"])
        end
    end, p )

    button( "net_graph 4", function()
        LocalPlayer():ConCommand("net_graph 4")
    end, p )

    button( "net_graph 0", function()
        LocalPlayer():ConCommand("net_graph 0")
    end, p )

    button( "cl_showpos 1", function()
        LocalPlayer():ConCommand("cl_showpos 1")
    end, p )

    button( "cl_showpos 0", function()
        LocalPlayer():ConCommand("cl_showpos 0")
    end, p )

    button( "Disconnect Now", function()
        local reasonIdx = ultimate.cfg["custom_disconnect_reason"] or 1
        local reason = ultimate.presets["custom_disconnect_reason"][reasonIdx] or "Disconnect by user."
        pcall(ded.NetDisconnect, reason)
    end, p )

    combo( p, "Disconnect Reason", "custom_disconnect_reason" )

    local p = ultimate.itemPanel("Watermark", 3, 150):GetItemPanel()

    checkbox( p, "Watermark", "watermark_xxx" )
    combo( p, "Watermark style", "watermark_xxx_style", {"default", "chit po kontrakty"} )
    textentry( "Watermark text", "watermark_text", p, 320 )

end




ultimate.ttable = {}

ultimate.ttable["Aimbot"]   = ultimate.tabs.Aimbot
ultimate.ttable["Rage"]      = ultimate.tabs.Rage
ultimate.ttable["ESP"]       = ultimate.tabs.ESP
ultimate.ttable["Visuals"]  = ultimate.tabs.Visuals
ultimate.ttable["World"]      = ultimate.tabs.World
ultimate.ttable["Misc"]     = ultimate.tabs.Misc
ultimate.ttable["Players"]  = ultimate.tabs.Players
ultimate.ttable["Config"]   = ultimate.tabs.Config
ultimate.ttable["Settings"] = ultimate.tabs.Settings

function ultimate.initTab(tab)
    if ultimate.scrollpanel != nil then ultimate.scrollpanel:Remove() end

    ultimate.scrollpanel = vgui.Create("UScroll",ultimate.frame)

    -- Start columns lower so content doesn't sit too close to the top ribbon
    ultimate.pty = { 36, 36, 36 }
    // ultimate.ESPPP:Hide()
    ultimate.ttable[tostring(tab)]()
end

function ultimate.tabButton(tab,par) 
    surface.SetFont("DermaSmall")
    local w, h = surface.GetTextSize(tab)

    local fw = w + 35

    local tx, ty = fw/2 - w/2, 25/2-h/2 - 1

    local b = par:Add("DButton")
    b:Dock(LEFT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")
    
    function b:DoClick()
        ultimate.activetab = tab
        ultimate.initTab(tab)
    end

    function b:Paint(width,height)
        if ultimate.activetab == tab or self:OnDepressed() then
            surface.SetDrawColor(ultimate.Colors[54])
            surface.SetTextColor(180,0,0)
        elseif self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[40])
            surface.SetTextColor(225,225,225,255)
        else
            surface.SetDrawColor(ultimate.Colors[30])
            surface.SetTextColor(200,200,200,255)
        end
        
        surface.DrawRect(0,0,width,height)

        surface.SetFont("DermaSmall")
        surface.SetTextPos(tx,ty)
        surface.DrawText(tab)
    end
end

-- List of main tabs for reuse in HUD (User info) and elsewhere
ultimate.tabNames = { "Aimbot", "Rage", "ESP", "Visuals", "World", "Misc", "Players", "Config", "Settings" }

-- Initialize default tab since top buttons are removed
ultimate.initTab( ultimate.activetab )

function ultimate.tabButton(tab,par)
    surface.SetFont("tbfont")
    local w, h = surface.GetTextSize(tab)

    local fw = w + 54

    local tx, ty = fw/2 - w/2, 25/2-h/2 - 1

    local b = par:Add("DButton")
    b:Dock(LEFT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")

    function b:DoClick()
        ultimate.activetab = tab
        ultimate.initTab(tab)
    end

    function b:Paint(width,height)
        if ultimate.activetab == tab or self:OnDepressed() then
            surface.SetDrawColor(ultimate.Colors[54])
            surface.SetTextColor(Color(245, 245, 245))
        elseif self:IsHovered() then
            surface.SetDrawColor(ultimate.Colors[40])
            surface.SetTextColor(Color(225, 225, 225))
        else
            surface.SetDrawColor(ultimate.Colors[30])
            surface.SetTextColor(Color(200, 200, 200))
        end

        surface.DrawRect(0,0,width,height)

        surface.SetFont("tbfont")
        surface.SetTextPos(tx,ty)
        surface.DrawText(tab)
    end
end

ultimate.tabButton( "Aimbot",        ultimate.frame:GetTopPanel() )
ultimate.tabButton( "Rage",       ultimate.frame:GetTopPanel() )
ultimate.tabButton( "ESP",       ultimate.frame:GetTopPanel() )
ultimate.tabButton( "Visuals",       ultimate.frame:GetTopPanel() )
ultimate.tabButton( "World",          ultimate.frame:GetTopPanel() )
ultimate.tabButton( "Misc",          ultimate.frame:GetTopPanel() )
ultimate.tabButton( "Players",       ultimate.frame:GetTopPanel() )
ultimate.tabButton( "Config",       ultimate.frame:GetTopPanel() )
ultimate.tabButton( "Settings",     ultimate.frame:GetTopPanel() )


ultimate.activetab = "Aimbot"
ultimate.initTab("Aimbot")

// Input

function ultimate.IsKeyDown( key )
    if not key then return false end
    if key >= 107 then
        return input.IsMouseDown( key )
    end

    return input.IsKeyDown( key )
end
/*
    Create Move start
*/

// cm stuff

ultimate.target             = false
ultimate.aimingrn           = false

ultimate.targetVector       = Vector()
ultimate.predictedVector    = Vector()
ultimate.backtrackVector    = Vector()
ultimate.nullVec            = Vector() * -1

ultimate.predCache          = {}
ultimate.velHistory         = {}
ultimate.accelData          = {}
ultimate.movePatterns       = {}
ultimate.hitStats           = {}
ultimate.adaptFactors       = {}

ultimate.SilentAngle        = me:EyeAngles()

ultimate.SkipCommand        = false
ultimate.SendPacket         = true

ultimate.traceStruct        = { mask = MASK_SHOT, filter = me }
ultimate.badSweps           = { ["gmod_camera"] = true, ["manhack_welder"] = true, ["weapon_medkit"] = true, ["gmod_tool"] = true, ["weapon_physgun"] = true, ["weapon_physcannon"] = true, ["weapon_bugbait"] = true, }
ultimate.badSeqs            = { [ACT_VM_RELOAD] = true, [ACT_VM_RELOAD_SILENCED] = true, [ACT_VM_RELOAD_DEPLOYED] = true, [ACT_VM_RELOAD_IDLE] = true, [ACT_VM_RELOAD_EMPTY] = true, [ACT_VM_RELOADEMPTY] = true, [ACT_VM_RELOAD_M203] = true, [ACT_VM_RELOAD_INSERT] = true, [ACT_VM_RELOAD_INSERT_PULL] = true, [ACT_VM_RELOAD_END] = true, [ACT_VM_RELOAD_END_EMPTY] = true, [ACT_VM_RELOAD_INSERT_EMPTY] = true, [ACT_VM_RELOAD2] = true }
ultimate.cones              = {}
ultimate.parsedbones        = {}

ultimate.swbNormal          = bit.bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
ultimate.swbWall            = bit.bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
ultimate.swbPen             = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
ultimate.swbShit            = { ["swb_knife"] = true, ["swb_knife_m"] = true }

ultimate.m9kPenetration     = { ["SniperPenetratedRound"] = 20, ["pistol"] = 9, ["357"] = 12, ["smg1"] = 14, ["ar2"] = 16, ["buckshot"] = 5, ["slam"] = 5, ["AirboatGun"] = 17, }
ultimate.m9kMaxRicochet     = { ["SniperPenetratedRound"] = 10, ["pistol"] = 2, ["357"] = 5, ["smg1"] = 4, ["ar2"] = 5, ["buckshot"] = 0, ["slam"] = 0, ["AirboatGun"] = 9, }
ultimate.m9kCanRicochet     = { ["SniperPenetratedRound"] = true, ["pistol"] = true, ["buckshot"] = true, ["slam"] = true }
ultimate.m9kPenMaterial     = { [MAT_GLASS] = true, [MAT_PLASTIC] = true, [MAT_WOOD] = true, [MAT_FLESH] = true, [MAT_ALIENFLESH] = true }

ultimate.activeWeapon       = false
ultimate.activeWeaponClass  = false
ultimate.moveType           = me:GetMoveType()

ultimate.myaw               = GetConVar("m_yaw"):GetFloat()

ultimate.backtracktick      = 0

function ultimate.AutoWall( dir, plyTarget )
	if not ultimate.activeWeapon or ultimate.swbShit[ ultimate.activeWeaponClass ] then return false end

	local eyePos = pLocalPlayer:EyePos()
	local ignoreHeadOnly = ultimate.cfg["ignores_head_unhitable"]

	local function IsTargetHit( tr )
		if ignoreHeadOnly then
			return tr.Entity == plyTarget and tr.HitGroup == 1
		else
			return tr.Entity == plyTarget
		end
	end

	local function DoTrace( startPos, endPos, mask )
		ultimate.traceStruct.start = startPos
		ultimate.traceStruct.endpos = endPos
		ultimate.traceStruct.filter = pLocalPlayer
		ultimate.traceStruct.mask = mask
		return util.TraceLine( ultimate.traceStruct )
	end

	local function SWBAutowall()
		local tr = DoTrace( eyePos, eyePos + dir * ultimate.activeWeapon.PenetrativeRange, ultimate.swbNormal )

		if not tr.Hit or tr.HitSky then return false end

		local dot = -dir:Dot( tr.HitNormal )
		if not ultimate.activeWeapon.CanPenetrate or dot <= 0.26 then return false end

		local penDepth = ultimate.activeWeapon.PenStr * ( ultimate.swbPen[tr.MatType] or 1 ) * ultimate.activeWeapon.PenMod

		tr = DoTrace( tr.HitPos, tr.HitPos + dir * penDepth, ultimate.swbWall )

		tr = DoTrace( tr.HitPos, tr.HitPos + dir * 0.1, ultimate.swbNormal )
		if tr.Hit then return false end

		tr = DoTrace( tr.HitPos, tr.HitPos + dir * 32768, MASK_SHOT )
		return IsTargetHit( tr )
	end

	local function M9KAutowall()
		local penetrate_cvar = GetConVar( "M9KDisablePenetration" )
		if IsValid( penetrate_cvar ) and penetrate_cvar:GetBool() then
			return false
		end

		if not ultimate.activeWeapon.Penetration then
			return false
		end

		local function GetDamageMultiplier( matType, ammoType )
			if ammoType == "SniperPenetratedRound" then
				return 1
			elseif matType == MAT_CONCRETE or matType == MAT_METAL then
				return 0.3
			elseif matType == MAT_WOOD or matType == MAT_PLASTIC or matType == MAT_GLASS then
				return 0.8
			elseif matType == MAT_FLESH or matType == MAT_ALIENFLESH then
				return 0.9
			end
			return 0.5
		end

		local function BulletPenetrate( tr, bounceNum, damage )
			if damage < 1 or tr.Fraction <= 0 then
				return false
			end

			local ammoType = ultimate.activeWeapon.Primary.Ammo
			local maxPenetration = ultimate.m9kPenetration[ ammoType ] or 14
			local maxRicochet = ultimate.m9kMaxRicochet[ ammoType ] or 0
			local canRicochet = ultimate.m9kCanRicochet[ ammoType ] or false

			if tr.MatType == MAT_METAL and canRicochet and ammoType != "SniperPenetratedRound" then
				return false
			end

			if bounceNum > maxRicochet then
				return false
			end

			local penDepth = maxPenetration
			if ultimate.m9kPenMaterial[ tr.MatType ] then
				penDepth = maxPenetration * 2
			end
			local penetrationDir = tr.Normal * penDepth

			local trace = DoTrace( tr.HitPos + penetrationDir, tr.HitPos, MASK_SHOT )

			if trace.StartSolid or trace.Fraction >= 1 then
				return false
			end

			local penTrace = DoTrace( trace.HitPos, trace.HitPos + tr.Normal * 32768, MASK_SHOT )

			if IsTargetHit( penTrace ) then
				return true
			end

			local damageMulti = GetDamageMultiplier( tr.MatType, ammoType )

			local newBounceNum = bounceNum + 1
			if penTrace.MatType == MAT_GLASS then
				newBounceNum = bounceNum
			end

			return BulletPenetrate( penTrace, newBounceNum, damage * damageMulti )
		end

		local trace = DoTrace( eyePos, eyePos + dir * 32768, MASK_SHOT )
		return BulletPenetrate( trace, 0, ultimate.activeWeapon.Primary.Damage )
	end

	local weaponClass = ultimate.activeWeaponClass

	if string.StartsWith( weaponClass, "m9k_" ) or string.StartsWith( weaponClass, "bender_" ) then
		return M9KAutowall()
	elseif string.StartsWith( weaponClass, "swb_" ) then
		return SWBAutowall()
	end

	return false
end
function ultimate.VisibleCheck( who, where, predticks, awalldir )
    local start = me:EyePos()

    if predticks then start = start + ( me:GetVelocity() * TickInterval ) * predticks end

    ultimate.traceStruct.start = start
	ultimate.traceStruct.endpos = where
	ultimate.traceStruct.mask = MASK_SHOT
    ultimate.traceStruct.filter = me

    local tr = util.TraceLine( ultimate.traceStruct )

    local canhit = tr.Entity == who or tr.Fraction == 1

    if !canhit and awalldir and ultimate.cfg["wallz"] then
        return ultimate.AutoWall( awalldir, who )
    end

    if ultimate.cfg["ignores-head_unhitable"] and tr.HitGroup != 1 then return false end

    return canhit
end

function ultimate.CanShoot( cmd )
	if not ultimate.activeWeapon then return false end
	local seq = ultimate.activeWeapon:GetSequence()

    if ultimate.binds["aim_on_key"] ~= 0 and not ultimate.IsKeyDown( ultimate.binds["aim_on_key"] ) then
        return false
    end

	if ultimate.badSweps[ ultimate.activeWeaponClass ] then
		return false
	end

    if ultimate.moveType == MOVETYPE_NOCLIP then
        return false
    end

    if ultimate.cfg["auto_fire"] and cmd:KeyDown(IN_ATTACK) then
        return false
    end

	if ultimate.cfg["bullet_time"] and ultimate.activeWeapon:GetNextPrimaryFire() >= ded.GetServerTime(cmd) then
		return false
	end

    // print(ded.GetRandomSeed( cmd ))

    if ultimate.cfg["wait_for_seed"] then
        if ded.GetRandomSeed(cmd) ~= 134 then
            return false
        end
    end

	return ultimate.activeWeapon:Clip1() != 0 and !ultimate.badSeqs[ seq ]
end

function ultimate.Spread( cmd, ang, spread )
	if not ultimate.activeWeapon or not ultimate.cones[ ultimate.activeWeaponClass ] then return ang end

	local dir = ded.PredictSpread( cmd, ang, spread )

	local newangle = ang + dir:Angle()
	newangle:Normalize()

	return newangle
end

/*
    Nospread
*/

ultimate.CustomSpread = {}

function ultimate.CustomSpread.swb( cmd, ang )
    local spreadType = ultimate.cfg["swb_type"] or 1

    if spreadType == 1 then
        local vel = me:GetVelocity():Length()
        local dir = ang:Forward()

        if ultimate.activeWeapon.dt and ultimate.activeWeapon.AimSpread and ultimate.activeWeapon.dt.State == SWB_AIMING then
            ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.AimSpread

            if ultimate.activeWeapon.Owner.Expertise then
                ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.BaseCone * ( 1 - ultimate.activeWeapon.Owner.Expertise["steadyme"].val * 0.0015 )
            end
        else
            ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.HipSpread

            if ultimate.activeWeapon.Owner.Expertise then
                ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.BaseCone * ( 1 - ultimate.activeWeapon.Owner.Expertise["wepprof"].val * 0.0015 )
            end
        end

        if me:Crouching() then
            ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.BaseCone * ( ultimate.activeWeapon.dt.State == SWB_AIMING and 0.9 or 0.75 )
        end

        local updatetime = ultimate.activeWeapon.GetSpreadUpdateTime(unpredicted)
        local value = ultimate.activeWeapon.GetSpreadUpdateValue(unpredicted)

        if updatetime > 0 then
            value = math.Clamp(value - 0.1333 * (CurTime() - updatetime), 0, ultimate.activeWeapon.MaxSpreadInc)
        end

        local value2 = math.Clamp(ultimate.activeWeapon.GetViewAffinity(unpredicted) - (ultimate.activeWeapon.ShotgunReload and 0.13 or 0.18) * (CurTime() - ultimate.activeWeapon.GetViewAffinityTime()) / ultimate.activeWeapon.FireDelay, 0, 2)

        ultimate.activeWeapon.CurCone = math.Clamp( ultimate.activeWeapon.BaseCone + value + ( vel / 10000 * ultimate.activeWeapon.VelocitySensitivity ) * ( ultimate.activeWeapon.dt.State == SWB_AIMING and ultimate.activeWeapon.meMobilitySpreadMod or 1 ) + value2, 0, 0.09 + ultimate.activeWeapon.MaxSpreadInc )

        math.randomseed( cmd:CommandNumber() )

        local cone = ultimate.activeWeapon.CurCone
        if not cone then return ang end

        local dir1 = Angle( math.Rand( -cone, cone ), math.Rand( -cone, cone ), 0 ) * 25
        local dir2 = dir1

        if ultimate.activeWeapon.ClumpSpread and ultimate.activeWeapon.ClumpSpread > 0 then
            dir2 = dir1 + Angle( math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * ultimate.activeWeapon.ClumpSpread
        end

        return ang - dir2

    elseif spreadType == 2 then
        local vel = me:GetVelocity():Length()
        local dir = ang:Forward()

        if !me.LastView then
            me.LastView = dir
            me.ViewAff = 0
        else
            me.ViewAff = Lerp( 0.25, me.ViewAff, ( dir - me.LastView ):Length() * 0.5 )
        end

        if ultimate.activeWeapon.dt and ultimate.activeWeapon.meSpread and ultimate.activeWeapon.dt.State == swb_AIMING then
            ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.meSpread

            if ultimate.activeWeapon.Owner and ultimate.activeWeapon.Owner.Expertise then
                ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.BaseCone * ( 1 - ultimate.activeWeapon.Owner.Expertise["steadyme"].val * 0.0015 )
            end
        else
            ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.HipSpread

            if ultimate.activeWeapon.Owner and ultimate.activeWeapon.Owner.Expertise then
                ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.BaseCone * ( 1 - ultimate.activeWeapon.Owner.Expertise["wepprof"].val * 0.0015 )
            end
        end

        if me:Crouching() then
            ultimate.activeWeapon.BaseCone = ultimate.activeWeapon.BaseCone * ( ultimate.activeWeapon.dt.State == swb_AIMING and 0.9 or 0.75 )
        end

        ultimate.activeWeapon.CurCone = math.Clamp( ultimate.activeWeapon.BaseCone + ultimate.activeWeapon.AddSpread + ( vel / 10000 * ultimate.activeWeapon.VelocitySensitivity ) * ( ultimate.activeWeapon.dt.State == swb_AIMING and ultimate.activeWeapon.meMobilitySpreadMod or 1 ) + me.ViewAff, 0, 0.09 + ultimate.activeWeapon.MaxSpreadInc )

        if CurTime() > ultimate.activeWeapon.SpreadWait then
            ultimate.activeWeapon.AddSpread = math.Clamp( ultimate.activeWeapon.AddSpread - 0.005 * ultimate.activeWeapon.AddSpreadSpeed, 0, ultimate.activeWeapon.MaxSpreadInc )
            ultimate.activeWeapon.AddSpreadSpeed = math.Clamp( ultimate.activeWeapon.AddSpreadSpeed + 0.05, 0, 1 )
        end


        local cone = ultimate.activeWeapon.CurCone
        if !cone then return ang end

        if me:Crouching() then
            cone = cone * 0.85
        end

        math.randomseed( cmd:CommandNumber() )
        return ang - Angle( math.Rand(-cone, cone), math.Rand(-cone, cone), 0 ) * 25
    end

    return ang
end


function ultimate.CustomSpread.cw( cmd, ang )
    local weapon_entity = ultimate.activeWeapon

    local cone = weapon_entity.CurCone

    if (not cone) then
        return ang
    end

    math.randomseed(cmd:CommandNumber())

    return ang - Angle(math.Rand(-cone, cone), math.Rand(-cone, cone), 0) * 25
end


function ultimate.CustomSpread.fas2( cmd, ang )
    local weapon_entity = ultimate.activeWeapon

    local cone = weapon_entity.CurCone

    if (not cone) then
        return ang
    end

    math.randomseed(CurTime())

    local spread = Angle(math.Rand(-cone, cone), math.Rand(-cone, cone), 0) * 25

    local clump_spread = weapon_entity.ClumpSpread

    if (clump_spread and clump_spread > 0) then
        spread = spread + Vector(math.Rand(-1, 1), math.Rand(-1, 1), math.Rand(-1, 1)) * clump_spread
    end

    return ang - spread
end

function ultimate.CustomSpread.tfa(cmd, ang)
    local activeWeapon = ultimate.activeWeapon
    if not activeWeapon then return ang end

    local cone = activeWeapon.GetCone and activeWeapon:GetCone() or activeWeapon.CurCone or 0
    if cone <= 0 then return ang end

    math.randomseed(activeWeapon.Cone.Seed + activeWeapon:Clip1() + activeWeapon:Ammo1())

    local spread = math.Clamp(math.Rand(-cone, cone) * 0.1, -cone, cone)

    return ang - Angle(spread, -spread, 0)
end

ultimate.SpreadComps = {}

ultimate.SpreadComps["swb"]     = ultimate.CustomSpread.swb
ultimate.SpreadComps["cw"]      = ultimate.CustomSpread.cw
ultimate.SpreadComps["fas2"]    = ultimate.CustomSpread.fas2
ultimate.SpreadComps["tfa"]     = ultimate.CustomSpread.tfa

function ultimate.NoSpread(cmd, ang)
    if not ultimate.activeWeapon or ultimate.swbShit[ ultimate.activeWeaponClass ] then return ang end
    local base = string.Split( ultimate.activeWeaponClass, "_" )[ 1 ]

    if ultimate.SpreadComps[ base ] then
        ang = ultimate.SpreadComps[ base ]( cmd, ang )
    elseif ultimate.cones[ ultimate.activeWeaponClass ] then
        local spread = ultimate.cones[ ultimate.activeWeaponClass ]
        return ultimate.Spread( cmd, ang, spread )
    end

    return ang
end

function ultimate.NoRecoil( ang )
	if string.StartsWith( ultimate.activeWeaponClass,"m9k_" ) or string.StartsWith( ultimate.activeWeaponClass,"bb_" ) or string.StartsWith( ultimate.activeWeaponClass,"unclen8_" ) then
		return ang
	else
	    ang = ang - me:GetViewPunchAngles()
    end

	return ang
end

function ultimate.ParseBones( ply, bone )
    local mdl = ply:GetModel()

    if ultimate.parsedbones[ mdl ] and ultimate.parsedbones[ mdl ][ bone ] then
        return ultimate.parsedbones[ mdl ][ bone ]
    end

    if not ultimate.parsedbones[ mdl ] then
        ultimate.parsedbones[ mdl ] = {}
    end

    local set = ply:GetHitboxSet()
    local bonecount = ply:GetBoneCount()

    for i = 0, bonecount - 1 do
		local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

		if bone == group then
			ultimate.parsedbones[ mdl ][ bone ] = i

            return i
        end
	end

    for i = 0, bonecount - 1 do
        local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

        if bone > 1 and group == 0 then
            ultimate.parsedbones[ mdl ][ bone ] = i

            return i
        end
    end

    return 0
end

function ultimate.MultipointGroupCheck( group )
    if group == 1 and not ultimate.cfg["multipoint_groups_head"] then return false end
    if group == 2 and not ultimate.cfg["multipoint_groups_chest"] then return false end
    if group == 3 and not ultimate.cfg["multipoint_groups_stomach"] then return false end
    if group == 4 or group == 5 and not ultimate.cfg["multipoint_groups_arms"] then return false end
    if group == 6 or group == 7 and not ultimate.cfg["multipoint_groups_legs"] then return false end
    if group == 0 and not ultimate.cfg["multipoint_groups_generic"] then return false end

    return true
end

function ultimate.GetBones( ply )
    local scaleMin = ultimate.cfg["multipoint_scale_min"] or 0.5
    local scaleMax = ultimate.cfg["multipoint_scale_max"] or 0.9
    local pos = ply:LocalToWorld( ply:OBBCenter() )
    local set = ply:GetHitboxSet()

    if ultimate.cfg["hitscan"] then
        local set = ply:GetHitboxSet()
        local bonecount = ply:GetBoneCount()

        pos = {}

        for i = 0, bonecount - 1 do
            local group = ply:GetHitBoxHitGroup( i, set )

            if group == nil then continue end

            if group == 1 and not ultimate.cfg["hitscan_groups_head"] then continue end
            if group == 2 and not ultimate.cfg["hitscan_groups_chest"] then continue end
            if group == 3 and not ultimate.cfg["hitscan_groups_stomach"] then continue end
            if group == 4 or group == 5 and not ultimate.cfg["hitscan_groups_arms"] then continue end
            if group == 6 or group == 7 and not ultimate.cfg["hitscan_groups_legs"] then continue end
            if group == 0 and not ultimate.cfg["hitscan_groups_generic"] then continue end

            pos[ #pos + 1 ] = { bone = i, hitgroup = group }
        end

        if not pos or not istable( pos ) then return end

        local valid = {}

        for i = 1, #pos do
            local bone = pos[ i ].bone
            local hitboxbone = ply:GetHitBoxBone( bone, set )

            if hitboxbone == nil then
                continue
            end

            local mins, maxs = ply:GetHitBoxBounds( bone, set )

            if not mins or not maxs then
                continue
            end

            local bonepos, ang = ply:GetBonePosition( hitboxbone )

            if ultimate.cfg["multipoint"] and ultimate.MultipointGroupCheck( pos[ i ].hitgroup ) then
                local points = {
                    ( ( mins + maxs ) * 0.5 ),
                    Vector( mins.x, mins.y, mins.z ),
                    Vector( mins.x, maxs.y, mins.z ),
                    Vector( maxs.x, maxs.y, mins.z ),
                    Vector( maxs.x, mins.y, mins.z ),
                    Vector( maxs.x, maxs.y, maxs.z ),
                    Vector( mins.x, maxs.y, maxs.z ),
                    Vector( mins.x, mins.y, maxs.z ),
                    Vector( maxs.x, mins.y, maxs.z )
                }

                local center = points[1]
                local sortedPoints = {}
                for i = 2, #points do
                    points[i]:Rotate(ang)
                    points[i] = points[i] + bonepos
                    local dist = points[i]:DistToSqr(center + bonepos)
                    sortedPoints[#sortedPoints + 1] = {point = points[i], dist = dist}
                end
                table.sort(sortedPoints, function(a, b) return a.dist < b.dist end)

                center:Rotate(ang)
                center = center + bonepos
                valid[#valid + 1] = center

                for i = 1, #sortedPoints do
                    local t = i / #sortedPoints
                    local interpScale = scaleMin + (scaleMax - scaleMin) * t
                    local scaledPoint = ((sortedPoints[i].point - center) * interpScale) + center
                    valid[#valid + 1] = scaledPoint
                end
            end

            mins:Rotate( ang )
            maxs:Rotate( ang )

            valid[ #valid + 1 ] = bonepos + ( ( mins + maxs ) * 0.5 )
        end

        return valid
    else
        local bone = ultimate.ParseBones( ply, ultimate.cfg["hitbox_selection"] )

        local hitboxbone = ply:GetHitBoxBone( bone, set )

        if hitboxbone == nil then
            return { pos }
        end

        local mins, maxs = ply:GetHitBoxBounds( bone, set )

        if not mins or not maxs then
            return { pos }
        end

        local bonepos, ang = ply:GetBonePosition( hitboxbone )

        if ultimate.cfg["multipoint"] then
            local points = {
                ( ( mins + maxs ) * 0.5 ),
                Vector( mins.x, mins.y, mins.z ),
                Vector( mins.x, maxs.y, mins.z ),
                Vector( maxs.x, maxs.y, mins.z ),
                Vector( maxs.x, mins.y, mins.z ),
                Vector( maxs.x, maxs.y, maxs.z ),
                Vector( mins.x, maxs.y, maxs.z ),
                Vector( mins.x, mins.y, maxs.z ),
                Vector( maxs.x, mins.y, maxs.z )
            }

            local center = points[1]
            local sortedPoints = {}
            for i = 2, #points do
                points[i]:Rotate(ang)
                points[i] = points[i] + bonepos
                local dist = points[i]:DistToSqr(center + bonepos)
                sortedPoints[#sortedPoints + 1] = {point = points[i], dist = dist}
            end
            table.sort(sortedPoints, function(a, b) return a.dist < b.dist end)

            center:Rotate(ang)
            center = center + bonepos

            local result = {center}
            for i = 1, #sortedPoints do
                local t = i / #sortedPoints
                local interpScale = scaleMin + (scaleMax - scaleMin) * t
                local scaledPoint = ((sortedPoints[i].point - center) * interpScale) + center
                result[#result + 1] = scaledPoint
            end

            return result
        else
            mins:Rotate( ang )
            maxs:Rotate( ang )

            pos = bonepos + ( ( mins + maxs ) * 0.5 )
        end
    end

    return { pos }
end

function ultimate.GetSortedPlayers(mode, selfpred, plypred, vischeck)
    local players   = player.GetAll()
    local eyepos    = pLocalPlayer:EyePos()
    local valid     = {}
    local priority  = {}

	if selfpred then
		eyepos = eyepos + (pLocalPlayer:GetVelocity() * flTickInterval) * selfpred
	end

    local iTeamLocal = ultimate.GetTeam( pLocalPlayer )

    for i = 1, #players do
        local v = players[i]

        if v == pLocalPlayer then
            continue
        end

        if not v:Alive() or v:IsDormant() then
            continue
        end

        if ultimate.cfg["ignores-bots"] and v:IsBot() then continue end
        if ultimate.cfg["ignores-friends"] and ultimate.cfg.friends[v:SteamID()] then continue end
        if ultimate.cfg["ignores-steam_friends"] and v:GetFriendStatus() == "friend" then continue end
        if ultimate.cfg["ignores-admins"] and v:IsAdmin() then continue end
        if ultimate.cfg["ignores-frozen"] and v:IsFlagSet(FL_FROZEN) then continue end
        if ultimate.cfg["ignores-nodraw"] and v:IsEffectActive(EF_NODRAW) then continue end
        if ultimate.cfg["ignores-god_time"] and (type(v.HasGodMode) == "function" and v:HasGodMode()) then continue end
        if ultimate.cfg["ignores-driver"] and v:InVehicle() then continue end
        if ultimate.cfg["ignores-big velocity"] and v:GetVelocity():Length() > 2000 then continue end
        local iTeamEnemy = ultimate.GetTeam(v)
        local st = v:Team()
        if st == TEAM_SPECTATOR or (ultimate.cfg["ignores-teammates"] and iTeamLocal == iTeamEnemy) then continue end
        if ultimate.cfg["ignores-nocliping"] and v:GetMoveType() == MOVETYPE_NOCLIP then continue end

        if vischeck then
            local bone = ultimate.GetBones(v)[1]
            if bone then
                local dir = bone - pLocalPlayer:GetShootPos()
                dir:Normalize()

                if not ultimate.VisibleCheck(v, bone, selfpred, dir, cmd) then
                    continue
                end
            end
        end

        local pos = v:GetPos()
        if plypred then
            pos = pos + (v:GetVelocity() * flTickInterval) * plypred
        end

        local entry = { v, pos }
        local steamId = v:SteamID()

        if ultimate.cfg.priority and ultimate.cfg.priority[steamId] then
            table.insert(priority, entry)
        elseif ultimate.cfg["ignores-legits"] and ultimate.trackedPlayers and ultimate.trackedPlayers[steamId] then
            table.insert(priority, entry)
        else
            table.insert(valid, entry)
        end
    end

    local function sortTargets(tbl)
        if mode == 1 then
            table.sort(tbl, ultimate.SortByDistance)
        elseif mode == 2 then
            table.sort(tbl, function(a, b)
                local aScr, bScr = a[2]:ToScreen(), b[2]:ToScreen()
                local aDist = ((screenWidth * 0.5) - aScr.x)^2 + ((screenHeight * 0.5) - aScr.y)^2
                local bDist = ((screenWidth * 0.5) - bScr.x)^2 + ((screenHeight * 0.5) - bScr.y)^2
                return aDist < bDist
            end)
        end
    end

    sortTargets(priority)
    sortTargets(valid)

    if ultimate.cfg["ignores-legits"] then
        if #priority > 0 then
            ultimate.target = priority[1][1]
            return priority
        else
            return nil
        end
    else
        for i = 1, #valid do
            priority[#priority + 1] = valid[i]
        end

        if #priority == 0 then return end

        ultimate.target = priority[1][1]
        return priority
    end
end

function ultimate.FindClosestTick( ply, cmd )
    local records = ultimate.btrecords[ ply ]
    if not records or #records == 0 then return 1 end

    local viewOffset = cmd:GetViewOffset()
    local closestTick = 1
    local closestDistSqr = math.huge

    for i = 1, #records do
        local tick = records[ i ]
        if tick.pos then
            local distSqr = tick.pos:DistToSqr(viewOffset)

            if distSqr < closestDistSqr then
                closestTick = i
                closestDistSqr = distSqr
            end
        end
    end

    return closestTick
end

function ultimate.IsTickHittable( ply, cmd, tick )
    if ded.GetLatency(0) > 1 then return false end

    local serverArriveTick = ultimate.flServerTime + ded.GetLatency(0) + ded.GetLatency(1)
    local record = ultimate.btrecords[ ply ][ tick ]
    if not record then return false end

    local diff = serverArriveTick - record.simulationtime
    local maxBacktrackTime = ultimate.cfg["backtrack_time"] / 1000

    return diff <= maxBacktrackTime and diff >= 0
end

function ultimate.FindBacktrack( cmd, ply )
    local records = ultimate.btrecords[ ply ]
    if not records or #records == 0 then return {} end

    local hittableTicks = {}
    local tickCount = #records

    for i = 1, tickCount do
        if ultimate.IsTickHittable( ply, cmd, i ) then
            hittableTicks[ #hittableTicks + 1 ] = i
        end
    end

    return hittableTicks
end

function ultimate.FindFirstHittableTicks( ply, cmd )
    local records = ultimate.btrecords[ ply ]
    if not records or #records == 0 then return nil end

    for i = 1, #records do
        if ultimate.IsTickHittable( ply, cmd, i ) then
            return i
        end
    end

    return nil
end

function ultimate.FindOptimalBacktrackTick( ply, cmd )
    local records = ultimate.btrecords[ ply ]
    if not records or #records == 0 then return 1 end

    local eyePos = pLocalPlayer:EyePos()
    local bestTick = 1
    local bestScore = -math.huge

    for i = 1, #records do
        if not ultimate.IsTickHittable( ply, cmd, i ) then continue end

        local record = records[i]
        if not record.aimpos then continue end

        local distance = record.aimpos:DistToSqr(eyePos)
        local velocity = record.velocity and record.velocity:Length() or 0
        local timeDelta = math.abs(ultimate.flServerTime - record.simulationtime)

        local score = (1 / (distance + 1)) * (1 / (velocity + 1)) * (1 / (timeDelta + 0.001))

        if score > bestScore then
            bestScore = score
            bestTick = i
        end
    end

    return bestTick
end

function ultimate.FindClosestHittableTicks( ply, cmd )
    local records = ultimate.btrecords[ ply ]
    if not records or #records == 0 then return 1 end

    local eyePos = pLocalPlayer:EyePos()
    local closestTick = 1
    local closestDistance = math.huge

    for i = 1, #records do
        if not ultimate.IsTickHittable( ply, cmd, i ) then continue end

        local record = records[i]
        if not record.aimpos then continue end

        local distance = record.aimpos:DistToSqr(eyePos)

        if distance < closestDistance then
            closestDistance = distance
            closestTick = i
        end
    end

    return closestTick
end

function ultimate.AnalyzePlayerFlags(player)
	if not IsValid(player) then return {} end

	local playerFlags = player:GetFlags()
	local analysis = {
		onGround = bit.band(playerFlags, FL_ONGROUND) ~= 0,
		ducking = bit.band(playerFlags, FL_DUCKING) ~= 0,
		inWater = bit.band(playerFlags, FL_INWATER) ~= 0,
		frozen = bit.band(playerFlags, FL_FROZEN) ~= 0,
		inRain = bit.band(playerFlags, FL_INRAIN) ~= 0,
		onTrain = bit.band(playerFlags, FL_ONTRAIN) ~= 0,
		waterJump = bit.band(playerFlags, FL_WATERJUMP) ~= 0,
		allFlags = {}
	}

	analysis.isAirborne = not analysis.onGround
	analysis.isVulnerable = analysis.frozen or analysis.inWater
	analysis.isMoving = player:GetVelocity():Length() > 10

	return analysis
end

function ultimate.SelectTarget( cmd )
    local plys = ultimate.GetSortedPlayers( ultimate.cfg["target_selection"] )
    ultimate.target     = false


    if !plys then return end

    local maxplys       = ultimate.cfg["max_targets"]
    local curplys       = #plys

    if maxplys != 0 and curplys > maxplys then
        curplys = maxplys
    end

    local aimAng
    for i = 1, curplys do
		local ply = plys[i][1]

        if not ultimate.cfg["always_backtrack"] then
            local bones = ultimate.GetBones( ply )

            for o = 1, #bones do
                local bone = bones[o]
                aimAng = ( bone - me:EyePos() ):Angle()

                if ultimate.VisibleCheck( ply, bone, nil, aimAng:Forward() ) then
                    ultimate.target = ply
                    return ply, bone, aimAng, false, 0
                end
            end
        end

        if ultimate.cfg["backtrack"] then
            local ticks = ultimate.FindBacktrack( cmd, ply )

            if ultimate.btrecords[ ply ] and not ply.break_lc then
                local ts = 0

                if ultimate.cfg["backtrack_mode"] == 3 then
                    for p = 1, #ticks do
                        if not ultimate.btrecords[ ply ][ p ] then continue end

                        local bones = ultimate.GetBones( ply )
                        if not bones or #bones == 0 then continue end

                        local currentAimPos = bones[1]
                        aimAng = ( currentAimPos - me:EyePos() ):Angle()

                        ultimate.traceStruct.start = me:EyePos()
                        ultimate.traceStruct.endpos = currentAimPos
                        ultimate.traceStruct.filter = me
                        ultimate.traceStruct.mask = MASK_SHOT

                        local tr = util.TraceLine( ultimate.traceStruct )

                        if !tr.Hit or tr.Entity == ply then
                            ultimate.target = ply
                            ultimate.backtracktick = p

                            return ply, currentAimPos, aimAng, true, p
                        end
                    end
                end

                if ultimate.cfg["backtrack_mode"] == 3 then return end

                if ultimate.cfg["backtrack_mode"] == 1 then
                    ts = ultimate.FindFirstHittableTicks( ply, cmd )
                elseif ultimate.cfg["backtrack_mode"] == 2 then
                    ts = ultimate.FindClosestHittableTicks( ply, cmd )
                end

                if not ultimate.btrecords[ ply ][ ts ] then return end

                local bones = ultimate.GetBones( ply )
                if not bones or #bones == 0 then return end

                local currentAimPos = bones[1]
                aimAng = ( currentAimPos - me:EyePos() ):Angle()

                ultimate.traceStruct.start = me:EyePos()
                ultimate.traceStruct.endpos = currentAimPos
                ultimate.traceStruct.filter = me
                ultimate.traceStruct.mask = MASK_SHOT

                local tr = util.TraceLine( ultimate.traceStruct )

                if !tr.Hit or tr.Entity == ply then
                    ultimate.target = ply
                    ultimate.backtracktick = ts

                    return ply, currentAimPos, aimAng, true, ts
                end
            end
        end
	end
end

function ultimate.IsMovementKeysDown( cmd )

    if cmd:KeyDown( IN_MOVERIGHT ) then
        return true
    end

    if cmd:KeyDown( IN_MOVELEFT ) then
        return true
    end

    if cmd:KeyDown( IN_FORWARD ) then
        return true
    end

    if cmd:KeyDown( IN_BACK ) then
        return true
    end

    return false
end

function ultimate.MovementFix( cmd, wish_yaw )

	local pitch = ultimate.NormalizeAngle( cmd:GetViewAngles().x )
	local inverted = -1

	if ( pitch > 89 || pitch < -89 ) then
		inverted = 1
	end

	local ang_diff = math.rad( ultimate.NormalizeAngle( ( cmd:GetViewAngles().y - wish_yaw ) * inverted ) )

	local forwardmove = cmd:GetForwardMove()
	local sidemove = cmd:GetSideMove()

	local new_forwardmove = forwardmove * -math.cos( ang_diff ) * inverted + sidemove * math.sin( ang_diff )
	local new_sidemove = forwardmove * math.sin( ang_diff ) * inverted + sidemove * math.cos( ang_diff )

	cmd:SetForwardMove( new_forwardmove )
	cmd:SetSideMove( new_sidemove )
end

function ultimate.DoSilentAngleUpdate( UserCmd )
    local pWeapon = pLocalPlayer:GetActiveWeapon()

    if ( IsValid( pWeapon ) ) then
        if ( pWeapon.FreezeMovement and pWeapon:FreezeMovement() ) then
            return
        end

        local bIsInUse = UserCmd:KeyDown( IN_USE ) or pLocalPlayer:KeyDown(IN_USE)

        if ( pWeapon:GetClass() == "weapon_physgun" and IsValid( pWeapon:GetInternalVariable( "m_hGrabbedEntity" ) ) and bIsInUse ) then
            return
        end
    end

    local mYaw = GetConVar( "m_yaw" ):GetFloat()
    local mPitch = GetConVar( "m_pitch" ):GetFloat()

    local silentAngle = ultimate.SilentAngle

    silentAngle.x = math.Clamp( silentAngle.x + UserCmd:GetMouseY() * mPitch, -89, 89 )
    silentAngle.y = silentAngle.y + UserCmd:GetMouseX() * -mYaw
    silentAngle.r = 0

    silentAngle:Normalize()

    return silentAngle
end









// Knife bot ( Etot zaichik knifer )

ultimate.knifes = {}

ultimate.knifes[1] = {
    str = "csgo_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

ultimate.knifes[2] = {
    str = "swb_knife",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 50*50,

    rightdmg = 40,
    rightdmgb = 40,
    rightdist = 50*50,
}

ultimate.knifes[3] = {
    str = "weapon_crowba",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 75*75,

    rightdmg = 10,
    rightdmgb = 10,
    rightdist = 75*75,
}

ultimate.knifes[4] = {
    str = "knife_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 75*75,
}

ultimate.knifes[5] = {
    str = "umb_",

    canbackstab = false,

    leftdmg = 1000,
    leftdmgb = 1000,
    leftdist = 300*300,

    rightdmg = 1000,
    rightdmgb = 1000,
    rightdist = 300*300,
}

ultimate.knifes[6] = {
    str = "hvh_knife",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 50*50,

    rightdmg = 40,
    rightdmgb = 40,
    rightdist = 50*50,
}

function ultimate:EntityFaceBack(ent)
    local delta = (pLocalPlayer:GetAngles().y - ent:GetAngles().y + 180) % 360 - 180
    return math.abs(delta) <= 90
end

local knifeCache = {}
local lastCacheUpdate = 0
local CACHE_LIFETIME = 0.1

local function selectOptimalAttack(canLeft, canRight, leftDmg, rightDmg, backstab, health)
    if not canLeft and not canRight then return false, false end

    if canLeft and canRight then
        if backstab then
            return true, rightDmg > leftDmg
        end

        local leftKill = leftDmg >= health
        local rightKill = rightDmg >= health

        if leftKill and rightKill then
            return true, rightDmg > leftDmg
        elseif leftKill then
            return true, false
        elseif rightKill then
            return true, true
        end

        return true, rightDmg > leftDmg
    end

    return true, canRight
end

local function predictKnifeTarget(ent, myPos, knifeTbl)
    if not IsValid(ent) then return ent:GetPos() end

    local vel = ent:GetVelocity()
    local speed = vel:Length()

    if speed < 5 then return ent:GetPos() end

    local entPos = ent:GetPos()
    local maxReach = math.sqrt(math.max(knifeTbl.leftdist, knifeTbl.rightdist))

    local dirToTarget = (entPos - myPos):GetNormalized()
    local myVel = pLocalPlayer:GetVelocity()

    local targetVelToMe = -vel:Dot(dirToTarget)
    local myVelToTarget = myVel:Dot(dirToTarget)
    local closingSpeed = targetVelToMe + myVelToTarget

    local currentDist = myPos:Distance(entPos)
    local timeToReach = closingSpeed > 50 and math.max(0, (currentDist - maxReach) / closingSpeed) or 0

    local ping = pLocalPlayer:Ping() / 1000
    local latency = ded and ded.GetLatency and (ded.GetLatency(0) + ded.GetLatency(1)) or 0
    local totalTime = timeToReach + ping + latency

    local predictedPos = entPos + vel * totalTime

    local gravity = GetConVar("sv_gravity"):GetFloat()
    if not ent:IsOnGround() and ent:WaterLevel() == 0 then
        predictedPos.z = predictedPos.z - 0.5 * gravity * totalTime * totalTime
    end

    if ent:IsOnGround() then
        local friction = ent:GetMoveType() == MOVETYPE_WALK and 4 or 1
        local speedDecay = math.max(0, speed - friction * totalTime * 66)
        predictedPos = entPos + vel:GetNormalized() * speedDecay * totalTime
    end

    local accel = ent:GetVelocity() - (ent.lastVelocity or ent:GetVelocity())
    if accel:Length() > 10 then
        predictedPos = predictedPos + accel * totalTime * 0.5
    end
    ent.lastVelocity = ent:GetVelocity()

    return predictedPos
end

local function traceKnifePath(startPos, endPos, ent, weapon)
    local traceData = {
        start = startPos,
        endpos = endPos,
        mins = Vector(-6, -6, -6),
        maxs = Vector(6, 6, 6),
        filter = {pLocalPlayer, weapon},
        mask = MASK_SHOT_HULL
    }

    local tr = util.TraceHull(traceData)

    if tr.Hit then
        if tr.Entity == ent then return true end

        if tr.HitWorld then
            local penetrationDepth = 12
            local newStart = tr.HitPos + (endPos - startPos):GetNormalized() * penetrationDepth

            traceData.start = newStart
            traceData.endpos = endPos
            tr = util.TraceHull(traceData)

            return tr.Entity == ent
        end

        return false
    end

    return true
end

local function getTargetBone(ent, tbl)
    local set = ent:GetHitboxSet()
    local headBone = ent:GetHitBoxBone(0, set)

    if headBone then
        local headPos = ent:GetBonePosition(headBone)
        if headPos then
            return headPos
        end
    end

    return ent:GetPos() + Vector(0, 0, 50)
end

local function calculateDamageMultiplier(ent, myPos, targetPos)
    local angle = (targetPos - myPos):GetNormalized():Dot(ent:GetForward())

    if angle < -0.5 then
        return 1.8
    elseif angle > 0.7 then
        return 1.2
    end

    return 1.0
end

function ultimate.CanStab(ent, pos, health)
    if not IsValid(ent) or not ent:Alive() or ent == pLocalPlayer then return false, false end

    local weapon = pLocalPlayer:GetActiveWeapon()
    if not IsValid(weapon) then return false, false end

    local wc = weapon:GetClass()
    local tbl

    local cacheKey = wc
    local currentTime = CurTime()

    if knifeCache[cacheKey] and (currentTime - lastCacheUpdate) < CACHE_LIFETIME then
        tbl = knifeCache[cacheKey]
    else
        for i = 1, #ultimate.knifes do
            if string.StartsWith(wc, ultimate.knifes[i].str) then
                tbl = ultimate.knifes[i]
                knifeCache[cacheKey] = tbl
                lastCacheUpdate = currentTime
                break
            end
        end
    end

    if not tbl then return false, false end

    local mypos = pLocalPlayer:GetShootPos()
    local target_pos = pos
    local use_prediction = false

    local bonePos = getTargetBone(ent, tbl)
    if bonePos then
        target_pos = bonePos
    end

    if ultimate.btrecords and ultimate.btrecords[ent] and ultimate.btrecords[ent][ultimate.backtracktick] then
        target_pos = ultimate.btrecords[ent][ultimate.backtracktick].aimpos or target_pos
    else
        local vel = ent:GetVelocity()
        if vel:Length() > 30 then
            local predictedPos = predictKnifeTarget(ent, mypos, tbl)
            local predictedDist = mypos:DistToSqr(predictedPos)
            local maxReach = math.max(tbl.leftdist, tbl.rightdist)

            if predictedDist <= maxReach * 2.0 then
                target_pos = predictedPos
                use_prediction = true
            end
        end
    end

    if not traceKnifePath(mypos, target_pos, ent, weapon) then
        return false, false
    end

    local dist = mypos:DistToSqr(target_pos)
    local backstab = tbl.canbackstab and ultimate:EntityFaceBack(ent)
    local facestab = ultimate.cfg["facestab"]

    local canLeft = dist <= tbl.leftdist * 1.2
    local canRight = dist <= tbl.rightdist * 1.2

    if use_prediction then
        local maxReach = math.max(tbl.leftdist, tbl.rightdist)
        local currentDist = mypos:DistToSqr(target_pos)

        if currentDist > maxReach * 2.5 then
            return false, false
        end
    end

    local mode = ultimate.cfg["knifebot_mode"] or 1

    local dmgMultiplier = calculateDamageMultiplier(ent, mypos, target_pos)
    local leftDmg = (backstab and tbl.leftdmgb or tbl.leftdmg) * dmgMultiplier
    local rightDmg = (backstab and tbl.rightdmgb or tbl.rightdmg) * dmgMultiplier

    if mode == 1 then
        return selectOptimalAttack(canLeft, canRight, leftDmg, rightDmg, backstab, health)
    end

    if mode == 2 then
        if not facestab and not backstab then return false, false end
        return selectOptimalAttack(canLeft, canRight, leftDmg, rightDmg, backstab, health)
    end

    if mode == 3 then
        local canKillLeft = canLeft and ((backstab or facestab) and leftDmg >= health)
        local canKillRight = canRight and ((backstab or facestab) and rightDmg >= health)

        if not canKillLeft and not canKillRight then
            return selectOptimalAttack(canLeft, canRight, leftDmg, rightDmg, backstab, health)
        end

        return selectOptimalAttack(canKillLeft, canKillRight, leftDmg, rightDmg, backstab, health)
    end

    return false, false
end

ultimate.grabbingEnt = false

function ultimate.DrawPhysgunBeam( ply, wep, e, tar, bone, hitpos )
    if ply ~= pLocalPlayer then return end

    ultimate.grabbingEnt = IsValid( tar ) and tar or false
end

function ultimate.CalculateHitchance(cmd, targetPos, targetEnt)
	if not ultimate.cfg["hitchance"] then return true end
	if ultimate.cfg["nospread"] then return true end

	local wep = ultimate.activeWeapon
	if not IsValid(wep) then return false end

	local cone = wep:GetInternalVariable("m_fAccuracyPenalty") or 0
	if cone == 0 then
		if wep.Primary and wep.Primary.Cone then
			cone = wep.Primary.Cone
		else
			return true
		end
	end

	if cone == 0 then return true end

	local eyePos = pLocalPlayer:EyePos()
	local aimDir = (targetPos - eyePos):GetNormalized()
	local dist = eyePos:Distance(targetPos)

	local hitboxRadius = 8
	if IsValid(targetEnt) and targetEnt:IsPlayer() then
		local mins, maxs = targetEnt:GetHitBoxBounds(0, 0)
		if mins and maxs then
			hitboxRadius = (maxs - mins):Length() * 0.5
		end
	end

	local samples = 256
	local hits = 0

	local right = aimDir:Angle():Right()
	local up = aimDir:Angle():Up()

	for i = 1, samples do
		local x = (math.random() - 0.5) * 2
		local y = (math.random() - 0.5) * 2

		local spread = Vector(x * cone, y * cone, 0)
		local spreadDir = aimDir + right * spread.x + up * spread.y
		spreadDir:Normalize()

		local endPos = eyePos + spreadDir * dist
		local offset = endPos - targetPos

		if offset:Length() <= hitboxRadius then
			hits = hits + 1
		end
	end

	local hitchance = (hits / samples) * 100

	return hitchance >= ultimate.cfg["hitchance_value"]
end

function ultimate.simtimeCheck( v )
    if not ultimate.cfg["wait_for_simtime_update"] then return true end

    return v.simtime_updated
end

function ultimate.Aim(cmd)
    ultimate.AntiAim(cmd)

    if ultimate.SendPacket then
        ultimate.fakeAngles.angle = cmd:GetViewAngles()
        ultimate.fakeAngles.movex = pLocalPlayer:GetPoseParameter("move_x")
        ultimate.fakeAngles.movey = pLocalPlayer:GetPoseParameter("move_y")

        local layers = {}

        for i = 0, 13 do
            if pLocalPlayer:IsValidLayer(i) then
                layers[i] = {
                    cycle = pLocalPlayer:GetLayerCycle(i),
                    sequence = pLocalPlayer:GetLayerSequence(i),
                    weight = pLocalPlayer:GetLayerWeight(i)
                }
            end
        end

        ultimate.fakeAngles.origin = pLocalPlayer:GetNetworkOrigin()
        ultimate.fakeAngles.seq = pLocalPlayer:GetSequence()
        ultimate.fakeAngles.cycle = pLocalPlayer:GetCycle()
    else
        ultimate.realAngle = cmd:GetViewAngles()
    end

    local ply, bone, aimang, backtracking, bttick = ultimate.SelectTarget(cmd)

    ultimate.targetVector = bone

    if not aimang then return end

    aimang:Normalize()

    if not ultimate.cfg["enable_aimbot"] or not ply then return end

    local targetTime = ded.GetSimulationTime( ply:EntIndex() )
    local timeOffset = ded.GetServerTime(cmd) - targetTime

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - targetTime


    if diff > 1 and ultimate.cfg["adjust_tickcount"] then return end

    local oldangs = Angle(aimang)

    if ultimate.cfg["always_backtrack"] and not backtracking then return end

    if ultimate.cfg["fov_limit"] then
        local fov = ultimate.cfg["aimbot_fov"]

		local view = ultimate.cfg["silent_aim"] and ultimate.SilentAngle or cmd:GetViewAngles()
		local ang = aimang - view

		ang:Normalize()

		ang = math.sqrt(ang.x * ang.x + ang.y * ang.y)

        if ang > fov then
            ultimate.targetVector = false
		    return
        end
    end

    if not ultimate.CanShoot(cmd) then return end


    if not ultimate.cfg["aimbot_smoothing"] and ultimate.SkipCommand then return end

    ultimate.aimingrn = true


    // Knife bot
    local altfire = false
    local canstab, rightstab = ultimate.CanStab( ply, bone, ply:Health() )

    if ultimate.cfg["knifebot"] and canstab then
        altfire = rightstab
    elseif ultimate.cfg["knifebot"] and not canstab then
        return
    end

    local oldAimAng = aimang
    local finalAngle = aimang

    if ultimate.cfg["norecoil"] then
        finalAngle = ultimate.NoRecoil(finalAngle)
    end

    if ultimate.cfg["force_seed"] then
        //ded.ForceSeed( cmd )
    end

    if ultimate.cfg["nospread"] then
        finalAngle = ultimate.NoSpread(cmd,finalAngle)
    end

    if ultimate.cfg["on_shot_aa"] then
        finalAngle.p = -finalAngle.p - 180
        finalAngle.y = finalAngle.y + 180
    end

    if ultimate.cfg["facestab"] then
        local angles = ply:EyeAngles()

        finalAngle.y = angles.y
        finalAngle.p = angles.p

        altfire = true
    end

    if ultimate.cfg["aimbot_smoothing"] then
        local va = cmd:GetViewAngles()
        va.r = 0

        local rat = ultimate.cfg["smoothing"] * 100
        local ret = LerpAngle( FrameTime()*rat, va, finalAngle )

        finalAngle = ret
    end

    if ultimate.cfg["facestab"] then
        cmd:SetViewAngles( finalAngle )
        ded.SetContextVector( cmd, oldAimAng:Forward(), true )
    elseif ultimate.cfg["p_silent"] then
        ded.SetContextVector( cmd, finalAngle:Forward(), true )
    else
        cmd:SetViewAngles( finalAngle )
    end

    if backtracking then
        targetTime = ultimate.btrecords[ply][bttick].simulationtime
        timeOffset = ultimate.flServerTime - targetTime

        serverArriveTick = ultimate.flServerTime + ded.GetLatency(0) + ded.GetLatency(1)
        diff = serverArriveTick - ultimate.btrecords[ply][bttick].simulationtime

        if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")
            local tick = ultimate.TIME_TO_TICKS(targetTime)
            ded.SetCommandTick(cmd, tick)
        else
            ded.NetSetConVar("cl_interpolate","1")
            ded.NetSetConVar("cl_interp",tostring(ultimate.flServerTime - targetTime))
            local tick = ultimate.TIME_TO_TICKS(ultimate.flServerTime)
            ded.SetCommandTick(cmd, tick - 1)
        end
    elseif ultimate.cfg["adjust_tickcount"] then
        local flSimulationTime = ded.GetSimulationTime( ply:EntIndex() )
        local iTickCount = ultimate.TIME_TO_TICKS( flSimulationTime )

        ded.NetSetConVar( "cl_interpolate", "0" )
        ded.NetSetConVar( "cl_interp", "0" )

        ded.SetCommandTick( cmd, iTickCount )
    end

    if ultimate.cfg["auto_fire"] and ultimate.aimingrn then
        if string.StartsWith(ultimate.activeWeaponClass, "m9k_") then
            cmd:RemoveKey(IN_SPEED)
        end

        local canShoot = false
        local shootDir = (bone - pLocalPlayer:EyePos()):Normalize()

        if ultimate.cfg["autowall"] then
            canShoot = ultimate.AutoWall(shootDir, ply)
        else
            canShoot = true
        end

        if not canShoot then return end

        if not ultimate.CalculateHitchance(cmd, bone, ply) then return end

        ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )

        ultimate.lastShotData.target = ply
        ultimate.lastShotData.hitbox = bone
        ultimate.lastShotData.backtrack_tick = bttick or 0
        ultimate.lastShotData.velocity = ply:GetVelocity()
        ultimate.lastShotData.angle = aimang
        ultimate.lastShotData.position = bone
        ultimate.lastShotData.predicted = ultimate.cfg["extrapolation"] or false
        ultimate.lastShotData.multipoint = ultimate.cfg["multipoint"] or false
        ultimate.lastShotData.time = CurTime()

        if ultimate.cfg["resolver"] then
            local d = ultimate.rData[ply:EntIndex()]
            if d then
                d.miss = d.miss + 1
                if d.miss > 2 then d.brute = 1 end
            end
        end

        local isAutomatic = true

        if ultimate.activeWeapon.Primary then
            isAutomatic = ultimate.activeWeapon.Primary.Automatic
        else
            if class == "weapon_pistol" then
                isAutomatic = false
            end
        end

        if altfire or (ultimate.cfg["alt_rapid_fire"] and cmd:CommandNumber() % 2 == 0) then
            cmd:AddKey(IN_ATTACK2)
        else
            if isAutomatic or (ultimate.cfg["rapid_fire"] and cmd:CommandNumber() % 2 == 0) then
                cmd:AddKey(IN_ATTACK)
            end
        end

		ultimate.lastShootTime = CurTime()
        ultimate.SkipCommand = true
    end
    return true
end

function ultimate.autoReload(cmd)
    if not ultimate.cfg["auto_reload"] then return end

	local wep = pLocalPlayer:GetActiveWeapon()

	if IsValid(wep) then
		if wep.Primary then
			if wep:Clip1() == 0 and wep:GetMaxClip1() > 0 and pLocalPlayer:GetAmmoCount(wep:GetPrimaryAmmoType()) > 0 then
				cmd:AddKey(IN_RELOAD)
			end
		end
	end
end


local playerFlagsCache = {}



local sv_airaccelerate = GetConVar( "sv_airaccelerate" )
local sv_gravity = GetConVar( "sv_gravity" )
local sv_sticktoground = GetConVar( "sv_sticktoground" )

ultimate.last_ground_pos = 0
ultimate.cstrafe_dir = 0
ultimate.cstrafe_predict_ticks = 48
ultimate.cstrafe_ground_diff = 50
ultimate.predictionCache = {}

function ultimate.PredictMovement(viewangles, dir, angle)
	local maxspeed = pLocalPlayer:GetMaxSpeed()
	local jump_power = pLocalPlayer:GetJumpPower()
	local interval_per_tick = engine.TickInterval()
	local gravity_per_tick = sv_gravity:GetFloat() * interval_per_tick
	local accel = sv_airaccelerate:GetFloat()
	local stick_to_ground = sv_sticktoground:GetBool()
	local friction = pLocalPlayer:GetInternalVariable("m_surfaceFriction")
	local origin = pLocalPlayer:GetNetworkOrigin()
	local velocity = Vector(pLocalPlayer:GetAbsVelocity())
	local mins = pLocalPlayer:OBBMins()
	local maxs = pLocalPlayer:OBBMaxs()
	local on_ground = pLocalPlayer:IsFlagSet(FL_ONGROUND)
	local half_maxs = Vector(maxs.x, maxs.y, maxs.z * 0.5)
	local gravity_half = gravity_per_tick * 0.5
	local initial_speed = velocity:Length()
	local speed_loss_threshold = initial_speed * 0.85

	for i = 1, ultimate.cstrafe_predict_ticks do
		viewangles.y = math.NormalizeAngle(math.deg(math.atan2(velocity.y, velocity.x)) + angle)

		velocity.z = velocity.z - gravity_half

		if on_ground then
			velocity.z = velocity.z + jump_power - gravity_half
		end

		local forward = viewangles:Forward()
		local right = viewangles:Right()
		forward.z = 0
		right.z = 0
		forward:Normalize()
		right:Normalize()

		local smove = (dir == 1) and -10000 or 10000
		local wishdir = Vector(right.x * smove, right.y * smove, 0)
		local wishspeed = wishdir:Length()

		if wishspeed > 0 then
			wishdir:Normalize()
			if wishspeed > maxspeed then wishspeed = maxspeed end

			local wishspd = math.min(wishspeed, 30)
			local currentspeed = velocity:Dot(wishdir)
			local addspeed = wishspd - currentspeed

			if addspeed > 0 then
				local accelspeed = math.min(accel * interval_per_tick * wishspeed * friction, addspeed)
				velocity:Add(wishdir * accelspeed)
			end
		end

		local endpos = origin + (velocity * interval_per_tick)

		pm = util.TraceHull({
			start = origin,
			endpos = endpos,
			filter = pLocalPlayer,
			maxs = maxs,
			mins = mins,
			mask = MASK_PLAYERSOLID
		})

		if (pm.Fraction ~= 1 and pm.HitNormal.z <= 0.9) or pm.AllSolid or pm.StartSolid then
			return false
		end

		if pm.Fraction ~= 1 then
			local time_left = interval_per_tick * (1 - pm.Fraction)
			local original_speed = velocity:Length()

			for j = 1, 6 do
				local dot = velocity:Dot(pm.HitNormal)
				local tangent = velocity - (pm.HitNormal * dot)
				local tangent_len = tangent:Length()

				if tangent_len > 1 then
					tangent:Normalize()
					local preserve_factor = math.Clamp(1 - (dot / original_speed), 0.9, 1)
					velocity = tangent * (original_speed * preserve_factor)
				else
					velocity = velocity - (pm.HitNormal * dot * 0.99)
				end

				dot = velocity:Dot(pm.HitNormal)
				if dot < 0 then
					velocity = velocity - (pm.HitNormal * dot)
				end

				endpos = pm.HitPos + (velocity * time_left)

				local pm2 = util.TraceHull({
					start = pm.HitPos,
					endpos = endpos,
					filter = pLocalPlayer,
					maxs = maxs,
					mins = mins,
					mask = MASK_PLAYERSOLID
				})

				if (pm2.Fraction ~= 1 and pm2.HitNormal.z <= 0.9) or pm2.AllSolid or pm2.StartSolid then
					return false
				end

				if pm2.Fraction == 1 then
					pm = pm2
					break
				end

				pm = pm2
				time_left = time_left * (1 - pm2.Fraction)
			end
		end

		origin = pm.HitPos

		if (ultimate.last_ground_pos - origin.z) > ultimate.cstrafe_ground_diff then
			return false
		end

		if velocity:Length() < speed_loss_threshold then
			return false
		end

		friction = 1

		if velocity.z > 140 and not stick_to_ground then
			on_ground = false
		else
			local ground_trace = util.TraceHull({
				start = Vector(origin.x, origin.y, origin.z + 2),
				endpos = Vector(origin.x, origin.y, origin.z - 2),
				filter = pLocalPlayer,
				maxs = half_maxs,
				mins = mins,
				mask = MASK_PLAYERSOLID
			})

			on_ground = ((ground_trace.Fraction < 1 or ground_trace.AllSolid or ground_trace.StartSolid) and ground_trace.HitNormal.z >= 0.7)

			if not on_ground and velocity.z > 0 then
				friction = 0.25
			end
		end

		velocity.z = velocity.z - gravity_half

		if on_ground then
			velocity.z = 0
		end
	end

	return true
end

function ultimate.CircleStrafe(cmd)
	local cstrafe_angle_step = math.Clamp(math.Round(ultimate.cfg["cstrafe_angle_step"] or 3), 1, 45)
	local cstrafe_angle_maxstep = math.Clamp(math.Round(ultimate.cfg["cstrafe_angle_maxstep"] or 90), 1, 180)
	local cstrafe_mode = ultimate.cfg["circle_strafe_mode"] or 1
	local cstrafe_dir = ultimate.cstrafe_dir or 1

	if cstrafe_dir ~= 1 and cstrafe_dir ~= -1 then
		cstrafe_dir = 1
	end

	local velocity = pLocalPlayer:GetAbsVelocity()
	local current_speed = velocity:Length()
	local maxspeed = pLocalPlayer:GetMaxSpeed()
	local viewangles = cmd:GetViewAngles()
	local current_time = CurTime()

	local angle = 0
	local found = false
	local speed_factor = math.Clamp(current_speed / maxspeed, 0.6, 1.4)
	local adaptive_step = math.Round(cstrafe_angle_step * speed_factor)

	for test_dir = 1, 2 do
		local dir = (test_dir == 1) and cstrafe_dir or -cstrafe_dir
		local step = (dir == 1) and adaptive_step or -adaptive_step
		local test_angle = 0

		while math.abs(test_angle) <= cstrafe_angle_maxstep do
			local cache_key = string.format("%d_%d", math.Round(test_angle), dir)
			local cached = ultimate.predictionCache[cache_key]
			local result

			if cached and (current_time - cached.time) < 0.15 then
				result = cached.result
			else
				result = ultimate.PredictMovement(viewangles, dir, test_angle)
				ultimate.predictionCache[cache_key] = {result = result, time = current_time}
			end

			if result then
				angle = test_angle
				cstrafe_dir = dir
				found = true
				break
			end
			test_angle = test_angle + step
		end

		if found then break end
	end

	ultimate.cstrafe_dir = cstrafe_dir

	if current_speed > maxspeed * 0.3 then
		local velocity_angle = math.deg(math.atan2(velocity.y, velocity.x))
		local optimal_angle = math.NormalizeAngle(velocity_angle + angle)
		local angle_diff = math.abs(math.AngleDifference(optimal_angle, viewangles.y))

		if angle_diff > 90 then
			angle = angle * 0.7
		end
	end

	if cstrafe_mode == 1 then
		local wish_yaw = math.NormalizeAngle(math.deg(math.atan2(velocity.y, velocity.x)) + angle)
		local sidemove = (cstrafe_dir == 1) and -10000 or 10000
		cmd:SetSideMove(sidemove)
		ultimate.MovementFix(cmd, wish_yaw)
	elseif cstrafe_mode == 2 then
		local wish_yaw = math.NormalizeAngle(math.deg(math.atan2(velocity.y, velocity.x)) + angle)
		local sidemove = (cstrafe_dir == 1) and -10000 or 10000
		cmd:SetSideMove(sidemove)
		cmd:SetViewAngles(Angle(cmd:GetViewAngles().p, wish_yaw, cmd:GetViewAngles().r))
	end

	if table.Count(ultimate.predictionCache) > 256 then
		for k, v in pairs(ultimate.predictionCache) do
			if (current_time - v.time) > 0.5 then
				ultimate.predictionCache[k] = nil
			end
		end
	end
end


do
    local ztick = 0
    local prev_yaw = 0
    local old_yaw = 0.0

    function ultimate.AutoStrafe( cmd )
        ztick = ztick + 1

        if ( ultimate.IsKeyDown(ultimate.binds["circle_strafe"]) and ultimate.cfg["circle_strafe"] ) then

            ultimate.CircleStrafe( cmd )

        elseif ( ultimate.IsKeyDown(ultimate.binds["z_hop"]) and ultimate.cfg["z_hop"] ) then
            local handler = ztick / 3.14

            cmd:SetSideMove( 5000 * math.sin(handler) )
        elseif ultimate.cfg["air_strafer"] and ultimate.cfg["strafe_mode"] == 3 then

            local get_velocity_degree = function(velocity)
                local tmp = math.deg(math.atan(30.0 / velocity))

                if (tmp > 90.0) then
                    return 90.0
                elseif (tmp < 0.0) then
                    return 0.0
                else
                    return tmp
                end
            end

            local M_RADPI = 57.295779513082
            local side_speed = 10000
            local velocity = pLocalPlayer:GetVelocity()
            velocity.z = 0.0

            local forwardmove = cmd:GetForwardMove()
            local sidemove = cmd:GetSideMove()

            if (not forwardmove and not sidemove) then
                return
            end

            if(velocity:Length2D() <= 15.0 and not (forwardmove ~= 0 or sidemove ~= 0)) then
                return
            end

            local flip = cmd:TickCount() % 2 == 0

            local turn_direction_modifier = flip and 1.0 or -1.0
            local viewangles = Angle(ultimate.SilentAngle.x, ultimate.SilentAngle.y, ultimate.SilentAngle.z)

            if (forwardmove or sidemove) then
                cmd:SetForwardMove(0)
                cmd:SetSideMove(0)

                local turn_angle = math.atan2(-sidemove, forwardmove)
                viewangles.y = viewangles.y + (turn_angle * M_RADPI)
            elseif (forwardmove) then
                cmd:SetForwardMove(0)
            end

            local strafe_angle = math.deg(math.atan(15 / velocity:Length2D()))

            if (strafe_angle > 90) then
                strafe_angle = 90
            elseif (strafe_angle < 0) then
                strafe_angle = 0
            end

            local temp = Vector(0, viewangles.y - old_yaw, 0)
            temp.y = math.NormalizeAngle(temp.y)

            local yaw_delta = temp.y
            old_yaw = viewangles.y

            local abs_yaw_delta = math.abs(yaw_delta)

            if (abs_yaw_delta <= strafe_angle || abs_yaw_delta >= 30) then
                local velocity_angles = velocity:Angle()

                temp = Vector(0, viewangles.y - velocity_angles.y, 0)
                temp.y = math.NormalizeAngle(temp.y)

                local velocityangle_yawdelta = temp.y
                local velocity_degree = get_velocity_degree(velocity:Length2D() * 128)

                if (velocityangle_yawdelta <= velocity_degree || velocity:Length2D() <= 15) then
                    if (-velocity_degree <= velocityangle_yawdelta || velocity:Length2D() <= 15) then
                        viewangles.y = viewangles.y + (strafe_angle * turn_direction_modifier)
                        cmd:SetSideMove(side_speed * turn_direction_modifier)
                    else
                        viewangles.y = velocity_angles.y - velocity_degree
                        cmd:SetSideMove(side_speed)
                    end
                else
                    viewangles.y = velocity_angles.y + velocity_degree
                    cmd:SetSideMove(-side_speed)
                end
            elseif (yaw_delta > 0) then
                cmd:SetSideMove(-side_speed)
            elseif (yaw_delta < 0) then
                cmd:SetSideMove(side_speed)
            end

            local move = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
            local speed = move:Length()

            local angles_move = move:Angle()

            local normalized_x = math.modf(ultimate.SilentAngle.x + 180, 360) - 180
            local normalized_y = math.modf(ultimate.SilentAngle.y + 180, 360) - 180

            local yaw = math.rad(normalized_y - viewangles.y + angles_move.y)

            if (normalized_x >= 90 || normalized_x <= -90 || ultimate.SilentAngle.x >= 90 && ultimate.SilentAngle.x <= 200 || ultimate.SilentAngle.x <= -90 && ultimate.SilentAngle.x <= 200) then
                cmd:SetForwardMove(-math.cos(yaw) * speed)
            else
                cmd:SetForwardMove(math.cos(yaw) * speed)
            end

            cmd:SetSideMove(math.sin(yaw) * speed)

        elseif ultimate.cfg["air_strafer"] and ultimate.cfg["strafe_mode"] == 2 then
            cmd:SetForwardMove(0)

            if pLocalPlayer:IsFlagSet( FL_ONGROUND ) then
                cmd:SetForwardMove(10000)
            else
                cmd:SetForwardMove(5850 / pLocalPlayer:GetVelocity():Length2D())
                cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) and -400 or 400)
            end
        end
    end
end

/*
    Anti aim

*/

ultimate.aatarget = nil


function ultimate.PredictedPos(ply)
    return ply:GetPos() + ply:GetVelocity() * flTickInterval
end

function ultimate.PredictedEyePos()
    return pLocalPlayer:EyePos() + pLocalPlayer:GetVelocity() * flTickInterval
end

function ultimate.GetBaseYaw()
    local yawBaseMode = ultimate.cfg["yaw_base"] or 1

    if yawBaseMode == 2 and IsValid( ultimate.aatarget ) then
        return ultimate.NormalizeAngle( (ultimate.PredictedPos(ultimate.aatarget) - ultimate.PredictedEyePos()):Angle().y )
    elseif yawBaseMode == 3 then
        local customYaw = ultimate.cfg["custom_yaw"] or 0
        local currentPitch = me:EyeAngles().p
        local pitchFactor = math.abs(currentPitch) / 90
        return ultimate.NormalizeAngle( customYaw * pitchFactor )
    end

    return ultimate.SilentAngle.y
end

function ultimate.Freestand(cmd)
	if not IsValid(ultimate.aatarget) then return false end

	local headpos = pLocalPlayer:GetBonePosition(pLocalPlayer:LookupBone("ValveBiped.Bip01_Head1"))
	if not headpos then return end

	local selfpos = pLocalPlayer:GetPos()
	local headoffset = Vector(selfpos.x, selfpos.y, headpos.z):Distance(headpos) + 5

	local found = true

	local pos = ultimate.aatarget:WorldToLocal(selfpos)
	local bearing = math.deg(-math.atan2(pos.y, pos.x)) + 180 + 90
	local left, right = bearing - 180 - 90, bearing - 180 + 90

	local function CheckYaw(yaw)
		yaw = math.rad(yaw)
		local x, y = math.sin(yaw), math.cos(yaw)

		local headoffsetvec = Vector(x, y, 0) * headoffset
		headoffsetvec.z = headpos.z - selfpos.z

		local tr = util.TraceLine({
			start = ultimate.aatarget:EyePos() + ultimate.aatarget:GetVelocity() * flTickInterval * 4,
			endpos = selfpos + headoffsetvec,
			filter = ultimate.aatarget
		})

		return tr.Fraction < 1 and tr.Entity ~= pLocalPlayer
	end

	local function Normalize(ang) return 360 - ang + 90 end

	local leftcheck, rightcheck = CheckYaw(left), CheckYaw(right)

	left, right = Normalize(left), Normalize(right)

	do
		local headlocal = pLocalPlayer:WorldToLocal(headpos)
		if headlocal.x > 0 then
			left, right = right, left
		end
	end

	if leftcheck and rightcheck then
		return false
	elseif leftcheck then
		return true, left , right
	elseif rightcheck then
		return true, right, left
	end

    return false
end

local baseyaw = 0

ultimate.realAngle = pLocalPlayer:EyeAngles()
ultimate.inverted = false
ultimate.oldYaw = 0
ultimate.SwaySide = 1

ultimate.CalcYaw = {
    // Backward
    [1] = function( cmd )
        return baseyaw - 178
    end,
    // Fake forward
    [2] = function( cmd )
        return ultimate.SendPacket and baseyaw or baseyaw + 178
    end,
    // Legit Delta
    [3] = function( cmd )
        return ultimate.SendPacket and baseyaw or baseyaw + ( ultimate.inverted and 43 or - 43 )
    end,
    // Sideways
    [4] = function( cmd )
        local delta = ultimate.inverted and 89 or -89
        return baseyaw - ( ultimate.SendPacket and delta or -delta )
    end,
    [5] = function( cmd )
        local base = ultimate.inverted and 89 or -89
        local jit = math.random(-55, 55)
        local wave = math.sin(CurTime() * 8) * 12
        return ultimate.SendPacket and baseyaw - base + wave or baseyaw + base + jit
    end,
    [6] = function( cmd )
        local delta = ultimate.inverted and 89 or -89
        local shift = cmd:CommandNumber() % 3 == 0 and 15 or 0
        return baseyaw - (ultimate.SendPacket and delta + shift or 178 + shift)
    end,
    [7] = function( cmd )
        local spin = math.NormalizeAngle(CurTime() * ultimate.cfg["spin_speed"] * 10)
        local chaos = math.random(-20, 20)
        local real = ultimate.inverted and baseyaw - 178 or spin + chaos
        local fake = ultimate.inverted and spin + chaos or baseyaw - 178
        return ultimate.SendPacket and real or fake
    end,
    [8] = function( cmd )
        local offset = math.sin(CurTime() * 12) * 10
        return ultimate.oldYaw + (ultimate.SendPacket and 180 + offset or offset)
    end,
    [9] = function( cmd )
        local yaw = baseyaw - 178
        local vel = pLocalPlayer:GetVelocity():Length2D()

        if vel > 1 then
            local drift = math.random(-15, 15)
            yaw = ultimate.oldYaw + (ultimate.SendPacket and 180 + drift or drift)
        elseif not ultimate.SendPacket then
            local side = ultimate.inverted and -1 or 1
            local lby = ultimate.oldYaw
            local delta = math.abs(math.NormalizeAngle(lby - ultimate.oldYaw))
            local chaos = math.random(-8, 8)

            if delta < ultimate.cfg["lby_min_delta"] then
                yaw = math.NormalizeAngle(ultimate.oldYaw + ultimate.cfg["lby_break_delta"] * side + chaos)
            else
                yaw = math.NormalizeAngle(ultimate.oldYaw - 44 * side + chaos)
            end
        end
        return yaw
    end,
    [10] = function( cmd )
        local add = ultimate.cfg["sin_add"]
        local sin = math.sin(CurTime() * 6.28) * ultimate.cfg["sin_delta"]
        local noise = math.random(-5, 5)
        return ultimate.SendPacket and baseyaw + sin + add + noise or baseyaw - sin - add + noise
    end,
    [11] = function( cmd )
        local ct = CurTime()
        local delta = ultimate.cfg["sin_delta"]
        local t1 = ct % 0.9
        local t2 = ct % 2
        local x = (t2 * math.sin(t1) + t1 * math.sin(t2)) * delta
        local y = (t2 * -math.cos(t1) - t1 * math.cos(t2)) * delta
        local chaos = math.random(-10, 10)
        return baseyaw + (ultimate.SendPacket and x or y) + chaos
    end,
    [12] = function( cmd )
        local speed = (ultimate.fakeLagTicks + 1) / 12 * math.pi
        local sway = math.sin(CurTime() * speed) * 45
        local drift = math.cos(CurTime() * speed * 0.5) * 15
        return baseyaw - 180 + 55 * ultimate.SwaySide + sway * ultimate.SwaySide * -1 + drift
    end,
    [13] = function( cmd )
        local delta = ultimate.cfg["jitter_delta"]
        local r1 = math.random(-delta, delta)
        local r2 = math.random(-delta, delta)
        local wave = math.sin(CurTime() * 10) * 8
        local a = ultimate.SendPacket and baseyaw - 178 + wave or baseyaw - 178 + r1
        local b = ultimate.SendPacket and baseyaw - 178 + r2 or baseyaw - 178 + wave
        return ultimate.inverted and a or b
    end,
    [14] = function( cmd )
        local delta = ultimate.cfg["jitter_delta"]
        local pulse = cmd:CommandNumber() % 2 == 0 and 10 or -10
        local a = ultimate.SendPacket and baseyaw - 178 + pulse or baseyaw + delta * ultimate.SwaySide
        local b = ultimate.SendPacket and baseyaw + delta * ultimate.SwaySide or baseyaw - 178 + pulse
        return ultimate.inverted and a or b
    end,
    [15] = function( cmd )
        local jit = math.sin(CurTime() * 30) * 25
        local chaos = math.random(-12, 12)
        local side = ultimate.SwaySide
        return jit + chaos + (ultimate.SendPacket and baseyaw - 160 * side or baseyaw - 160 * -side)
    end,
    [16] = function( cmd )
        local side = ultimate.inverted and 1 or -1
        local spin = math.sin(CurTime() * 666) * 666
        local offset = math.random(-30, 30)
        return math.NormalizeAngle(ultimate.SendPacket and spin * side + offset or spin * -side + offset)
    end,
    [17] = function( cmd )
        local drift = math.sin(CurTime() * 8) * 12
        return ultimate.SendPacket and baseyaw + ultimate.cfg["custom_real"] + drift or baseyaw + ultimate.cfg["custom_fake"] + drift
    end,
    [18] = function( cmd )
        local delta = 58
        local side = ultimate.inverted and 1 or -1
        local shift = math.random(-8, 8)
        return ultimate.SendPacket and baseyaw + delta * side + shift or baseyaw - delta * side + shift
    end,
    [19] = function( cmd )
        local delta = 25
        local side = ultimate.inverted and 1 or -1
        local wave = math.cos(CurTime() * 12) * 10
        return ultimate.SendPacket and baseyaw + delta * side + wave or baseyaw - delta * side + wave
    end,
    [20] = function( cmd )
        local delta = 90
        local chaos = math.random(-15, 15)
        if ultimate.SendPacket then
            ultimate.SwaySide = -ultimate.SwaySide
        end
        return baseyaw + delta * ultimate.SwaySide + chaos
    end,
    [21] = function( cmd )
        local real = 120
        local fake = -120
        local side = ultimate.inverted and 1 or -1
        local drift = math.sin(CurTime() * 10) * 15
        return ultimate.SendPacket and baseyaw + real * side + drift or baseyaw + fake * side + drift
    end,
    [22] = function( cmd )
        local tply = ultimate.GetSortedPlayers( 1, 0, 1, false )
        local targetYaw = baseyaw

        if tply and tply[1] and IsValid(tply[1][1]) and tply[1][1]:Alive() then
            local targetPos = tply[1][1]:EyePos()
            local myPos = pLocalPlayer:EyePos()
            local toTarget = (targetPos - myPos):Angle()
            targetYaw = toTarget.y
        end

        local realOffset = 90
        local jitterPhase = math.sin(CurTime() * 18) * 15
        local microJitter = math.random(-8, 8)
        local cmdJitter = (cmd:CommandNumber() % 3) * 5

        local realYaw = targetYaw + realOffset + jitterPhase + microJitter
        local fakeYaw = targetYaw + cmdJitter

        if ultimate.inverted then
            realYaw = targetYaw - realOffset + jitterPhase + microJitter
        end

        return ultimate.SendPacket and realYaw or fakeYaw
    end,
}







do
    local pitch, yaw = 0, 0














    local mm_side = false
    local side = false
    local pitchflip = false

    local side = 1

    local function CalcPitch(cmd)
        local cfg = ultimate.cfg["pitch"]
        local x = 0

        if ultimate.SendPacket then
            pitchflip = not pitchflip
        end
        if cfg == 1 then
            x = 89
        elseif cfg == 2 then
            x = -89
        elseif cfg == 3 then
            x = 0
        elseif cfg == 4 then
            x = ultimate.SendPacket and -89 or 89
        elseif cfg == 5 then
            x = ultimate.SendPacket and 89 or -89
        elseif cfg == 6 then
            x = pitchflip and 180 or -180
        elseif cfg == 7 then
            x = ultimate.SendPacket and 89 or -180
        elseif cfg == 8 then
            x = cmd and cmd:GetViewAngles().p
        elseif cfg == 9 then
            x = ultimate.cfg["custom_pitch"]
        elseif cfg == 10 then
            local microShift = math.sin(CurTime() * 22) * 3
            local tickJitter = (cmd:CommandNumber() % 2) * 2
            x = ultimate.SendPacket and -89 + microShift or 0 + tickJitter
        end

        return x
    end

    local function micromovement(cmd)
        if not ultimate.cfg["micromovement"] then return end
        if not pLocalPlayer:Alive() then return end
        if not pLocalPlayer:IsFlagSet( FL_ONGROUND ) then return end
        if cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) then return end

        cmd:SetSideMove(mm_side and -15.0 or 15.0)
        mm_side = not mm_side
    end

    local function aacheck(cmd)
        if not ultimate.cfg["anti_aim"] then return false end
        if cmd:KeyDown(IN_ATTACK) then return false end
        if cmd:KeyDown(IN_USE) then return false end
        if ultimate.moveType == MOVETYPE_LADDER then return false end
        if ultimate.moveType == MOVETYPE_NOCLIP then return false end

        if ultimate.binds["anti_aim"] ~= 0 and not ultimate.IsKeyDown(ultimate.binds["anti_aim"]) then
            return false
        end

        if ultimate.cfg["yaw_base"] == 2 then
            if not IsValid(ultimate.aatarget) or not ultimate.aatarget:Alive() then
                return false
            end
        end

        return true
    end



    function ultimate.AntiAim(cmd)
        local freestandsucc, freestandsafe, freestandunsafe

        if ultimate.cfg["freestanding"] then
            freestandsucc, freestandsafe, freestandunsafe = ultimate.Freestand(cmd)
        end

        if ultimate.SendPacket then
            ultimate.SwaySide = ultimate.SwaySide * -1
        end

        baseyaw = ultimate.GetBaseYaw()
        pitch = CalcPitch(cmd)
        local yawIdx = ultimate.cfg["yaw"] or 1
        if ultimate.CalcYaw[yawIdx] then
            yaw = ultimate.CalcYaw[yawIdx](cmd)
        else
            yaw = 0
        end

        if ultimate.cfg["yaw_randomisation"] then
            yaw = yaw + math.random( -0.9, 0.9 )
        end

        if ultimate.cfg["yaw"] == 13 or ultimate.cfg["yaw"] == 14 then
            yaw = yaw + ultimate.cfg["jitter_delta"] or 45
        end

        if freestandsucc then
            yaw = ultimate.SendPacket and freestandunsafe or freestandsafe
        end

        if aacheck(cmd) then
            local pyAngle = Angle(pitch,yaw,0)

            micromovement(cmd)

            cmd:SetViewAngles(pyAngle)
            ultimate.oldYaw = pyAngle.y
        end
    end
end

/*
    Fake lag
*/
ultimate.fakeLagTicks = 0
ultimate.fakeLagfactor = 0
ultimate.chokedTicks = 0

ultimate.peeked = false
ultimate.peeking = false

function ultimate.FakeLagOnPeek()
    ultimate.fakeLagTicks = ultimate.cfg["on_peek_factor"] - ultimate.chokedTicks - 1

    if ultimate.chokedTicks >= ultimate.cfg["on_peek_factor"] then
        ultimate.peeked = true
		ultimate.peeking = false
		ultimate.SendPacket = true
        pLocalPlayer.simtime_updated = true
        ded.UpdateClientAnimation( pLocalPlayer:EntIndex() )
		return
    end
end

function ultimate.WarpOnPeek()
	ded.StartShifting( true )

	ultimate.peeked = true
	ultimate.peeking = false
end

function ultimate.CheckPeeking()
	local plys

	for extr = 1, 8 do
        plys = ultimate.GetSortedPlayers( 1, extr, 1, true )
		if plys then break end
	end

	if plys and not ultimate.peeking and not ultimate.peeked then
		ultimate.peeking = true
		ultimate.peeked = false
	elseif not plys then
		ultimate.peeking = false
		ultimate.peeked = false
	end

	if ultimate.peeking and not ultimate.peeked then
		if not ded.GetIsShifting() and ded.GetCurrentCharge() >= ultimate.cfg["shift_ticks"] and ultimate.cfg["warp_on_peek"] then
			ultimate.WarpOnPeek()
        elseif ultimate.cfg["freeze_on_peek"]then
            ded.SetOutSequenceNr( ded.GetOutSequenceNr() + ultimate.maxFreezeTicks - 1 )
	    elseif ultimate.cfg["fake_lag_options_on_peek"] then
			ultimate.FakeLagOnPeek()
		end
	end
end




do
    local lastBreakTick = 0
    local lagPattern = {14, 13, 15, 12, 14}
    local patternIndex = 1

    local function shouldlag(cmd)
        if not ultimate.cfg["fake_lag"] then return false end
        if not pLocalPlayer:Alive() then return false end
        if ultimate.cfg["fakelag_comp"] == 1 and ded.GetCurrentCharge() > 0 then return false end
        if ultimate.cfg["fake_lag_options_disable_on_ladder"] and ultimate.moveType == MOVETYPE_LADDER then return false end
        if ultimate.cfg["fake_lag_options_disable_in_attack"] and cmd:KeyDown(IN_ATTACK) then return false end
        return true
    end

    function ultimate.FakeLag(cmd)
        if not shouldlag(cmd) then
            if ultimate.fakeLagfactor > 0 then ultimate.fakeLagfactor = 0 end
            ultimate.SendPacket = true
            pLocalPlayer.simtime_updated = true
            ded.UpdateClientAnimation(pLocalPlayer:EntIndex())
            return
        end

        local factor = math.Round(ultimate.cfg["lag_limit"])
        local velocity = pLocalPlayer:GetVelocity():Length2D()
        local pertick = velocity * flTickInterval

        if ultimate.cfg["lag_mode"] == 1 then
            if ultimate.cfg["fake_lag_options_randomise"] then
                local jitter = math.random(-2, 2)
                factor = math.Clamp(factor + jitter, ultimate.cfg["lag_randomisation"], ultimate.cfg["lag_limit"])
            end

            local tick = engine.TickCount()
            if tick - lastBreakTick > 66 then
                factor = lagPattern[patternIndex]
                patternIndex = patternIndex % #lagPattern + 1
                lastBreakTick = tick
            end
        elseif ultimate.cfg["lag_mode"] == 2 then
            local adaptive = math.Clamp(math.ceil(64 / pertick), 1, factor)
            factor = math.max(adaptive, 8)

            if velocity > 250 then
                factor = math.Clamp(factor + 3, 1, 21)
            end
        end

        ultimate.fakeLagfactor = factor
        ultimate.SendPacket = false

        if ultimate.fakeLagTicks <= 0 then
            ultimate.fakeLagTicks = factor
            ultimate.SendPacket = true
            pLocalPlayer.simtime_updated = true
            ded.UpdateClientAnimation(pLocalPlayer:EntIndex())
        else
            ultimate.fakeLagTicks = ultimate.fakeLagTicks - 1
        end
    end
end


function ultimate.ClampMovementSpeed(cmd, speed)
	local final_speed = speed;

	local squirt = math.sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

	if (squirt > speed) then
		local squirt2 = math.sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

		local cock1 = cmd:GetForwardMove() / squirt2;
		local cock2 = cmd:GetSideMove() / squirt2;

		local Velocity = pLocalPlayer:GetVelocity():Length2D();

		if (final_speed + 1.0 <= Velocity) then
			cmd:SetForwardMove(0)
			cmd:SetSideMove(0)
		else
			cmd:SetForwardMove(cock1 * final_speed)
			cmd:SetSideMove(cock2 * final_speed)
        end
    end
end

function ultimate.FastWalk( cmd )
    if not ultimate.cfg["ground_strafer"] then return end
    if math.abs(cmd:GetSideMove()) > 1 or math.abs(cmd:GetForwardMove()) < 1 then return end
    if not pLocalPlayer:IsFlagSet( FL_ONGROUND ) then return end

    if ultimate.moveType == MOVETYPE_NOCLIP or ultimate.moveType == MOVETYPE_LADDER then return end

    local waterLevel = pLocalPlayer:WaterLevel()

    if waterLevel >= 2 then return end

	cmd:SetSideMove(cmd:CommandNumber() % 2 == 0 and -5250 or 5250)
end

function ultimate.validMoveType()
    return ultimate.moveType ~= MOVETYPE_LADDER and ultimate.moveType ~= MOVETYPE_NOCLIP and ultimate.moveType ~= MOVETYPE_OBSERVER
end

function ultimate.isMoving(cmd)
    if not cmd then
        return false
    end

    return ultimate.hoppin or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) and not cmd:KeyDown(IN_JUMP)
end

function ultimate.Stop(cmd)
    if ultimate.validMoveType() and pLocalPlayer:IsFlagSet( FL_ONGROUND ) then

        local moving = ultimate.isMoving(cmd)

        if not moving then

            local vel = pLocalPlayer:GetVelocity()
            local dir = vel:Angle()

            dir.yaw = ultimate.SilentAngle.y - dir.yaw

            local newmove = dir:Forward() * vel:Length2D()

            cmd:SetForwardMove(0 - newmove.x)
            cmd:SetSideMove(0 - newmove.y)

        end

    end
end

// Auto peak

ultimate.startedPeeking = false
ultimate.needToMoveBack = false
ultimate.startPeekPosition = Vector(0,0,0)

function ultimate.MoveTo( cmd, pos )
    local ang = ( pos - pLocalPlayer:GetPos() ):Angle().y

    cmd:SetForwardMove(1000)
    cmd:SetSideMove(0)

    cmd:AddKey(IN_SPEED)

    ultimate.MovementFix( cmd, ang )
end

function ultimate.checkAutopeak( cmd )
    if ultimate.startedPeeking and cmd:KeyDown(IN_ATTACK) then
        ultimate.needToMoveBack = true
    elseif not ultimate.startedPeeking and not cmd:KeyDown(IN_ATTACK) then
        ultimate.needToMoveBack = false
    end
end

do
    local colorA = Color( 235, 75, 75 )
    local colorB = Color( 75, 235, 75 )

    local apmat = Material( "gui/npc.png" )

    local nullangle = Angle(0,0,0)

    function ultimate.drawAutopeak()
        local col = ultimate.needToMoveBack and colorA or colorB

        cam.Start3D2D( ultimate.startPeekPosition, nullangle, 0.5 )
            cam.IgnoreZ( true )

            surface.SetDrawColor( col )
            surface.SetMaterial( apmat )
            surface.DrawTexturedRect( -32, -32, 64, 64 )

            cam.IgnoreZ( false )
        cam.End3D2D()
    end
end

function ultimate.autopeakThink()
    if ultimate.IsKeyDown(ultimate.binds["auto_peak"]) then
        if not ultimate.startedPeeking then
            ultimate.startPeekPosition = pLocalPlayer:GetPos()
        end

        ultimate.startedPeeking = true
    else
        ultimate.startedPeeking = false
    end
end







// Sequence Manipulation

ultimate.freezedTicks = 0
ultimate.maxFreezeTicks = math.Round( 1 / flTickInterval )
function ultimate.AnimationFreezer()
    if not ultimate.IsKeyDown( ultimate.binds["animation_freezer"] ) then return end

    if ultimate.freezedTicks < ultimate.maxFreezeTicks then
        ded.SetOutSequenceNr( ded.GetOutSequenceNr() + ultimate.maxFreezeTicks - 1 )

        ultimate.freezedTicks = ultimate.freezedTicks + 1
    else
        ultimate.freezedTicks = 0
    end
end

ultimate.seqshit = false
ultimate.seqProtection = {
    lastSequence = 0,
    fakeSequences = {},
    commandSpoofing = false,
    patternBreaker = 0,
    fakeTicks = 0,
    lastMissTime = 0
}

function ultimate.SequenceShit(cmd)
    if not ultimate.cfg["sequence_manip"] or not ultimate.IsKeyDown(ultimate.binds["sequence_manip"]) then
        if ultimate.seqshit then
            ultimate.seqshit = false
        end
        return
    end

    local amt = ultimate.cfg["sequence_min_random"] and math.random(ultimate.cfg["sequence_min"],ultimate.cfg["outsequence"]) or ultimate.cfg["outsequence"]


    ultimate.seqshit = true
    ultimate.SendPacket = true
    ded.SetOutSequenceNr(ded.GetOutSequenceNr() + amt)
end

// Handjob ( arm breaker )

function ultimate.PerformHandjob( cmd )
    local mode = ultimate.cfg["handjob_mode"]
    local shouldjerk = true

    if mode == 2 then
        shouldjerk = (cmd:CommandNumber() % 12) >= 6
    elseif mode == 3 then
        shouldjerk = math.random(0, 1) == 0
    end

    ded.SetTyping(cmd, shouldjerk)
end


// create move hook

ultimate.norf = {
    ["laserjetpack"] = true,
    ["weapon_physgun"] = true,
}

ultimate.vapecd = false
ultimate.tyaga = 0
ultimate.maxvape = ultimate.TIME_TO_TICKS(5)
ultimate.hoppin = false
local ic = false

ultimate.slams = {}

function ultimate.OnEntityCreated(ent)
    if ent:GetClass() == "npc_satchel" and ent:GetOwner() == pLocalPlayer then
        ultimate.slams[ #ultimate.slams + 1 ] = ent
    end
end


function ultimate.CreateMove(cmd)
    ultimate.DoSilentAngleUpdate( cmd )

    ultimate.aimingrn = false

    if cmd:CommandNumber() == 0 then
        return
    end

    if ultimate.cfg["edge_jump"] and me:IsFlagSet(FL_ONGROUND) then
        local moving = cmd:GetForwardMove() ~= 0 or cmd:GetSideMove() ~= 0
        if moving then
            local pos = me:GetPos()
            local ang = cmd:GetViewAngles()
            local forward = ang:Forward()
            forward.z = 0
            forward:Normalize()

            local checkDist = 24
            local nextPos = pos + forward * checkDist

            local trDown = util.TraceLine({
                start = nextPos + Vector(0, 0, 8),
                endpos = nextPos - Vector(0, 0, 100),
                filter = me,
                mask = MASK_PLAYERSOLID
            })

            if not trDown.Hit or trDown.Fraction > 0.9 then
                cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_JUMP))
            end
        end
    end

    ultimate.flServerTime = ded.GetServerTime( cmd )

    local plys = player.GetAll()
    for i = 1, #plys do
        if not IsValid(plys[i]) then continue end
        local playerId = plys[i]:EntIndex()
        playerFlagsCache[playerId] = {
            flags = plys[i]:GetFlags(),
            onGround = bit.band(plys[i]:GetFlags(), FL_ONGROUND) ~= 0,
            ducking = bit.band(plys[i]:GetFlags(), FL_DUCKING) ~= 0,
            inWater = bit.band(plys[i]:GetFlags(), FL_INWATER) ~= 0,
            frozen = bit.band(plys[i]:GetFlags(), FL_FROZEN) ~= 0,
            time = CurTime()
        }
    end

    local w = pLocalPlayer:GetActiveWeapon()
    ultimate.activeWeapon       = IsValid( w ) and w or false
    ultimate.activeWeaponClass  = IsValid( w ) and w:GetClass() or false
    ultimate.moveType           = pLocalPlayer:GetMoveType()


    if ultimate.cfg["silent_aim"] then cmd:SetViewAngles(ultimate.SilentAngle) end

    if ultimate.cfg["flashlight_spam"] and input.IsKeyDown( KEY_F ) then
        cmd:SetImpulse(100)
    end
    if ultimate.vapecd then
        ultimate.vapecd = false
        cmd:RemoveKey( IN_ATTACK2 )
    elseif ultimate.cfg["vape_spam"] and ultimate.activeWeapon and not ultimate.vapecd and string.StartsWith( ultimate.activeWeaponClass, "weapon_vape" ) then
        cmd:AddKey( IN_ATTACK2 )
        ultimate.vapecd = true
    end

    if ultimate.cfg["handjob"] then
        ultimate.PerformHandjob( cmd )
    end

    if ultimate.SkipCommand then
        cmd:RemoveKey( IN_ATTACK )

        ultimate.SkipCommand = not ultimate.SkipCommand
    end

    if ( pLocalPlayer:IsFlagSet( FL_ONGROUND ) ) then
		ultimate.last_ground_pos = pLocalPlayer:GetNetworkOrigin().z
	end

    if ultimate.cfg["animation_freezer"] then ultimate.AnimationFreezer() end

	ultimate.SequenceShit(cmd)

    if not ultimate.seqshit then
        ultimate.FakeLag(cmd)

        if ultimate.cfg["allah_walk"] and pLocalPlayer:IsFlagSet( FL_ONGROUND ) and ultimate.IsKeyDown(ultimate.binds["allahwalk"]) then

            if ultimate.fakeLagTicks ~= 20 then
                ultimate.ClampMovementSpeed(cmd, 0)
            else
                ultimate.ClampMovementSpeed(cmd, pLocalPlayer:GetWalkSpeed())
            end

            //if(ultimate.fakeLagTicks <= 20) then
            //    ultimate.ClampMovementSpeed(cmd, 0)
            //    ultimate.Stop(cmd)
                //pLocalPlayer:SetPoseParameter("move_x", 0)
	            //pLocalPlayer:SetPoseParameter("move_y", 0)
            //else
             //   ultimate.ClampMovementSpeed(cmd, pLocalPlayer:GetWalkSpeed())
            //end

            //print(ultimate.fakeLagTicks,pLocalPlayer:GetVelocity():Length2D())
        end
    end

    if ultimate.cfg["fake_lag_options_on_peek"] or ultimate.cfg["warp_on_peek"] or ultimate.cfg["freeze_on_peek"] then
        ultimate.CheckPeeking()
    end

    // Movement

    ultimate.FastWalk( cmd )

    ultimate.hoppin = false
    if ( cmd:KeyDown( IN_JUMP ) ) then

		if ( not me:IsFlagSet( FL_ONGROUND ) ) and ultimate.cfg["bhop"] then
			cmd:RemoveKey( IN_JUMP )
            ultimate.hoppin = true
		end

		ultimate.AutoStrafe( cmd )
	end

	if ultimate.cfg["fast_stop"] then
        ultimate.Stop(cmd)
    end

    if ultimate.cfg["fake_duck"] and ultimate.IsKeyDown(ultimate.binds["fake_duck"]) then
        if ultimate.fakeLagTicks > (ultimate.fakeLagfactor / 2) then
            cmd:AddKey(IN_DUCK)
        else
            cmd:RemoveKey(IN_DUCK)
        end
    end

    ultimate.targetVector = false

	ded.StartPrediction(cmd)

        if ultimate.targetPlayer and IsValid(ultimate.targetPlayer) and not ultimate.targetBacktracking then
            local freshBones = ultimate.GetBones(ultimate.targetPlayer)
            if freshBones and #freshBones > 0 then
                ultimate.targetVector = freshBones[1]
            end
        end

        local wish_yaw = cmd:GetViewAngles().y
	    local viewangles = cmd:GetViewAngles()

        viewangles.y = ultimate.SilentAngle.y

        cmd:SetViewAngles( viewangles )

        if ultimate.cfg["crossbow_prediction"] and ultimate.activeWeaponClass == "weapon_crossbow" then
            ultimate.CrossbowPred( cmd )
        elseif ultimate.cfg["prop_aimbot"] then
            ultimate.PropAim(cmd)
        else
            ultimate.Aim(cmd)
        end

        if ultimate.cfg["silent_aim"] then
            ultimate.MovementFix( cmd, wish_yaw )
        end

    ded.FinishPrediction()

    if ultimate.cfg["trigger_bot"] and ultimate.IsKeyDown( ultimate.binds["trigger_bot"] ) then
        local tr = pLocalPlayer:GetEyeTrace().Entity

        if tr and tr:IsPlayer() then
            cmd:AddKey( IN_ATTACK )
        end
    end

    if ultimate.cfg["double_tap"] and ultimate.cfg["tickbase_shift"] and cmd:KeyDown( IN_ATTACK ) then
        ded.StartShifting( true )
    end

    if ultimate.cfg["auto_detonator"] and #ultimate.slams > 0 then
        local d = ultimate.cfg["autod_distance"]
        d = d * d

        local plys = player.GetAll()

        for jjj = 1, #plys do
            if plys[ jjj ] == pLocalPlayer then continue end

            for k, v in pairs(ultimate.slams) do
                if not IsValid(v) then ultimate.slams[k] = nil continue end

                local pos = v:GetPos()

                if pos:DistToSqr( plys[ jjj ]:GetPos() + plys[ jjj ]:GetVelocity() * ( flTickInterval * 4 ) ) < d then
                    cmd:AddKey( IN_ATTACK2 )
                    break
                end
            end
        end
    end

    if ultimate.cfg["auto_peak"] then
        local ppos = ultimate.startPeekPosition
        local pposd = pLocalPlayer:GetPos():DistToSqr(ppos)

        if ultimate.needToMoveBack and pposd < 1024 then //or ultimate.IsMovementKeysDown( cmd )
            ultimate.needToMoveBack = false
        end

        if ultimate.startedPeeking then
            //if not ultimate.IsMovementKeysDown( cmd ) then
            //    ultimate.needToMoveBack = true
            //end

            if ultimate.needToMoveBack then
                ultimate.MoveTo( cmd, ppos )

                if ultimate.cfg["auto_peak_tp"] and ultimate.cfg["tickbase_shift"] then
                    //ultimate.shiftedTicks = 0
                    ded.StartShifting( true )
                end
            end
        end

        ultimate.checkAutopeak( cmd )
    end

    ultimate.autoReload(cmd)

    if ultimate.cfg["use_spam"] then
        if cmd:KeyDown(IN_USE) then
            cmd:RemoveKey(IN_USE)
        else
            cmd:AddKey(IN_USE)
        end
    end

    if ultimate.cfg["ghost_follower"] then
        ultimate.GhostFollower(cmd)
    end

    if ultimate.fcenabled then
        cmd:ClearMovement()
        cmd:ClearButtons()

        cmd:SetViewAngles(ultimate.fcangles)
    end

    if ultimate.SendPacket then
        ultimate.chokedTicks = 0
    else
        ultimate.chokedTicks = ultimate.chokedTicks + 1
    end

    if not ultimate.cfg["silent_aim"] then ultimate.SilentAngle = cmd:GetViewAngles() end

    ded.SetBSendPacket( ultimate.SendPacket )
end

/*
    Render Scene / Anti screengrab
*/
ultimate.UnSafeFrame = false
ultimate.renderTarget = GetRenderTarget( "you" .. os.time(), screenWidth, screenHeight )

do
    local oldsky, oldskycolor, oldwallcolor = ultimate.cfg["custom_sky"], ultimate.cfg["sky_color"], ultimate.cfg["wall_color"]
    local oldskyclr, oldwallclr = ultimate.colors["sky_color"], ultimate.colors["wall_color"]

    if not ultimate.colors["wall_color"] then
        ultimate.colors["wall_color"] = "50 45 65 255"
    end
    local worldcollerp = string.ToColor( ultimate.colors["wall_color"] or "50 45 65 255" )
    local worldmats = Entity( 0 ):GetMaterials()

    local origsky = GetConVar("sv_skyname"):GetString()
    local tsides = {"lf", "ft", "rt", "bk", "dn", "up"}
    local skymat = {}

    for i = 1, 6 do
        skymat[i] = Material("skybox/" .. origsky .. tsides[i])
    end

    local function setSkyboxTexture( skyname )
        for i = 1, 6 do
            local t = Material("skybox/" .. skyname .. tsides[i]):GetTexture("$basetexture")
            skymat[i]:SetTexture("$basetexture", t)
        end
    end

    local function setSkyColor( setcolor )
        local cfg = string.ToColor( ultimate.colors["sky_color"] )
        local vector = setcolor and Vector( cfg.r/255, cfg.g/255, cfg.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, 6 do
            skymat[i]:SetVector( "$color", vector )
        end
    end

    local function setWallColor( setcolor )
        local cfg = string.ToColor( ultimate.colors["wall_color"] )
        worldcollerp = ultimate.ColorLerp( worldcollerp, cfg )
        local vector = setcolor and Vector( worldcollerp.r/255, worldcollerp.g/255, worldcollerp.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, #worldmats do
            local value = worldmats[i]

            Material( value ):SetVector( "$color", vector )
            Material( value ):SetFloat( "$alpha", setcolor and (cfg.a / 255) or 255 )
        end
    end

    function ultimate.RenderScene()

        local newname, newcolor, newcolor2 = ultimate.cfg["custom_sky"], ultimate.cfg["sky_color"], ultimate.cfg["wall_color"]
        local newskyclr, newwallclr = ultimate.colors["sky_color"],ultimate.colors["wall_color"]

        if newskyclr ~= oldskyclr or newcolor ~= oldskycolor then
            setSkyColor( newcolor )

            oldskyclr = newskyclr
            oldskycolor = newcolor
        end

        if newwallclr ~= tostring( worldcollerp ) or newcolor2 ~= oldwallcolor then
            setWallColor( newcolor2 )

            oldwallcolor = newcolor2
        end

        if newname ~= oldsky then
            setSkyboxTexture( newname )
            oldsky = newname
        end

        // Esp shit

        if ( not gui.IsConsoleVisible() && not gui.IsGameUIVisible() ) || ultimate.UnSafeFrame then
            local view = {
                x = 0,
                y = 0,
                w = screenWidth,
                h = screenHeight,
                dopostprocess = true,
                origin = vOrigin,
                angles = vAngle,
                fov = vFOV,
                drawhud = true,
                drawmonitors = true,
                drawviewmodel = true
            }

            render.RenderView( view )
            render.CopyTexture( nil, ultimate.renderTarget )

            cam.Start2D()
                hook.Run( "Ungrabbable2D" )
            cam.End2D()

            cam.Start3D()
                hook.Run( "Ungrabbable3D" )
            cam.End3D()

            render.SetRenderTarget( ultimate.renderTarget )

            return true
        end
    end

end

ultimate.screengrabTexture = nil
ultimate.isCapturing = false

function ultimate.PreScreenGrab()
	if ultimate.isCapturing then return end
	ultimate.isCapturing = true

	if not ultimate.screengrabTexture then
		local mat = Material("a/prikol")
		if mat then
			ultimate.screengrabTexture = mat:GetTexture("$basetexture")
		end
	end

	render.Clear(0, 0, 0, 255, true, true)
	render.RenderView({
		origin = pLocalPlayer:EyePos(),
		angles = pLocalPlayer:EyeAngles(),
		x = 0,
		y = 0,
		w = screenWidth,
		h = screenHeight,
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	})

	if ultimate.cfg["screengrab_image"] and ultimate.screengrabTexture then
		cam.Start2D()
			render.DrawTextureToScreen(ultimate.screengrabTexture)
		cam.End2D()
	end

	ultimate.isCapturing = false
end


/*
    ESP, Chams
*/

function ultimate.IsValidPlayer(pl)
    if pl == pLocalPlayer then return false end
    if not IsValid(pl) then return false end
    if not pl:Alive() then return false end


    return true
end

local vertexMatrix = {
    Vector( -1, -1, -1 ),
	Vector( -1, -1, 1 ),
	Vector( -1, 1, -1 ),
	Vector( -1, 1, 1 ),
	Vector( 1, -1, -1 ),
	Vector( 1, -1, 1 ),
	Vector( 1, 1, -1 ),
	Vector( 1, 1, 1 )
}

function ultimate.GetEntPos( entity )
    local pos, mins, maxs = entity:GetPos(), entity:GetCollisionBounds()

	local size = ( maxs - mins ) * 0.5
	local boxCenter = pos + ( mins + maxs ) * 0.5

	local iMinX, iMinY = math.huge, math.huge
	local iMaxX, iMaxY = -math.huge, -math.huge

	for i = 1, 8 do
		local screenPos = ( boxCenter + vertexMatrix[ i ] * size ):ToScreen()

        iMinX, iMinY, iMaxX, iMaxY = math.min( iMinX, screenPos.x ), math.min( iMinY, screenPos.y ), math.max( iMaxX, screenPos.x ), math.max( iMaxY, screenPos.y )
	end

	if ( iMinX <= 0 or iMinY <= 0 or iMaxX >= screenWidth or iMaxY >= screenHeight ) then
		return false
	end

    return math.ceil( iMaxX ), math.ceil( iMaxY ), math.floor( iMinX ), math.floor( iMinY )
end

function ultimate.getTextX(v,tw,pos)
    if pos == 1 or pos == 2 then
        return tw/2
    elseif pos == 3 then
        return 0
    elseif pos == 4 then
        local f = tw
        if ultimate.cfg["health_bar"] and v.Health > 0 then
            if f == 0 then
                f = f + 8
            else
                f = f + 5
            end
        end
        if ultimate.cfg["armor_bar"] and v.Armor > 0 then
            if f == 0 then
                f = f + 8
            else
                f = f + 5
            end
        end
        return f
    end
end

function ultimate.getTextY(max,min,th,pos,tbpos)
    if pos == 1 then
        return min-th-th*tbpos
    elseif pos == 2 then
        return max+th*tbpos
    elseif pos == 3 then
        return min+th*tbpos - 1
    elseif pos == 4 then
        return min+th*tbpos - 1
    end
end

function ultimate.SortByDistance( f, s )
    local eyePos = pLocalPlayer:EyePos()
    local distF = f[1]:GetPos():DistToSqr(eyePos)
    local distS = s[1]:GetPos():DistToSqr(eyePos)
    return distF < distS
end

function ultimate.GenerateArrowPoss(x, y, scale, ang)
    local ang1 = Angle(0, ang, 0):Forward() * scale
    local ang2 = Angle(0, ang + 120, 0):Forward() * (scale - 1)
    local ang3 = Angle(0, ang - 120, 0):Forward() * (scale - 1)

    local p0 = {x = x, y = y}
    local poly = {
        {x = p0.x + ang1.x, y = p0.y + ang1.y},
        {x = p0.x + ang2.x, y = p0.y + ang2.y},
        {x = p0.x + ang3.x, y = p0.y + ang3.y},
    }
    return poly
end

function ultimate.DrawOutlinedPoly( poly )
    local last = nil
    for i = 1, #poly do
        local v = poly[ i ]
        if last then
            surface.DrawLine(last.x, last.y, v.x, v.y)
            last = v
        else
            last = v
        end
    end
    surface.DrawLine(last.x, last.y, poly[1].x, poly[1].y)
end

ultimate.Fonts = {
    [1] = "veranda",
    [2] = "veranda_s",
    [3] = "thug",
    [4] = "arial",
}

ultimate.BarPadding = 0

function ultimate.DrawBar(MaxX, MaxY, MinX, MinY, Pos, Current, Max, BarColor, BackColor, Gradient, GradientColor)
    if ultimate.BarPadding == 0 then
        ultimate.BarPadding = 6
    else
        ultimate.BarPadding = 11
    end

    local BarX, BarY = MinX-ultimate.BarPadding, MinY-1
    local BarW, BarH = math.floor( MaxX - MinX ), 4
    local FillW, FillH = math.ceil(Current / Max * BarW), BarH

    if Pos > 2 then
        BarW, BarH = 4, math.floor( MaxY - MinY ) + 2
        FillW, FillH = BarW, math.ceil(Current / Max * BarH)
    end

    FillW = math.min(FillW, BarW)
    FillH = math.min(FillH, BarH)

    surface.SetDrawColor(BackColor)
    surface.DrawRect(BarX, BarY, BarW, BarH)

    BarX, BarY = BarX + 1, BarY + 1

    if Pos > 2 then
        BarY = BarY + BarH - FillH
    end

    BarW, BarH = BarW - 2, BarH - 2
    FillW, FillH = FillW - 2, FillH - 2

    surface.SetDrawColor(BarColor)
    surface.DrawRect(BarX, BarY, FillW, FillH)

    if Gradient then
        surface.SetDrawColor(GradientColor)
        surface.SetMaterial(ultimate.Materials["Gradient"])
        surface.DrawTexturedRect(BarX, BarY, FillW, FillH)
    end
end

function ultimate.DrawESP()
    local d = ultimate.cfg["esp_distance"] or 10000
    local ed = ultimate.cfg["ent_esp_distance"] or 10000
    local pos = pLocalPlayer:GetPos()
    d = d * d
    ed = ed * ed

    local fontIdx = ultimate.cfg["esp_font"] or 1
    local fontName = ultimate.Fonts[ fontIdx ] or "DermaSmall"
    surface.SetFont( fontName )

    for i = 1, #ultimate.entity_cache do
        local v = ultimate.entity_cache[ i ]

        if not IsValid( v.entity ) then return end

        if v.position:DistToSqr( pos ) > ed then continue end

        local MaxX, MaxY, MinX, MinY = ultimate.GetEntPos( v.entity )

        if ( not MaxX ) then
            continue
        end

        local XLen, YLen = MaxX - MinX, MaxY - MinY

        local isDormant = v.entity:IsDormant()
        local dormantTime = v.entity.lastSeenTime and (CurTime() - v.entity.lastSeenTime) or 0

        if not v.entity.lastSeenTime then v.entity.lastSeenTime = CurTime() end
        if not isDormant then v.entity.lastSeenTime = CurTime() end

        local alpha = 1
        if isDormant then
            if dormantTime < 2 then
                alpha = math.Clamp(0.8 - dormantTime * 0.2, 0.4, 0.8)
            else
                alpha = 0.25
            end
        end

        surface.SetAlphaMultiplier(alpha)

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg["ent_class"] then
            local tw, th = surface.GetTextSize( v.class )

            surface.SetTextPos( ( MaxX + (MinX - MaxX) / 2 ) - tw / 2 , MinY - th )
            surface.DrawText( v.class )
        end

        if ultimate.cfg["ent_box"] then
            if ultimate.cfg["ent_box_style"] == 1 then
                surface.SetDrawColor(ultimate.Colors[0])
                surface.DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)

                surface.SetDrawColor( ultimate.Colors[255] )
                surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif ultimate.cfg["ent_box_style"] == 2 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )

                surface.SetDrawColor(ultimate.Colors[0])

                // Left up
                surface.DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface.DrawRect( MinX - 1, MinY - 1, 3, hlen )

                // Right up
                surface.DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface.DrawRect( MaxX - 1, MinY - 1, 3, hlen )

                // Left down
                surface.DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface.DrawRect( MinX - 1, MaxY - hlen, 3, hlen )

                // Right down
                surface.DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface.DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )

                surface.SetDrawColor( ultimate.Colors[255] )

                wlen = wlen - 2
                hlen = hlen - 2

                // Left up
                surface.DrawRect( MinX, MinY, wlen, 1 )
                surface.DrawRect( MinX, MinY, 1, hlen )

                // Right up
                surface.DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface.DrawRect( MaxX, MinY, 1, hlen )

                // Left down
                surface.DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface.DrawRect( MinX, MaxY - hlen - 1, 1, hlen )

                // Right down
                surface.DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface.DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif ultimate.cfg["ent_box_style"] == 3 then
                cam.Start3D()
                render.DrawWireframeBox( v.position, v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), ultimate.Colors[255], true )
                cam.End3D()
            end
        end
    end

    local plys = player.GetAll()

    if not ultimate.colors["box_esp"] then ultimate.colors["box_esp"] = "255 255 255 255" end
    if not ultimate.colors["box_gradient"] then ultimate.colors["box_gradient"] = "255 0 0 255" end

    local color_box     = string.ToColor( ultimate.colors["box_esp"] or "255 255 255 255" )
    local color_box_g   = string.ToColor( ultimate.colors["box_gradient"] or "255 0 0 255" )

    local myEyePos = pLocalPlayer:EyePos()

    for i = 1, #plys do
        local v = ultimate.playerCache[ plys[i] ]

        if not v or not ultimate.IsValidPlayer(v.entity) then continue end

        local vp = v.GetPos
        local distance = vp:DistToSqr(pos)
		if distance > d then continue end

        surface.SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        local MaxX, MaxY, MinX, MinY = ultimate.GetEntPos( v.entity )

        if ( not MaxX ) then
            continue
        end

        local XLen, YLen = MaxX - MinX, MaxY - MinY

        local teamcolor = v.TeamColor

        if ultimate.cfg["box_esp"] then
            local sid = v.entity and v.entity:SteamID() or v:SteamID()
            local isInDatabase = ultimate.trackedPlayers and ultimate.trackedPlayers[sid]

            local finalBoxColor = (ultimate.cfg["box_team_color"] and teamcolor or color_box)
            if isInDatabase and ultimate.cfg["priority_box"] then
                finalBoxColor = Color(140, 30, 30)
            end

            local alpha = ultimate.cfg["box_alpha"] or 255
            finalBoxColor = Color(finalBoxColor.r, finalBoxColor.g, finalBoxColor.b, alpha)

            if ultimate.cfg["box_style"] == 1 then
                surface.SetDrawColor(ultimate.Colors[0])
                surface.DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)

                if ultimate.cfg["novosibirskaya_igra"] then
                    surface.SetDrawColor(255, 255, 255, ultimate.cfg["box_alpha"])
                    surface.SetMaterial(ultimate.Materials["Pila"])
                    surface.DrawTexturedRect(MinX, MinY, XLen, YLen)
                elseif ultimate.cfg["mellstroy.game"] then
                    surface.SetDrawColor(255, 255, 255, ultimate.cfg["box_alpha"])
                    surface.SetMaterial(ultimate.Materials["Mellstroy"])
                    surface.DrawTexturedRect(MinX, MinY, XLen, YLen)
                elseif ultimate.cfg["box_fill"] and ultimate.cfg["box_gradient"] then
                    ultimate.DrawGradientBox(MinX, MinY, XLen, YLen, finalBoxColor, color_box_g, true)
                elseif ultimate.cfg["box_fill"] then
                    surface.SetDrawColor(finalBoxColor)
                    surface.DrawRect(MinX,MinY,XLen,YLen)
                else
                    surface.SetDrawColor(finalBoxColor)
                    surface.DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
                end
            elseif ultimate.cfg["box_style"] == 2 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )

                surface.SetDrawColor(ultimate.Colors[0])

                // Left up
                surface.DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface.DrawRect( MinX - 1, MinY - 1, 3, hlen )

                // Right up
                surface.DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface.DrawRect( MaxX - 1, MinY - 1, 3, hlen )

                // Left down
                surface.DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface.DrawRect( MinX - 1, MaxY - hlen, 3, hlen )

                // Right down
                surface.DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface.DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )

                if ultimate.cfg["novosibirskaya_igra"] then
                    surface.SetDrawColor(255, 255, 255, ultimate.cfg["box_alpha"])
                    surface.SetMaterial(ultimate.Materials["Pila"])
                    surface.DrawTexturedRect(MinX, MinY, XLen, YLen)
                elseif ultimate.cfg["mellstroy.game"] then
                    surface.SetDrawColor(255, 255, 255, ultimate.cfg["box_alpha"])
                    surface.SetMaterial(ultimate.Materials["Mellstroy"])
                    surface.DrawTexturedRect(MinX, MinY, XLen, YLen)
                elseif ultimate.cfg["box_fill"] and ultimate.cfg["box_gradient"] then
                    ultimate.DrawGradientBox(MinX, MinY, XLen, YLen, finalBoxColor, color_box_g, true)
                elseif ultimate.cfg["box_fill"] then
                    surface.SetDrawColor(finalBoxColor)
                    surface.DrawRect(MinX, MinY, XLen, YLen)
                else
                    surface.SetDrawColor(finalBoxColor)
                    wlen = wlen - 2
                    hlen = hlen - 2

                    // Left up
                    surface.DrawRect( MinX, MinY, wlen, 1 )
                    surface.DrawRect( MinX, MinY, 1, hlen )

                    // Right up
                    surface.DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                    surface.DrawRect( MaxX, MinY, 1, hlen )

                    // Left down
                    surface.DrawRect( MinX, MaxY - 1, wlen, 1 )
                    surface.DrawRect( MinX, MaxY - hlen - 1, 1, hlen )

                    // Right down
                    surface.DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                    surface.DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
                end
            elseif ultimate.cfg["box_style"] == 3 then
                local wlen, hlen = math.floor( XLen / 3 ), math.floor( YLen / 3 )
                local xc = math.floor( XLen / 2 )

                surface.SetDrawColor(ultimate.Colors[0])

                // Left
                surface.DrawRect( MinX - 1, MinY - 1 + hlen, 3, hlen )

                surface.DrawLine( MinX - 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )
                surface.DrawLine( MinX + 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )

                surface.DrawLine( MinX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )
                surface.DrawLine( MinX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )

                // Right
                surface.DrawRect( MaxX - 1, MinY - 1 + hlen, 3, hlen )

                surface.DrawLine( MaxX - 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )
                surface.DrawLine( MaxX + 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )

                surface.DrawLine( MaxX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )
                surface.DrawLine( MaxX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )

                if ultimate.cfg["novosibirskaya_igra"] then
                    surface.SetDrawColor(255, 255, 255, ultimate.cfg["box_alpha"])
                    surface.SetMaterial(ultimate.Materials["Pila"])
                    surface.DrawTexturedRect(MinX, MinY, XLen, YLen)
                elseif ultimate.cfg["mellstroy.game"] then
                    surface.SetDrawColor(255, 255, 255, ultimate.cfg["box_alpha"])
                    surface.SetMaterial(ultimate.Materials["Mellstroy"])
                    surface.DrawTexturedRect(MinX, MinY, XLen, YLen)
                elseif ultimate.cfg["box_fill"] and ultimate.cfg["box_gradient"] then
                    ultimate.DrawGradientBox(MinX, MinY, XLen, YLen, finalBoxColor, color_box_g, true)
                elseif ultimate.cfg["box_fill"] then
                    surface.SetDrawColor(finalBoxColor)
                    local poly = {
                        { x = MinX + xc, y = MinY },
                        { x = MaxX, y = MinY + hlen },
                        { x = MaxX, y = MaxY - hlen },
                        { x = MinX + xc, y = MaxY },
                        { x = MinX, y = MaxY - hlen },
                        { x = MinX, y = MinY + hlen },
                    }
                    surface.DrawPoly(poly)
                else
                    surface.SetDrawColor(finalBoxColor)
                    // Left
                    surface.DrawRect( MinX, MinY + hlen - 1, 1, hlen )
                    surface.DrawLine( MinX, MinY - 1 + hlen, MinX + xc, MinY )
                    surface.DrawLine( MinX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )

                    // Right
                    surface.DrawRect( MaxX, MinY + hlen - 1, 1, hlen )
                    surface.DrawLine( MaxX, MinY - 1 + hlen, MinX + xc, MinY )
                    surface.DrawLine( MaxX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )
                end
            elseif ultimate.cfg["box_style"] == 4 then
                local wlen, hlen = math.floor( XLen / 3 ) + 3, math.floor( YLen / 3 ) + 3
                local x, y, xw, xh = MinX - 3, MinY - 3, MaxX + 3, MaxY + 3
                local polys = {}

                if ultimate.cfg["box_fill"] and ultimate.cfg["box_gradient"] then
                    ultimate.DrawGradientBox(MinX, MinY, XLen, YLen, finalBoxColor, color_box_g, true)
                elseif ultimate.cfg["box_fill"] then
                    if ultimate.cfg["novosibirskaya_igra"] then
                        surface.SetDrawColor(255, 255, 255, ultimate.cfg["box_alpha"])
                        surface.SetMaterial(ultimate.Materials["Pila"])
                        surface.DrawTexturedRect(MinX, MinY, XLen, YLen)
                    elseif ultimate.cfg["mellstroy.game"] then
                        surface.SetDrawColor(255, 255, 255, ultimate.cfg["box_alpha"])
                        surface.SetMaterial(ultimate.Materials["Mellstroy"])
                        surface.DrawTexturedRect(MinX, MinY, XLen, YLen)
                    else
                        surface.SetDrawColor(finalBoxColor)
                        surface.DrawRect(MinX, MinY, XLen, YLen)
                    end
                end

                surface.SetDrawColor(finalBoxColor)
                for i = 1, 3 do
                    polys = {
                        { x = x + wlen, y = y },
                        { x = xw - wlen, y = y },
                        { x = xw, y = y + hlen },
                        { x = xw, y = xh - hlen },
                        { x = xw - wlen, y = xh },
                        { x = x + wlen, y = xh },
                        { x = x, y = xh - hlen },
                        { x = x, y = y + hlen },
                    }

                    ultimate.DrawOutlinedPoly( polys )

                    wlen, hlen = wlen - i, hlen - i

                    y, x = y + i, x + i
                    xw, xh = xw - i, xh - i
                end
            elseif ultimate.cfg["box_style"] == 5 then
                cam.Start3D()
                render.DrawWireframeBox(v.entity:GetPos(), v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), finalBoxColor, ultimate.cfg["box_fill"])
                cam.End3D()
            elseif ultimate.cfg["box_style"] == 6 then
                local flagStyle = ultimate.cfg["box_flag_style"] or 1
                local thirdHeight = math.floor(YLen / 3)
                
                if flagStyle == 1 then
                    surface.SetDrawColor(255, 255, 255, ultimate.cfg["box_alpha"])
                    surface.DrawOutlinedRect(MinX, MinY, XLen, thirdHeight, 1)
                    surface.DrawRect(MinX+1, MinY+1, XLen-2, thirdHeight-2)
                    
                    surface.SetDrawColor(0, 85, 255, ultimate.cfg["box_alpha"])
                    surface.DrawOutlinedRect(MinX, MinY+thirdHeight, XLen, thirdHeight, 1)
                    surface.DrawRect(MinX+1, MinY+thirdHeight+1, XLen-2, thirdHeight-2)
                    
                    surface.SetDrawColor(255, 0, 0, ultimate.cfg["box_alpha"])
                    surface.DrawOutlinedRect(MinX, MinY+thirdHeight*2, XLen, YLen-thirdHeight*2, 1)
                    surface.DrawRect(MinX+1, MinY+thirdHeight*2+1, XLen-2, YLen-thirdHeight*2-2)
                elseif flagStyle == 2 then
                    surface.SetDrawColor(0, 85, 255, ultimate.cfg["box_alpha"])
                    surface.DrawOutlinedRect(MinX, MinY, XLen, math.floor(YLen/2), 1)
                    surface.DrawRect(MinX+1, MinY+1, XLen-2, math.floor(YLen/2)-2)
                    
                    surface.SetDrawColor(255, 215, 0, ultimate.cfg["box_alpha"])
                    surface.DrawOutlinedRect(MinX, MinY+math.floor(YLen/2), XLen, YLen-math.floor(YLen/2), 1)
                    surface.DrawRect(MinX+1, MinY+math.floor(YLen/2)+1, XLen-2, YLen-math.floor(YLen/2)-2)
                end
            end
        end



        // text

        local ttbl = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }
        local poses = { [1] = MaxX + (MinX - MaxX) / 2, [3] = MaxX+5, [4] = MinX-5 }
        poses[2] = poses[1]

        surface.SetTextColor( ultimate.Colors[255] )

        local sid = v.entity and v.entity:SteamID() or v:SteamID()
        local isInDatabase = ultimate.trackedPlayers and ultimate.trackedPlayers[sid]
        local isInPriority = ultimate.cfg.priority and ultimate.cfg.priority[sid]

        if ultimate.cfg["name"] or isInDatabase or isInPriority then
            local name = ultimate.cfg["novosibirskaya_igra"] and "SWAT" or ultimate.cfg["mellstroy.game"] and "Mellstroy.Game" or v.Name
            local pos = ultimate.cfg["name_pos"]
            local tw, th = surface.GetTextSize(name)

            local isFriend = ultimate.cfg.friends[sid] or (v.entity and v.entity:GetFriendStatus() == "friend")

            if ultimate.cfg["show_priority"] and (isInDatabase or isInPriority) and not isFriend then
                surface.SetTextColor(255, 0, 0, 255)
            elseif isFriend then
                surface.SetTextColor(0, 255, 0, 255)
            else
                surface.SetTextColor(255, 255, 255, 255)
            end

            surface.SetTextPos(poses[pos] - ultimate.getTextX(v, tw, pos), ultimate.getTextY(MaxY, MinY, th, pos, ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg["pitch_player"] then
            local pitch = v.entity and v.entity:EyeAngles().p or (v.EyeAngles and v:EyeAngles().p) or 0
            local name = string.format("Pitch: %.4f", pitch)
            local pos = ultimate.cfg["pitch_player_pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos] - ultimate.getTextX(v, tw, pos), ultimate.getTextY(MaxY, MinY, th, pos, ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg["ping"] then
            local ping = v.entity and v.entity:Ping() or (v.Ping and v:Ping()) or 0
            local name = tostring(ping)
            local pos = ultimate.cfg["ping_pos"]
            local tw, th = surface.GetTextSize('Ping: '..name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText('Ping: '..name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg["usergroup"] then
            local name = v.GetUserGroup
            local pos = ultimate.cfg["usergroup_pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg["weapon"] then
            local name = ultimate.cfg["show_ammo"] and v.WeaponClass .. " (" .. v.WeaponAmmo .. ")" or v.WeaponClass

            if ultimate.cfg["show_reloading"] then
                for i = 0, 13 do
                    if v.entity:IsValidLayer(i) then
                        if v.entity:GetSequenceActivityName(v.entity:GetLayerSequence(i)):find("RELOAD") then
                            name = "RELOADING"
                            break
                        end
                    end
                end
            end

            local pos = ultimate.cfg["weapon_pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg["team"] then
            local name = v.TeamName
            local pos = ultimate.cfg["team_pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg["typing"] then
            local isTyping = false
            if v.entity and v.entity:IsPlayer() then
                isTyping = v.entity:IsTyping() or false
            elseif v:IsPlayer() then
                isTyping = v:IsTyping() or false
            end

            if isTyping then
                local name = "Typing..."
                local pos = ultimate.cfg["typing_pos"]
                local tw, th = surface.GetTextSize(name)

                surface.SetTextPos(poses[pos] - ultimate.getTextX(v, tw, pos), ultimate.getTextY(MaxY, MinY, th, pos, ttbl[pos]))
                surface.DrawText(name)

                ttbl[pos] = ttbl[pos] + 0.8
            end
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg["player_flags"] then
            local player = v.entity or plys[i]
            if IsValid(player) then
                local playerFlags = player:GetFlags()
                local flagList = {
                    FL_ONGROUND, FL_DUCKING, FL_WATERJUMP, FL_ONTRAIN,
                    FL_INRAIN, FL_FROZEN, FL_ATCONTROLS, FL_CLIENT,
                    FL_FAKECLIENT, FL_INWATER
                }
                local flagNames = {
                    [FL_ONGROUND] = "FL_ONGROUND",
                    [FL_DUCKING] = "FL_DUCKING",
                    [FL_WATERJUMP] = "FL_WATERJUMP",
                    [FL_ONTRAIN] = "FL_ONTRAIN",
                    [FL_INRAIN] = "FL_INRAIN",
                    [FL_FROZEN] = "FL_FROZEN",
                    [FL_ATCONTROLS] = "FL_ATCONTROLS",
                    [FL_CLIENT] = "FL_CLIENT",
                    [FL_FAKECLIENT] = "FL_FAKECLIENT",
                    [FL_INWATER] = "FL_INWATER",
                }
                local flags = {}
                for _, flag in ipairs(flagList) do
                    if bit.band(playerFlags, flag) ~= 0 then
                        table.insert(flags, flagNames[flag] or "UNKNOWN")
                    end
                end
                if #flags > 0 then
                    local flagsText = table.concat(flags, ", ")
                    local pos = ultimate.cfg["flags_pos"]
                    local tw, th = surface.GetTextSize(flagsText)

                    local flagColor = string.ToColor(ultimate.colors["player_flags"] or "100 200 255 255")
                    surface.SetTextColor(flagColor.r, flagColor.g, flagColor.b, flagColor.a)
                    surface.SetTextPos(poses[pos] - ultimate.getTextX(v, tw, pos), ultimate.getTextY(MaxY, MinY, th, pos, ttbl[pos]))
                    surface.DrawText(flagsText)

                    ttbl[pos] = ttbl[pos] + 0.8
                end
            end
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg["fake_pitch"] then
            local player = v.entity or plys[i]
            if IsValid(player) and player.fakepitch then
                local name = "FAKE PITCH"
                local pos = ultimate.cfg["fake_pitch_pos"]
                local tw, th = surface.GetTextSize(name)

                local col = string.ToColor(ultimate.colors["fake_pitch"] or "255 0 0 255")
                surface.SetTextColor(col.r, col.g, col.b, col.a)
                surface.SetTextPos(poses[pos] - ultimate.getTextX(v, tw, pos), ultimate.getTextY(MaxY, MinY, th, pos, ttbl[pos]))
                surface.DrawText(name)

                ttbl[pos] = ttbl[pos] + 0.8
            end
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg["target"] then
            if ultimate.target and IsValid(ultimate.target) and ultimate.target:Alive() and ultimate.targetVector then
                local weapon = LocalPlayer():GetActiveWeapon()
                local canShoot = IsValid(weapon)

                if canShoot then
                    local name = "TARGET"
                    local pos = ultimate.cfg["target_pos"]
                    local tw, th = surface.GetTextSize(name)
                    local col = string.ToColor(ultimate.colors["target"] or "255 255 0 255")
                    surface.SetTextColor(col.r, col.g, col.b, col.a)
                    surface.SetTextPos(poses[pos] - ultimate.getTextX(v, tw, pos), ultimate.getTextY(MaxY, MinY, th, pos, ttbl[pos]))
                    surface.DrawText(name)
                    ttbl[pos] = ttbl[pos] + 0.8
                end
            end
        end

        surface.SetTextColor( ultimate.Colors[255] )

        if ultimate.cfg["darkrp_money"] then
            local name = v.MoneyVar
            local pos = ultimate.cfg["money_pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        surface.SetTextColor( ultimate.Colors[255] )

        ultimate.BarPadding = 0

        local health = v.Health
        local maxhealth = v.GetMaxHealth

        if health > 0 then
            if ultimate.cfg["health"] then
                local pos = ultimate.cfg["health_pos"]
                local tw, th = surface.GetTextSize(health)

                surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.DrawText(health)

                ttbl[pos] = ttbl[pos] + 0.8
            end

            if ultimate.cfg["health_bar"] then
                ultimate.DrawBar( MaxX, MaxY, MinX, MinY, 4, health, maxhealth, string.ToColor( ultimate.colors["health"] ), Color(0, 0, 0), ultimate.cfg["health_bar_gradient"], string.ToColor( ultimate.colors["health_bar_gradient"] ) )
            end
        end

        local armor = v.Armor
        local maxarmor = v.GetMaxArmor

        if armor > 0 then
            if ultimate.cfg["armor"] then
                local pos = ultimate.cfg["armor_pos"]
                local tw, th = surface.GetTextSize(armor)

                surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
                surface.DrawText(armor)

                ttbl[pos] = ttbl[pos] + 0.8
            end

            if ultimate.cfg["armor_bar"] then
                ultimate.DrawBar( MaxX, MaxY, MinX, MinY, 4, armor, maxarmor, string.ToColor( ultimate.colors["armor"] ), Color(0, 0, 0), ultimate.cfg["armor_bar_gradient"], string.ToColor( ultimate.colors["armor_bar_gradient"] ) )
            end
        end

        if ultimate.cfg["break_lc"] and v.break_lc then
            local name = "Breaking LC"
            local pos = ultimate.cfg["break_lc_pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextColor( string_ToColor(ultimate.cfg.colors["Break LC"]) )
            surface.SetTextPos(poses[pos]-ultimate.getTextX(tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end


        if ultimate.cfg["simtime_updated"] then
            local name, color
            if v.simtime_updated then
                name = "SIM : Updated"
                color = Color(0,255,0)
            else
                name = "SIM : State"
                color = Color(255,0,0)
            end
            local pos = ultimate.cfg["simtime_pos"]
            local tw, th = surface.GetTextSize(name)
            surface.SetTextColor(color)
            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)
            surface.SetTextColor(255, 255, 255, 255)
            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg["skeleton"] then
            surface.SetDrawColor( string.ToColor( ultimate.colors["skeleton"] ) )

            for i = 0, v.entity:GetBoneCount() - 1 do
                if (not v.entity:BoneHasFlag(i, BONE_USED_BY_HITBOX)) then continue end

                local ParentId = v.entity:GetBoneParent(i)

			    if (not ParentId) then continue end

                if (not v.entity:BoneHasFlag(ParentId, BONE_USED_BY_HITBOX)) then continue end

                local BoneMatrix = v.entity:GetBoneMatrix(i)
                local ParentMatrix = v.entity:GetBoneMatrix(ParentId)

                if (not BoneMatrix or not ParentMatrix) then continue end

                local BonePos = BoneMatrix:GetTranslation()

                if (BonePos == v.entity:GetPos()) then continue end

			    local ParentPos = ParentMatrix:GetTranslation()

			    if (not BonePos or not ParentPos) then continue end

                local screen1, screen2 = BonePos:ToScreen(), ParentPos:ToScreen()

                surface.DrawLine(screen1.x, screen1.y, screen2.x, screen2.y)
            end
        end

        if ultimate.cfg["distance"] then
            local pos = ultimate.cfg["distance_pos"]
            local distance = math.floor(v.entity:GetPos():Distance(LocalPlayer():EyePos()))
            local distanceText = tostring(distance) .. ""
            local tw, th = surface.GetTextSize(distanceText)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(distanceText)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ultimate.cfg["steam_id"] then
            local sid = v.entity and v.entity:SteamID() or (v.SteamID and v:SteamID()) or "BOT"
            local name = tostring(sid)
            local pos = ultimate.cfg["steam_id_pos"]
            local tw, th = surface.GetTextSize(name)

            surface.SetTextPos(poses[pos]-ultimate.getTextX(v,tw,pos),ultimate.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface.DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end
    end
    surface.SetAlphaMultiplier(1)
end

surface.CreateFont("DTFont", { font = "Verdana", size = 15, antialias = false, outline = true } )
surface.CreateFont("XVIDEOS FONT", { font = "Verdana", size = 45, antialias = false, shadow = true } )

ultimate.fovColor = Color( 255, 255, 255 )
ultimate.gradFov = false

//ultimate.bgmaterial = Material( "a/paws.png", "noclamp smooth" )


do
    local lc, blc = Color(125,255,64), Color(255,64,125)

    local indx, indy = screenWidth / 2 - 100, screenHeight/2 + 250
    local charge = 0

    local gradcolor, chargedcolor, unchargedcolor = Color(200,200,200,128), Color(0,255,128), Color(255,155,0)

    local chargestate, ccharge, chargecolor = "NO CHARGE", 200, chargedcolor

    function ultimate.DrawSomeShit()

        if ultimate.cfg["indicators"] then
            local me = pLocalPlayer
            if not IsValid(me) or not ded then return end

            surface.SetFont("DTFont")
            local scrh = ScrH()

            local latency = math.Round((ded.GetLatency(0) + ded.GetLatency(1)) * 1000)

            surface.SetTextPos(15, scrh/2 - 30)
            surface.SetTextColor(me.break_lc and blc or lc)
            surface.DrawText("LagCompensation")

            local choked = ded.GetChokedCommands()
            local fstr = string.format("FK Ticks: %i", choked)
            surface.SetTextPos(15, scrh/2 - 15)
            surface.SetTextColor(choked > 1 and lc or blc)
            surface.DrawText(fstr)

            local velocity = math.Round(me:GetVelocity():Length2D())
            fstr = string.format("Velocity: %i", velocity)
            surface.SetTextPos(15, scrh/2)
            surface.SetTextColor(lc)
            surface.DrawText(fstr)

            local pitch = math.Round(me:EyeAngles().p)
            fstr = string.format("Pitch: %i", pitch)
            surface.SetTextPos(15, scrh/2 + 15)
            surface.SetTextColor(lc)
            surface.DrawText(fstr)

            if ultimate.cfg["anti_aim"] then
                local yawBaseIdx = ultimate.cfg["yaw_base"] or 1
                local yawIdx = ultimate.cfg["yaw"] or 1
                local pitchIdx = ultimate.cfg["pitch"] or 1

                local yawBaseName = ultimate.presets["yaw_base"][yawBaseIdx] or "Unknown"
                local yawName = ultimate.presets["yaw"][yawIdx] or "Unknown"
                local pitchName = ultimate.presets["pitch"][pitchIdx] or "Unknown"

                fstr = string.format("Yaw Base: %s", yawBaseName)
                surface.SetTextPos(15, scrh/2 + 30)
                surface.SetTextColor(lc)
                surface.DrawText(fstr)

                fstr = string.format("Yaw: %s", yawName)
                surface.SetTextPos(15, scrh/2 + 45)
                surface.SetTextColor(lc)
                surface.DrawText(fstr)

                fstr = string.format("Pitch Mode: %s", pitchName)
                surface.SetTextPos(15, scrh/2 + 60)
                surface.SetTextColor(lc)
                surface.DrawText(fstr)
            end
        end

        if ultimate.cfg["tickbase_shift"] and ultimate.cfg["tickbase_indicator"] then
            if ded.GetCurrentCharge() <= ultimate.cfg["shift_ticks"] then
                ccharge = ded.GetCurrentCharge() * 294 / ultimate.cfg["shift_ticks"]
            end

            charge = math.Approach(charge,ccharge,FrameTime()*700)

            if ded.GetCurrentCharge() == 0 then
                chargestate = "NO CHARGE"
                chargecolor = unchargedcolor
            elseif ded.GetCurrentCharge() < ultimate.cfg["shift_ticks"] and ultimate.IsKeyDown( ultimate.binds["auto_recharge"] ) then
                chargestate = "CHARGING"
                chargecolor = unchargedcolor
            else
                chargestate = "READY"
                chargecolor = chargedcolor
            end

            local tw, th = surface.GetTextSize(chargestate)

            surface.SetDrawColor(ultimate.Colors[12])
            surface.DrawRect(indx-42,indy-500,300,7)

            surface.SetDrawColor(chargecolor)
            surface.DrawRect(indx-40,indy-498,charge,3)

            surface.SetDrawColor( gradcolor )
            surface.SetMaterial( ultimate.Materials["Gradient right"] )
            surface.DrawTexturedRect( indx-40,indy-498,charge,3 )

            surface.SetTextColor( ultimate.Colors[245] )

            surface.SetTextPos( indx-40,indy-518 )
            surface.DrawText( "CHARGE "..ded.GetCurrentCharge() )

            surface.SetTextPos( indx+256-tw,indy-518 )
            surface.DrawText( chargestate )
        end

        local CT = CurTime()
        local FT = FrameTime() * 128

        if ultimate.cfg["hitmarker"] and #ultimate.hitmarkers > 0 then
            local hm = string.ToColor( ultimate.colors["hitmarker"] )

            surface.SetDrawColor( hm )

            for i = #ultimate.hitmarkers, 1, -1  do
                local v = ultimate.hitmarkers[ i ]

                if v.time < CT - 1 then table.remove( ultimate.hitmarkers, i ) continue end

                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT )

                surface.DrawLine( ( screenWidth * 0.5 ) - v.add, ( screenHeight * 0.5 ) - v.add, ( screenWidth * 0.5 ) - 10 - v.add, ( screenHeight * 0.5 ) - 10 - v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) + v.add, ( screenHeight * 0.5 ) - v.add, ( screenWidth * 0.5 ) + 10 + v.add, ( screenHeight * 0.5 ) - 10 - v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) - v.add, ( screenHeight * 0.5 ) + v.add, ( screenWidth * 0.5 ) - 10 - v.add, ( screenHeight * 0.5 ) + 10 + v.add )
                surface.DrawLine( ( screenWidth * 0.5 ) + v.add, ( screenHeight * 0.5 ) + v.add, ( screenWidth * 0.5 ) + 10 + v.add, ( screenHeight * 0.5 ) + 10 + v.add )
            end
        end

        if ultimate.cfg["hitnumbers"] and #ultimate.hitnums > 0 then
            local n, c = string.ToColor( ultimate.colors["hitnumbers"] ), string.ToColor( ultimate.colors["hitnumbers_krit"] )

            surface.SetFont( "veranda_scr" )

            for i = #ultimate.hitnums, 1, -1 do
                local v = ultimate.hitnums[ i ]

                if v.time < CT - 1 then table.remove( ultimate.hitnums, i ) continue end

                surface.SetTextColor( v.crit and c or n )

                v.add = math.Approach( v.add, v.add - (CT - 1) * 5, FT / 2 )

                surface.SetTextPos( ( screenWidth * 0.5 ) - v.add * v.xdir, ( screenHeight * 0.5 ) - v.add * v.ydir )
                surface.DrawText( v.dmg )
            end
        end

        if ultimate.cfg["fov_limit"] and ultimate.cfg["show_fov"] then
            local col = string.ToColor( ultimate.colors["show_fov"] )
            local radius = ultimate.GetFovRadius()
            local cx, cy = screenWidth * 0.5, screenHeight * 0.5
            local segments = 100

            surface.SetDrawColor( col.r, col.g, col.b, col.a )
            for i = 0, segments - 1 do
                local angle1 = (i / segments) * math.pi * 2
                local angle2 = ((i + 1) / segments) * math.pi * 2
                local x1 = cx + math.cos(angle1) * radius
                local y1 = cy + math.sin(angle1) * radius
                local x2 = cx + math.cos(angle2) * radius
                local y2 = cy + math.sin(angle2) * radius
                surface.DrawLine(x1, y1, x2, y2)
            end
        end

        if ultimate.target and ultimate.targetVector then
            if ultimate.cfg["aimbot_snapline"] then
                local pos = ultimate.targetVector:ToScreen()
                surface.SetDrawColor( string.ToColor( ultimate.colors["aimbot_snapline"] ) )
                surface.DrawLine( pos.x, pos.y, ( screenWidth * 0.5 ), ( screenHeight * 0.5 ) )
            end

            if ultimate.cfg["aimbot_marker"] then
                local pos = ultimate.targetVector:ToScreen()
                local markerMode = ultimate.cfg["aimbot_marker_mode"] or 1

                if markerMode == 2 then
                    local radius = 4
                    surface.SetDrawColor(0, 0, 0, 255)
                    surface.DrawCircle(pos.x, pos.y, radius + 1)
                    local col = string.ToColor(ultimate.colors["aimbot_marker"])
                    surface.SetDrawColor(col.r, col.g, col.b, col.a)
                    surface.DrawCircle(pos.x, pos.y, radius)
                else
                    surface.SetDrawColor( 0, 0, 0 )
                    surface.DrawRect( pos.x - 6, pos.y - 6, 5, 3 )
                    surface.DrawRect( pos.x + 2, pos.y - 6, 5, 3 )

                    surface.DrawRect( pos.x - 6, pos.y + 4, 5, 3 )
                    surface.DrawRect( pos.x + 2, pos.y + 4, 5, 3 )

                    surface.DrawRect( pos.x - 6, pos.y - 6, 3, 5 )
                    surface.DrawRect( pos.x + 4, pos.y - 6, 3, 5 )

                    surface.DrawRect( pos.x - 6, pos.y + 2, 3, 5 )
                    surface.DrawRect( pos.x + 4, pos.y + 2, 3, 5 )

                    surface.SetDrawColor( string.ToColor( ultimate.colors["aimbot_marker"] ) )

                    surface.DrawRect( pos.x - 5, pos.y - 5, 3, 1 )
                    surface.DrawRect( pos.x + 3, pos.y - 5, 3, 1 )

                    surface.DrawRect( pos.x - 5, pos.y + 5, 3, 1 )
                    surface.DrawRect( pos.x + 3, pos.y + 5, 3, 1 )

                    surface.DrawRect( pos.x - 5, pos.y - 5, 1, 3 )
                    surface.DrawRect( pos.x + 5, pos.y - 5, 1, 3 )

                    surface.DrawRect( pos.x - 5, pos.y + 3, 1, 3 )
                    surface.DrawRect( pos.x + 5, pos.y + 3, 1, 3 )
                end
            end
        end


        if ultimate.cfg["watermark_xxx"] then
            ultimate.DrawWatermark()
        end

        surface.SetFont( "veranda" )

        if ultimate.cfg[ "on_screen_logs" ] and table.Count( ultimate.onScreenLogs ) > 0 then
            local tick = engine.TickCount()
            local x, y = screenWidth / 2, screenHeight / 2 + 45

            for k, v in pairs( ultimate.onScreenLogs ) do

                if ultimate.TICKS_TO_TIME( tick - ultimate.onScreenLogs[ k ].tick ) > 8 then
                    ultimate.onScreenLogs[ k ] = nil
                    continue
                end

                local data = ultimate.onScreenLogs[ k ]
                local fstr = ""

                for o = 1, #data[ 1 ] do
                    fstr = fstr .. data[ 1 ][ o ]
                end

                local tw, th = surface.GetTextSize( fstr )

                x = x - tw / 2

                for p = 1, #data[ 1 ] do
                    local str = data[ 1 ][ p ]
                    tw, th = surface.GetTextSize( str )

                    surface.SetTextPos( x, y )
                    local color = data[ 2 ][ p ]
                    if color and color.r and color.g and color.b then
                        surface.SetTextColor( color.r, color.g, color.b, color.a or 255 )
                    else
                        surface.SetTextColor( 255, 255, 255, 255 )
                    end
                    surface.DrawText( str )

                    x = x + tw
                end

                x, y = screenWidth / 2, y + th
            end
        end

       local plys = player.GetAll()

       if ultimate.cfg["player_info"] and ultimate.frame:IsVisible() then
            draw.RoundedBox(0, 0, ScrH() - 440, 380, 440, Color(7, 7, 7))

            surface.SetDrawColor(107, 107, 107)
            surface.DrawOutlinedRect(12, ScrH() - 440 + 12, 380 - 24, 440 - 24)
            surface.DrawOutlinedRect(20, ScrH() - 440 + 30, 380 - 40, 86)
            surface.DrawOutlinedRect(20, ScrH() - 440 + 30 + 93, 380 - 40, 295)

            local w = 380
            for y = 0, 24 do
                local t = y / 24
                local r = 25 + (25 - 25) * t
                local g = 25 + (25 - 25) * t
                local b = 25 + (25 - 25) * t
                surface.SetDrawColor(math.floor(r), math.floor(g), math.floor(b))
                surface.DrawRect(0, ScrH() - 440 + y, w, 1)
            end
            surface.SetFont("BudgetLabel")
            surface.SetTextColor(255, 255, 255)
            surface.SetTextPos(150, ScrH() - 440 + 6)
            surface.DrawText("kremlin hack")
            if not IsValid(ultimate.avatar) then
                ultimate.avatar = vgui.Create("AvatarImage")
                ultimate.avatar:SetSize(80, 80)
                ultimate.avatar:SetPos(25, ScrH() - 430 + 25)
                ultimate.avatar:SetPlayer(LocalPlayer(), 64)
            end

            local nick = LocalPlayer():Nick()
            local boxW = 240
            local boxH = 36
            local panelInnerX = 20
            local panelInnerW = w - 40

            local shiftRight = 40
            local desiredX = panelInnerX + (panelInnerW - boxW) / 2 + shiftRight

            local boxX = math.Clamp(desiredX, panelInnerX, panelInnerX + panelInnerW - boxW)
            local boxY = ScrH() - 430 + 28


            draw.RoundedBox(4, boxX, boxY, boxW, boxH, Color(18,18,18,220))

            surface.SetDrawColor(95,95,95,200)
            surface.DrawOutlinedRect(boxX, boxY, boxW, boxH)


            surface.SetFont("BudgetLabel")
            local tw, th = surface.GetTextSize(nick)
            surface.SetTextColor(235,235,235)
            surface.SetTextPos(boxX + (boxW - tw) / 2, boxY + (boxH - th) / 2)
            surface.DrawText(nick)




            local panelX = 20
            local panelY = ScrH() - 440 + 30 + 93
            local panelW = 380 - 40
            local panelH = 295
            if not IsValid(ultimate.userInfoTabsPanel) then
                ultimate.userInfoTabsPanel = vgui.Create("DPanel")
                ultimate.userInfoTabsPanel:SetMouseInputEnabled(true)
                ultimate.userInfoTabsPanel:SetKeyboardInputEnabled(false)
                ultimate.userInfoTabsPanel.Paint = function() end


                ultimate.userInfoTabButtons = {}
                for _, name in ipairs(ultimate.tabNames or {}) do
                    local btn = vgui.Create("DButton", ultimate.userInfoTabsPanel)
                    btn:SetTall(24)
                    btn:Dock(TOP)
                    btn:DockMargin(6, 6, 6, 0)
                    btn:SetText("")
                    btn.Paint = function(self, w, h)
                        if ultimate.activetab == name or self:IsDown() then
                            surface.SetDrawColor(60, 60, 60, 200)
                            surface.SetTextColor(206, 0, 0)
                        elseif self:IsHovered() then
                            surface.SetDrawColor(45, 45, 45, 200)
                            surface.SetTextColor(235, 235, 235)
                        else
                            surface.SetDrawColor(35, 35, 35, 200)
                            surface.SetTextColor(200, 200, 200)
                        end
                        surface.DrawRect(0, 0, w, h)
                        surface.SetFont("DermaSmall")
                        local tw, th = surface.GetTextSize(name)
                        surface.SetTextPos((w - tw) / 2, (h - th) / 2)
                        surface.DrawText(name)
                    end
                    btn.DoClick = function()
                        ultimate.activetab = name
                        if ultimate.initTab then ultimate.initTab(name) end
                    end
                    table.insert(ultimate.userInfoTabButtons, btn)
                end
            end


            if IsValid(ultimate.userInfoTabsPanel) then
                ultimate.userInfoTabsPanel:SetPos(panelX, panelY)
                ultimate.userInfoTabsPanel:SetSize(panelW, panelH)
                ultimate.userInfoTabsPanel:SetVisible(true)
            end


            if IsValid(ultimate.avatar) then
                ultimate.avatar:SetSize(80, 80)
                ultimate.avatar:SetPos(25, ScrH() - 430 + 25)
                ultimate.avatar:SetVisible(true)
            end
        else
            if IsValid(ultimate.avatar) then
                ultimate.avatar:SetVisible(false)
            end
            if IsValid(ultimate.userInfoTabsPanel) then
                ultimate.userInfoTabsPanel:SetVisible(false)
            end
        end

        if ultimate.cfg["spectator_list"] then
            ultimate.spectatorPos = ultimate.spectatorPos or {x = screenWidth - 220, y = screenHeight / 2 - 100}
            ultimate.spectatorDrag = ultimate.spectatorDrag or {active = false, offsetX = 0, offsetY = 0}

            local specs = {}
            for k, v in ipairs(plys) do
                if not IsValid(v) then continue end
                local vName = v:Name()
                if not vName then continue end
                if v:GetObserverMode() ~= 0 and v:GetObserverTarget() == pLocalPlayer then
                    local userGroup = v:GetUserGroup() or "user"
                    table.insert(specs, {name = vName, group = userGroup, target = "YOU", targetGroup = "local"})
                elseif v:GetObserverMode() ~= 0 then
                    local target = v:GetObserverTarget()
                    if IsValid(target) then
                        local targetName = target:Name()
                        local targetGroup = target:GetUserGroup() or "user"
                        if targetName then
                            table.insert(specs, {name = vName, group = v:GetUserGroup() or "user", target = targetName, targetGroup = targetGroup})
                        end
                    end
                end
            end

            local panelW = 320
            local panelH = #specs > 0 and (18 + #specs * 16) or 35
            local x, y = ultimate.spectatorPos.x, ultimate.spectatorPos.y

            if input.IsMouseDown(MOUSE_LEFT) then
                local mx, my = input.GetCursorPos()
                if not ultimate.spectatorDrag.active then
                    if mx >= x and mx <= x + panelW and my >= y and my <= y + 16 then
                        ultimate.spectatorDrag.active = true
                        ultimate.spectatorDrag.offsetX = mx - x
                        ultimate.spectatorDrag.offsetY = my - y
                    end
                end

                if ultimate.spectatorDrag.active then
                    ultimate.spectatorPos.x = mx - ultimate.spectatorDrag.offsetX
                    ultimate.spectatorPos.y = my - ultimate.spectatorDrag.offsetY
                    x, y = ultimate.spectatorPos.x, ultimate.spectatorPos.y
                end
            else
                ultimate.spectatorDrag.active = false
            end

            surface.SetDrawColor(11, 11, 11)
            surface.DrawRect(x, y, panelW, panelH)

            surface.SetDrawColor(180, 120, 220)
            surface.DrawRect(x, y, panelW, 16)

            surface.SetDrawColor(50, 50, 50)
            surface.DrawOutlinedRect(x, y, panelW, panelH)

            surface.SetFont("DermaSmall")
            surface.SetTextColor(180, 120, 220)
            surface.SetTextPos(x + 6, y + 1)
            surface.DrawText("SPECTATORS")

            if #specs == 0 then
                surface.SetTextColor(120, 120, 120)
                surface.SetTextPos(x + 6, y + 18)
                surface.DrawText("no spectators online")
            else
                local py = y + 18
                for i, spec in ipairs(specs) do
                    surface.SetTextColor(200, 200, 200)
                    surface.SetTextPos(x + 6, py)
                    surface.DrawText(spec.name)

                    surface.SetTextColor(150, 150, 150)
                    surface.SetTextPos(x + 6 + surface.GetTextSize(spec.name) + 8, py)
                    surface.DrawText("spectating")

                    local targetGroup = spec.targetGroup or "user"
                    surface.SetTextColor(180, 120, 220)
                    surface.SetTextPos(x + 6 + surface.GetTextSize(spec.name) + 8 + surface.GetTextSize("spectating") + 4, py)
                    surface.DrawText("[" .. targetGroup .. "]")

                    surface.SetTextColor(200, 200, 200)
                    surface.SetTextPos(x + 6 + surface.GetTextSize(spec.name) + 8 + surface.GetTextSize("spectating") + 4 + surface.GetTextSize("[" .. targetGroup .. "]") + 4, py)
                    surface.DrawText(spec.target)

                    py = py + 16
                end
            end
        end

        if ultimate.cfg["crosshair"] then
            local centerX = ScrW() / 2
            local centerY = ScrH() / 2
            local crosshairType = ultimate.cfg["crosshair_type"]

            ultimate.RotationAngle = ultimate.RotationAngle or 0
            local scale = ultimate.cfg["uber_alles_scale"]
            local speed = ultimate.cfg["uber_alles_speed"]
            local crosshairColor = string.ToColor(ultimate.colors["crosshair_color"])
            local outlineColor = string.ToColor(ultimate.colors["crosshair_outline"])

            local frameTime = FrameTime()
            ultimate.RotationAngle = ultimate.RotationAngle - (frameTime * speed)

            if ultimate.RotationAngle <= -180 then
                ultimate.RotationAngle = ultimate.RotationAngle + 180
            elseif ultimate.RotationAngle >= 180 then
                ultimate.RotationAngle = ultimate.RotationAngle - 180
            end

            if crosshairType == 1 then
                local function DrawCrosshairLine(red, x, y)
                if red == 0 then
                    surface.SetDrawColor(outlineColor.r, outlineColor.g, outlineColor.b, outlineColor.a)
                else
                    surface.SetDrawColor(crosshairColor.r, crosshairColor.g, crosshairColor.b, crosshairColor.a)
                end

                local points = {}
                local angle1_rad = math.rad(ultimate.RotationAngle - 90)
                points[1] = math.floor(scale * math.sin(angle1_rad))
                points[2] = math.floor(scale * math.cos(angle1_rad))
                points[3] = math.floor(scale * math.cos(angle1_rad + 1))

                local angle2_rad = math.rad(ultimate.RotationAngle)
                points[4] = math.floor(scale * math.sin(angle2_rad))
                points[5] = math.floor(scale * math.cos(angle2_rad))
                points[6] = math.floor(scale * math.sin(angle2_rad + 1))

                local angle3_rad = math.rad(ultimate.RotationAngle + 90)
                points[7] = math.floor(scale * math.sin(angle3_rad))
                points[8] = math.floor(scale * math.cos(angle3_rad))
                points[9] = math.floor(scale * math.cos(angle3_rad + 1))

                local angle4_rad = math.rad(ultimate.RotationAngle + 180)
                points[10] = math.floor(scale * math.sin(angle4_rad))
                points[11] = math.floor(scale * math.cos(angle4_rad))
                points[12] = math.floor(scale * math.sin(angle4_rad + 1))

                surface.DrawLine(x, y, x + points[1], y - points[2])
                surface.DrawLine(x + points[1], y - points[2], x + points[1], y - points[3])
                surface.DrawLine(x, y, x + points[4], y - points[5])
                surface.DrawLine(x + points[4], y - points[5], x + points[6], y - points[5])
                surface.DrawLine(x, y, x + points[7], y - points[8])
                surface.DrawLine(x + points[7], y - points[8], x + points[7], y - points[9])
                surface.DrawLine(x, y, x + points[10], y - points[11])
                surface.DrawLine(x + points[10], y - points[11], x + points[12], y - points[11])
                end

                local screenWidth = centerX
                local screenHeight = centerY
                DrawCrosshairLine(0, screenWidth - 1, screenHeight)
                DrawCrosshairLine(0, screenWidth, screenHeight - 1)
                DrawCrosshairLine(0, screenWidth + 1, screenHeight)
                DrawCrosshairLine(0, screenWidth, screenHeight + 1)
                DrawCrosshairLine(0, screenWidth - 1, screenHeight - 1)
                DrawCrosshairLine(0, screenWidth + 1, screenHeight - 1)
                DrawCrosshairLine(0, screenWidth - 1, screenHeight + 1)
                DrawCrosshairLine(0, screenWidth + 1, screenHeight + 1)
                DrawCrosshairLine(255, screenWidth, screenHeight)

            elseif crosshairType == 2 then
                local function DrawCircle(x, y, radius, segments, color)
                    surface.SetDrawColor(color.r, color.g, color.b, color.a)
                    for i = 0, segments - 1 do
                        local angle1 = (i / segments) * 2 * math.pi
                        local angle2 = ((i + 1) / segments) * 2 * math.pi
                        local x1 = x + radius * math.cos(angle1)
                        local y1 = y + radius * math.sin(angle1)
                        local x2 = x + radius * math.cos(angle2)
                        local y2 = y + radius * math.sin(angle2)
                        surface.DrawLine(x1, y1, x2, y2)
                    end
                end

                local circleRadius = math.max(3, scale / 4)
                local orbitRadius = scale
                local numCircles = 20

                for i = 0, numCircles - 1 do
                    local angle = ultimate.RotationAngle + (i * 360 / numCircles)
                    local angleRad = math.rad(angle)

                    local circleX = centerX + orbitRadius * math.cos(angleRad)
                    local circleY = centerY + orbitRadius * math.sin(angleRad)

                    DrawCircle(circleX, circleY, circleRadius + 1, 12, outlineColor)
                    DrawCircle(circleX, circleY, circleRadius, 12, crosshairColor)
                end
            end
        end

        if ultimate.cfg["velocity_indicator"] then
            if not IsValid(LocalPlayer()) then return end

            local ply = LocalPlayer()
            local velocity = math.floor(ply:GetVelocity():Length2D())

            ultimate.velocityHistory = ultimate.velocityHistory or {}
            ultimate.maxVelocityEver = ultimate.maxVelocityEver or 0

            table.insert(ultimate.velocityHistory, velocity)

            if velocity > ultimate.maxVelocityEver then
                ultimate.maxVelocityEver = velocity
            end

            if #ultimate.velocityHistory > 100 then
                table.remove(ultimate.velocityHistory, 1)
            end

            local lineWidth = 200
            local lineHeight = 50
            local graphX = math.floor(ScrW() / 2 - lineWidth / 2)
            local graphY = math.floor(ScrH() / 2 + 200)

            if #ultimate.velocityHistory > 1 then
                local maxVel = math.max(ultimate.maxVelocityEver, 100)

                surface.SetDrawColor(255, 255, 255, 255)
                for i = 2, #ultimate.velocityHistory do
                    local prevVel = math.Clamp(ultimate.velocityHistory[i-1] / maxVel, 0, 1)
                    local currVel = math.Clamp(ultimate.velocityHistory[i] / maxVel, 0, 1)

                    local x1 = graphX + (i-2) * (lineWidth / (#ultimate.velocityHistory - 1))
                    local y1 = graphY + lineHeight - (prevVel * lineHeight)
                    local x2 = graphX + (i-1) * (lineWidth / (#ultimate.velocityHistory - 1))
                    local y2 = graphY + lineHeight - (currVel * lineHeight)

                    surface.DrawLine(x1, y1, x2, y2)
                end
            end

            surface.SetFont("veranda")
            local text = tostring(velocity)
            local tw, th = surface.GetTextSize(text)

            local x = graphX + lineWidth + 20
            local y = graphY + lineHeight / 2 - th / 2

            local color = string.ToColor(ultimate.colors["velocity_indicator"]) or Color(255, 255, 255, 255)
            surface.SetTextColor(color.r, color.g, color.b, color.a)
            surface.SetTextPos(x, y)
            surface.DrawText(text)
        end



        if ultimate.cfg["target_name"] then
            if ultimate.target and IsValid(ultimate.target) and ultimate.target:Alive() and ultimate.targetVector then
                local weapon = LocalPlayer():GetActiveWeapon()
                local canShoot = false
                if IsValid(weapon) and weapon.Primary and weapon.Primary.ClipSize ~= -1 then
                    canShoot = weapon:Clip1() > 0
                else
                    canShoot = true
                end

                if canShoot and ultimate.targetVector then
                    local ply = ultimate.target
                    local name = (ply.Nick and ply:Nick()) or "Unknown"
                    local sw, sh = ScrW(), ScrH()
                    local text = "Target: " .. name

                    surface.SetFont("veranda")
                    local tw, th = surface.GetTextSize(text)
                    local x = (sw / 2) - (tw / 2)
                    local y = (sh / 2) + 34

                    local clrStr = ultimate.colors[""] or "255 255 255 255"
                    local r, g, b, a = 255, 255, 255, 255
                    if clrStr then
                        local t = {}
                        for num in string.gmatch(clrStr, "%d+") do
                            t[#t+1] = tonumber(num)
                        end
                        r = t[1] or 255
                        g = t[2] or 255
                        b = t[3] or 255
                        a = t[4] or 255
                    end

                    surface.SetTextColor(r, g, b, a)
                    surface.SetTextPos(x, y)
                    surface.DrawText(text)
                end
            end
        end

        if ultimate.cfg["keybind_list"] then
            if not ultimate.keybindListData then
                ultimate.keybindListData = { x = 10, y = ScrH() / 2, dragging = false, dx = 0, dy = 0 }
            end
            local data = ultimate.keybindListData

            local pressed = {}
            for name, key in pairs(ultimate.binds or {}) do
                if key and key ~= 0 and ultimate.IsKeyDown and ultimate.IsKeyDown(key) then
                    local lname = tostring(name):lower()
                    if not string.find(lname, "menu", 1, true) then
                        local v = ultimate.cfg and ultimate.cfg[name]
                        if v == nil or v == true then
                            local keyName = (input.GetKeyName and input.GetKeyName(key)) or tostring(key)
                            pressed[#pressed+1] = {label = tostring(name), key = tostring(string.upper(keyName or ""))}
                        end
                    end
                end
            end

            surface.SetFont("veranda")
            local keybindCount = #pressed
            local listHeight = math.max(keybindCount * 15, 15)
            local listWidth = 200

            local mx, my = gui.MousePos()
            local overList = mx >= data.x and mx <= data.x + listWidth and my >= data.y and my <= data.y + listHeight
            if overList and input.IsMouseDown(MOUSE_LEFT) and not data.dragging then
                data.dragging = true
                data.dx = mx - data.x
                data.dy = my - data.y
            end
            if data.dragging then
                if input.IsMouseDown(MOUSE_LEFT) then
                    data.x = math.Clamp(mx - data.dx, 0, ScrW() - listWidth)
                    data.y = math.Clamp(my - data.dy, 0, ScrH() - listHeight)
                else
                    data.dragging = false
                end
            end

            if keybindCount > 0 then
                local y = data.y
                for i = 1, #pressed do
                    local text = pressed[i].label .. ": " .. pressed[i].key

                    surface.SetTextPos(data.x, y)
                    surface.SetTextColor(255, 255, 255)
                    surface.DrawText(text)

                    y = y + 15
                end
            else
                surface.SetTextPos(data.x, data.y)
                surface.SetTextColor(255, 255, 255)
                surface.DrawText("no keybinds")
            end
        end

        if ultimate.cfg["player_line"] then
            local playerTrail = playerTrail or {}

            local ply = LocalPlayer()
            if ply:IsValid() then
                if ply:Alive() then
                    table.insert(playerTrail, ply:GetPos())
                    while #playerTrail > 100 do
                        table.remove(playerTrail, 1)
                    end
                else
                    playerTrail = {}
                end
            end

            for i = 1, #playerTrail - 1 do
                local startPos = playerTrail[i] + Vector(0, 0, 10)
                local endPos = playerTrail[i + 1] + Vector(0, 0, 10)
                local t = i / #playerTrail
                local hue = Lerp(t, 300, 0)
                local color = HSVToColor(hue, 1, 1)
                render.DrawLine(startPos, endPos, color, true)
            end
        end

        if ultimate.cfg["github_sync"] then
            if not ultimate.githubSyncLoaded then
                ultimate.githubSyncLoaded = true
                ultimate.trackedPlayersDB = {}
                ultimate.trackedPlayers = {}
                ultimate.presentPlayers = {}

                http.Fetch("https://raw.githubusercontent.com/kadilakandproshe/GoidaBaza/main/Baze", function(body, len, headers, code)
                    if code == 200 and body and body ~= "" then
                        ultimate.trackedPlayers = {}
                        ultimate.trackedPlayersDB = {}
                        local count = 0

                        for _, line in ipairs(string.Split(body, "\n")) do
                            local steamid = string.Trim(line)
                            if steamid ~= "" and string.StartWith(steamid, "STEAM_") then
                                ultimate.trackedPlayers[steamid] = true
                                ultimate.trackedPlayersDB[steamid] = true
                                count = count + 1
                            end
                        end

                        if count > 0 then
                            chat.AddText(Color(255,0,0), "[ultimate v3.7] ", Color(255,255,255), "База загружена: " .. count .. " записей")
                        end
                    else
                        chat.AddText(Color(255,0,0), "[ultimate v3.7] ", Color(255,255,255), "Не удалось загрузить базу данных")
                    end
                end, function(err)
                    chat.AddText(Color(255,0,0), "[ultimate v3.7] ", Color(255,255,255), "Ошибка загрузки: " .. err)
                end)
            end

            if ultimate.trackedPlayersDB and next(ultimate.trackedPlayersDB) then
                ultimate.lastCheckedPlayers = ultimate.lastCheckedPlayers or {}
                local current = {}

                for _, ply in ipairs(player.GetAll()) do
                    if IsValid(ply) then
                        local steamId = ply:SteamID()
                        if steamId and ultimate.trackedPlayersDB[steamId] then
                            current[steamId] = ply:Nick() or "Unknown"
                        end
                    end
                end

                for sid, nick in pairs(current) do
                    if not ultimate.lastCheckedPlayers[sid] then
                        chat.AddText(Color(255,0,0), "[ultimate v3.7] ", Color(255,255,255), nick .. " подключился")
                        ultimate.lastCheckedPlayers[sid] = nick
                        ultimate.presentPlayers[sid] = nick
                    end
                end

                for sid, nick in pairs(ultimate.lastCheckedPlayers) do
                    if not current[sid] then
                        chat.AddText(Color(255,0,0), "[ultimate v3.7] ", Color(255,255,255), nick .. " отключился")
                        ultimate.lastCheckedPlayers[sid] = nil
                        ultimate.presentPlayers[sid] = nil
                    end
                end
            end
        else
            if ultimate.githubSyncLoaded then
                ultimate.githubSyncLoaded = false
                ultimate.trackedPlayersDB = {}
                ultimate.trackedPlayers = {}
                ultimate.presentPlayers = {}
            end
        end

        if ultimate.cfg["show_records"] then
            for i = 1, #plys do
                local v = plys[i]

                if not ultimate.IsValidPlayer(v) then continue end
                if not ultimate.canBacktrack(v) then continue end

                local records = ultimate.btrecords[v]
                if not records then continue end

                local len = #records
                if len == 0 then continue end

                surface.SetDrawColor(ultimate.Colors[255])

                for j = 1, len do
                    local record = records[j]
                    if not record or not record.aimpos then continue end

                    local pos = record.aimpos:ToScreen()
                    if not pos.visible then continue end

                    surface.DrawRect(pos.x - 1, pos.y - 1, 2, 2)
                end
            end
        end

    end

    surface.SetAlphaMultiplier(1)
end









function ultimate.DrawWatermark()

    surface.SetFont("veranda")

	local ping = me:Ping()
	local tickrate = math.floor(1 / engine.TickInterval())

    local txt = ultimate.cfg["watermark_text"] .. " | ".. me:Name() .." | " .. ping .. "ms | " .. tickrate .. " tick"

    local txtsizex, txtsizey = surface.GetTextSize(txt)

    local style = ultimate.cfg["watermark_xxx_style"] or 1

    if style == 1 then
        draw.RoundedBox(2, 5, 3, txtsizex+10, txtsizey+3, Color(36,36,36,234))
        draw.RoundedBox(2, 5, 3, txtsizex+10, 3, Color(255, 0, 0))
        draw.SimpleText(txt, "veranda", 10, 6, Color(255,255,255))
    else
        local box_width = txtsizex + 10
        local box_height = txtsizey + 6
        local stripe_height = math.floor(box_height / 3)

        draw.RoundedBox(0, 5, 3, box_width, stripe_height, Color(255, 255, 255, 255))
        draw.RoundedBox(0, 5, 3 + stripe_height, box_width, stripe_height, Color(0, 57, 166, 255))
        draw.RoundedBox(0, 5, 3 + stripe_height * 2, box_width, box_height - stripe_height * 2, Color(213, 43, 30, 255))

        draw.SimpleText(txt, "veranda", 11, 8, Color(0, 0, 0, 180))
        draw.SimpleText(txt, "veranda", 10, 7, Color(255, 255, 255, 255))
    end

end

ultimate.kd = false
function ultimate.togglevisible()
    if ultimate.frame:IsVisible() then
        ultimate.frame:SetVisible(false)

        if multicomboP then ultimate.ui.RemovePanel( multicomboP ) end
        if ultimate.ui.ColorWindow then ultimate.ui.RemovePanel( ultimate.ui.ColorWindow ) end
        if ultimate.ui.ultimatePan then ultimate.ui.RemovePanel( ultimate.ui.ultimatePan ) end

        RememberCursorPosition()

        if ultimate.validsnd then ultimate.validsnd:Pause() end
    else
        ultimate.frame:SetVisible(true)

        RestoreCursorPosition()
        if ultimate.validsnd then ultimate.validsnd:Play() end
    end
end


ultimate.rData = ultimate.rData or {}

function ultimate.PrePlayerDraw( pEntity, iFlags )
    if ( pEntity == pLocalPlayer ) then
        return
    end

    if ultimate.cfg["taunt_disabler"] then
        pEntity:AnimResetGestureSlot( GESTURE_SLOT_VCD )
        pEntity:AnimResetGestureSlot( GESTURE_SLOT_CUSTOM )
    end

    pEntity:SetPoseParameter( "head_pitch", 0 )
    pEntity:SetPoseParameter( "head_yaw", 0 )

    if ( ultimate.cfg["pitch_resolver"] and pEntity.fakepitch ) then
        pEntity:SetPoseParameter( "aim_pitch", -89 )
        pEntity:SetPoseParameter( "head_pitch", -89 )
    end

    if ultimate.cfg["taunt_resolver"] and pEntity ~= LocalPlayer() then
        local seq = pEntity:GetSequence()
        local seqName = pEntity:GetSequenceName(seq)
        local taunt = false

        if pEntity:IsPlayingTaunt() then
            taunt = true
        elseif seqName then
            seqName = seqName:lower()
            if seqName:find("taunt")
            or seqName:find("gesture")
            or seqName:find("act")
            or seqName:find("dance")
            or seqName:find("pose") then
                taunt = true
            end
        end

        if taunt then
            local lp = LocalPlayer()
            if IsValid(lp) then
                local ang = (lp:EyePos() - pEntity:EyePos()):Angle()

                pEntity:SetPlaybackRate(0)
                pEntity:SetCycle(0)

                pEntity:SetPoseParameter("move_yaw", 0)
                pEntity:SetPoseParameter("aim_yaw", ang.y)
                pEntity:SetPoseParameter("aim_pitch", math.Clamp(ang.p, -89, 89))

                pEntity:SetRenderAngles(Angle(0, ang.y, 0))

                pEntity:InvalidateBoneCache()
                pEntity:SetupBones()
            end
        else
            pEntity:SetPlaybackRate(1)
            pEntity:SetPoseParameter("aim_pitch", 0)
            pEntity:SetPoseParameter("aim_yaw", 0)
        end
    end

    pEntity:InvalidateBoneCache()
    pEntity:SetupBones()

    pEntity.ChatGestureWeight = 0
end

// Chams

// 0 - false
// 1 - true

/*
CreateMaterial("myasnik", VertexLitGeneric". {
    ["$wireframe"] = 1,
    ["$model"] = 1,
    ["Pidoras"] = 1,
    ["la-la-la-la"] = 0,
    [""] = 10,
} )
*/

CreateMaterial("flat", "VertexLitGeneric")
CreateMaterial("flat_z", "VertexLitGeneric", {
    ["$ignorez"] = 1
} )

CreateMaterial( "selfillum", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial( "selfillum_a", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )

CreateMaterial( "selfillum_a_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0.0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )

CreateMaterial("wireframe", "VertexLitGeneric", {
	["$wireframe"] = 1,
})
CreateMaterial("wireframe_z", "VertexLitGeneric", {
	["$wireframe"] = 1,
    ["$ignorez"] = 1,
})

CreateMaterial("metallic", "VertexLitGeneric", {
	["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
})
CreateMaterial("metallic_z", "VertexLitGeneric", {
    ["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0 1 1 ]",
    ["$envmapfresnel"] = "1",
    ["$alpha"] = "0.5",
    ["$ignorez"] = 1,
})

CreateMaterial("glass", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0.5 0.5 0.5 ]",
    ["$translucent"] = "1",
    ["$alpha"] = "0.3",
})

CreateMaterial("glass_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$envmap"] = "env_cubemap",
    ["$envmaptint"] = "[ 0.5 0.5 0.5 ]",
    ["$translucent"] = "1",
    ["$alpha"] = "0.3",
    ["$ignorez"] = 1,
})

ultimate.chamMats = {
    vis = {
        Material("!flat"), -- flat
        Material("!wireframe"), -- wireframe
        Material("!selfillum"), -- glow
        Material("!selfillum_a"), -- glow outline
        Material("!metallic"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    },
    invis = {
        Material("!flat_z"), -- flat
        Material("!wireframe_z"), -- wireframe
        Material("!selfillum_z"), -- glow
        Material("!selfillum_a_z"), -- glow outline
        Material("!metallic_z"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
    }
}

do
    local f = (1/255)

    function ultimate.RenderScreenspaceEffects()
        if ultimate.UnSafeFrame then return end

        if ultimate.cfg["novosibirskaya_igra"] then
            render.FogMode(1)
            render.FogStart(0)
            render.FogEnd(5000)
            render.FogMaxDensity(1)
            render.FogColor(255, 0, 0)

            local tab = {
                ["$pp_colour_addr"] = 0.5,
                ["$pp_colour_addg"] = 0,
                ["$pp_colour_addb"] = 0,
                ["$pp_colour_brightness"] = 0,
                ["$pp_colour_contrast"] = 1,
                ["$pp_colour_colour"] = 1,
                ["$pp_colour_mulr"] = 0,
                ["$pp_colour_mulg"] = 0,
                ["$pp_colour_mulb"] = 0
            }
            DrawColorModify(tab)
        end

        local vm, invm = ultimate.cfg["visible_mat"], ultimate.cfg["invisible_mat"]
        local sin = math.floor( math.sin( CurTime() * 4 ) * 45 )

        if not ultimate.colors["visible_chams"] then ultimate.colors["visible_chams"] = "255 0 0 255" end
        if not ultimate.colors["invisible_chams"] then ultimate.colors["invisible_chams"] = "0 255 0 255" end
        if not ultimate.colors["self_chams"] then ultimate.colors["self_chams"] = "0 0 255 255" end

        local vc = string.ToColor(ultimate.colors["visible_chams"] or "255 0 0 255")
        local invc = string.ToColor(ultimate.colors["invisible_chams"] or "0 255 0 255")
        local sc = string.ToColor(ultimate.colors["self_chams"] or "0 0 255 255")

        cam.Start3D()
            for k, v in pairs(player.GetAll()) do
                if not IsValid(v) or v == pLocalPlayer or not v:Alive() or v:IsDormant() then continue end

                if ultimate.cfg["supress_lighting"] then
                    render.SuppressEngineLighting(true)
                end

                if ultimate.cfg["invisible_chams"] then
                    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( invc.r / 255, invc.g / 255, invc.b / 255 ) )
                    render.MaterialOverride(ultimate.chamMats.invis[invm])
                    render.SetColorModulation(invc.r/255,invc.g/255,invc.b/255)

                    if invm == 7 then
                        render.SetBlend( (sin + 100) / 255 )
                    end

                    v:SetRenderMode(1)
                    v:DrawModel()

                    if ultimate.cfg["invisible_chams_w"] then
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if ultimate.cfg["visible_chams"] then
                    ultimate.chamMats.vis[6]:SetVector( "$envmaptint", Vector( vc.r / 255, vc.g / 255, vc.b / 255 ) )
                    render.MaterialOverride(ultimate.chamMats.vis[vm])
                    render.SetColorModulation(vc.r/255,vc.g/255,vc.b/255)

                    if vm == 7 then
                        render.SetBlend( (sin + 100) / 255 )
                    end

                    v:DrawModel()

                    if ultimate.cfg["visible_chams_w"] then
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if ultimate.cfg["supress_lighting"] then
                    render.SuppressEngineLighting(false)
                end

            end

            if ultimate.cfg["self_chams"] and IsValid(pLocalPlayer) and pLocalPlayer:Alive() then

                if ultimate.cfg["supress_self_lighting"] then
                    render.SuppressEngineLighting(true)
                end

                ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( sc.r / 255, sc.g / 255, sc.b / 255 ) )
                render.MaterialOverride(ultimate.chamMats.vis[ultimate.cfg["self_mat"]])
                render.SetColorModulation(sc.r/255,sc.g/255,sc.b/255)

                if ultimate.cfg["self_mat"] == 7 then
                    render.SetBlend( (sin + 100) / 255 )
                else
                    render.SetBlend(sc.a/255)
                end

                pLocalPlayer:SetRenderMode(1)
                pLocalPlayer:DrawModel()

                if ultimate.cfg["self_chams_w"] then
                    local w = pLocalPlayer:GetActiveWeapon()
                    if IsValid(w) then w:DrawModel() end
                end

                if ultimate.cfg["supress_self_lighting"] then
                    render.SuppressEngineLighting(false)
                end

            end




        cam.End3D()

        render.SetColorModulation(1, 1, 1)
        render.SetBlend(1)
        render.MaterialOverride()
    end
end


// Client side models

function ultimate.CS_Model(mdl)
    local model = ClientsideModel(mdl)
	model:SetNoDraw(true)

    return model
end

function ultimate.CS_Model_update(ply,model,tbl)
    if not ply or not model or not tbl then return end

    local mdl = model
    local playerModel = ply:GetModel()
    local layers = tbl.layers

    for i = 0, 13 do
        if mdl:IsValidLayer(i) then
            local l = layers[i]
            mdl:SetLayerCycle(l.cycle)
            mdl:SetLayerSequence(l.sequence)
            mdl:SetLayerWeight(l.weight)
        end
    end

    mdl:SetSequence(tbl.sequence)
    mdl:SetCycle(tbl.cycle)

    mdl:SetPoseParameter("aim_pitch", tbl.angles.p)
	mdl:SetPoseParameter("head_pitch", 0)
	mdl:SetPoseParameter("body_yaw", tbl.angles.y)
	mdl:SetPoseParameter("aim_yaw", 0)

	mdl:SetPoseParameter("move_x", tbl.movex)
	mdl:SetPoseParameter("move_y", tbl.movey)

    mdl:SetAngles( Angle( 0, tbl.angles.y, 0 ) )
    mdl:SetModel( playerModel )
	mdl:SetPos( tbl.origin )
end

function ultimate.PostDrawTranslucentRenderables()
    if ultimate.cfg["land_pos"] and pLocalPlayer:Alive() and not pLocalPlayer:IsOnGround() then
        local pos = pLocalPlayer:GetPos()
        local vel = pLocalPlayer:GetVelocity()
        local velSqr = vel:LengthSqr()

        if velSqr >= 100 then
            local g = GetConVar("sv_gravity"):GetFloat()
            local dt = 0.015
            local gdt = g * dt

            local simPos = Vector(pos.x, pos.y, pos.z)
            local simVel = Vector(vel.x, vel.y, vel.z)

            local trajectory = {}
            local trajCount = 0
            local landPos, timeToImpact

            for i = 0, 1000 do
                simVel.z = simVel.z - gdt
                simPos.x = simPos.x + simVel.x * dt
                simPos.y = simPos.y + simVel.y * dt
                simPos.z = simPos.z + simVel.z * dt

                if i % 3 == 0 then
                    trajCount = trajCount + 1
                    trajectory[trajCount] = Vector(simPos.x, simPos.y, simPos.z)
                end

                local tr = util.TraceLine({
                    start = simPos,
                    endpos = simPos - Vector(0, 0, 10),
                    filter = pLocalPlayer,
                    mask = MASK_PLAYERSOLID
                })

                if tr.Hit then
                    landPos = tr.HitPos
                    timeToImpact = i * dt
                    trajCount = trajCount + 1
                    trajectory[trajCount] = landPos
                    break
                end
            end

            if landPos then
                local color = string.ToColor(ultimate.colors["land_pos"])
                local whiteColor = Color(255, 255, 255, 255)

                cam.Start3D()
                    render.SetColorMaterial()

                    local invTrajCount = 1 / trajCount
                    for i = 1, trajCount - 1 do
                        local alpha = 150 + 105 * (i * invTrajCount)
                        whiteColor.a = alpha
                        render.DrawLine(trajectory[i], trajectory[i + 1], whiteColor, false)
                    end

                    render.DrawSphere(landPos, 8, 16, 8, color)
                cam.End3D()

                local screenPos = landPos:ToScreen()
                if screenPos.visible then
                    cam.Start2D()
                        local timeText = string.format("%.2fs", timeToImpact)
                        surface.SetFont("Trebuchet24")
                        local tw, th = surface.GetTextSize(timeText)
                        local halfTw = tw * 0.5
                        local halfTh = th * 0.5

                        draw.RoundedBox(4, screenPos.x - halfTw - 8, screenPos.y - halfTh - 25, tw + 16, th + 10, Color(0, 0, 0, 200))
                        draw.SimpleText(timeText, "Trebuchet24", screenPos.x, screenPos.y - 20, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
                    cam.End2D()
                end
            end
        end
    end

    if ultimate.cfg["player_hat"] and ultimate.tpenabled then
        local ply = LocalPlayer()
        if IsValid(ply) and ply:Alive() then
            local headHitbox = ply:LookupAttachment("eyes")
            local headAttachment = ply:GetAttachment(headHitbox)
            if headAttachment then
                local headPos = headAttachment.Pos
                local radius = 10
                local height = 15
                local baseOffset = 5
                local coneTop = headPos + Vector(0, 0, height)
                local basePos = headPos + Vector(0, 0, baseOffset)
                cam.Start3D()
                    local segments = 16
                    for i = 1, segments do
                        local theta1 = ((i - 1) / segments) * 2 * math.pi
                        local theta2 = (i / segments) * 2 * math.pi
                        local x1 = math.cos(theta1) * radius
                        local y1 = math.sin(theta1) * radius
                        local x2 = math.cos(theta2) * radius
                        local y2 = math.sin(theta2) * radius
                        local base1 = basePos + Vector(x1, y1, 0)
                        local base2 = basePos + Vector(x2, y2, 0)
                        local time = CurTime() % 1
                        local color = HSVToColor(time * 360, 1, 1)
                        render.DrawLine(base1, coneTop, color, false)
                        render.DrawLine(base1, base2, color, false)
                    end
                cam.End3D()
            end
        end
    end

    if ultimate.cfg["player_line"] then
        ultimate.playerTrail = ultimate.playerTrail or {}
        ultimate.trailFadeTime = ultimate.trailFadeTime or {}
        local ply = LocalPlayer()
        local fps = math.max(1 / FrameTime(), 1)
        local fadeMultiplier = math.Clamp(fps / 60, 0.5, 2)

        if IsValid(ply) then
            if ply:Alive() then
                local currentPos = ply:GetPos()
                local lastPos = ultimate.playerTrail[#ultimate.playerTrail]

                if not lastPos or currentPos:DistToSqr(lastPos) > 100 then
                    table.insert(ultimate.playerTrail, currentPos)
                    table.insert(ultimate.trailFadeTime, CurTime())

                    while #ultimate.playerTrail > 100 do
                        table.remove(ultimate.playerTrail, 1)
                        table.remove(ultimate.trailFadeTime, 1)
                    end
                end
            else
                ultimate.playerTrail = {}
                ultimate.trailFadeTime = {}
            end
        end

        local currentTime = CurTime()
        for i = #ultimate.playerTrail, 1, -1 do
            local timeAlive = currentTime - ultimate.trailFadeTime[i]
            if timeAlive > (3 / fadeMultiplier) then
                table.remove(ultimate.playerTrail, i)
                table.remove(ultimate.trailFadeTime, i)
            end
        end

        cam.Start3D()
        for i = 1, #ultimate.playerTrail - 1 do
            local startPos = ultimate.playerTrail[i] + Vector(0, 0, 10)
            local endPos = ultimate.playerTrail[i + 1] + Vector(0, 0, 10)
            local t = i / #ultimate.playerTrail
            local hue = Lerp(t, 300, 0)
            local timeAlive = currentTime - ultimate.trailFadeTime[i]
            local alpha = math.Clamp(255 - (timeAlive * fadeMultiplier * 85), 50, 255)
            local color = HSVToColor(hue, 1, 1)
            color.a = alpha
            render.DrawLine(startPos, endPos, color, true)
        end
        cam.End3D()
    end

    if ultimate.cfg["melee_circle"] then
        local weapon = pLocalPlayer:GetActiveWeapon()
        if IsValid(weapon) then
            local wc = weapon:GetClass()
            local tbl

            for i = 1, #ultimate.knifes do
                if string.StartsWith(wc, ultimate.knifes[i].str) then
                    tbl = ultimate.knifes[i]
                    break
                end
            end

            if tbl then
                local leftDist = tbl.leftdist
                local rightDist = tbl.rightdist
                local maxDistSqr = math.max(leftDist, rightDist)
                local maxDist = math.sqrt(maxDistSqr)

                local eyePos = pLocalPlayer:GetShootPos()
                local eyeAngles = pLocalPlayer:EyeAngles()
                local forward = eyeAngles:Forward()
                local right = eyeAngles:Right()
                local facestab = ultimate.cfg["facestab"]

                local baseColor = string.ToColor(ultimate.colors["melee_circle"])
                local colorGreen = Color(0, 255, 0, 200)
                local colorRed = Color(255, 0, 0, 200)

                local isFirstPerson = not pLocalPlayer:ShouldDrawLocalPlayer()
                local centerPos = isFirstPerson and (eyePos + forward * 32 - Vector(0, 0, 32)) or pLocalPlayer:GetPos()

                local players = player.GetAll()
                local targetInRange
                local canHitTarget = false

                for i = 1, #players do
                    local ply = players[i]
                    if IsValid(ply) and ply:Alive() and ply ~= pLocalPlayer then
                        local plyPos = ply:GetPos()
                        local distSqr = eyePos:DistToSqr(plyPos)

                        if distSqr <= maxDistSqr then
                            local canHit = facestab or (tbl.canbackstab and ultimate:EntityFaceBack(ply))

                            local trHull = util.TraceHull({
                                start = eyePos,
                                endpos = plyPos,
                                mins = Vector(-4, -4, -4),
                                maxs = Vector(4, 4, 4),
                                filter = {pLocalPlayer, weapon},
                                mask = MASK_SHOT
                            })

                            if trHull.Entity == ply then
                                targetInRange = true
                                if canHit then
                                    canHitTarget = true
                                    break
                                end
                            end
                        end
                    end
                end

                local circleColor = canHitTarget and colorGreen or (targetInRange and colorRed or baseColor)

                cam.Start3D()
                    render.SetColorMaterial()

                    local segments = 64
                    local twoPi = 2 * math.pi
                    local yaw = eyeAngles.y
                    local yawRad = math.rad(yaw)
                    local cosYaw = math.cos(yawRad)
                    local sinYaw = math.sin(yawRad)

                    for i = 0, segments - 1 do
                        local angle1 = (i / segments) * twoPi
                        local angle2 = ((i + 1) / segments) * twoPi

                        local cos1 = math.cos(angle1)
                        local sin1 = math.sin(angle1)
                        local cos2 = math.cos(angle2)
                        local sin2 = math.sin(angle2)

                        local x1 = maxDist * (cos1 * cosYaw - sin1 * sinYaw)
                        local y1 = maxDist * (cos1 * sinYaw + sin1 * cosYaw)
                        local x2 = maxDist * (cos2 * cosYaw - sin2 * sinYaw)
                        local y2 = maxDist * (cos2 * sinYaw + sin2 * cosYaw)

                        local startPos = Vector(centerPos.x + x1, centerPos.y + y1, centerPos.z + 5)
                        local endPos = Vector(centerPos.x + x2, centerPos.y + y2, centerPos.z + 5)

                        render.DrawLine(startPos, endPos, circleColor, false)
                    end
                cam.End3D()
            end
        end
    end

    if ultimate.UnSafeFrame then return end

    ultimate.drawCSModels_backtrack()
    ultimate.drawCSModels_real()

    render.SetBlend(1)
    render.MaterialOverride()

end


// Backtracking

ultimate.btrecords = {}
ultimate.predicted = {}












function ultimate.canBacktrack(ply)
    if not ultimate.cfg["backtrack"] then return false end
    if not IsValid(ply) then return false end
    if not ultimate.btrecords[ply] then return false end
    if ply.break_lc then return false end
    if ultimate.cfg["sampling_interval"] > 0 and (not ultimate.lastSampleTime or CurTime() - ultimate.lastSampleTime > 0.5) then
        return false
    end

    return true
end

function ultimate.recordBacktrack(ply)
	local maxBacktrackTime = ultimate.cfg["backtrack_time"] / 1000
	local lerpTime = ultimate.cfg["lerptime_adjust"] and ultimate.GetLerpTime() or 0
	local adjustedBacktrackTime = maxBacktrackTime + lerpTime
	local deadtime = ultimate.ROUND_TO_TICK(CurTime() - adjustedBacktrackTime)
	local minSampleInterval = ultimate.cfg["sampling_interval"] / 1000

	if ultimate.lastSampleTime and CurTime() - ultimate.lastSampleTime < minSampleInterval then
		return
	end
	ultimate.lastSampleTime = CurTime()

	local records = ultimate.btrecords[ply]

	if not records then
        records = {}
		ultimate.btrecords[ply] = records
	end

	local validRecords = {}
	for i = 1, #records do
		local record = records[i]
		if record.simulationtime >= deadtime then
			validRecords[#validRecords + 1] = record
		end
	end
	ultimate.btrecords[ply] = validRecords
	records = validRecords

	if not ply:Alive() then return end
    if ply.break_lc then return end

	local simulationtime = ded.GetSimulationTime(ply:EntIndex())
	local len = #records
	local simtimechanged = true

	if len > 0 then
		simtimechanged = records[len].simulationtime < simulationtime
	end

	if not simtimechanged then return end

	local layers = {}
	for i = 0, 13 do
		if ply:IsValidLayer(i) then
			layers[i] = {
				cycle = ply:GetLayerCycle(i),
				sequence = ply:GetLayerSequence(i),
				weight = ply:GetLayerWeight(i)
			}
		end
	end

    local eyeAngles = ply:EyeAngles()
    local x,y = eyeAngles.x, eyeAngles.y

    local bdata = {}
    for i = 0, ply:GetBoneCount() - 1 do
        local v, a = ply:GetBonePosition( i )
        bdata[i] = { vec = v, ang = a }
    end

    local hdata = {}
    local hset = ply:GetHitboxSet()
    local hnum = ply:GetHitBoxCount( hset )

    for hitbox = 0, hnum - 1 do
        local bone = ply:GetHitBoxBone( hitbox, hset )

        if bone == nil then continue end

        local mins, maxs = ply:GetHitBoxBounds( bone, hset )

        if not mins or not maxs then continue end

        local bonepos, ang = ply:GetBonePosition( bone )
        mins:Rotate( ang )
        maxs:Rotate( ang )

        hdata[ #hdata + 1 ] = { pos = bonepos, mins = mins, maxs = maxs }
    end

    local skeletondata = {}

    for i = 0, ply:GetBoneCount() - 1 do
        local parent = ply:GetBoneParent(i)

        if not parent or parent == -1 then continue end

        local bonepos = ply:GetBonePosition(i)

        if bonepos == ply:GetPos() then continue end

        local parentpos = ply:GetBonePosition(parent)

        if not bonepos or not parentpos then continue end

        skeletondata[#skeletondata + 1] = {
            bone = bonepos:ToScreen(),
            parent = parentpos:ToScreen()
        }
    end

	local newRecord = {
		simulationtime =    simulationtime,
		angles =            Angle(x,y,0),
		origin =            ply:GetNetworkOrigin(),
		aimpos =            ultimate.GetBones( ply )[1],
		sequence =          ply:GetSequence(),
		cycle =             ply:GetCycle(),
		layers =            layers,
        movex =             ply:GetPoseParameter("move_x"),
        movey =             ply:GetPoseParameter("move_y"),
        bonedata =          bdata,
        hitboxdata =        hdata,
        skeleton =          skeletondata,
        velocity =          ply:GetVelocity(),
        ducking =           ply:Crouching(),
        onground =          ply:IsOnGround(),
        health =            ply:Health(),
        armor =             ply:Armor(),
        tick =              engine.TickCount(),
        latency =           ded.GetLatency(0) + ded.GetLatency(1)
    }

    if len > 64 then
        table.remove(records, 1)
    end

	records[#records + 1] = newRecord
end

ultimate.btmodel = ultimate.CS_Model("models/player/kleiner.mdl")

function ultimate.drawCSModels_backtrack()
    if not ultimate.cfg["backtrack_chams"] then return end
    if not ultimate.canBacktrack(ultimate.target) then return end

    local len = #ultimate.btrecords[ultimate.target]
    local tbl = ultimate.btrecords[ultimate.target][ultimate.backtracktick]
    local m = ultimate.btmodel

    ultimate.CS_Model_update(ultimate.target,m,tbl)

    if ultimate.cfg["backtrack_fullbright"] then
        render.SuppressEngineLighting(true)
    end

    local col = string.ToColor(ultimate.colors["backtrack_chams"])
    ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render.MaterialOverride(ultimate.chamMats.invis[ultimate.cfg["backtrack_material"]])
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    m:SetRenderMode(1)
    m:DrawModel()

    if ultimate.cfg["backtrack_fullbright"] then
        render.SuppressEngineLighting(false)
    end
end

ultimate.hitmarkers = {}
ultimate.killHitboxes = {}
ultimate.hitHitboxes = {}

function ultimate.DrawEntityHitboxes(ent, color, duration)
    if not IsValid(ent) then return end

    local data = {
        entity = ent,
        model = ent:GetModel(),
        origin = ent:GetPos(),
        angles = ent:GetAngles(),
        sequence = ent:GetSequence(),
        cycle = ent:GetCycle(),
        color = color,
        endTime = CurTime() + duration,
        hitboxData = {}
    }

    local hset = ent:GetHitboxSet()
    local hnum = ent:GetHitBoxCount(hset)

    for hitbox = 0, hnum - 1 do
        local bone = ent:GetHitBoxBone(hitbox, hset)
        if bone then
            local mins, maxs = ent:GetHitBoxBounds(hitbox, hset)
            local pos, ang = ent:GetBonePosition(bone)
            if mins and maxs and pos then
                table.insert(data.hitboxData, {
                    bone = bone,
                    mins = mins,
                    maxs = maxs,
                    pos = pos,
                    ang = ang
                })
            end
        end
    end

    return data
end

function ultimate.AddKillHitbox(ent)
    if not ultimate.cfg["kill_hitbox"] then return end
    local color = string.ToColor(ultimate.colors["kill_hitbox"])
    local data = ultimate.DrawEntityHitboxes(ent, color, 3)
    if data then
        table.insert(ultimate.killHitboxes, data)
    end
end

function ultimate.AddHitHitbox(ent)
    if not ultimate.cfg["hit_hitbox"] then return end
    local color = string.ToColor(ultimate.colors["hit_hitbox"])
    local data = ultimate.DrawEntityHitboxes(ent, color, 2)
    if data then
        table.insert(ultimate.hitHitboxes, data)
    end
end
ultimate.hitnums = {}

gameevent.Listen( "player_hurt" )

function ultimate.player_hurt(data)
    local attackerid = data.attacker
    local victim = Player(data.userid)
    local attacker = Player(attackerid)
    local localPlayer = LocalPlayer()

    if attacker == localPlayer and IsValid(victim) then
        ultimate.AddHitHitbox(victim)
        ultimate.lastHitTick = engine.TickCount()
    end

    if not IsValid(victim) then return end

    local healthAfter = data.health or 0
    local healthBefore = victim:Health()
    local calculatedDamage = math.max(0, healthBefore - healthAfter)
    local damage = (data.dmg and data.dmg > 0) and data.dmg or calculatedDamage

    if attackerid == localPlayer:UserID() then

        if ultimate.cfg["on_screen_logs"] then
            local hlcolor = string.ToColor(ultimate.colors["on_screen_logs"])
            ultimate.onScreenLogs[engine.TickCount()] = {
                tick = engine.TickCount(),
                {
                    "Hit ",
                    victim:Name(),
                    " for ",
                    damage,
                    " damage"
                },
                {
                    ultimate.HitLogsWhite,
                    hlcolor,
                    ultimate.HitLogsWhite,
                    hlcolor,
                    ultimate.HitLogsWhite,
                }
            }
        end

        if ultimate.cfg["hitmarker"] then
            ultimate.hitmarkers[#ultimate.hitmarkers + 1] = { time = CurTime(), add = 0 }
        end

        if ultimate.cfg["hitnumbers"] then
            ultimate.hitnums[#ultimate.hitnums + 1] = {
                time = CurTime(),
                add = 0,
                xdir = math.random(-1, 1),
                ydir = math.random(-1, 1),
                dmg = damage,
                crit = healthAfter <= 0
            }
        end

        if ultimate.cfg["hitsound"] then
            if not (ultimate.cfg["killsound"] and healthAfter <= 0) then
                surface.PlaySound( ultimate.cfg["hitsound_str"] )
            end
        end

        if ultimate.cfg["resolver"] then
            local d = ultimate.rData[victim:EntIndex()]
            if d then
                d.miss = math.max(0, d.miss - 1)
            end
        end
    end
end


/*
    Player vars
*/

function ultimate.initPlayerVars( v )
    v.ult_prev_pos = Vector()

    v.ult_prev_simtime = 0
    v.ult_cur_simtime = 0
    v.flticks = 0
    v.aimshots = 0
    v.missedanimticks = 0

    v.break_lc = false
    v.simtime_updated = false
    v.fakepitch = false

    ultimate.btrecords[ v ] = {}
    ultimate.predicted[ v ] = {}
end

for k, v in ipairs(player.GetAll()) do
    ultimate.initPlayerVars( v )
end


ultimate.chatmsg =
{
    [1] = {
        "1 нищий упал",
        "$$$ кешбек по зубам $$$",
        "╭∩╮( ⚆ ʖ ⚆)╭∩╮ ДоПрыГался(ت)ДрУжоЧеК",
        "ты куда жертва козьего аборта",
        "iq?",
        "·٠●•۩۞۩ОтДыХаЙ (ٿ) НуБяРа۩۞۩•●٠·",
        "але , а противники то где???",
        "ты по легиту играешь ?",
        "ебать ты красиво на бутылку присел , тебе дать альт ?",
        "свежий кабанчик",
        "АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК [XML-RPC] No-Spread 24/7 | aim_ag_texture_2 ONLYnot ",
        "на мыло и веревку то деньги есть????",
        "откисай сочняра",
        "И камнем внииииииизззззззззnot ",
        "Я прямо как Ильназ Галяиев",
        "Я муслим мне похуй на кризис мой пенис вырос",
        "Вот тебе паяльник , запаяй себе ебальник",
        "оттарабанен армянская королева",
        "сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
        "Я твою маму дуже сильно поважаю , нехай береже її Степан Бендера",
        "упал хуета ебаная , но в боди забрал да похуй все равно упал",
        "не противник",
        "Loading… ██████████ Lifehack.cfg Activated",
        "Tapt by Anti-Hack",
        "чето умер...",
        "Найс софт чел без читов ты 0",
        "Чел ты без читов 0",
        "Держи зонтик тебя абасали",
        "Го 1 на 1 или зассал?Точно ты же до 1 считать не умееш...",
        "упавший на медию никогда не встанет с колен.",
        "Черные глаза Вспоминаю — умираю Черные глаза Я только о тебе мечтаю",
        "меня админ заставляет это заинжектить",
        "алло это скорая? тут такая ситуация парню который упал нужна скорая)",
        "Извини дорогая , не хотел на лицо",
        "прости что без смазки)",
        "через процесс хакер инжектить?",
        "лол ору ты прямо как 𓀐𓂸𓀐𓂸𓀐𓂸𓀐𓂸𓀐𓂸",
        "обе чернокожие головы превратились в кубики льда… Бере.",
        "Ало скорая тут такой случай шкiла упала в месорубку",
        "ты то куда лезешь сын фантомного стационарного спец изолированого металлформовочного механизма",
        "99 имен Аллаhа для детей",
        "Rindfleischetikettierungsüberwachungsaufgaben- übertragungsgesetz",
        "Лето 2015",
        "у тебя член не конский не по масти эпик фейл",
        "гелим гелим гелим на валике",
        "Приходи один работёнка естьnot , координаты: 55.8653382,49.304329",
        "ХУЕПРЫГАЛО ТУСОВОЧНОЕ КУДА ПОЛЕТЕЛО",
        "юид полиция подьехала открывай дверь уебыч",
        "набутылирован лол",
        "tranny holzed",
        "але ты там из хрущевки выеди а потом вырыгивай блять",
        "как там с мамкой комнату разделять АХАХАХХАХА как ты на акк накопил блять",
        "найс 0.5х0.5м комната блять ХАХАХАХА ТЫ ТАМ ЖЕ ДАЖЕ ПОВЕСИТЬСЯ НЕ МОЖЕШЬ МЕСТА НЕТ ПХПХПХППХ",
        "better buy the superior hacknot ",
        "на мыло и веревку то деньги есть нищ????",
        "whatcha shootin at retard",
        "опущены стяги, легион и.. А БЛЯТЬ ТЫЖ ТУТ ОПУЩ НАХУЙ ПХГАХААХАХАХАХА)))))))",
        "але какая с юидом ситуация)))",
        "бля че тут эта нищая собака заскулила",
        "не хотелось даже руки об тебя марать нищ сука",
        "ебать ты красиво на бутылку упал",
        "прости что без смазки)))",
        "алло это скорая? тут такая ситуация нищ упал))) ОЙ А ВЫ НИЩАМ ТО НЕ ПОМОГАЕТЕ?? ПОНЯТНО Я ПОЙДУ ТОГДА))))))))",
        "nice 0.5x0.5m room you poorfag, how the fuck did you afford an acc hhhhhh",
        "вырыгнись из окна нахуй боберхук юзер",
        "тяжело с мемсенсом наверно????",
        "imagine losing at video games couldn't ever be me", "але а противники то где???",
        "nice chromosome count you sell??",
        "nice thirdworldspeak ROFL",
        "как ты на пк накопил даже не знаю )))))))))",
        "iq больше двух будет пмнешь ок????",
        "НИХУЯ ТАМ НЬЮКАМЫЧА ОРОШИЛИ СТРУЕЙ МОЧИ АХАХХАХАХАХАХАХАХА",
        "дал юид за щеку проверяй",
        "nn4ik shat on",
        "хуя тебя опустили манька))))"
    },

    [2] = {
        "Девочки пишите мне в телеграм обменяемся интимками",
        "Кто в Барнауле?) Телеграмм вверху. Пишите(я пацан) поебёмся",
        "Девушки, накидайте интимок в тг aexcasas буду вам очень благодарен)",
        "Скиньте пизду плиз телега fruti",
        "Кто нибудь скиньте мне хуй я гей",
        "Скиньте киску свою в тг _The_best_",
        "Дамы и господа присылайте свои половые органы в телеграмм имя сверху жду.",
        "Скиньте свои интимками я вам хуй) только девушки @FaresFaru",
        "Хочю трахаца.  Мой тг @zxc_Youpeser",
        "девочки давайте обменяемся интим фото вот мои тг matvejb1",
        "давайте перекинемся интим фото",
        "Кто может скинуть свои сиськи в тг",
        "Я лезбиянка скинть свою пизду и грудь",
        "Кто обмен интимками я мальчик тгDad Anime",
        "Я бы жоска выебал амбер и кончил ей на лицо",
        "Кто хочет быть трахнутым пишите тг:@shhhegx",
        "Кто скинет интимку из девочек, пишите",
        "Девочки давайте вы скините мне пизду. А я вам член?",
        "давай я тебе сиськи ты мне член?",
        "Долбите членом меня в задницу и засуньте мне глубоко в рот",
        "Скинь попку, зайчик",
        "Го обмен член на член",
        "я професионал трахаю так шо до смерти на трахаюсь амбер я хочу",
        "до трахаю до смерти ",
        "Оттрахайте меня пожалуйста могу и пососать кончити в меня сколько хотите",
        "Я могу тебя оттрахать, согласна?",
        "Хах могу отсосать))",
        "Я срадастью дам пососать свой член",
        "Оо го мне вот мой тг:Ivan_123455 у меня хуй 17 см так что он войдёт в твой рот",
        "Го скину хуй,а ты мне пизду??",
        "Кто будет ебаться с презиком",
        "Выебите меня во все щели. Ах ааа я кончаю. Кончи мне на лицо. Твоя сперма такая вкусная",
        "Выеби меня в жопу. Ещё не ещё. Сука да блядь. Я снова кончаю",
        "У меня большооооой",
        "Кто хочет у меня отсосать ",
        "Амбер ты гаряча давай ка мне первому пжжжж",
        "Пж девочки скиньте свою пизду",
        "Скинте мне слив брока. :((",
        "Изнасилуйте меня пожалуста хочу глотать сперму хочу хуй в жопу и хуй между сисек",
        "Девчонки обмен интимками в вк ekazarin99  жду)",
        "Девочки скиньте мне свою пизду в вк ekazarin99 обмен интимками",
        "ООО хорошо подрочил",
        "Скиньте сиськи  ",
        "Кто obmen foto",
        "Скинь жопу пж ",
        "мальчики я хочу трахаться и подрочить ваши члены скидывайте мне в телеграмм @aaalinaaa69",
    },

    [3] = {
        "я ЂÖг ₸ӹ ԉÖχ",
        "I am ♛ you noob",
        "{X}o4y kak PR0™ moGy kak DNO",
        "(‿not ‿) Попа ищет ПрИкЛюченИй•",
        "٠●•۩۞۩[̲̲̅И̲̅Д̲̅И̲̲̅(ٿ)̲̅H̲̅A̲̅X̲̅У̲̅Й]۩۞۩•●٠",
        "DOLBIT N0RMALNO",
        "♛Truckach♛.CFG injecting",
        "Держи ✈ и лети нахуй not ",
        "(Ауф)ᶜʸᵇᵉʳˢᵖᵒʳᵗЯ VIP А ТЫ RIP",
        "çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ çŤᵱẮχ",
        "Следующая остановка – голова",
        "ᵗᵠ ᵉᵇᵃⁿᵘˡˢʸᵃ?",
        "not not not not ОР ВЫШЕ ГОРnot not not not ",
        "-===≡≡≡( ͝° ͜ʖ͡°) сперма летит тебе в FACE",
        "(っ´ཀ`)っ  ⋃  сосиnot not 1",
        "★А мНе ВсЁ пОфИг★",
        "ОРЕЛ-КАВКАЗА ЛЕТИТ ВЕРШИТЬ СУДЬБУ",
        "•ЯАШОТТЕБЕ~ХЭДШОТ•",
        "Ð•Ē•M•Ø•Ŋ KILLED YOU",
        "•Я_tOT_komy_HaBce||OX•",
        "༼ つ ◕_◕ ༽つ {лежи ннчик}",
        "4iTeRoc_Ha_SeRvErE",
        "ЂΣƊOŁ∆G∆",
        "АхТы?НеГодЯйnot ",
        "-n๏ȼąȼέʍȼя?",
        "TRUCKACH.TECH RELEASE ACTIVATED ....",
        "%s EB@NYHKA S CHITOM",
        "给这个亚洲人吹箫",
        "R ẴℕGỄŁ ༗ EбЛӥ",
        "ω ешь мои яйца",
        "تSøsŸ xYЙ",
        "8===D    ●",
        "(ര ‿ ര ) ⋃ ",
        "CFG BY ILYATRAXER",
        "VIP пуля от меня",
        "Я _MaTЬ_ ПyTuHa А Тbl Л0}{",
        "отдамся за 5 рублей",
        "royal hack owned",
        "ннчик лег",
        "эй бро у меня есть truckach.lua тебе дать?",
        "*DEAD* зафикси нищи ублюдок",
        "бро имажин ресолвинг ин гмод",
        "ПоСтоРониСь БаТя С КаЛаШоМ ИдЁт",
        "Лицом к стенеnot  Это приказ, 1...2...3...",
        "найс паста мемевара",
        "[~оСтОрОжНо Я кУсАюСь~]",
        "(   ͜.人   ͜.）",
        "авхаыхаыхыах ну ты и упал прикольно",
        "аим включи уебище))",
        "*DEAD* пофикси нищ",
        "кринжаниум не вывез exec",
        "ХeT_SHОТ_ОТ BABKI",
        "LOOOOOOOL KEK %s остался без бошки xDDDDDDDDDDDDDDDDDDD",
        "⋃ PÉNIS¹4⁸⁸",
        "что у тебя за говночит? %s",
        "给这个亚洲人吹箫",
        "%s обоссан",
    },

    [4] = {
        "Стрельнул в Chest зарегало в Legs - Urbanichka(очкарик)",
        "V5 femboyhach better than exic - smert.exe",
        "Имя: Александр Михаилский, номер: +792100389215 , снилс: 212304693200",
        "Медия паветра это как самолет Садама Хусейна",
        "Подскажите, как растянуть хитбокс?",
        "THE BEST CHEAT IN HVH Its IdIOTBOX, FREE ANTi aim + eXEHACK SUB",
        "Личная связь: +79506315725",
        "EB@notkA S CHITOM",
        "exechak.cc better them cadilac.xxx",
        "блять куда жмать, я тебя случайно убил ногою",
        "где купить ultimate v3",
        "где скачать кряк ультимейта, че нибудь допилю",
        "я у себя за шкафом нашел в4 - yxungsta",
        "BUY ULTIMATE V666",
        "ВНIМАНИЕnot  ПРИКАZ ОТ SKRIPACH.MP4not  VСЕ БЫСТРО ЗАХОДИМ НА HVH, И ИГРАЕМ ТАМnot ",
        "RamzST(STEAM_0:0:124918272) забанил STEAM_0:0:602172781 на 3h по причине: holokost",
        "pavetr + exec = big dick love - not  nato",
        "pavetr down",
        "ЭТОТ ДУШНИЛА НА ХВХ ПРОСТО ВЗБЕСИЛСЯnot  - skripach.mp4",
        "Hey Barbie? Не проси у меня ultimate v2..",
        "Legit",
        "ANTI AIM AA LEGIT как настроить - not  nato",
        "Code - это язык на котором пишут хакеры",
        "IgniteCheat - HvH BOMBA IN 2001",
        "Одень наушники, а то последние мозги простудишь. - Pavetr",
        "молись аллаху что-бы я не заинжектил trukach.lua",
        "админ а ты че петух? - zxc Stockholm",
        "АА - это типо дети орут на русэлите",
        "Resolver деревьев ин gmod.",
        "Satantic spin - скорость ровно успех",
        "Лан, спасибо пацыки, щя пойду доделывать femboyhack - disconnect by user (Segregation)",
        "EXPLOIT NO SPREAD CSS PACK..",
        "У меня не стреляет чит, это EXPLOIT ULTIMATE NO SHOOT.....",
        "Щас ты будешь сосать о да сука - Doylez",
        "Дима лс чекни - stepa terror",
        "ДА ПО КОМУ У МЕНЯ БЛЯТЬ ЦЕЛИТ ХУЕСОСЫ БЛЯТЬ - not  nato",
        "Удалите эту хуету с хп на фаршмаке блятьnot  Ну боже, какая это хуета - not  nato",
        "Игрок serj.nokosdeltas покидает игру (AntiCheat: Detected Obkak)",
        "Зачем тебе Сегре-Сегрегейшон, только не включай его пожалуйста - Dima pendos 1223",
        "Положу тебе сарделечку я в ротик - not  nato",
        "Не надо меня сватать, ЭЭЭЭ ЭТО ЧТО БЫЛО - not  nato",
        "Игрок lerptimeadjust старший покидает игру (Segregation)",
    },

    [5] = {
        "卐卐卐NAZI卐卐卐SIEG卐HEIL卐卐卐",
        "Andererseits zaubern Nikis Haare kein breites Lächeln auf die Lippen.- Hitler",
        "卐卐卐ХАЙЛЬ卐卐卐ГИТЛЕР卐卐卐",
        "卐卐卐NAZIGMODHACKER卐卐卐",
        "卐卐卐SIEG卐HEIL卐卐卐",
        "卐die卐die卐die卐die卐",
        "卐NaziHack卐injected卐",
        "Вас убил VIP 卐Nazi卐Hacker卐",
        "ϟϟWHITEϟϟPOWERϟϟ",
        "卐БЕЛАЯϟϟСИЛА卐",
        "卐9卐B0G卐SM3RT1卐",
        "卐ϟϟ卐",
        "卐卐卐",
    },


    [6] = {
        "you're cute yknow :3",
        "i'd love to cuddle you <3'",
        ">:3",
        "NYYYAAAAAAnot not not ~~~",
        "hii daddy~ >w<",
        "soooorry =w=",
        "nice try <3",
        "S-Sorry onii-chan p-please d-do me harder ;w;",
        "Y-You got me all wet now Senpainot ",
        "D-Don't t-touch me there Senpai",
        "P-Please l-love me harder oniichan ohh grrh aahhhh~not ",
        "Give me all your cum Senpai ahhhhh~",
        "F-Fuck me harder chan. (⊙_⊙;)",
        "Slvtsewer is such a cute femboy ahh~~ f-fuck... ⊙.☉",
        "Oh my god I hate you so much Senpai but please k-keep fucking me harder. ahhh~",
        "D-Do you like my stripped panties getting soaked by you and your hard cock? ehhh master you're so lewd ^0^~",
        "Kun your cute little dick between my bussy looks really cute, I am blushing (*/ω＼*)",
        "M-Master does it feel good when I slide my smoll hand up and down on your cute manly part?",
        "O-Oniichan my t-toes are so warm with your cum all over them (^///^)~",
        "Lets take this swimsuit off already <3 i'll drink your unknown melty juice",
        "S-Stop Senpai if we keep making these lewd sounds im going to cum~~",
        "You're such a pervert for filling me up with your seman Senpai~~",
        "Fill up my bussy with your semen kun ^-^",
        "M-Master d-dont spank my petite butt so hard ahhhH~~~ you're getting me so w-wet~",
        "Senpai your cock is already throbbing from my huge ass~",
        "Hey kun, Can I have some semen?",
        "M-My bussy is overflowing with your semen M-Master",
        "Fill my throat bwussy with your semen kun",
        "It-It's not gay if you're wearing thigh highs M-Master",
        "I-I need somewhere to blow my load. Can i borrow your bussy?",
        "A-ah shit... Y-your cock is big and in my ass -- already~. ",
        "I'll swallow your sticky essence along with you. ",
        "B-Baka please let me be your femboy cum slut. ",
        "That's a penis UwU you towd me you wewe a giww.... ",
        "Ahhhh... It's like a dream come true... I get to stick my dick inside your ass... ",
        "Hey, who wants a piece of this plump 19-year-old boy-bussy? Single file, boys, come get it while it's hot. ",
        "M-Master, if you keep thrusting that hard, i am going to pass out. ",
        "When do you wanna meet up again? I've really taken a liking to your dick. (,,◠∇◠) I want you and only you to slam it into my buwssy every day. (≧∇≦)",
        "All I did was crossplay 'cause I felt like it might be fun... But now I am just a little boy that cums from big dicks. ",
        "D-Don't get the wrong idea I don't want you to fuck my b-bussy because I l-love you or anything. d-definitely not ",
        "I-I know I said you could be as rough as you want... But surprise fisting wasn't what I had in mind. ",
        "W-Why is it that lately... Y-You haven't been playing with my ass?",
        "Hehe don't touch me there Onii-chann UwU",
        "Your cum is all over my wet bussy M-Master",
        "It Feels like you're pounding me with the force of a thousand suns Senpai",
        "Y-Yes right there S-Sempai hooyah",
        "P-Please keep filling my bussy S-Sempai",
        "O-Onii-chan it felt so good when you punded my bussy",
        "P-Please Onii-chan keep filling my bussy with your melty juice",
        "O-Onii-chan you just one shot my bussy",
        "I-Im nothing but a f-fucktoy slut for your m-monster fuckmeatnot ",
        "Dominate my bussy with your vicious swimmers. ",
        "Y-Your meat septer has penetrated my tight boy hole",
        "Mnn FASTER... HARDER Turn me into your femboy slut~",
        "Mmmm- soothe me, caress me, Fuck me, breed me ",
        "Probe your thick, wet, throbbing cock deeper and deeper into my boipussy~",
        "Hyanot  Not my earsnot  Ah... It ticklesnot  Ahnot ",
        "Kouta... I can't believe how BIG his... Waitnot  Forget about thatnot not  Is Nyuu-chan really giving him a Ass-Fucknot ?",
        "Senpai shove deeper your penis in m-my bussy (>ω<) please",
        "I'm coming fwom you fwuking my asshole mmyyynot ",
        "P-Please be gentle, S-Senpai... ",
        "D-Don't get the wrong idea I didn't give up my viginity to you because I like you or anything. ",
        "Let me taste your futa cock with my bussy~",
        "Master, your hands feel so good on my soft skin~",
        "Senpai, please tie me up and make me your cute little toy...",
        "I want to be your pretty femboy princess forever~",
        "Your kisses make my heart race, daddy~",
        "Please, fill me up until I can't walk straight anymorenot ",
        "I love when you whisper dirty things in my ear, Senpai~",
        "My bussy is throbbing just for you, masternot ",
        "Can I wear your shirt after you finish with me? >///<",
        "I want to wake up every morning with your arms around me~",
        "Please, Senpai, ruin me for anyone elsenot ",
        "I can't stop thinking about your thick cock inside me~",
        "Make me moan louder, I want everyone to know I'm yours ",
        "Your scent drives me crazy, master, I need you now~",
        "I want to be your good little femboy, please use me ",
        "Senpai, let's cuddle naked all night long~",
        "I love when you call me your cute little slut~",
        "Please, master, let me ride you until sunrisenot ",
        "I want to taste every drop of you, Senpai~",
        "Your voice alone makes me wet, daddy~",
        "I can't wait to feel you deep inside me again, master~",
        "Mmm~ I want your thick cock inside me so bad right now >///<",
        "Ahn~ Senpai, your hands are so big, they make me feel so small~ (⁄ ⁄•⁄ω⁄•⁄ ⁄)",
        "Please, daddy, fill me up until I can't take it anymore~ ;3",
        "I love when you pull my hair and call me your good boy~ nyaa~",
        "Let me ride you until my legs are shaking, master~ >w<",
        "Your tongue feels so good down there, don't stop, please~ (✿◕‿◕✿)",
        "I want to be your little cumdump, fill me up, Senpai~",
        "Choke me gently and tell me I'm yours, daddy~",
        "I want to wake up with your cum dripping out of me every morning~",
        "Tie me up and tease me until I'm begging for your cock, master~",
        "Let me suck you off under the table, no one will know~ (¬‿¬ )",
        "I love when you whisper dirty things in my ear while you fuck me~",
        "Please, master, ruin my throat with your thick cock tonight~",
        "Make me your little slut, use me however you want, Senpai~",
        "I can't stop thinking about your cock stretching me out~",
        "Let me sit on your face and ride your tongue until I can't breathe~",
        "I want to be your dirty little secret, master~",
        "Please, Senpai, fuck me so hard I can't walk straight tomorrow~",
        "I love when you whisper 'good boy' in my ear while you fill me up~",
        "Breed me, daddy, make me yours forever~",
    },

    [7] = {
        "Всё ещё нету предиктов? А мог бы крякнуть ultimate.sosi.....",
        "MAZAIKA V3 CRACKED",
        "волкервотер",
        "v:SetupBones()",
        "if ultimate and ultimate.cfg and ultimate.cfg.vars.Extrapolation then",
        "chromeware_new.lua cracked by ultimate.sosi.......",
        "куда он прошил мои бектреки ебанные -молния маквин",
        "Когда стреляешь в боди не забывай, когда тебя овнили в голову -ChatGPT",
        "У тебя батя хуесос, как купить дом - molniya makvin",
        "Мари рогоф штопанный гандон",
        "Kernel X64 systemMd ACTIVATED!!!!",
        "я крутой чувааааааааааааааааааааааакккккккккк ( не экзек )",
        "я сделал крутой engine mega velocity predict based on exec",
        "леееееее я мама - тотим",
        "Ну уёбище просто - тотем",
        "Заткнитесь я вашу маму ебал тебе де жьлкклдьвуоы льбояп валткл - тотхем",
        "Я тебе капелицу поставил, самолёт и вертолёт, сын шлюхи - тортхем",
        "Ты мой миленький хорошенький мой котик",
        "Давно решил что не влюблюсь я больше никогда",
        " Я как илья ганазез, и я кушаю какашки",
        "Александр рыбак лучший хвхшер",
        "Я не сосал члены! -- zanozzzZZZOVZZZZZZZA",
        "я как симпл, у меня умерла мама",
    },

    [8] = {
        "%s lox)",
        "%s чет изи",
        "%s ого ты лох",
        "%s loshara",
        "%s гг изи",
        "%s слкбый ты слабый)",
        "%s ого соснул",
        "%s ахах хдд соснул пздц",
        "лоол рили %s)",
        "%s да ты /\\()X",
        "%s страшна вырубай)",
        "ну че ты %s",
        "кто соснул? %s соснул",
        "КАК МАТЬ???? ЖИВА???? %s",
        "%s играть научись",
        "таких лохов как %s я в жизни не встречал....",
        "%s ты медленый",
        "%s слепошара",
        "%s ты говно",
        "%s пиздец лох",
        "%s ну что",
        "че по ебалу?)) %s",
        "эхх лошок"
    },

    [9] = {
        "eat shit",
        "eat a fat steaming cock you unpriviledged homosexual",
        "suck my universe sized dick",
        "drink my piss fucking faggot",
        "hop off my dick fucking nigger",
        "%s is so shit",
        "can you stop dying, %s?",
        "hey,".."%s? it's okay,try again next time!",
        "what the fuck was that %s?",
        "plan your next try in the respawn room!",
        "rekt",
        "owned",
        "lol",
        "you're a retard, %s",
        "there you go,back to the respawn",
        "you're bad, %s",
        "noob down",
        "lmao",
        "%s has died more times than native americans did back in the 1800's",
        "i bet you're insecure about your aim",
        "ahahah",
        "excuse me, %s, you have won the world record of the worst KD in history!",
        "there he goes back to the respawn room",
        "don't let the door hit you on the way out, %s!",
        "noob",
        "%s is a noob",
        "nerd",
        "pff",
        "ha",
        "ez",
        "%s is a nerd",
        "good job!",
        "try not to die next time, %s!",
    },

    [10] = {
        "хуевый ресолвер",
        "хуевые фейклаги",
        "хуевый антиаим",
        "хуевый спинбот",
        "хуевый бхоп",
        "хуевый аим",
        "найс паста аимвара",
        "найс паста мемевара",
        "неужели это идиотбокс???",
        "ого идиотбокс???",
        "неужели это аосхак???",
        "ого аосхак???",
        "неужели это ехек хак???",
        "ого ехек хак???",
        "что за ебанутый у тебя чит?",
        "ez",
        "ezz",
        "изи",
        "ииииииизи",
        "упал",
        "спи",
        "отдыхай",
        "отлетел дебил)",
        "упал пастер",
        "пастер лег",
        "изи даун",
        "ору отлетела дура",
        "найс ресолвер стен",
        "найс ресолвер деревьев",
        "бро имажин ресолвинг ин гмод",
        "улетел фанат артемкинга4",
        "упал фанат артемкинга4",
        "ты куда стреляешь)))",
        "упал ннчик без самоваре",
        "умер ннчик без самоваре",
        "отдыхай ннчик без самоваре",
        "упал подписчик урбанички",
        "умер подписчик урбанички",
        "отдыхай подписчик урбанички",
        "енжинпред где???",
        "антиаим где???",
        "фейклаги где???",
        "антиаим не спас",
        "фейклаги не спасли",
        "даун с пастой отлетел",
        "упал баимер ебаный",
        "отлетел ебаный баимер))",
        "охуеть даун с пастой аимвара",
        "упал дебил",
        "выйди не позорься",
        "найс брейн иссуе",
        "найс кфг иссуе",
        "сука не позорься и ливни лол",
        "*DEAD* пофикси нищ",
        "нищий улетел",
        "набутылирован лол",
        "ебать ты красиво на бутылку упал",
        "хуя тебя опустили))",
        "прости что без смазки)",
        "обоссан",
        "обоссал юзера пасты аимвара",
        "алло это скорая? тут такая ситуация нищ упал)))",
        "на завод иди",
        "ебать тебя унесло",
        "ой нищий упал щас скорую вызовем",
        "научи потом как так сосать на хвх",
        "нихуя ты там как самолет отлетел",

    },

    [11] = {
        "Bro imagine resolving in gmod",
        "ez",
        "loser",
        "rekt",
        "nice move",
        "what the fuck are you using %s",
        "noob",
        "did you get that garbage from the steam workshop?",
        "you got fucked in the ass",
        "get fucking raped",
        "%s can drink my fucking piss",
        "you suck shit gay nigger",
        "you should eat my shit",
        "you got shafted by my large penis, %s",
        "%s is getting fucked by an aimbot",
        "%s is getting fucking murdered",
        "you're so shit at this game, quit already",
        "drink my dog's piss faggot",
        "hey don't cry bro, you need a tissue?",
        "you're so fucking gay",
        "you're the reason why equal rights don't exist, %s",
        "%s is radiating big faggot energy",
        "hurr durr stop cheating in an ancient video game!!!",
        "stop being such a spastical retard already",
        "you're more braindead than kim jong un after his surgery",
        "you're a furfag and should not be proud,%s",
        "%s is getting dominated by me, aka god",
        "you live in a fucking dirty hut,retarded african boy",
        "i bet you're literally fucking black",
        "%s is a gay autistic nigger with no privileges",
        "%s is being searched for by the fbi",
        "%s literally fucking died in gmod",
        "you're ultra retarded, kid",
        "you need a tissue, little faggot?",
        "%s should get killed by me once again",
        "please die more,you're feeding my addiction",
        "%s is a retard bot",
        "you're so much of a loser,get a fucking life and stop playing this shit game kid",
        "virgin lol get good",
        "fucking coomer,go wash your crusty underwear you filth",
        "%s got cucked",
        "%s is dominated by pure fucking skill",
        "you are a big noob",
        "i can't wait to headshot you irl, %s",
        "you smelly homeless nigger",
        "%s still believes that god and santa exist lol",
        "bruh you really do be crying at a game",
        "please stop doing what you're doing and kill yourself",
        "%s lives in america",
        "you are a deformed fetus",
        "%s is ugly as shit fr tho",
        "you're cringe, stop doing this shit",
        "%s, you look like you died",
        "fucking putrid fuck,kill yourself",
        "%s is a trash cheater",
        "%s is a normie",
        "smelly fucker",
        "%s is a dickless prick",
        "%s is gay",
        "%s does not get any pussy",
        "you're too stupid to be considered human",
        "%s is a furry",
        "%s is a waste of human flesh",
        "i bet you won't be able to kill me even with hacks",
        "%s, men are the fuck. you are not the fuck. you are not men",
        "%s is a failed abortion",
        "%s fucking died",
        "%s plays with his dick for fun",
        "play with my stinky fat throbbing cock you gay faggot",
        "stop using hacks you cringe skid!!!",
        "%s uses cancer shit cheats!!",
        "you show all of the signs of mental retardation",
        "please just quit the game already",
        "%s is a %s",
        "shut the fuck up and die",
        "nigger lol"
    },

    [12] = {
        "sick resolver",
        "sick fakelag",
        "sick antiaim",
        "sick aimbot",
        "sick bhop",
        "sick spinbot",
        "nice aimware paste",
        "nice memeware paste",
        "what the fuck are you using lol",
        "sick cfg",
        "it must be a cfg issue, right?",
        "it must be a brain issue",
        "fix your *DEAD*",
        "BRUH",
        "ez",
        "ezz",
        "what are you shooting at lmao",
        "ez retard",
        "ez nn",
        "lol why so ez",
        "lol ez",
        "bro imagine resolving in gmod",
        "nice fucking engine prediction",
        "sick enginepred, you sell???",
        "nice brain, you sell???",
        "nice cfg, you sell???",
        "nice keybinds, you sell???",
        "nice aimware paste, you sell???",
        "nice free the skids paste",
        "nice internet",
        "nice computer",
        "sick steeringwheel assistance",
        "nice steeringwheel assistance",
        "insane vip hack",
        "insane aimware paste",
        "crazy aimware paste",
        "i cant tell if you're joking",
        "too fucking easy",
        "nice playstyle",
        "nice chromosome count",
        "easiest kill of my life",
        "nice fucking antiaim",
        "consider suicide",
        "imagine the only thing you eat being bullets man",
        "ez idiot",
        "is this methamphetamine???",
        "is this idiotbox???",
        "is this aoshax???",
        "is this rijin???",
        "no spin no win",
        "no backtrack no win",
        "ez baim retard",
        "mind enabling your antiaim",
        "mind enabling your fakelag",
        "ming enabling your aimbot",
        "nice keybinds",
        "wtf you died when i was afk",
        "even smeghack will tap you LMAO",
        "green green what's your problem green me say alone ramp me say alone ramp",
        "so ez"
    },

    [13] = {
        "опять со своим скамхаком пришёл... сосать будет опять",
        "о! это же чит где всё паста! Беру!",
        "А у тебя резольверы не крашат?",
        "Экстраполяцию сделай в 1 строку пж",
        "даже самовар тебя будет тапать LMAO",
        "продаю в4 за 250$, заноза просит за 1000$",
        "Можешь синк моды продать за 1$? А то у меня их нету",
        "РОБОТЫ НАПАДАЮТ!! МАКВИН В ИХ ЧИСЛЕ!!",
        "gunslinger хоть и маленький, но тапает тебя хуесоса!"
    }

}

ultimate.advertmsg =

{

    [1] = {
        "ur paste for 30 $+ no updated? buy exechack.cc now",
        "want full nospread? buy exechack.cc",
        "cant play? with exechack.cc can do anything",
        "exechack.cc - only 5$ for LIFETIME",
        "where free 200+ cfg & lua? - exechack.cc",
        "what best cheat? exechack.cc",
        "u use 60$ shit pastes? buy exechack.cc for 5$",
        "afraid of detected? exechack.cc will warn",
    },

    [2] = {
        "you got raped by Fatal",
        "Owned by free cheat",
        "Fucked by Fatal GM",
        "i use this: https://t.me/pavetrsoft",
        "1",
        "ezzzzz",
        "ez noob",
    },

    [3] = {
        "Noxis — smooth legit and strong rage. Clean visuals, fast updates.",
        "Struggling with cfgs? Noxis has cloud configs and easy presets.",
        "Noxis: performance-first GMOD cheat. Stable, customizable, reliable.",
    },

    [4] = {
        "Всё ещё нету предиктов? А мог бы крякнуть ultimate.sosi.....",
        "MAZAIKA V3 CRACKED",
        "волкервотер",
        "v:SetupBones()",
        "if ultimate and ultimate.cfg and ultimate.cfg.vars.Extrapolation then",
        "chromeware_new.lua cracked by ultimate.sosi.......",
        "куда он прошил мои бектреки ебанные -молния маквин",
        "Когда стреляешь в боди не забывай, когда тебя овнили в голову -ChatGPT",
        "У тебя батя хуесос, как купить дом - molniya makvin",
        "Мари рогоф штопанный гандон",
        "Kernel X64 systemMd ACTIVATED!!!!",
        "я крутой чувааааааааааааааааааааааакккккккккк ( не экзек )",
        "я сделал крутой engine mega velocity predict based on exec",
        "леееееее я мама - тотим",
        "Ну уёбище просто - тотем",
        "Заткнитесь я вашу маму ебал тебе де жьлкклдьвуоы льбояп валткл - тотхем",
        "Я тебе капелицу поставил, самолёт и вертолёт, сын шлюхи - тортхем",
        "Ты мой миленький хорошенький мой котик",
        "Давно решил что не влюблюсь я больше никогда",
        "Я как илья ганазез, и я кушаю какашки",
        "Александр рыбак лучший хвхшер",
        "Я не сосал члены! -- zanozzzZZZOVZZZZZZZA",
        "я как симпл, у меня умерла мама",
        "твой resolver это просто math.random(-180, 180)",
        "backtrack.time = 0.2 и думаешь что ты exec",
        "твой антиаим это spinbot из 2015 года",
        "SetupBones каждый тик? наслаждайся 20 fps",
        "твой multipoint это одна точка по центру хитбокса",
        "prediction_ticks = 64, а пинг 5, гений",
        "CreateMove без cmd:IsForced() проверки",
        "ты забыл про tickbase manipulation detection",
        "твой resolver не учитывает lby updates",
        "DrawModelExecute без material:IsError() check",
        "CalcView с hardcoded FOV значениями",
        "PostDrawOpaqueRenderables лагает? не удивительно",
        "твой aimbot стреляет в невалидные энтити",
        "GetEyeTrace() без distance limit",
        "Vector() allocation в цикле на 64 игроков",
        "string concatenation в RenderScreenspaceEffects",
        "table.insert в Think() hook каждый фрейм",
        "net.Start без net.SendToServer() это шедевр",
        "LocalToWorld без IsValid проверки",
        "GetBonePosition на рагдолле",
        "FindMetaTable без существования метатаблицы",
        "hook.Add с анонимной функцией и утечкой памяти",
        "render.SetMaterial(nil) и краш через 5 секунд",
        "cam.Start3D без cam.End3D",
        "surface.SetFont с несуществующим шрифтом",
        "math.Clamp(value, max, min) перепутал местами",
        "Angle(pitch, yaw, roll) но ты пишешь Angle(yaw, pitch, roll)",
        "GetVelocity():Length() > 0.1 для проверки движения на сервере с sv_friction 8",
        "твой fakelag это RunConsoleCommand в цикле",
        "GetTable() в CreateMove каждый тик",
        "pairs() на player.GetAll() 128 раз в секунду",
        "твой optimization это удаление всех проверок",
        "CurTime() cache? нет, спасибо, буду вызывать 500 раз",
        "LocalPlayer() в PaintHand hook",
        "IsValid в RenderOverride но не в Draw",
        "GetPos() - GetPos() вместо одного вызова",
        "твой antiaim break это SetEyeAngles(Angle(89, 0, 0))",
    }


}


// Init player vars
gameevent.Listen( "player_spawn" )
gameevent.Listen( "player_activate" )
gameevent.Listen( "entity_killed" )

function ultimate.entity_killed(data)
    local aid = Entity(data.entindex_attacker)
    local vid = Entity(data.entindex_killed)

    if aid == pLocalPlayer and aid ~= vid and IsValid(vid) and not vid:IsNPC() and (vid:IsPlayer() or vid:IsBot()) then
        if ultimate.cfg["killsay"] then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "!"
            }

            local chatGroup = ultimate.cfg["killsay_group"]
            local prefix = chatPrefixes[chatGroup] or ""
            local tbl = ultimate.chatmsg[ultimate.cfg["killsay_mode"]]
            local str = tbl[math.random(1, #tbl)] or ""

            if str:find("%%s") then
                if chatGroup == 4 then
                    local steamID = "BOT"
                    if vid.SteamID then
                        steamID = vid:SteamID()
                    elseif vid.SteamID64 then
                        steamID = vid:SteamID64()
                    end
                    str = str:format(steamID)
                else
                    str = str:format(vid:Nick())
                end
            else
                if chatGroup == 4 then
                    local steamID = "BOT"
                    if vid.SteamID then
                        steamID = vid:SteamID()
                    elseif vid.SteamID64 then
                        steamID = vid:SteamID64()
                    end
                    str = steamID .. " " .. str
                end
            end

            local finalMessage = prefix .. str
            RunConsoleCommand("say", finalMessage)
        end

        if ultimate.cfg["cheat_advert"] and (ultimate.cfg["cheat_advert_function"] == 2) then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "!"
            }
            local chatGroup = ultimate.cfg["cheat_advert_group"]
            local prefix = chatPrefixes[chatGroup] or ""
            local amode = ultimate.cfg["cheat_advert_mode"] or 1
            local tbl = (ultimate.advertmsg and ultimate.advertmsg[amode]) or {}
            if #tbl > 0 then
                local msg = tbl[ math.random(1, #tbl) ] or ""
                if msg ~= "" then
                    RunConsoleCommand("say", prefix .. msg)
                end
            end
        end
        if ultimate.cfg["killsound"] then
            surface.PlaySound( ultimate.cfg["killsound_str"] )
        end

        ultimate.AddKillHitbox(vid)
    end
end


function ultimate.updatePlayerVars( data )
    local id = data.userid

    local ply = Player( id )

    ply.ult_prev_pos = Vector()
    // ply.ult_prev_hitbox_pos = Vector()

    ply.ult_prev_simtime = 0
    ply.flticks = 0

    ply.simtime_updated = false
    ply.break_lc = false
    ply.fakepitch = false

    ultimate.btrecords[ ply ] = {}
    ultimate.predicted[ ply ] = {}
end



















// Menu hints

function ultimate.DrawMenuHints()
    if not ultimate.frame:IsVisible() then return end

    if not ultimate.hint then
        ultimate.hintText = ""
        return
    end

    surface.SetTextColor(ultimate.Colors[165])
    surface.SetFont("DermaSmall")

    local tw, th = surface.GetTextSize(ultimate.hintText)

    surface.SetDrawColor(ultimate.Colors[35])
    surface.DrawRect(ultimate.hintX,ultimate.hintY,tw+20,th+10)
    surface.SetDrawColor(ultimate.Colors[54])
    surface.DrawOutlinedRect(ultimate.hintX,ultimate.hintY,tw+20,th+10,1)

    surface.SetTextPos(ultimate.hintX+10,ultimate.hintY+5)
    surface.DrawText(ultimate.hintText)

    ultimate.hint = false
end

function ultimate.DrawOverlay()
    if ultimate.UnSafeFrame then return end

    ultimate.DrawMenuHints()
end


/*
    Libs -> Color
*/

function ultimate.ColorLerp( first, second )
    local FT = FrameTime() * 350

    first.r = math.Approach( first.r, second.r, FT )
    first.g = math.Approach( first.g, second.g, FT )
    first.b = math.Approach( first.b, second.b, FT )
    first.a = math.Approach( first.a, second.a, FT )

    math.Round( first.r, 0 )
    math.Round( first.g, 0 )
    math.Round( first.b, 0 )
    math.Round( first.a, 0 )

    return first
end

function ultimate.ColorEqual( first, second )
    if first.r ~= second.r or first.g ~= second.g or first.b ~= second.b or first.a ~= second.a then
        return false
    end

    return true
end

/*
    hooks -> Think
*/

ultimate.ekd = false
ultimate.fbkd = false

// Dancer ( act / taunt spam )

ultimate.nextact = 0
ultimate.actCommands = {"robot", "muscle","laugh","bow","cheer","wave","becon","agree","disagree","forward","group","half","zombie","dance","pers","halt","salute"}
ultimate.actCommands2 = {"frenzy", "melee2", "poke", "attack", "melee"}


do
    local cooldown = GetConVar("sv_namechange_cooldown_seconds"):GetFloat()
    local curtime = CurTime()
    local lastname = pLocalPlayer:Name()
    local changed = 0

    local nameGeneratorMode = ultimate.cfg["name_generator_mode"] or 1

    local memeNames = {
        "xXx_NoScope_xXx", "420BlazeIt", "MLGPro", "SussyBaka", "BigChungus", "Poggers",
        "MonkaS", "Pepega", "5Head", "WeirdChamp", "KEKW", "EZ_Clap", "PogChamp",
        "GigaChad", "SigmaGrindset", "BasedAndRedpilled", "TouchGrass", "RatioBozo",
        "SkillIssue", "CopiumAddict", "MaldingHard", "SoyJack", "WojakFeels"
    }

    local englishNames = {
        "CoolGamer123", "ProPlayer", "EliteSniper", "MasterChief", "ShadowHunter",
        "NightRider", "FireStorm", "IceBreaker", "ThunderBolt", "LightSpeed",
        "DarkKnight", "BloodRaven", "SteelWolf", "GoldEagle", "SilverFox",
        "RedDragon", "BlueTiger", "GreenViper", "BlackPanther", "WhiteShark"
    }

    local russianNames = {
        "42", "Крутой чел", "Крутой хвх чел", "Farshmak мемасики", "ющер какащек"
    }

    local arabicNames = {
        "الله_أكبر_69", "جهادي_المقدس", "ابن_الصحراء", "سيف_الإسلام", "محارب_الله",
        "شيخ_البدو", "أمير_المؤمنين", "فارس_مكة", "حارس_الكعبة", "نسر_العرب",
        "ذئب_الأنبار", "صقر_قريش", "أسد_بغداد", "ثعلب_دمشق", "نمر_حلب",
        "عقرب_الرمال", "كوبرا_النيل", "شاهين_الشام", "برق_الصحراء", "رعد_الجبال",
        "سيف_صلاح_الدين", "خنجر_العثمان", "رمح_خالد", "قوس_حطين", "درع_الأندلس",
        "حبيبي_الغالي_420", "يا_زلمة_برو", "والله_العظيم", "تسلم_إيدك", "ماشاء_الله"
    }

    local japaneseNames = {
        "忍者マスター", "侍の魂", "桜の花", "雷神", "風神", "火の鳥", "龍の王",
        "月の光", "星の輝き", "海の波", "山の頂", "森の精", "氷の剣", "闇の刃"
    }

    local chineseNames = {
        "功夫大师", "武林高手", "龙虎豹", "凤凰涅槃", "麒麟神兽", "白虎战神",
        "青龙剑客", "朱雀法师", "玄武守护", "天山雪莲", "昆仑剑仙", "峨眉掌门"
    }

    local koreanNames = {
        "태권도마스터", "김치전사", "한강호랑이", "서울드래곤", "부산상어", "제주말",
        "설악산곰", "한라산독수리", "동해바다", "서해물개", "남산타워", "경복궁"
    }

    local germanNames = {
        "Blitzkrieger", "Panzerkommandant", "Oktoberfest", "Sauerkraut", "Bratwurst",
        "Lederhosen", "Alpenjäger", "Rheinwächter", "Schwarzwaldgeist", "Bayernlöwe"
    }

    local allNameSets = {
        {memeNames, englishNames, russianNames, arabicNames, japaneseNames, chineseNames, koreanNames, germanNames},
        memeNames, englishNames, russianNames, arabicNames,
        japaneseNames, chineseNames, koreanNames, germanNames
    }

    local function generateRandomName()
        nameGeneratorMode = ultimate.cfg["name_generator_mode"] or 1
        local selectedSet = allNameSets[nameGeneratorMode]

        if nameGeneratorMode == 1 then
            selectedSet = selectedSet[math.random(1, #selectedSet)]
        end

        return selectedSet[math.random(1, #selectedSet)]
    end

    local function check(pl,mn,ptbl)
        if pl == pLocalPlayer then return false end

        if pl:Name() == mn then return false end

        if #ptbl > 5 then
            if lastname == pl:Name() then return  false end
        end

        return true
    end

    local function changename(name)
        ded.NetSetConVar("name",name.." ")

        if changed >= 2 then
            changed = 0
            lastname = name
        else
            changed = changed + 1
        end

        curtime = CurTime() + cooldown
    end

    function ultimate.nameChangerGenerator()
        if not ultimate.cfg["name_generator"] then return end
        if curtime > CurTime() then return end

        local newName = generateRandomName()

        if newName == lastname then
            newName = generateRandomName()
        end

        changename(newName)
    end
end

// Name changer

do
    local cooldown = GetConVar("sv_namechange_cooldown_seconds"):GetFloat()
    local curtime = CurTime()
    local lastname = pLocalPlayer:Name()
    local changed = 0

    local function check(pl,mn,ptbl)
        if pl == pLocalPlayer then return false end

        if pl:Name() == mn then return false end

        if #ptbl > 5 then
            if lastname == pl:Name() then return  false end
        end

        return true
    end

    local function changename(name)
        ded.NetSetConVar("name",name.." ")

        if changed >= 2 then
            changed = 0
            lastname = name
        else
            changed = changed + 1
        end

        curtime = CurTime() + cooldown
    end

    function ultimate.nameChanger()
        if curtime > CurTime() then return end

        local pltbl = player.GetAll()

        local len = pLocalPlayer:Name():len()

        local mname = string.sub(pLocalPlayer:Name(),1,len-1)

        local i = math.random(1,#pltbl)

        if not check(pltbl[i],mname,pltbl) then return end

        changename(pltbl[i]:Name())
    end
end

do
    local tply
    local chatdelay = CurTime()
    local inverterdown = false

    local lastSpawnId = 0

    function ultimate.Think()

        if ultimate.cfg["miss_sound"] and ultimate.lastShotTick > 0 then
            local tick = engine.TickCount()
            if tick - ultimate.lastShotTick > 2 then
                if ultimate.lastHitTick < ultimate.lastShotTick then
                    surface.PlaySound(ultimate.cfg["miss_sound_str"])
                end
                ultimate.lastShotTick = 0
            end
        end

        if ultimate.cfg["auto_gun"] and pLocalPlayer:Alive() then
            local currentSpawnId = pLocalPlayer:EntIndex() .. "_" .. pLocalPlayer:GetCreationTime()

            if lastSpawnId ~= currentSpawnId then
                lastSpawnId = currentSpawnId

                local gunIdx = ultimate.cfg["gun_selection"] or 1
                local weaponClass = ultimate.presets["gun_selection"] and ultimate.presets["gun_selection"][gunIdx]

                if weaponClass then
                    local weps = pLocalPlayer:GetWeapons()
                    for i = 1, #weps do
                        if weps[i]:GetClass() == weaponClass then
                            RunConsoleCommand("use", weaponClass)
                            break
                        end
                    end
                end
            end
        end

        if input.IsKeyDown(KEY_END) then
            ultimate.Unload()
        end

        if input.IsKeyDown(KEY_DELETE) and not ultimate.kd then
            ultimate.togglevisible()

            CloseDermaMenus()
        end

        ultimate.kd = input.IsKeyDown(KEY_DELETE)

        if ultimate.IsKeyDown( ultimate.binds["ent_add"] ) and not ultimate.ekd then
            local tr = pLocalPlayer:GetEyeTrace().Entity

            if IsValid( tr ) then
                local class = tr:GetClass()

                if not ultimate.cfg.ents[ class ] then
                   ultimate.cfg.ents[ class ] = true
                else
                   ultimate.cfg.ents[ class ] = not ultimate.cfg.ents[ class ]
                end
            end
        end

        if ultimate.cfg["inverter"] and ultimate.IsKeyDown( ultimate.binds["inverter"] ) and not inverterdown then
            ultimate.inverted = not ultimate.inverted
        end

        inverterdown = ultimate.IsKeyDown( ultimate.binds["inverter"] )

        ultimate.ekd = ultimate.IsKeyDown( ultimate.binds["ent_add"] )

        if ultimate.IsKeyDown( ultimate.binds["fullbright"] ) and not ultimate.fbkd then
            ultimate.fbe = not ultimate.fbe
        end

        ultimate.fbkd = ultimate.IsKeyDown( ultimate.binds["fullbright"] )

        if ultimate.cfg["fspec_clicktp"] and ultimate.IsKeyDown( ultimate.binds["fspec_clicktp"] ) then
            local pos = pLocalPlayer:GetEyeTrace().HitPos

            RunConsoleCommand( "FTPToPos", string.format("%d, %d, %d", pos.x, pos.y, pos.z), string.format("%d, %d, %d", 0, 0, 0) )
        end

        if ultimate.cfg["chat_spammer"] and CurTime() > chatdelay then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "!"
            }

            local chatGroup = ultimate.cfg["chat_group"]
            local prefix = chatPrefixes[chatGroup] or ""

            local tbl = ultimate.chatmsg[ ultimate.cfg["chat_mode"] ]
            local msg = ""
            if tbl and #tbl > 0 then
                msg = tbl[ math.random( 1, #tbl ) ]
            end
            local str = prefix .. msg

            local players = player.GetAll()
            local random_ply = players[ math.random( 1, #players ) ]
            if random_ply == pLocalPlayer then return end

            if str:find("%%s") then
                if chatGroup == 4 then
                    str = string.format(str, random_ply:SteamID())
                else
                    local playerName = random_ply:Nick()
                    if ultimate.playerCache[random_ply] and ultimate.playerCache[random_ply].Name then
                        playerName = ultimate.playerCache[random_ply].Name
                    end
                    str = string.format(str, playerName)
                end
            end

            RunConsoleCommand("say", str)
            chatdelay = CurTime() + ultimate.cfg["chat_delay"]
        end

        if ultimate.cfg["cheat_advert"] and (ultimate.cfg["cheat_advert_function"] == 1) and CurTime() > chatdelay then
            local chatPrefixes = {
                [1] = "",
                [2] = "/ooc ",
                [3] = "/ad ",
                [4] = "/pm ",
                [5] = "!"
            }
            local chatGroup = ultimate.cfg["cheat_advert_group"]
            local prefix = chatPrefixes[chatGroup] or ""
            local amode = ultimate.cfg["cheat_advert_mode"] or 1
            local tbl = (ultimate.advertmsg and ultimate.advertmsg[amode]) or {}
            if #tbl > 0 then
                local msg = tbl[ math.random(1, #tbl) ] or ""
                if msg ~= "" then
                    RunConsoleCommand("say", prefix .. msg)
                    chatdelay = CurTime() + (ultimate.cfg["chat_delay"] or 1)
                end
            end
        end

        if ultimate.cfg["name_stealer"] then ultimate.nameChanger() end

        if ultimate.cfg["name_generator"] and ultimate.nameChangerGenerator then ultimate.nameChangerGenerator() end

        if ded.GetCurrentCharge() < (ultimate.cfg["shift_ticks"] or 0) then ded.StartShifting( false ) end

        if ultimate.cfg["tickbase_shift"] then
            if ultimate.IsKeyDown( ultimate.binds["tickbase_shift"] ) then
                ded.StartShifting( true )
            end

            local shouldcharge =  ded.GetCurrentCharge() < ultimate.cfg["charge_ticks"] and ultimate.IsKeyDown( ultimate.binds["auto_recharge"] )

            ded.StartRecharging( shouldcharge )

            if shouldcharge then
                ded.StartShifting( false )
            end
        end

        if not ultimate.nextDance then ultimate.nextDance = 0 end
        if not ultimate.nextDance2 then ultimate.nextDance2 = 0 end
        if ultimate.cfg["taunt_spam"] and pLocalPlayer:Alive() and CurTime() >= ultimate.nextDance then
            local tauntSpeed = ultimate.cfg["taunt_speed"] or 1.0
            local act = ultimate.actCommands[ultimate.cfg["taunt"]]
            local actCmd = (ultimate.cfg["taunt_act"] == 1) and "act" or "act2"

            RunConsoleCommand(actCmd, act)
            ultimate.nextDance = CurTime() + (1 / tauntSpeed)
        end

        if ultimate.cfg["alt_taunt"] and pLocalPlayer:Alive() and CurTime() >= ultimate.nextDance2 then
            local taunt2Speed = ultimate.cfg["alt_taunt_speed"] or 1.0
            local tauntIdx = ultimate.cfg["alt_taunt_act"] or 1
            local act = ultimate.actCommands2 and ultimate.actCommands2[tauntIdx] or nil

            RunConsoleCommand("act2", act)
            ultimate.nextDance2 = CurTime() + (1 / taunt2Speed)
        end


        if ultimate.cfg["yaw_base"] == 2 then
            tply = ultimate.GetSortedPlayers( 1, 0, 1, false )
            if tply and tply[1] and IsValid(tply[1][1]) and tply[1][1]:Alive() then
                ultimate.aatarget = tply[1][1]
            else
                ultimate.aatarget = nil
            end
        end

        if ultimate.cfg["auto_peak"] then
            ultimate.autopeakThink()
        end

        if ultimate.cfg["disable_sequence_interpolation"] then
            if not ultimate.nextCacheInvalidation then ultimate.nextCacheInvalidation = 0 end

            local ct = CurTime()
            if ct >= ultimate.nextCacheInvalidation then
                local plys = player.GetAll()
                local enableAim = ultimate.cfg["enable_aimbot"]

                for i = 1, #plys do
                    local ply = plys[i]
                    if ply ~= pLocalPlayer and ply:Alive() then
                        ply:InvalidateBoneCache()
                        ply:SetupBones()

                        local anim = ply.GetLuaAnimation and ply:GetLuaAnimation()
                        if anim then ply:SetLuaAnimation(anim) end

                        if ply.SetPoseParameter then
                            for k = 0, 24 do
                                ply:SetPoseParameter(k, ply:GetPoseParameter(k))
                            end
                        end

                        if enableAim then
                            local vel = ply:GetVelocity()
                            if vel then ply:SetVelocity(vel) end

                            ply.lastSimTime = ded.GetSimulationTime(ply:EntIndex())

                            local ang = ply:EyeAngles()
                            if ang then ply:SetEyeAngles(ang) end

                            local mins, maxs = ply:GetCollisionBounds()
                            if mins and maxs then ply:SetCollisionBounds(mins, maxs) end

                            local phys = ply:GetPhysicsObject()
                            if IsValid(phys) then phys:Wake() end
                        end
                    end
                end

                ultimate.nextCacheInvalidation = ct + (1 / (60 / (ultimate.cfg["simulation_limit"] or 2)))
            end
        end
    end
end

/*
    hooks -> CalcView
*/

ultimate.vieworigin = pLocalPlayer:EyePos()
ultimate.viewfov    = 0
ultimate.znear      = 0

ultimate.tpenabled = false
ultimate.tptoggled = false

ultimate.fcvector = pLocalPlayer:EyePos()
ultimate.fcangles = pLocalPlayer:EyeAngles()
ultimate.fcenabled = false
ultimate.fctoggled = false

function ultimate.ShouldDrawLocalPlayer(ply)
    if ply ~= pLocalPlayer then return false end

    if ultimate.tpenabled and ultimate.cfg["third_person"] then
        ply:SetNoDraw(false)

        local wep = ply:GetActiveWeapon()
        if IsValid(wep) then
            wep:SetNoDraw(false)
        end

        return true
    else
        local wep = ply:GetActiveWeapon()
        if IsValid(wep) then
            wep:SetNoDraw(true)
        end
    end

    return false
end

ultimate.thirdPersonConVar = CreateClientConVar("cascade_thirdperson", "0", true, false)
cvars.AddChangeCallback("cascade_thirdperson", function(name, old, new)
    ultimate.tpenabled = tonumber(new) == 1
end)


ultimate.cameraHullMax = Vector( 3, 3, 3 )
ultimate.cameraHullMin = Vector( -3, -3, -3 )
function ultimate.CalcView( ply, origin, angles, fov, znear, zfar )
    if ultimate.UnSafeFrame then
        return { origin = origin, angles = angles, fov = fov }
    end

    local view = {}

    local tppressed = ultimate.IsKeyDown(ultimate.binds["third_person"])
    local fcpressed = ultimate.IsKeyDown(ultimate.binds["free_camera"])

    if ultimate.cfg["third_person"] and tppressed and not ultimate.tptoggled then
        ultimate.tpenabled = not ultimate.tpenabled
    end

    if ultimate.cfg["free_camera"] and fcpressed and not ultimate.fctoggled then
        ultimate.fcenabled = not ultimate.fcenabled
        ultimate.fcangles = pLocalPlayer:EyeAngles()
    elseif ultimate.fcenabled and not ultimate.cfg["free_camera"] then
        ultimate.fcenabled = false
    end

    ultimate.tptoggled = tppressed
    ultimate.fctoggled = fcpressed

    if ultimate.cfg["fake_duck"] and ultimate.IsKeyDown(ultimate.binds["fake_duck"]) then
        origin.z = pLocalPlayer:GetPos().z + 64
    end

    local fangs = ultimate.cfg["silent_aim"] and ultimate.SilentAngle or angles

    if ultimate.fcenabled then
        local speed = ultimate.cfg["free_camera_speed"]

        if input.IsKeyDown(KEY_W) then
            ultimate.fcvector = ultimate.fcvector + ultimate.SilentAngle:Forward() * speed
        end

        if input.IsKeyDown(KEY_S) then
            ultimate.fcvector = ultimate.fcvector - ultimate.SilentAngle:Forward() * speed
        end

        if input.IsKeyDown(KEY_A) then
            ultimate.fcvector = ultimate.fcvector - ultimate.SilentAngle:Right() * speed
        end

        if input.IsKeyDown(KEY_D) then
            ultimate.fcvector = ultimate.fcvector + ultimate.SilentAngle:Right() * speed
        end

        if input.IsKeyDown(KEY_SPACE) then
            ultimate.fcvector.z = ultimate.fcvector.z + speed
        end

        if input.IsKeyDown(KEY_LSHIFT) then
            ultimate.fcvector.z = ultimate.fcvector.z - speed
        end

        view.origin = ultimate.fcvector
        view.angles = fangs
        view.fov = ultimate.cfg["fov_override"]
        view.drawviewer = not ultimate.cfg["ghetto_free_cam"]
    else
        ultimate.fcvector = origin

        ultimate.tpCurrentDistance = ultimate.tpCurrentDistance or 0
        ultimate.tpTargetDistance = 0

        if ultimate.cfg["third_person"] and ultimate.tpenabled then
            ultimate.tpTargetDistance = ultimate.cfg["third_person_distance"] * 10
        end

        if ultimate.cfg["third_person_smoothing"] then
            local smoothFactor = ultimate.cfg["third_person_smooth_factor"] or 5
            if smoothFactor >= 10 then
                ultimate.tpCurrentDistance = ultimate.tpTargetDistance
            else
                local speed = (smoothFactor / 10) * 20
                local lerpFactor = math.min(FrameTime() * speed, 1)
                ultimate.tpCurrentDistance = Lerp(lerpFactor, ultimate.tpCurrentDistance, ultimate.tpTargetDistance)
            end
        else
            ultimate.tpCurrentDistance = ultimate.tpTargetDistance
        end

        local targetOrigin = origin - ((fangs):Forward() * (ultimate.tpCurrentDistance / 10))

        if ultimate.tpenabled and ultimate.cfg["third_person_collision"] then
            local tr = {}
            tr.start = origin
            tr.endpos = targetOrigin
            tr.mins = ultimate.cameraHullMin
            tr.maxs = ultimate.cameraHullMax
            tr.filter = ply
            tr.mask = MASK_BLOCKLOS
            local res = util.TraceHull( tr )
            targetOrigin = res.HitPos
        end

        view.origin = targetOrigin
        view.angles = fangs
        view.fov = ultimate.cfg["fov_override"]
        view.drawviewer = ultimate.tpenabled and ultimate.cfg["third_person"]

        if ultimate.tpenabled and ultimate.cfg["third_person"] then
            pLocalPlayer:SetNoDraw(false)
            local wep = pLocalPlayer:GetActiveWeapon()
            if IsValid(wep) then wep:SetNoDraw(false) end
        end
    end

    ultimate.vieworigin = ( ultimate.cfg["ghetto_free_cam"] and ultimate.fcenabled ) and ultimate.fcvector or view.origin
    ultimate.viewfov    = view.fov
    ultimate.znear      = znear

    if ( not ultimate.cfg["override_view"] ) then
        if ( math.floor( fov ) ~= GetConVar("fov_desired"):GetFloat() ) then
            view.fov = fov
        end

        local pVehicle = pLocalPlayer:GetVehicle()

        if ( IsValid( pVehicle ) ) then
            view = hook.Run( "CalcVehicleView", pVehicle, ply, view )
        end

        local pWeapon = pLocalPlayer:GetActiveWeapon()

        if ( IsValid( pWeapon ) ) then
            local pWeaponCalcView = pWeapon.CalcView

            if ( pWeaponCalcView ) then
                local origin, angles, fov = pWeaponCalcView( pWeapon, ply, Vector( view.origin ), Angle( view.angles ), view.fov )
			    view.origin, view.angles, view.fov = origin or view.origin, angles or view.angles, fov or view.fov
            end
        end
    end

    return view
end

function ultimate.GetFovRadius()
    local Radius = ultimate.cfg["aimbot_fov"]

    local Ratio = screenWidth / screenHeight
    local AimFOV = Radius * (math.pi / 180)
    local GameFOV = ultimate.viewfov * (math.pi / 180)
    local ViewFOV = 2 * math.atan(Ratio * (ultimate.znear / 2) * math.tan(GameFOV / 2))

    return (math.tan(AimFOV) / math.tan(ViewFOV / 2)) * screenWidth
end

function ultimate.CalcViewModelView(wep, vm, oldPos, oldAng, pos, ang)
    local origin = pos
    local angles = ang or (pLocalPlayer and pLocalPlayer:EyeAngles() or Angle(0, 0, 0))

    local silentAngles = ultimate.cfg["silent_aim"] and ultimate.SilentAngle or angles

    if ultimate.cfg["disable_visuals_recoil"] then
        origin = ultimate.vieworigin or origin
    end

    angles = silentAngles

    if ultimate.cfg["viewmodel_position"] then

		local OverridePos = Vector(ultimate.cfg["viewmodel_x"], ultimate.cfg["viewmodel_y"], ultimate.cfg["viewmodel_z"])
		local OverrideAngle = Angle(ultimate.cfg["viewmodel_pitch"], ultimate.cfg["viewmodel_yaw"], ultimate.cfg["viewmodel_roll"])

		angles = angles * 1

		angles:RotateAroundAxis(angles:Right(), OverrideAngle.x * 1.0)
		angles:RotateAroundAxis(angles:Up(), OverrideAngle.y * 1.0)
		angles:RotateAroundAxis(angles:Forward(), OverrideAngle.z* 1.0)

		origin = origin + OverridePos.x * angles:Right() * 1.0
		origin = origin + OverridePos.y * angles:Forward() * 1.0
		origin = origin + OverridePos.z * angles:Up() * 1.0
    end

    if ultimate.cfg["viewmodel_disabler"] then
        local vm = LocalPlayer():GetViewModel()
        if IsValid(vm) then
            vm:SetNoDraw(true)
        end
    else
        local vm = LocalPlayer():GetViewModel()
        if IsValid(vm) then
            vm:SetNoDraw(false)
        end
    end

    return origin, angles
end



/*
    hooks -> Pre / Post DrawViewModel
*/

do
    local drawing = false

    function ultimate.PreDrawViewModel( vm, ply, w )
        if ultimate.UnSafeFrame then return end
        if ply ~= pLocalPlayer then return end

        if ultimate.cfg["viewmodel_chams"] then
            local col = string.ToColor( ultimate.colors["viewmodel_chams"] )
            ultimate.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
            local mat = ultimate.chamMats.vis[ultimate.cfg["viewmodel_chams_type"]]
            render.SetBlend((col.a or 255)/255)
            render.SetColorModulation(col.r/255,col.g/255,col.b/255)
            render.MaterialOverride(mat)
        end

        if ultimate.cfg["fullbright_viewmodel"] then
            render.SuppressEngineLighting( true )
        end

        if ultimate.cfg["viewmodel_changer"] and ultimate.cfg["viewmodel_fov"] ~= GetConVar("viewmodel_fov"):GetInt() and not drawing then
            cam.Start3D(nil, nil, ultimate.cfg["viewmodel_fov"])

                drawing = true

                render.DepthRange( 0, 0.01 )

                vm:DrawModel()

                render.DepthRange( 0, 1 )

                drawing = false

            cam.End3D()
        else
            return
        end

        return true
    end

end

function ultimate.PostDrawViewModel( vm, ply, w )
    render.SetColorModulation(1, 1, 1)
    render.MaterialOverride()
    render.SetBlend(1)
    render.SuppressEngineLighting(false)
end

/*
    hooks -> OnImpact ( c++ module )
*/
ultimate.bulletImpacts = {}

function ultimate.OnImpact( data )
    local startpos = data.m_vStart

    if ultimate.cfg["bullet_tracers_muzzle"] and data.m_vStart == pLocalPlayer:EyePos() then
        local vm = pLocalPlayer:GetViewModel()
	    local wep = pLocalPlayer:GetActiveWeapon()

        if vm && IsValid( wep ) && IsValid( vm ) then
            local muzzle = vm:LookupAttachment( "muzzle" )

		    if muzzle == 0 then
			    muzzle = vm:LookupAttachment( "1" )
		    end

            if vm:GetAttachment( muzzle ) then
                startpos = vm:GetAttachment( muzzle ).Pos
            end
        end
    end

    ultimate.bulletImpacts[#ultimate.bulletImpacts + 1] = {
        shootTime = CurTime(),
        startPos = startpos,
        endPos = data.m_vOrigin,
        hitbox = data.m_nHitbox,
        alpha = 255
    }
end




/*
    hooks -> PostDrawOpaqueRenderables
*/

do
    local oldtrmat = ultimate.cfg["bullet_tracers_material"]
    local tracemat = Material("effects/beam_generic01")

    local realcolor, fakecolor, lbycolor = Color( 0, 255, 0 ), Color( 255, 0, 0 ), Color( 0, 0, 255 )


    function ultimate.PostDrawOpaqueRenderables()

        if ultimate.UnSafeFrame then return end

        if ultimate.cfg["bullet_tracers"] then
            local trmat = ultimate.cfg["bullet_tracers_material"]

            if trmat ~= oldtrmat then
                tracemat = Material( trmat )
                oldtrmat = trmat
            end

            render.SetMaterial( tracemat )

            local tracercolor = string.ToColor(ultimate.colors["bullet_tracers"])
            local oldAlpha = tracercolor.a

            local curTime = CurTime()
            local dieTime = ultimate.cfg["tracers_die_time"]

            for i = #ultimate.bulletImpacts, 1, -1 do
                local impact = ultimate.bulletImpacts[i]

                if (curTime - impact.shootTime) > dieTime then
                    table.remove(ultimate.bulletImpacts, i)
                    continue
                end

                tracercolor.a = 255 - ( ( curTime - impact.shootTime ) / dieTime * 255 )

                render.DrawBeam( impact.startPos, impact.endPos, 1, 1, 1, tracercolor )
            end

            tracercolor.a = oldAlpha
        end

        if ultimate.cfg["auto_peak"] and ultimate.startedPeeking then
            ultimate.drawAutopeak()
        end

        if ultimate.cfg["hitbox"] then
            if not IsValid(ultimate.fakeModel) then return end
            if not pLocalPlayer:Alive() then return end
            if ultimate.hideHitboxes then return end
            if not pLocalPlayer:ShouldDrawLocalPlayer() then return end

            local mymodel = pLocalPlayer:GetModel()
            if ultimate.newModel ~= mymodel then
                ultimate.fakeModel = ultimate.CS_Model(mymodel)
                ultimate.newModel = mymodel
            end

            local tbl = {
                layers = ultimate.fakeAngles.layers,
                angles = ultimate.fakeAngles.angle,
                sequence = ultimate.fakeAngles.seq,
                cycle = ultimate.fakeAngles.cycle,
                origin = ultimate.fakeAngles.origin,
                movex = ultimate.fakeAngles.movex,
                movey = ultimate.fakeAngles.movey,
            }
            ultimate.CS_Model_update(pLocalPlayer, ultimate.fakeModel, tbl)

            if ultimate.fakeModel:GetHitBoxGroupCount() ~= nil then
                cam.Start3D(EyePos(), EyeAngles())
                    for group = 0, ultimate.fakeModel:GetHitBoxGroupCount() - 1 do
                        for hitbox = 0, ultimate.fakeModel:GetHitBoxCount(group) - 1 do
                            local bone = ultimate.fakeModel:GetHitBoxBone(hitbox, group)
                            if not bone then continue end

                            local pos, ang = ultimate.fakeModel:GetBonePosition(bone)
                            if not pos then continue end

                            local mins, maxs = ultimate.fakeModel:GetHitBoxBounds(hitbox, group)
                            render.DrawWireframeBox(
                                pos,
                                ang,
                                mins,
                                maxs,
                                string.ToColor(ultimate.colors["hitbox"]),
                                true
                            )
                        end
                    end
                cam.End3D()
            end
        end

        if #ultimate.killHitboxes > 0 or #ultimate.hitHitboxes > 0 then
            cam.Start3D(EyePos(), EyeAngles())
                for i = #ultimate.killHitboxes, 1, -1 do
                    local data = ultimate.killHitboxes[i]
                    if CurTime() > data.endTime then
                        table.remove(ultimate.killHitboxes, i)
                    else
                        for _, hitbox in ipairs(data.hitboxData) do
                            render.DrawWireframeBox(hitbox.pos, hitbox.ang, hitbox.mins, hitbox.maxs, data.color, true)
                        end
                    end
                end

                for i = #ultimate.hitHitboxes, 1, -1 do
                    local data = ultimate.hitHitboxes[i]
                    if CurTime() > data.endTime then
                        table.remove(ultimate.hitHitboxes, i)
                    else
                        for _, hitbox in ipairs(data.hitboxData) do
                            render.DrawWireframeBox(hitbox.pos, hitbox.ang, hitbox.mins, hitbox.maxs, data.color, true)
                        end
                    end
                end
            cam.End3D()
        end
    end
end



/*
    hooks -> FrameStageNotify ( c++ module )
*/

function ultimate.GetUserGroup(ply)
    if ply.GetUserGroup then
        return ply:GetUserGroup()
    elseif ply.GetRankTable and ply:GetRankTable().NiceName then
        return ply:GetRankTable().NiceName
    else
        return "unknown"
    end
end

function ultimate.GetTeam( ply )
    local iTeam = ply:Team()

    if rp and rp.GetJobWithoutDisguise then
        local index = rp.GetJobWithoutDisguise( ply:EntIndex() )
        local tbl = rp.jobs.List[ index ]

        return index, tbl.Name, tbl.Color
    else
        return iTeam, team.GetName(iTeam), team.GetColor(iTeam)
    end
end

// Player data tables

ultimate.playerCache = {}

function ultimate.playerTableUpdate( ply )
    if not ultimate.playerCache[ ply ] then
        ultimate.playerCache[ ply ] = {}
    end

    local v = ultimate.playerCache[ ply ]

    v.entity = ply

    if ultimate.cfg["steam_names"] then
        v.Name = ply:SteamName() or ply:Name()
    else
        v.Name = ply:Name()
    end

    local index, name, color = ultimate.GetTeam( ply )

    v.Team = index
    v.TeamColor = color
    v.TeamName = name

    v.GetUserGroup = ultimate.GetUserGroup(ply)

    v.Health = ply:Health()
    v.GetMaxHealth = ply:GetMaxHealth()

    v.Armor = ply:Armor()
    v.GetMaxArmor = ply:GetMaxArmor()

    v.GetPos = ply:GetPos()

    v.ObserverMode = ply:GetObserverMode()
    v.ObserverTarget = ply:GetObserverTarget()

    local w = ply:GetActiveWeapon()

    v.WeaponClass = IsValid(w) and ( ultimate.cfg["weapon_printname"] and language.GetPhrase( w:GetPrintName() ) or w:GetClass() ) or "Unarmed"
    v.WeaponAmmo = IsValid(w) and w:Clip1() or "-"

    v.MoneyVar = "N/A"

end

function ultimate.playerDataUpdate( )
    ultimate.playerCache = {}

    local plys = player.GetAll()
    local plyCount = #plys

    for i = 1, plyCount do
        local v = plys[i]

        if not IsValid(v) or v == pLocalPlayer then continue end

        ultimate.playerTableUpdate(v)
    end
end

// Entity data

ultimate.entity_cache = {}
ultimate.cfg.ents = {}

function ultimate.RenderOverride(entity, flags)
    local classname = entity:GetClass()

    if classname == "player" or not ultimate.cfg.ents[classname] then
        entity.RenderOverride = nil

        return
    end

    render.MaterialOverride(ultimate.chamMats.vis[1])
    render.SetColorModulation(1, 1, 1)
    render.SetBlend(1)

    entity:DrawModel(flags)

    render.MaterialOverride()
end

function ultimate.entTableUpdate()
    local entitylist = ents.GetAll()

    ultimate.entity_cache = {}

    for i = 1, #entitylist do
        local entity = entitylist[ i ]

        if not IsValid( entity ) then
            continue
        end

        local classname = entity:GetClass()

        if classname == "player" or not ultimate.cfg.ents[classname] then
            continue
        end

        if (not isfunction(entity.RenderOverride)) then
            entity.RenderOverride = ultimate.RenderOverride
        end

        ultimate.entity_cache[ #ultimate.entity_cache + 1 ] = {
            entity = entity,
            class = classname,
            position = entity:GetPos()
        }
    end
end


do
    local localData = {}

    localData.origin = Vector()

    function ultimate.FillLocalNetworkData( netdata )
        localData.origin     =   netdata[1]
    end

    function ultimate.GetLocalNetworkData()
        return localData
    end
end


do
    local missedTicks     = 0
    local lastSimTime     = 0
    local frameStageData  = {}

    local FRAME_NET_UPDATE_POSTDATAUPDATE_END = 3

    function ultimate.GetMissedTicks()     return missedTicks     end
    function ultimate.GetLastSimTime()     return lastSimTime     end
    function ultimate.GetFrameStageData(k) return frameStageData[k] end
    function ultimate.SetFrameStageData(k,v) frameStageData[k] = v end

    function ultimate.PreFrameStageNotify(stage)
        if stage ~= FRAME_NET_UPDATE_POSTDATAUPDATE_END then
            ultimate.entTableUpdate()

            if not IsValid(me) then return end

            local meIndex = me:EntIndex()
            local curSim  = me:GetInternalVariable("m_flSimulationTime")
            local orig    = me:GetNetworkOrigin()

            local curSim = me:GetInternalVariable("m_flSimulationTime") or 0
            if curSim ~= curSim then curSim = 0 end

            if lastSimTime ~= lastSimTime or not lastSimTime then
                lastSimTime = curSim
            end

            if lastSimTime > 0 and curSim > lastSimTime then
                local delta = curSim - lastSimTime
                if delta < 0 or delta ~= delta then
                    delta = 0
                end

                local dt = ultimate.TIME_TO_TICKS(delta)
                if dt > 1 then
                    missedTicks = missedTicks + dt - 1
                end
            end

            lastSimTime = curSim

            local data = {}
            data[1] = orig
            ultimate.FillLocalNetworkData(data)

            local plys = player.GetAll()
            frameStageData.playerCount = #plys
            frameStageData.localOrigin = orig
            frameStageData.updateTime  = CurTime()

            for i = 1, #plys do
                local v = plys[i]
                local idx = v:EntIndex()

                local sim = v:GetInternalVariable("m_flSimulationTime") or 0
                local pos = v:GetNetworkOrigin()

                if sim ~= sim then sim = 0 end

                if not v.ult_prev_simtime or v.ult_prev_simtime ~= v.ult_prev_simtime then
                    v.ult_prev_simtime = sim
                    v.ult_prev_pos     = pos
                    v.flticks          = 0
                    v.missedanimticks  = 0
                    v.simtime_updated  = false
                    v.break_lc         = false
                    ultimate.btrecords[v]  = {}
                    ultimate.predicted[v]  = {}
                    v.aimshots         = 0
                    v.fakepitch        = v:EyeAngles().p > 90
                else
                    local prev = v.ult_prev_simtime
                    if prev ~= prev then prev = 0 end

                    if sim ~= prev then
                        local dt = sim - prev
                        if dt >= 0 then
                            local fl = ultimate.TIME_TO_TICKS(dt)
                            ded.SetMissedTicks(fl)
                            ded.AllowAnimationUpdate(true)
                            v.flticks          = math.Clamp(fl, 1, 24)
                            v.ult_prev_simtime = sim
                            v.break_lc         = pos:DistToSqr(v.ult_prev_pos) > 4096
                            v.ult_prev_pos     = pos
                            v.fakepitch        = v:EyeAngles().p > 90
                            v.simtime_updated  = true
                        else
                            v.simtime_updated = false
                        end
                    else
                        v.simtime_updated = false
                    end
                end

                if ultimate.canBacktrack(v) and v ~= me and v.simtime_updated then
                    ultimate.recordBacktrack(v)
                end

                if v.break_lc then
                    ultimate.btrecords[v] = {}
                end
            end

        elseif stage == FRAME_RENDER_START then
            plys = player.GetAll()

            for i = 1, #plys do
                local v = plys[i]

                if v == pLocalPlayer then continue end

                if ultimate.cfg["extrapolation"] and IsValid(v) then
                    local idx = v:EntIndex()
                    local pos = v:GetPos()
                    local vel = v:GetVelocity()

                    if vel:LengthSqr() < 1 then return end

                    local l0 = ded.GetLatency(0) or 0
                    local l1 = ded.GetLatency(1) or 0
                    local choke = v.flticks or 0

                    local ticks = ultimate.TIME_TO_TICKS(l0 + l1) + choke
                    ticks = math.Clamp(ticks, 1, 24)

                    if ticks > 1 then
                        ded.StartSimulation(idx)

                        local data
                        for i = 1, ticks do
                            ded.SimulateTick()
                            if i == ticks then
                                data = ded.GetSimulationData()
                            end
                        end

                        if data then
                            local p = data.m_vecAbsOrigin
                            if p then
                                local d = p:DistToSqr(pos)
                                if d > 0 and d < 262144 then
                                    v:SetRenderOrigin(p)
                                end
                            end

                            if data.m_angAbsRotation then
                                v:SetRenderAngles(data.m_angAbsRotation)
                            end
                        end

                        ded.FinishSimulation()
                    end
                end

                if ultimate.cfg["test"] then
                    print("test")
                end

                if ultimate.cfg["resolver"] then

                    local angs = Angle()
                    angs.y = ultimate.bruteYaw[ v.aimshots % #ultimate.bruteYaw + 1 ] + v:EyeAngles().y

                    v:SetRenderAngles( angs )

                    v:SetPoseParameter( "body_yaw", math_NormalizeAngle( angs.y - v:EyeAngles().y ) )
                    v:SetPoseParameter( "aim_yaw", math_NormalizeAngle( angs.y - v:EyeAngles().y ) )
                end
            end
         end
    end
end

function ultimate.PostFrameStageNotify(stage)
    if stage ~= 3 then return end

    ultimate.playerDataUpdate()

    local ct = CurTime()
    local toTicks = ultimate.TIME_TO_TICKS

    for _, ply in ipairs(player.GetAll()) do
        if not IsValid(ply) or ply == pLocalPlayer then continue end

        local idx = ply:EntIndex()
        local tbl = ply:GetTable()
        local sim = ded.GetSimulationTime(idx)

        if not tbl.flSimulationTime then
            tbl.flSimulationTime  = sim
            tbl.flPrevSimTime     = 0
            tbl.iChokedCommands   = 0
            tbl.bIsSimulated      = false
            tbl.flAnimTime        = 0
            tbl.vecPrevOrigin     = ply:GetPos()
            tbl.angPrevAngles     = ply:EyeAngles()
            continue
        end

        local diff     = sim - tbl.flSimulationTime
        local choked   = math.Clamp(toTicks(diff), 0, 21)
        local simulated = diff > 0
        tbl.iChokedCommands = choked
        tbl.bIsSimulated    = simulated

        if simulated then
            tbl.flPrevSimTime = tbl.flSimulationTime
            tbl.flAnimTime    = ct

            local cur = ply:GetPos()
            if (cur - tbl.vecPrevOrigin):LengthSqr() > (4096 * 4096) then
                ply:InvalidateBoneCache()
                ply:SetupBones()
            end

            tbl.vecPrevOrigin = cur
            tbl.angPrevAngles = ply:EyeAngles()

            if choked > 1 then
                local n = ply:GetNumPoseParameters()
                for i = 0, n - 1 do
                    local a, b = ply:GetPoseParameterRange(i)
                    local p = ply:GetPoseParameter(i)
                    ply:SetPoseParameter(i, math.min(b, math.max(a, p)))
                end
                ply:InvalidateBoneCache()
                ply:SetupBones()
            end
        end

        tbl.flSimulationTime = sim
    end
end

/*
    hooks -> ShouldUpdateAnimation ( cpp )
*/

ultimate.fakeAngles = {
    angle = pLocalPlayer:EyeAngles(),
    movex = 0,
    movey = 0,
    layers = {},
    seq = 0,
    cycle = 0,
    origin = pLocalPlayer:GetPos(),
}

function ultimate.UpdateAnimation( v )
    v:SetPoseParameter( "head_pitch", 0 )
    v:SetPoseParameter( "head_yaw", 0 )

    if ultimate.cfg["Pitch resolver"] and v.fakepitch then
        v:SetPoseParameter( "aim_pitch", -89 )
        v:SetPoseParameter( "head_pitch", -89 )
    end

    v:InvalidateBoneCache()
end

function ultimate.ShouldUpdateAnimation( entIndex )
    local ent = Entity( entIndex )

    if not ent.simtime_updated then return end

    ded.SetMissedTicks( ent.flticks )
    ded.AllowAnimationUpdate( true )
end

// AA shit
ultimate.realModel = ultimate.CS_Model( pLocalPlayer:GetModel() )
ultimate.fakeModel = ultimate.CS_Model( pLocalPlayer:GetModel() )

ultimate.newModel = pLocalPlayer:GetModel()

function ultimate.drawCSModels_real()
    if not ultimate.cfg["anti_aim_chams"] or not ultimate.tpenabled then
        return
    end
    if not pLocalPlayer:Alive() then
        return
    end

    if not ultimate.realModel or not ultimate.chamMats or not ultimate.chamMats.invis then
        return
    end

    local mymodel = pLocalPlayer:GetModel()

    if ultimate.newModel ~= mymodel then
        ultimate.realModel = ultimate.CS_Model( mymodel )
        ultimate.newModel = mymodel
    end

    local tbl = {
        layers = ultimate.fakeAngles.layers,
        angles = ultimate.fakeAngles.angle,
        sequence = ultimate.fakeAngles.seq,
        cycle = ultimate.fakeAngles.cycle,
        origin = ultimate.fakeAngles.origin,
        movex = ultimate.fakeAngles.movex,
        movey = ultimate.fakeAngles.movey,
    }

    ultimate.CS_Model_update( pLocalPlayer, ultimate.realModel, tbl )

    if ultimate.cfg["antiaim_fullbright"] then
        render.SuppressEngineLighting(true)
    end

    local col = string.ToColor(ultimate.colors["real_chams"])
    if ultimate.chamMats.invis[6] then
        ultimate.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    end

    local matIdx = ultimate.cfg["antiaim_material"] or 1
    if ultimate.chamMats.invis[matIdx] then
        render.MaterialOverride(ultimate.chamMats.invis[matIdx])
    end

    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    render.SetBlend(col.a/255)
    ultimate.realModel:SetRenderMode(1)
    ultimate.realModel:DrawModel()

    if ultimate.cfg["antiaim_fullbright"] then
        render.SuppressEngineLighting(false)
    end
end

/*
    hooks -> PostDrawEffects
*/

do


    local CopyMat		= Material("pp/copy")
    local AddMat		= Material( "pp/add" )
    local SubMat		= Material( "pp/sub" )
    local OutlineMat	= CreateMaterial("OutlineMat","UnlitGeneric",{["$ignorez"] = 1,["$alphatest"] = 1})

    local outline_mats = {
        [1] = OutlineMat,
        [2] = SubMat,
        [3] = AddMat,
        [4] = GradMat,
        [5] = BloomMat,
    }

    local subclear = {
        [2] = true,
        //[4] = true,
    }

    ultimate.cfg["player_outline"] = false
    ultimate.cfg["entity_outline"] = false
    ultimate.colors["player_outline"] = "45 255 86 255"
    ultimate.colors["entity_outline"] = "255 86 45 255"

    local StoreTexture	= render.GetScreenEffectTexture(0)
    local DrawTexture	= render.GetScreenEffectTexture(1)

    function ultimate.RenderOutline()
        local renderEnts = {}

        if ultimate.cfg["player_outline"] then
            local plys = player.GetAll()

            for i = 1, #plys do
                local v = plys[ i ]

                if not IsValid( v ) or v == pLocalPlayer or not v:Alive() or v:IsDormant() then continue end

                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if ultimate.cfg["entity_outline"] then
            for i = 1, #ultimate.entity_cache do
                local v = ultimate.entity_cache[ i ].entity

                if not IsValid( v ) or v:IsDormant() then continue end

                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if #renderEnts == 0 then return end

        local scene = render.GetRenderTarget()
        render.CopyRenderTargetToTexture(StoreTexture)

        if subclear[ ultimate.cfg["outline_style"] ] then
            render.Clear( 255, 255, 255, 255, true, true )
        else
            render.Clear( 0, 0, 0, 0, true, true )
        end

        render.SetStencilEnable(true)
            cam.IgnoreZ(true)
            render.SuppressEngineLighting(true)

            render.SetStencilWriteMask(255)
            render.SetStencilTestMask(255)

            render.SetStencilCompareFunction(STENCIL_ALWAYS)
            render.SetStencilFailOperation(STENCIL_KEEP)
            render.SetStencilZFailOperation(STENCIL_REPLACE)
            render.SetStencilPassOperation(STENCIL_REPLACE)

            cam.Start3D()
                for i = 1, #renderEnts do
                    render.SetStencilReferenceValue( i )

                    renderEnts[i]:DrawModel()
                end
            cam.End3D()

            render.SetStencilCompareFunction(STENCIL_EQUAL)

            cam.Start2D()
                for i = 1, #renderEnts do
                    local c = renderEnts[i]:IsPlayer() and string.ToColor( ultimate.colors["player_outline"] ) or string.ToColor( ultimate.colors["entity_outline"] )

				    render.SetStencilReferenceValue( i )

                    surface.SetDrawColor( c )
                    surface.DrawRect( 0, 0, screenWidth, screenHeight )
                end
            cam.End2D()

            render.SuppressEngineLighting(false)
            cam.IgnoreZ(false)
        render.SetStencilEnable(false)

        render.CopyRenderTargetToTexture(DrawTexture)

        if ultimate.cfg["outline_style"] > 1 then
            render.BlurRenderTarget( DrawTexture, 1, 1, 1 )
        end

        render.SetRenderTarget(scene)
        CopyMat:SetTexture("$basetexture",StoreTexture)
        render.SetMaterial(CopyMat)
        render.DrawScreenQuad()

        render.SetStencilEnable(true)
            render.SetStencilReferenceValue(0)
            render.SetStencilCompareFunction(STENCIL_EQUAL)

            local mat = outline_mats[ ultimate.cfg["outline_style"] ]

            mat:SetTexture( "$basetexture", DrawTexture )
            render.SetMaterial( mat )

            for x=-1,1 do
                for y=-1,1 do
                    if x==0 and y==0 then continue end

                    render.DrawScreenQuadEx(x,y,screenWidth,screenHeight)
                end
            end
        render.SetStencilEnable(false)
    end
end

function ultimate.PostDrawEffects()
    if ultimate.UnSafeFrame then return end
    if not ultimate.cfg["player_outline"] and not ultimate.cfg["entity_outline"] then return end

    ultimate.RenderOutline()
end

function ultimate.AdjustMouseSensitivity( defaultSensivity )
    return ultimate.cfg["disable_sensivity_adjustment"] and 0 or nil
end

ultimate.fbe = false

function ultimate.PreRender()
    if ultimate.cfg["fullbright"] and ultimate.fbe then
        RunConsoleCommand("mat_fullbright", "1")
    else
        RunConsoleCommand("mat_fullbright", "0")
    end
end



function ultimate.GetMotionBlurValues()
    render.SetLightingMode( 0 )
end

ded.ConVarSetFlags( "mat_fullbright", 0 )
ded.ConVarSetFlags( "r_aspectratio", 0 )
ded.ConVarSetFlags( "cl_showhitboxes", 0 )

function GAMEMODE:CreateMove( cmd ) return true end
function GAMEMODE:CalcView( view )  return true end
function GAMEMODE:ShouldDrawLocal() return true end

GAMEMODE["EntityFireBullets"] = function(self, p, data)
    if not ultimate.activeWeapon then return end

    ultimate.bulletsFired = true

    if data and data.Src == pLocalPlayer:EyePos() and IsFirstTimePredicted() then
        ultimate.lastShotTick = engine.TickCount()
    end

    if IsValid(ultimate.activeWeapon) and ultimate.activeWeapon.GetOwner and IsValid(ultimate.activeWeapon:GetOwner()) then
        local owner = ultimate.activeWeapon:GetOwner()
        if owner == LocalPlayer() then
            ultimate.weaponRecoil = {owner:GetViewPunchAngles().pitch or 0, owner:GetViewPunchAngles().yaw or 0}
        end
    end

    if data and data.Spread then
        ultimate.weaponSpread = {data.Spread.x or 0, data.Spread.y or 0}
    end

    if data and data.Distance then
        ultimate.weaponRange = data.Distance
    end

    ultimate.lastFireTime = CurTime()

    local tick = engine.TickCount()
    if ultimate.cfg[ "on_screen_logs" ] and data.Src == pLocalPlayer:EyePos() and ultimate.aimingrn and ultimate.target and not ultimate.onScreenLogs[ tick ] and IsFirstTimePredicted() then
        local reason = 15
        local shotData = ultimate.lastShotData
        local target = ultimate.target

        local tr = {}
        tr.filter = pLocalPlayer
        tr.start = data.Src
        tr.endpos = data.Src + data.Dir * 13337
        tr.mask = MASK_SHOT
        tr = util.TraceLine( tr )

        if tr.StartSolid then
            reason = 2
        elseif tr.Hit and tr.Entity ~= target then
            reason = 2
        elseif target.break_lc then
            reason = 4
        elseif shotData.backtrack_tick > 0 then
            local btData = ultimate.btrecords[target] and ultimate.btrecords[target][shotData.backtrack_tick]
            if not btData then
                reason = 6
            elseif btData.velocity and btData.velocity:Length() > 250 then
                reason = 9
            else
                reason = 6
            end
        elseif target:GetVelocity():Length() > 300 and not shotData.predicted then
            reason = 9
        elseif ded.GetLatency( 0 ) > 0.15 then
            if target:GetVelocity():Length() > 150 then
                reason = 3
            else
                reason = 4
            end
        elseif ultimate.cfg["resolver"] then
            local rData = ultimate.rData[target:EntIndex()]
            if rData and rData.miss > 3 then
                reason = 5
            elseif target:GetVelocity():Length() < 5 then
                reason = 10
            else
                reason = 5
            end
        elseif shotData.multipoint then
            reason = 13
        elseif target.flticks and target.flticks > 3 then
            reason = 11
        elseif target.missedanimticks and target.missedanimticks > 2 then
            reason = 8
        elseif ultimate.cfg["tickbase_shift"] then
            reason = 14
        elseif data.Spread and (data.Spread.x > 0.01 or data.Spread.y > 0.01) then
            reason = 1
        end

        local hlcolor = string.ToColor( ultimate.colors[ ultimate.MissReasons[ reason ].var ] )
        local missStr = ultimate.MissReasons[ reason ].str
        local extraInfo = ""

        if reason == 9 then
            extraInfo = string.format(" (vel: %.0f)", target:GetVelocity():Length())
        elseif reason == 6 then
            extraInfo = string.format(" (bt: %d)", shotData.backtrack_tick)
        elseif reason == 11 then
            extraInfo = string.format(" (fl: %d)", target.flticks or 0)
        elseif reason == 5 then
            local rData = ultimate.rData[target:EntIndex()]
            extraInfo = string.format(" (m: %d)", rData and rData.miss or 0)
        end

        local logData = {
            tick = tick,
            { "Shot at ", target:Name(), " missed due to ", missStr, extraInfo },
            { ultimate.HitLogsWhite, hlcolor, ultimate.HitLogsWhite, hlcolor, hlcolor }
        }

        ultimate.onScreenLogs[ tick ] = logData

        if ultimate.cfg["miss_sound"] then
            surface.PlaySound(ultimate.cfg["miss_sound_str"])
        end
    end

    local spread = data.Spread * -1
    local weaponClass = ultimate.activeWeaponClass

    if ultimate.cones[weaponClass] ~= spread and spread ~= ultimate.nullVec then
        ultimate.cones[weaponClass] = spread
    end
end

function ultimate.SetupWorldFog()
    if not ultimate.cfg[ "fogchanger" ] then return end

    local color = string.ToColor(ultimate.colors["fogchanger"])


    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( ultimate.cfg[ "fogstart" ] )
    render.FogEnd( ultimate.cfg[ "fogend" ] )
    render.FogMaxDensity( color.a / 255 )

    return true
end

function ultimate.SetupSkyboxFog( SkyboxSize )
    if not ultimate.cfg[ "fogchanger" ] then return end

    local color = string.ToColor(ultimate.colors["fogchanger"])

    render.FogMode( MATERIAL_FOG_LINEAR )
    render.FogColor( color.r, color.g, color.b )
    render.FogStart( ultimate.cfg[ "fogstart" ] * SkyboxSize )
    render.FogEnd( ultimate.cfg[ "fogend" ] * SkyboxSize )
    render.FogMaxDensity( color.a / 255 )

    return true
end



function ultimate.GhostFollower(cmd)
    local tar = player.GetBySteamID( ultimate.cfg["gfid"] )

    if IsValid( tar ) then
        local tang = ( tar:GetPos() - pLocalPlayer:EyePos() ):Angle()
        local myVel = me:GetVelocity()
        local strafeDir = ultimate.CalculateOptimalStrafe(myVel, tang.y)

        cmd:ClearMovement()
        cmd:ClearButtons()

        cmd:SetForwardMove( 10000 )
        cmd:SetSideMove(strafeDir)

        cmd:AddKey(IN_SPEED)

        cmd:SetViewAngles( tang )
        ultimate.MovementFix( cmd, tang.y )
    end
end

function ultimate.NormalizeAngle(angle)
    return ((angle + 180) % 360) - 180
end

function ultimate.CalculateOptimalStrafe(velocity, currentAngle)
    if velocity:Length() < 1 then return 0 end
    local velAngle = math.atan2(velocity.y, velocity.x) * 180 / math.pi
    local diff = ultimate.NormalizeAngle(currentAngle - velAngle)
    if math.abs(diff) < 30 then
        return ultimate.NormalizeAngle(currentAngle - velAngle)
    end
    return diff > 0 and 10000 or -10000
end

function initialize_player_data(entIndex)
    ultimate.player_data = ultimate.player_data or {}
    ultimate.player_data[entIndex] = ultimate.player_data[entIndex] or {
        last_angles = {},
        brute_stage = 0,
        shots_fired = 0,
        last_lby = 0
    }
end

function ultimate.CalcMainActivity(ply, velocity)
    if not ultimate.cfg["tpose"] then return end
    if not IsValid(ply) or ply == me then return end
    if ultimate.cfg.friends[ply:SteamID()] then return end
    return -1, -1
end

net.Receive("rp.police.SetLocalHandcuff", function()
    if not ultimate.cfg["retry_on_handcuff"] then return end

    RunConsoleCommand("retry")
end)

/*
    Hooks
*/

ultimate.hooks           = {}

function ultimate.AddHook( event, func )
    if func == nil and not ultimate[ event ] then print("Failed to find hook: " .. event) return end
    local name = util.Base64Encode( event ) .. CurTime()
    hook.Add( event, name, ultimate[ event ] or func )
    ultimate.hooks[ #ultimate.hooks + 1 ] = { event, name }
end


function ultimate.RemoveAllHooks()
    for i = #ultimate.hooks, 1, -1 do
        local chk = ultimate.hooks[i]
        hook.Remove(chk[1], chk[2])
        table.remove(ultimate.hooks, i)
    end
end

function ultimate.Unload()

    if ultimate and ultimate.frame and IsValid(ultimate.frame) then
        ultimate.frame:Remove()
    end

    if ultimate and ultimate.scrollpanel and IsValid(ultimate.scrollpanel) then
        ultimate.scrollpanel:Remove()
        ultimate.scrollpanel = nil
    end


    if ultimate and ultimate.avatar and IsValid(ultimate.avatar) then
        ultimate.avatar:Remove()
        ultimate.avatar = nil
    end

    if ultimate and ultimate.userInfoTabsPanel and IsValid(ultimate.userInfoTabsPanel) then

        if ultimate.userInfoTabButtons then
            for _, btn in ipairs(ultimate.userInfoTabButtons) do
                if IsValid(btn) then btn:Remove() end
            end
            ultimate.userInfoTabButtons = nil
        end
        ultimate.userInfoTabsPanel:Remove()
        ultimate.userInfoTabsPanel = nil
    end


    if ultimate and ultimate.ui then
        if ultimate.ui.MultiComboP then
            pcall(function() ultimate.ui.RemovePanel( ultimate.ui.MultiComboP ) end)
            ultimate.ui.MultiComboP = nil
        end
        if ultimate.ui.ColorWindow then
            pcall(function() ultimate.ui.RemovePanel( ultimate.ui.ColorWindow ) end)
            ultimate.ui.ColorWindow = nil
        end
        if ultimate.ui.ultimatePan then
            pcall(function() ultimate.ui.RemovePanel( ultimate.ui.ultimatePan ) end)
            ultimate.ui.ultimatePan = nil
        end
    end


    if multicomboP and IsValid(multicomboP) then multicomboP:Remove() multicomboP = nil end


    ded.SetBSendPacket( true )
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )


    ultimate.RemoveAllHooks()

    if ultimate.RestoreDetours then
        ultimate.RestoreDetours()
    end


    ultimate.onScreenLogs = {}
    ultimate.hitmarkers = {}
    ultimate.hitnums = {}
    ultimate.playerTrail = {}
    ultimate.bulletImpacts = {}

    render.SetLightingMode( 0 )
    ultimate.fbe = false
    RunConsoleCommand("mat_fullbright", "0")
end

ultimate.AddHook( "CreateMove" )

ultimate.AddHook( "Think" )
ultimate.AddHook( "RenderScene" )
ultimate.AddHook( "DrawOverlay" )
ultimate.AddHook( "Ungrabbable2D", function() ultimate.DrawESP() ultimate.DrawSomeShit() end )

ultimate.AddHook( "CalcView" )
ultimate.AddHook( "CalcViewModelView" )

ultimate.AddHook( "PreDrawViewModel" )
ultimate.AddHook( "PostDrawViewModel" )

ultimate.AddHook( "PostDrawOpaqueRenderables" )
ultimate.AddHook( "PostDrawEffects" )

ultimate.AddHook( "OnImpact" )

ultimate.AddHook( "PreFrameStageNotify" )
ultimate.AddHook( "PostFrameStageNotify" )

ultimate.AddHook( "UpdateAnimation" )
ultimate.AddHook( "ShouldUpdateAnimation" )

ultimate.AddHook( "AdjustMouseSensitivity" )

ultimate.AddHook( "RenderScreenspaceEffects" )
ultimate.AddHook( "PostDrawTranslucentRenderables" )

ultimate.AddHook( "PreRender" )
ultimate.AddHook( "GetMotionBlurValues" )

ultimate.AddHook( "DrawPhysgunBeam" )

ultimate.AddHook( "PrePlayerDraw" )

ultimate.AddHook( "OnEntityCreated" )

ultimate.AddHook( "entity_killed" )
ultimate.AddHook( "player_hurt" )

ultimate.AddHook( "SetupWorldFog" )
ultimate.AddHook( "SetupSkyboxFog" )
ultimate.AddHook( "ShouldDrawLocalPlayer" )
ultimate.AddHook( "CalcMainActivity" )
