

local ilya                          = {}
local me                                = LocalPlayer()

require("zxcmodule")

jit.flush()

/*
    Localization start
*/

local global 		                    = _G //table.Copy( _G )

local gRunCmd                           = global.RunConsoleCommand

local Angle                             = Angle
local Material                          = Material
local Vector                            = Vector
local Color                             = Color
local pairs                             = pairs
local ipairs                            = ipairs
local IsValid                           = IsValid
local tostring                          = tostring
local tonumber                          = tonumber
local CurTime                           = CurTime
local IsFirstTimePredicted              = IsFirstTimePredicted
local Lerp                              = Lerp
local LerpAngle                         = LerpAngle

local gFindMeta                         = global.FindMetaTable

local MetaPly                           = gFindMeta("Player")

local gVgui                             = global.vgui
local gGui                              = global.gui
local gString                           = global.string
local gTable                            = global.table
local gUtil                             = global.util
local gHttp                             = global.http
local gFile                             = global.file
local gSurface                          = global.surface
local gDraw                             = global.draw
local gRender                           = global.render
local gCam                              = global.cam
local gInput                            = global.input
local gHook                             = global.hook
local gNet                              = global.net
local gMath                             = global.math
local gBit                              = global.bit
local gEnts                             = global.ents
local gPlys                             = global.player
local gGame                             = global.game
local gEngine                           = global.engine
local gTeam                             = global.team

local gPlayer                            = global.Player
local gEntity                            = global.Entity

local team_GetColor                     = gTeam.GetColor
local team_GetName                      = gTeam.GetName

local surface_DrawLine                  = gSurface.DrawLine
local surface_DrawOutlinedRect          = gSurface.DrawOutlinedRect
local surface_DrawPoly                  = gSurface.DrawPoly
local surface_DrawRect                  = gSurface.DrawRect
local surface_DrawText                  = gSurface.DrawText
local surface_DrawTexturedRect          = gSurface.DrawTexturedRect
local surface_DrawTexturedRectRotated   = gSurface.DrawTexturedRectRotated
local surface_GetTextSize               = gSurface.GetTextSize
local surface_PlaySound                 = gSurface.PlaySound
local surface_SetAlphaMultiplier        = gSurface.SetAlphaMultiplier
local surface_SetDrawColor              = gSurface.SetDrawColor
local surface_SetFont                   = gSurface.SetFont
local surface_SetMaterial               = gSurface.SetMaterial
local surface_SetTextColor              = gSurface.SetTextColor
local surface_SetTextPos                = gSurface.SetTextPos
local surface_CreateFont                = gSurface.CreateFont

local math_abs                          = gMath.abs
local math_Round                        = gMath.Round
local math_floor                        = gMath.floor
local math_ceil                         = gMath.ceil
local math_min                          = gMath.min
local math_max                          = gMath.max
local math_Clamp                        = gMath.Clamp
local math_sin                          = gMath.sin
local math_cos                          = gMath.cos
local math_tan                          = gMath.tan
local math_rad                          = gMath.rad
local math_Rand                         = gMath.Rand
local math_randomseed                   = gMath.randomseed
local math_deg                          = gMath.deg
local math_atan                         = gMath.atan
local math_atan2                        = gMath.atan2
local math_random                       = gMath.random
local math_huge                         = gMath.huge
local math_sqrt                         = gMath.sqrt

local math_Approach                     = gMath.Approach
local math_NormalizeAngle               = gMath.NormalizeAngle
local math_DistanceSqr                  = gMath.DistanceSqr

local hook_Add                          = gHook.Add
local hook_Remove                       = gHook.Remove
local hook_GetTable                     = gHook.GetTable
local hook_Call                         = gHook.Call
local hook_Run                          = gHook.Run

local bor                               = gBit.bor

local vgui_Create                       = gVgui.Create
local vgui_Register                     = gVgui.Register

local table_Count                       = gTable.Count
local table_Empty                      = gTable.Empty
local table_concat                      = gTable.concat
local table_insert                      = gTable.insert
local table_remove                      = gTable.remove
local table_RemoveByValue               = gTable.RemoveByValue
local table_sort                        = gTable.sort

function table.Empty( tbl )
    if tbl == _G then return end

    return table_Empty( tbl )
end

local gui_ActivateGameUI                = gGui.ActivateGameUI
local gui_HideGameUI                    = gGui.HideGameUI
local gui_OpenURL                       = gGui.OpenURL

local string_find                       = gString.find
local string_format                     = gString.format
local string_len                        = gString.len
local string_sub                        = gString.sub
local string_lower                      = gString.lower
local StartsWith                        = gString.StartWith
local string_ToColor                    = gString.ToColor

local TraceHull                         = gUtil.TraceHull
local TraceLine                         = gUtil.TraceLine

local file_Exists                       = gFile.Exists
local file_Delete                       = gFile.Delete
local file_Find                         = gFile.Find
local file_Read                         = gFile.Read
local file_Write                        = gFile.Write

/*function file.Read( fileName, gamePath )
    local lowered = string_lower( fileName )

    if lowered:find("ilya") or lowered:find(".dll") then
        return nil
    end

    return file_Read( fileName, gamePath )
end

function file.Find( name, path, sorting )
    local files, directories = file_Find( name, path )

    for i = 1, #files do
        local f = string_lower( files[ i ] )

        if f:find("ilya") or f:find(".dll") then
            files[ i ] = nil
        end
    end

    for i = 1, #directories do
        local d = string_lower( directories[ i ] )

        if d:find("ilya") or d:find("bin") then
            directories[ i ] = nil
        end
    end

    return files, directories
end*/

local cam_Start3D                       = gCam.Start3D
local cam_End3D                         = gCam.End3D
local cam_Start3D2D                     = gCam.Start3D2D
local cam_End3D2D                       = gCam.End3D2D
local cam_Start2D                       = gCam.Start2D
local cam_End2D                         = gCam.End2D
local cam_IgnoreZ                       = gCam.IgnoreZ

local input_IsKeyDown                   = gInput.IsKeyDown
local input_IsMouseDown                 = gInput.IsMouseDown
local input_GetCursorPos                = gInput.GetCursorPos

local TickInterval                      = gEngine.TickInterval()
local ActiveGamemode                    = gEngine.ActiveGamemode()

local render_MaterialOverride           = gRender.MaterialOverride
local render_SetColorModulation         = gRender.SetColorModulation
local render_SetBlend                   = gRender.SetBlend
local render_SuppressEngineLighting     = gRender.SuppressEngineLighting
local render_DrawBeam                   = gRender.DrawBeam
local render_SetMaterial                = gRender.SetMaterial
local render_DrawWireframeBox           = gRender.DrawWireframeBox
local render_RenderView                 = gRender.RenderView
local render_Clear                      = gRender.Clear
local render_Capture                    = gRender.Capture
local render_CapturePixels              = gRender.CapturePixels

local player_GetAll                     = gPlys.GetAll
local ents_GetAll                       = gEnts.GetAll

local gDebugGetInfo                     = global.debug.getinfo

local scrw                              = ScrW()
local scrh                              = ScrH()
local scrwc                             = scrw / 2
local scrhc                             = scrh / 2

ilya.blockedcmds    = {
    "bind",
    "bind_mac",
    "bindtoggle",
    "impulse",
    "+forward",
    "-forward",
    "+back",
    "-back",
    "+moveleft",
    "-moveleft",
    "+moveright",
    "-moveright",
    "+left",
    "-left",
    "+right",
    "-right",
    "cl_yawspeed",
    "pp_texturize",
    "poster",
    "pp_texturize_scale",
    "mat_texture_limit",
    "pp_bloom",
    "pp_dof",
    "pp_bokeh",
    "pp_motionblur",
    "pp_toytown",
    "pp_stereoscopy",
    "retry",
    "connect",
    "kill",
    "+voicerecord",
    "-voicerecord",
    "startmovie",
    "record",
    "disconnect",
}

/*
if debug and debug.getinfo then
    function debug.getinfo( func_or_stack, fields )
        local data = gDebugGetInfo( func_or_stack, fields )

        if(func_or_stack == _G.RunConsoleCommand || func_or_stack == _G.debug.getinfo) then
            data.source = "=[C]"
            data.what = "C"
        end

        return data
    end
end
*/

// custom funcs

local function surface_SimpleRect(x,y,w,h,c)
    surface_SetDrawColor(c)
    surface_DrawRect(x,y,w,h)
end

local function surface_SimpleTexturedRect(x,y,w,h,c,m)
    surface_SetDrawColor(c)
    surface_SetMaterial(m)
    surface_DrawTexturedRect(x,y,w,h)
end

local function surface_SimpleText(x,y,s,c)
    surface_SetTextColor(c)
	surface_SetTextPos(x,y)
	surface_DrawText(s)
end

local function SmoothMaterial(path)
    return Material( path, "noclamp smooth" )
end

// fonts

surface_CreateFont( "tbfont", {	font = "Open Sans", extended = false,size = 15,weight = 100,additive = false,} )
surface_CreateFont( "veranda", { font = "Verdana", size = 12, antialias = false, outline = true } )
surface_CreateFont( "veranda_s", { font = "Verdana", size = 12, antialias = false, shadow = true } )
surface_CreateFont( "thug", { font = "DS Cloister Black", size = 18, antialias = false, shadow = true } )
surface_CreateFont( "veranda_scr", { font = "Verdana", size = ScreenScale( 9 ), antialias = false, outline = true } )
surface_CreateFont( "arial", { font = "Arial", size = 15, antialias = true, shadow = true, outline = true  } )
surface_CreateFont("KeyStroke", { font = "Roboto", size = 20, weight = 2000, antialias = true })

ilya.Colors = {}

for i = 0,255 do  // 50 shades of grey
    ilya.Colors[i] = Color( i, i, i )
end

ilya.Colors["Red"] = Color( 255, 0, 0, 255 )

ilya.accent = Color( 255, 255, 255 )

/*
    Cached shit
*/

ilya.cached = {}

ilya.Materials = {}

ilya.Materials["Gradient"] = SmoothMaterial("gui/gradient_up")
ilya.Materials["Gradient down"] = SmoothMaterial("gui/gradient_down")
ilya.Materials["Gradient right"] = SmoothMaterial("gui/gradient")
ilya.Materials["Alpha grid"] = SmoothMaterial("gui/alpha_grid.png")
ilya.blur = Material("pp/blurscreen")

/*
crosshair
*/


ilya.crosshairTypes = {
    "Lines",
    "Rotating Circles"
}




// CONFIG

ilya.presets = {}
ilya.cfg = { vars = {}, binds = {}, colors = {}, friends = {} }

ilya.cfg.vars["Enable aimbot"]              = false
ilya.cfg.binds["Aim on key"]                = 0

ilya.cfg.vars["Silent aim"]                 = true
ilya.cfg.vars["pSilent"]                    = false

ilya.cfg.vars["Auto reload"]                = false
ilya.cfg.vars["Auto fire"]                  = false
ilya.cfg.vars["Rapid fire"]                 = false
ilya.cfg.vars["Rapid fire glitch"]          = false
ilya.cfg.vars["Alt Rapid fire"]             = false
ilya.cfg.vars["Rapid fire 2"]               = false
ilya.cfg.vars["Alt Rapid fire 2"]           = false
ilya.cfg.vars["Bullet time"]                = false
ilya.cfg.vars["Server time"]                = false

ilya.cfg.vars["Nospread"]                   = false
ilya.cfg.vars["no working"]                 = false
ilya.cfg.vars["Wait for seed"]              = false
ilya.cfg.vars["Norecoil"]                   = false
ilya.cfg.vars["gRust NR"]                   = false

ilya.cfg.vars["Extrapolation"]              = false
ilya.cfg.vars["last update"]                = false
ilya.cfg.vars["Disable taunts"]             = false
ilya.cfg.vars["Bone fix"]                   = false
ilya.cfg.vars["Update Client Anim fix"]     = false
ilya.cfg.vars["Wait for simtime update"]    = false
ilya.cfg.vars["leg_breaker"]                = false
ilya.cfg.vars["Disable interpolation"]      = false
ilya.cfg.vars["Disable Sequence interpolation"] = false

ilya.cfg.vars["Target selection"]           = 1
ilya.cfg.vars["target_selection"]           = 1
ilya.cfg.vars["Ignores-Friends"]            = false
ilya.cfg.vars["Ignores-Steam friends"]      = false
ilya.cfg.vars["Ignores-Teammates"]          = false
ilya.cfg.vars["Ignores-Admins"]             = false
ilya.cfg.vars["Ignores-Bots"]               = false
ilya.cfg.vars["Ignores-Frozen"]             = false
ilya.cfg.vars["Ignores-Nodraw"]             = false
ilya.cfg.vars["Ignores-Nocliping"]          = false
ilya.cfg.vars["Ignores-God time"]           = false
ilya.cfg.vars["Ignores-Head unhitable"]     = false
ilya.cfg.vars["Ignores-Driver"]             = false
ilya.cfg.vars["Ignores-Break LC"]           = false
ilya.cfg.vars["aimbot-ignore_bgod"] = false
ilya.cfg.vars["aimbot-ignore_nodraw"] = false
ilya.cfg.vars["aimbot-ignore_admin"] = false
ilya.cfg.vars["aimbot-ignore_bots"] = false
ilya.cfg.vars["aimbot-ignore_steam"] = false
ilya.cfg.vars["aimbot-ignore_noclip"] = false
ilya.cfg.vars["aimbot-ignore_team"] = false
ilya.cfg.vars["aimbot-ignore_fr"] = false



ilya.cfg.vars["Wallz"]                      = false
ilya.cfg.vars["Max targets"]                = 10
ilya.cfg.vars["eyes_e"]                     = false
ilya.cfg.vars["hitbox_selection serj version"] = 1
ilya.cfg.vars["Hitbox selection"]           = 1
ilya.cfg.vars["Hitscan"]                    = false
ilya.cfg.vars["Hitscan groups-Head"]        = false
ilya.cfg.vars["Hitscan groups-Chest"]       = false
ilya.cfg.vars["Hitscan groups-Stomach"]     = false
ilya.cfg.vars["Hitscan groups-Arms"]        = false
ilya.cfg.vars["Hitscan groups-Legs"]        = false
ilya.cfg.vars["Hitscan groups-Generic"]     = false
ilya.cfg.vars["Hitscan Mode"]               = 1
ilya.cfg.vars["Multipoint"]                 = false
ilya.cfg.vars["Multipoint scale"]           = 0.8
ilya.cfg.vars["Multipoint groups-Head"]     = false
ilya.cfg.vars["Multipoint groups-Chest"]    = false
ilya.cfg.vars["Multipoint groups-Stomach"]  = false
ilya.cfg.vars["Multipoint groups-Arms"]     = false
ilya.cfg.vars["Multipoint groups-Legs"]     = false
ilya.cfg.vars["Multipoint groups-Generic"]  = false

ilya.cfg.vars["Adjust tickcount"]           = false
ilya.cfg.vars["Gun switch"]                 = false
ilya.cfg.vars["Auto detonator"]             = false
ilya.cfg.vars["AutoD distance"]             = 96

ilya.cfg.vars["Backtrack"]                  = false
ilya.cfg.vars["Always backtrack"]           = false
ilya.cfg.vars["Backtrack mode"]             = 1
ilya.cfg.vars["Sampling interval"]          = 0
ilya.cfg.vars["Backtrack time"]             = 200

ilya.cfg.vars["Aimbot smoothing"]           = false
ilya.cfg.vars["Smoothing"]                  = 0.05

ilya.cfg.vars["Fov limit"]                  = false
ilya.cfg.vars["Fov dynamic"]                = false
ilya.cfg.vars["Aimbot FOV"]                 = 30
ilya.cfg.vars["Show FOV"]                   = false
ilya.cfg.colors["Show FOV"]                 = "255 255 0 255"

ilya.cfg.vars["Aimbot snapline"]                   = false
ilya.cfg.colors["Aimbot snapline"]                 = "255 128 0 255"
ilya.cfg.vars["Aimbot marker"]                   = false
ilya.cfg.colors["Aimbot marker"]                 = "255 255 255 255"
ilya.cfg.vars["Aimbot_swaston"]                  = false
ilya.cfg.colors["Aimbot_swaston"]                 = "255 255 255 255"
ilya.cfg.vars["Aimbot_markers"]                  = false
ilya.cfg.colors["Aimbot_markers"]                 = "255 255 255 255"
ilya.cfg.vars["Aimbot_fill"]                      = false
ilya.cfg.colors["Aimbot_fill"]                  = "255 255 255 255"
ilya.cfg.vars["Aimbot_krujok"]                 = false
ilya.cfg.colors["Aimbot_krujok"]                 = "255 255 255 255"
ilya.cfg.vars["ap_enable"] = false
ilya.cfg.colors["ap_enable"] = "255 255 255 255"
ilya.cfg.vars["ap_box"] = false

ilya.cfg.colors["Trails"] = "255 255 255 225"


ilya.cfg.vars["Trigger bot"]                = false
ilya.cfg.binds["Trigger bot"]               = 0

ilya.cfg.vars["Prop aimbot"]                = false
ilya.cfg.vars["PA thrower"]                 = false
ilya.cfg.vars["PA thrower dist"]            = 128
ilya.cfg.vars["Prop max simtime"]           = 4

ilya.cfg.vars["Crossbow prediction"]        = false
ilya.cfg.vars["Sync mode"]            = 1


ilya.cfg.vars["Simulation limit"]           = 4
ilya.cfg.vars["Strafe prediction"]         = false

ilya.cfg.vars["Baim low health"]            = false
ilya.cfg.vars["Baim health"]                = 65

ilya.cfg.vars["Auto healthkit"]             = false
ilya.cfg.vars["Healthkit-Self heal"]        = false
ilya.cfg.vars["Healthkit-Heal closest"]     = false

ilya.cfg.vars["Knifebot"]                   = false
ilya.cfg.vars["Knifebot mode"]              = 1
ilya.presets["Knifebot mode"] = { "Damage", "Fast", "Fatal" }

ilya.cfg.vars["Facestab"]                   = false

ilya.cfg.vars["Projectile aimbot"]          = false


ilya.cfg.vars["Forwardtrack"]               = false
ilya.cfg.vars["Forwardtrack time"]          = 100

ilya.cfg.vars["Lag fix"]                    = false
ilya.cfg.vars["Backshoot"]                  = false

ilya.cfg.vars["tickfix"] = false
ilya.cfg.vars["tickfix_time"] = 1
ilya.cfg.vars["crosshair"] = false
ilya.cfg.vars["crosshair_type"] = 1
ilya.cfg.vars["uber_alles_scale"] = 16
ilya.cfg.vars["uber_alles_speed"] = 192
ilya.Colors["crosshair_color"] = "255 0 0 255"
ilya.Colors["crosshair_outline"] = "0 0 0 255"

ilya.cfg.vars["NoAimLag"] = false

ilya.cfg.vars["Handjob"] = false
ilya.cfg.vars["Handjob mode"] = 1

ilya.cfg.vars["Bullet speed"] =   1000
ilya.cfg.vars["GRAVITY new"]  = 10


ilya.cfg.vars["ShootDelay"] = false
ilya.cfg.vars["ShootDelay time"] = 1

// Resolver

ilya.cfg.vars["Resolver"] = false
ilya.cfg.vars["Resolver mode"] = 1
ilya.cfg.vars["Pitch resolver"] = false
ilya.cfg.vars["Taunt resolver"] = false



ilya.cfg.vars["Invert first shot"] = false
ilya.cfg.vars["Resolver max misses"] = 2


// Tickbase
ilya.cfg.vars["Tickbase shift"] = false
ilya.cfg.vars["Wait for unlag"] = false

ilya.cfg.vars["Fakelag comp"] = 2
ilya.cfg.vars["LagCompensation"] = false

ilya.cfg.vars["Skip fire tick"] = false
ilya.cfg.vars["Double tap"] = false
ilya.cfg.vars["Dodge projectiles"] = false
ilya.cfg.vars["Passive recharge"] = false

ilya.cfg.vars["Auto recharge"] = false
ilya.cfg.vars["Wait for charge"] = false
ilya.cfg.vars["Warp on peek"] = false

ilya.cfg.vars["Charge ticks"] = 48
ilya.cfg.vars["Shift ticks"] = 48
ilya.cfg.binds["Tickbase shift"] = 0
ilya.cfg.binds["Auto recharge"] = 0

ilya.cfg.vars["Engine pred"] = false

ilya.cfg.vars["Anti aim"]                   = false
ilya.cfg.vars["Yaw randomisation"]          = false

ilya.cfg.vars["Custom real"]                = 75
ilya.cfg.vars["Custom fake"]                = 180
ilya.cfg.vars["Custom pitch"]               = 89
ilya.cfg.vars["Spin speed"]                 = 30
ilya.cfg.vars["LBY min delta"]              = 100
ilya.cfg.vars["LBY break delta"]            = 120
ilya.cfg.vars["Sin delta"]                  = 89
ilya.cfg.vars["Sin add"]                    = 11
ilya.cfg.vars["Jitter delta"]               = 45

ilya.cfg.vars["ilyapredict"] = false

ilya.cfg.vars["Yaw base"]                   = 1
ilya.presets["Yaw base"] = { "Viewangles", "At targets" }
ilya.cfg.vars["Yaw"]                        = 1
ilya.presets["Yaw"] = {
    "Backward", "Fake Forward", "Legit Delta",
    "Sideways", "Half Sideways",
    "Fake Spin", "LBY", "LBY Breaker",
    "Sin Sway", "Pendulum Sway", "Lag Sway",
    "Fake Jitter", "Kappa Jitter", "Abu Jitter",
    "Satanic Spin", "Custom",
    "Custom Abu", "Legit AA"

}
ilya.cfg.vars["Pitch"]                      = 1
ilya.presets["Pitch"] = {
    "Down", "Up", "Zero",
    "Fake down", "Fake fake down",
    "Fake jitter","Fake down break", "Kizaru",
    "Fake zero", "Fake Up jitter",
    "Up jitter","Flicker +Up","Fucker Flicker +Up",
    "Custom"
}
ilya.cfg.vars["Edge"]                       = 1

ilya.cfg.binds["Anti aim"]                   = 0







ilya.cfg.vars["Antiaim material"] = 1
ilya.cfg.vars["Antiaim fullbright"] = false
ilya.cfg.colors["Real chams"] = "128 128 255 255"

// Anim breakers

ilya.cfg.vars["Taunt spam"] = false
ilya.cfg.vars["Taunt"] = 1




ilya.cfg.vars["Micromovement"] = false
ilya.cfg.vars["On shot aa"] = false
ilya.cfg.vars["Freestanding"] = false
ilya.cfg.binds["freestand"] = 0
ilya.cfg.vars["Inverter"] = false
ilya.cfg.binds["Inverter"] = 0
ilya.cfg.vars["Anti aim chams"] = false

ilya.cfg.vars["Angle arrows"] = false

ilya.cfg.vars["Trails"] = false
ilya.cfg.vars["Trails distance"] = 25
ilya.cfg.vars["Trails move"] = 2

ilya.cfg.vars["GetManipulateInterp"] = false
ilya.cfg.vars["LerpTime"] = false


ilya.cfg.vars["Free standing"] = false
ilya.cfg.vars["Dancer"] = false
    ilya.cfg.vars["Dance"] = 1
    ilya.cfg.vars["Arm breaker"] = false
    ilya.cfg.vars["Arm breaker mode"] = 1
    ilya.cfg.vars["Fake duck"] = false
    ilya.cfg.vars["Fake duck mode"] = 1
    ilya.cfg.vars["Fake walk"] = false
    ilya.cfg.vars["Crimwalk"] = false

    ilya.cfg.vars["Air crouch"] = false
    ilya.cfg.vars["Air crouch mode"] = 1

// fake lag
ilya.cfg.vars["Fake lag"] = false

ilya.cfg.vars["Fake lag options-Disable on ladder"] = false
ilya.cfg.vars["Fake lag options-Disable in attack"] = false
ilya.cfg.vars["Fake lag options-On peek"] = false
ilya.cfg.vars["Fake lag options-Randomise"] = false
ilya.cfg.vars["Fake lag options-Only in AntiAim"] = false

ilya.cfg.vars["Lag mode"] = 1

ilya.cfg.vars["Lag limit"] = 1
ilya.cfg.vars["Lag randomisation"] = 1

ilya.cfg.vars["Fake duck"] = false
ilya.cfg.binds["Fake duck"] = 0

ilya.cfg.vars["Slow Walk"] = false
ilya.cfg.binds["Slow Walk"] = 0
ilya.cfg.vars["Slow Walk speed"] = 4

ilya.cfg.vars["Air lag duck"] = false
ilya.cfg.vars["Jesus lag"] = false
ilya.cfg.vars["Break lagcomp"] = false


ilya.cfg.vars["Allah fly"] = false


// Sequence manip
ilya.cfg.vars["Sequence manip"] = false
ilya.cfg.vars["OutSequence"] = 500
ilya.cfg.binds["Sequence manip"] = 0
ilya.cfg.vars["Sequence min random"] = false
ilya.cfg.vars["Sequence min"] = 1

ilya.cfg.binds["Animation freezer"] = 0
ilya.cfg.vars["Animation freezer"] = false

ilya.cfg.vars["Freeze on peek"] = false

ilya.cfg.vars["Allah walk"] = false
ilya.cfg.binds["Allah walk"] = 0


ilya.cfg.vars["Lagger manip mode"] = 1


// Animfix

ilya.cfg.vars["Interpolation-Disable interpolation"] = false
ilya.cfg.vars["Interpolation-Fast sequences"] = false





    // ESP
    ilya.cfg.vars["Bounding box"] = false



// Movement
ilya.cfg.vars["Bhop"] = false
ilya.cfg.vars["Sprint"] = false
ilya.cfg.vars["Bug Sprint"] = false
ilya.cfg.vars["Bhop safe"] = false
ilya.cfg.vars["Bhop safe duplex"] = 1
ilya.cfg.vars["Edge jump"] = false
ilya.cfg.vars["Air duck"] = false

ilya.cfg.vars["Air strafer"] = false
ilya.cfg.vars["Strafe mode"] = 1
ilya.cfg.vars["Ground strafer"] = false
ilya.cfg.vars["FixMovement"] = false
ilya.cfg.vars["Fast stop"] = false
ilya.cfg.vars["Z Hop"] = false
ilya.cfg.binds["Z Hop"] = 0

ilya.cfg.vars["Water jump"] = false

ilya.cfg.vars["Auto peak"] = false
ilya.cfg.binds["Auto peak"] = 0
ilya.cfg.vars["Auto peak tp"] = false

ilya.cfg.vars["Circle strafe"] = false
ilya.cfg.binds["Circle strafe"] = 0
ilya.cfg.vars["CStrafe ticks"] = 64
ilya.cfg.vars["CStrafe angle step"] = 1
ilya.cfg.vars["CStrafe angle max step"] = 10
ilya.cfg.vars["CStrafe ground diff"] = 10

ilya.cfg.vars["Cvar name"] = ""
ilya.cfg.vars["Cvar int"] = "1"
ilya.cfg.vars["Cvar str"] = ""
ilya.cfg.vars["Cvar mode"] = 1
ilya.cfg.vars["Cvar flag"] = 1

ilya.cfg.vars["Net Convar"] = ""
ilya.cfg.vars["Net Convar str"] = ""
ilya.cfg.vars["Net Convar int"] = 1
ilya.cfg.vars["Net Convar mode"] = 1

ilya.cfg.vars["Name Convar"] = ""
ilya.cfg.vars["Disconnect reason"] = "VAC banned from secure server"
ilya.cfg.vars["Name stealer"] = false
ilya.cfg.vars["Name generator"] = false
ilya.cfg.vars["Auto reconnect"] = false

ilya.cfg.vars["Killsay"]            = false
ilya.cfg.vars["Killsay mode"]       = 1
ilya.cfg.vars["Chatspam"]           = false
ilya.cfg.vars["Chatspam mode"]      = 1
ilya.cfg.vars["Chatspam timer"]     = 1

// FTPToPos abuse xd )))
ilya.cfg.vars["FSpec Teleport"] = false
ilya.cfg.binds["FSpec Teleport"] = 0

ilya.cfg.vars["FSpec Masskill"] = false
ilya.cfg.binds["FSpec Masskill"] = 0

ilya.cfg.vars["FSpec ClickTP"] = false
ilya.cfg.binds["FSpec ClickTP"] = 0

ilya.cfg.vars["FSpec Velocity"] = false
ilya.cfg.binds["FSpec Velocity"] = 0

// Player visuals
ilya.cfg.vars["Box esp"]                    = false
ilya.cfg.vars["Box style"]                  = 1

ilya.cfg.vars["Sight lines"]        = false
ilya.cfg.colors["Sight lines"]        = "255 0 255 255"

ilya.cfg.vars["IFOV"]        = false
ilya.cfg.colors["IFOV"] = "255 255 255 255"

ilya.cfg.vars["ESP Font"]                  = 1

ilya.cfg.vars["Box gradient"]   = false

ilya.cfg.colors["Box esp"]      = "255 0 255 255"
ilya.cfg.colors["Box gradient"] = "0 255 255 255"

ilya.cfg.vars["Box team color"] = false

ilya.cfg.vars["Name"] = false
ilya.cfg.vars["Name pos"] = 1
ilya.cfg.colors["Name"] = "255 255 255 255"

ilya.cfg.vars["Usergroup"] = false
ilya.cfg.vars["Usergroup pos"] = 1
ilya.cfg.colors["Usergroup"] = "255 255 255 255"

ilya.cfg.vars["Team"] = false
ilya.cfg.vars["Team pos"] = 1
ilya.cfg.colors["Team"] = "255 255 255 255"

ilya.cfg.vars["Health"] = false
ilya.cfg.vars["Health bar"] = false
ilya.cfg.vars["Health bar gradient"] = false
ilya.cfg.vars["Health pos"] = 1
ilya.cfg.colors["Health"] = "75 255 0 255"
ilya.cfg.colors["Health bar gradient"] = "255 45 0 255"
ilya.cfg.vars["Health grust"] = false
ilya.cfg.vars["Health bar grust"] = false
ilya.cfg.vars["Health bar gradient grust"] = false
ilya.cfg.colors["Health grust"] = "75 255 0 255"
ilya.cfg.colors["Health bar gradient grust"] = "255 45 0 255"
ilya.cfg.vars["Health pos grust"] = 1

ilya.cfg.vars["Armor"] = false
ilya.cfg.vars["Armor pos"] = 1
ilya.cfg.colors["Armor"] = "255 255 255 255"

ilya.cfg.vars["DarkRP Money"] = false
ilya.cfg.vars["Money pos"] = 1
ilya.cfg.colors["DarkRP Money"] = "255 255 255 255"

ilya.cfg.vars["Weapon"] = false
ilya.cfg.vars["Weapon pos"] = 1
ilya.cfg.colors["Weapon"] = "255 255 255 255"

ilya.cfg.vars["Show ammo"] = false
ilya.cfg.vars["Weapon printname"] = false
ilya.cfg.vars["Show reload"] = false

ilya.cfg.vars["Break LC"] = false
ilya.cfg.vars["Break LC pos"] = 1
ilya.cfg.colors["Break LC"] = "255 255 255 255"

ilya.cfg.vars["Simtime updated"] = false
ilya.cfg.vars["Simtime pos"] = 1
ilya.cfg.colors["Simtime updated"] = "255 255 255 255"

ilya.cfg.colors["Skeleton"] = "255 255 255 255"
ilya.cfg.vars["Skeleton"] = false

ilya.cfg.vars["Player flags"] = false

ilya.cfg.vars["Hitbox"] = false
ilya.cfg.colors["Hitbox"] = "255 255 255 255"

ilya.cfg.vars["hitbones"] = false
ilya.cfg.colors["hitbones"] = "255 45 0 255"

ilya.cfg.vars["Indicators"] = false

ilya.cfg.vars["Print Distance"] = false
ilya.cfg.vars["Print Distance pos"] = 1
ilya.cfg.colors["Print Distance"] = "255 255 255 255"

// Chams
ilya.cfg.vars["Visible chams"] = false
ilya.cfg.vars["Visible chams w"] = false
ilya.cfg.vars["Visible mat"] = 1
ilya.cfg.colors["Visible chams"] = "0 255 255 255"

ilya.cfg.vars["inVisible chams"] = false
ilya.cfg.vars["inVisible chams w"] = false
ilya.cfg.vars["inVisible mat"] = 1
ilya.cfg.colors["inVisible chams"] = "255 255 0 255"

ilya.cfg.vars["Supress lighting"] = false

ilya.cfg.vars["Self chams"] = false
ilya.cfg.vars["Self chams w"] = false
ilya.cfg.vars["Self mat"] = 1
ilya.cfg.colors["Self chams"] = "255 0 255 255"

ilya.cfg.vars["Supress self lighting"] = false

ilya.cfg.vars["Show records"] = false

ilya.cfg.vars["Backtrack chams"] = false
ilya.cfg.vars["Backtrack material"] = 1
ilya.cfg.vars["Backtrack fullbright"] = false
ilya.cfg.colors["Backtrack chams"] = "255 128 255 255"
ilya.cfg.vars["Backtrack skeleton"] = false
ilya.cfg.vars["OOF Arrows"] = false
ilya.cfg.vars["OOF Style"] = 1
ilya.cfg.colors["OOF Arrows color"] = "255 128 255 255"
ilya.cfg.vars["OOF team color"] = false

ilya.cfg.vars["On screen logs"] = false

ilya.cfg.colors["On screen logs"] = "69 255 69 255"
ilya.cfg.colors["Miss lagcomp"] = "69 69 255 255"
ilya.cfg.colors["Miss spread"] = "255 255 69 255"
ilya.cfg.colors["Miss fail"] = "255 69 69 255"

ilya.cfg.vars["Entity chams"] = false
ilya.cfg.vars["Entity material"] = 1
ilya.cfg.vars["Entity fullbright"] = false
ilya.cfg.colors["Entity chams"] = "255 89 89 255"

ilya.cfg.vars["Player outline"] = false
ilya.cfg.vars["Entity outline"] = false
ilya.cfg.colors["Player outline"] = "45 255 86 255"
ilya.cfg.colors["Entity outline"] = "255 86 45 255"

ilya.cfg.vars["Outline style"] = 1

ilya.cfg.vars["ESP Distance"] = 3500

// Entity Esp
ilya.cfg.binds["Ent add"] = 0
ilya.cfg.vars["Ent box"] = false
ilya.cfg.vars["Ent box 3d"] = false
ilya.cfg.vars["Ent class"] = false
ilya.cfg.vars["Ent ESP Distance"] = 3500

ilya.cfg.vars["Fresnel minimum illum"] = 0
ilya.cfg.vars["Fresnel maximum illum"] = 1
ilya.cfg.vars["Fresnel exponent"] = 1

// Hitmarker
ilya.cfg.vars["Hitmarker"] = false
ilya.cfg.vars["Hit particles"] = false
ilya.cfg.vars["Hitnumbers"] = false

ilya.cfg.binds["Unhook cheat"] = 0

ilya.cfg.vars["res test"] = false



ilya.cfg.vars["Hitsound"] = false
ilya.cfg.vars["Killsound"] = false
ilya.cfg.vars["Killstreak"] = false

ilya.cfg.vars["Hitsound str"] = "phx/hmetal1.wav"
ilya.cfg.vars["Killsound str"] = "phx/explode00.wav"
ilya.cfg.vars["rainbow player"] = false

ilya.cfg.colors["Hit particles"] = "255 128 235 255"
ilya.cfg.colors["Hitmarker"] = "255 155 25 255"
ilya.cfg.colors["Hitnumbers"] = "255 255 255 255"
ilya.cfg.colors["Hitnumbers krit"] = "255 35 35 255"

// Name hide / visual misc

ilya.cfg.vars["Hide name"] = false
ilya.cfg.vars["Custom name"] = "Your mom"
ilya.cfg.vars["Disable SADJ"] = false
ilya.cfg.vars["Screengrab image"] = false

ilya.cfg.vars["admin detect new"] = false

// Visuals
ilya.cfg.vars["Tickbase indicator"] = false
ilya.cfg.vars["WaterMark"] = true
ilya.cfg.colors["WaterMarkColor"]           = "13 13 13 255"
ilya.cfg.vars["Spectator list"] = false
ilya.cfg.vars["AnimBug"]        = false
ilya.cfg.vars["DoorZaeba"]      = false
ilya.cfg.vars["Killsound"] = false

// World
ilya.cfg.vars["Custom sky"] = GetConVar("sv_skyname"):GetString()
ilya.cfg.vars["Sky color"] = false
ilya.cfg.colors["Sky color"] = "145 185 245 255"
ilya.cfg.vars["Wall color"] = false
ilya.cfg.colors["Wall color"] = "50 45 65 255"
ilya.cfg.vars["Fullbright"] = false
ilya.cfg.vars["Fullbright mode"] = 1
ilya.cfg.binds["Fullbright"] = 0
ilya.cfg.vars["Disable shadows"] = false


// Effects
ilya.cfg.vars["Bullet tracers"] = false
ilya.cfg.colors["Bullet tracers"] = "255 65 65 255"
ilya.cfg.vars["Bullet tracers material"] = "sprites/tp_beam001"
ilya.cfg.vars["Tracers die time"] = 5
ilya.cfg.vars["Bullet tracers muzzle"] = false

// View
ilya.cfg.vars["Third person"] = false
ilya.cfg.binds["Third person"] = 0
ilya.cfg.vars["Third person collision"] = false
ilya.cfg.vars["Third person smoothing"] = false
ilya.cfg.vars["Third person distance"] = 150

ilya.cfg.vars["Free camera"] = false
ilya.cfg.binds["Free camera"] = 0
ilya.cfg.vars["Free camera speed"] = 25
ilya.cfg.vars["Ghetto free cam"] = false
ilya.cfg.vars["admin_detect"]   = false

ilya.cfg.vars["Fov override"] = GetConVarNumber("fov_desired")
ilya.cfg.vars["Aspect ratio"] = 0

ilya.cfg.vars["Kill effect"] = false
ilya.cfg.vars["Kill effect enemy"] = false

ilya.cfg.vars["Viewmodel changer"] = false

ilya.cfg.vars["Viewmodel fov"] = GetConVar("viewmodel_fov"):GetInt()

ilya.cfg.vars["Viewmodel chams"] = false
ilya.cfg.colors["Viewmodel chams"] = "75 95 128 255"
ilya.cfg.vars["Viewmodel chams type"] = 1
ilya.cfg.vars["Fullbright viewmodel"] = false

ilya.cfg.vars["chams_hand"] = false
ilya.cfg.colors["chams_hand"] = "75 95 128 255"
ilya.cfg.vars["chams_hand_mat"] = 1

ilya.cfg.vars["Viewmodel manip"] = false
ilya.cfg.vars["Viewmodel x"] = 0
ilya.cfg.vars["Viewmodel y"] = 0
ilya.cfg.vars["Viewmodel z"] = 0
ilya.cfg.vars["Viewmodel r"] = 0
ilya.cfg.vars["Viewmodel p"] = 0
ilya.cfg.vars["Viewmodel ya"] = 0





ilya.cfg.vars["Modelchanger"]   = false
ilya.cfg.vars["Modelchanger model"] = 1
ilya.cfg.vars["Player_modelchanger"] = false
ilya.cfg.vars["Player_modelchanger_agent"] = 1

ilya.cfg.vars["Color_Modify"] = false
ilya.cfg.vars["pp_colour_addr"] = 0.02
ilya.cfg.vars["pp_colour_addg"] = 0.02
ilya.cfg.vars["pp_colour_addb"] = 0
ilya.cfg.vars["pp_colour_brightness"] = 0
ilya.cfg.vars["pp_colour_contrast"] = 1
ilya.cfg.vars["pp_colour_colour"] = 3
ilya.cfg.vars["pp_colour_mulr"] = 0
ilya.cfg.vars["pp_colour_mulg"] = 0.02
ilya.cfg.vars["pp_colour_mulb"] = 0

// Keystrokes
ilya.cfg.vars["Key strokes"] = false



ilya.cfg.vars["Ghost follower"] = false
ilya.cfg.vars["GFID"] = "SteamID"

// Misc

ilya.cfg.vars["Use spam"] = false
ilya.cfg.vars["Flashlight spam"] = false
ilya.cfg.vars["Auto GTA"] = false
ilya.cfg.vars["Camera spam"] = false
ilya.cfg.vars["Fast lockpick"] = false


ilya.cfg.vars["Config name"] = "default"
ilya.cfg.vars["Selected config"] = 1

ilya.cfg.colors["Menu color"] = "15 15 20 255"

--ilya.cfg.vars["Watermark xxx"] = false
--ilya.cfg.vars["Watermark xxx mode"] = 1


do
    local maxshift = GetConVar("sv_maxusrcmdprocessticks"):GetInt() - 1
    local tickrate = tostring(math_Round(1 / TickInterval))

	gRunCmd("cl_cmdrate", tickrate)
	gRunCmd("cl_updaterate", tickrate)

	gRunCmd("cl_interp", "0")
	gRunCmd("cl_interp_ratio", "0")

    ilya.cfg.vars["Shift ticks"] = maxshift
    ilya.cfg.vars["Charge ticks"] = maxshift

    ded.SetInterpolation( false )
    ded.SetSequenceInterpolation( false )
    ded.EnableAnimFix( false )
end




/*
    Miss / Hit logs
*/

ilya.onScreenLogs = {}
ilya.firedShots = 0
ilya.HitLogsWhite = Color( 225, 225, 225 )
ilya.MissReasons = {
    [ 1 ] =     { str = "spread", var = "Miss spread" },
    [ 2 ] =     { str = "occlusion", var = "Miss spread" },
    [ 3 ] =     { str = "desync", var = "Miss lagcomp" },
    [ 4 ] =     { str = "lagcomp", var = "Miss lagcomp" },
    [ 5 ] =     { str = "resolver", var = "Miss fail" },
}







// Config save / load

if not file.Exists( "data/ultimate", "GAME" ) then
    file.CreateDir("data/ultimate")
end

if not file.Exists( "data/ultimate/default.txt", "GAME" ) then
    file.Write( "data/ultimate/default.txt", util.TableToJSON( ilya.cfg, false ) )
end



ilya.configs = {}
function ilya.fillConfigTable()
    local ftbl = file_Find( "data/ultimate/*.txt", "GAME" )
    ilya.configs = {}

    if not ftbl[1] then return end

    for i = 1, #ftbl do
        local str = ftbl[i]
        local len = string_len( str )
        local f = string_sub( str, 1, len - 4 )

        ilya.configs[ #ilya.configs + 1 ] = f
    end
end

ilya.fillConfigTable()

function ilya.SaveConfig()
    local tojs = util.TableToJSON( ilya.cfg, false )

    file_Write( "data/ultimate/"..ilya.cfg.vars["Config name"]..".txt", tojs )

    ilya.fillConfigTable()
    ilya.initTab("Settings")
end

function ilya.LoadConfig()
    local str = ilya.configs[ ilya.cfg.vars["Selected config"] ]

    if not file_Exists( "data/ultimate/"..str..".txt", "GAME" ) then return end

    local read = file_Read( "data/ultimate/"..str..".txt", "GAME" )
    local totbl = util.JSONToTable( read )

    for k, v in pairs( totbl ) do

        for key, value in pairs( v ) do
            local tbl = ilya.cfg

            if k == "vars" then
                tbl = ilya.cfg.vars
            elseif k == "colors" then
                tbl = ilya.cfg.colors
            elseif k == "binds" then
                tbl = ilya.cfg.binds
            end

            tbl[ key ] = value
        end
    end

    ded.SetInterpolation(ilya.cfg.vars["Disable interpolation"])
    ded.SetSequenceInterpolation(ilya.cfg.vars["Disable Sequence interpolation"])
    ded.EnableAnimFix(ilya.cfg.vars["Update Client Anim fix"])
    ded.EnableBoneFix(ilya.cfg.vars["Bone fix"])

    ded.SetMaxShift(ilya.cfg.vars["Charge ticks"])
    ded.SetMinShift(ilya.cfg.vars["Shift ticks"])
    ded.EnableTickbaseShifting(ilya.cfg.vars["Tickbase shift"])
end

SV_MAXVEL = GetConVar("sv_maxvelocity"):GetFloat()
SV_GRAVITY = GetConVar("sv_gravity"):GetFloat()
SV_FRICTION = GetConVar("sv_friction"):GetFloat()
SV_AIRACCELERATE = GetConVar("sv_airaccelerate"):GetFloat()

/*
    Kill effects
*/

hook.Add("entity_killed", "ilya_kill_effect", function(data)
    if ilya.cfg.vars["Kill effect enemy"] then
        local me = LocalPlayer()
        local victim = Entity(data.entindex_killed)
        local attacker = Entity(data.entindex_attacker)
        
        if attacker == me and attacker ~= victim and (victim:IsPlayer() or victim:IsNPC()) then 
            -- White particles at victim position
            if true then
                local vPoint = victim:GetPos()
                local effectdata = EffectData()
                local curcol = Color(255, 255, 255)
                local fixcolor = 1 / 255
                effectdata:SetOrigin(vPoint)
                effectdata:SetColor(curcol.r * fixcolor, curcol.g * fixcolor, curcol.b * fixcolor)
                effectdata:SetScale(math.random(4, 15)) 
                util.Effect("ElectricSpark", effectdata)
            end
            
            -- Particles at victim's head
            if true then
                local vPos = victim:GetPos()
                local effectdata = EffectData()
                
                if victim:LookupBone("ValveBiped.Bip01_Head1") == nil then
                    effectdata:SetOrigin(vPos)
                else
                    effectdata:SetOrigin(victim:GetBonePosition(victim:LookupBone("ValveBiped.Bip01_Head1")))
                end
                
                effectdata:SetMagnitude(5)
                effectdata:SetScale(math.random(4, 15)) 
                util.Effect("ElectricSpark", effectdata)
            end
        end
    end

    if ilya.cfg.vars["Kill effect"] then
        local me = LocalPlayer()
        local victim = Entity(data.entindex_killed)
        local attacker = Entity(data.entindex_attacker)
        
        if attacker == me and attacker ~= victim and (victim:IsPlayer() or victim:IsBot()) then 
            -- Red particles at local player position
            if true then
                local vPoint = LocalPlayer():GetPos()
                local effectdata = EffectData()
                local curcol = Color(255, 0, 0)
                local fixcolor = (1/255)
                effectdata:SetOrigin(vPoint)
                effectdata:SetColor(curcol.r * fixcolor, curcol.g * fixcolor, curcol.b * fixcolor)
                effectdata:SetScale(math.random(4, 15)) 
                util.Effect("ElectricSpark", effectdata)
            end
            
            -- Particles at victim's head
            if true then
                local vpos = victim:GetPos()
                local effectdata = EffectData()
                
                if victim:LookupBone("ValveBiped.Bip01_Head1") == nil then
                    effectdata:SetOrigin(vpos)
                else
                    effectdata:SetOrigin(victim:GetBonePosition(victim:LookupBone("ValveBiped.Bip01_Head1")))
                end
                
                effectdata:SetMagnitude(5)
                effectdata:SetScale(math.random(4, 15)) 
                util.Effect("ElectricSpark", effectdata)
            end
        end
    end
end)
SV_ACCELERATE = GetConVar("sv_accelerate"):GetFloat()
SV_STOPSPEED = GetConVar("sv_stopspeed"):GetFloat()


local vecOrigin = Vector(0,0,0)
local gMAX_SAMPLE_TIME = 1

function ilya.TIME_TO_TICKS(time)
    return math_floor(0.5 + (time / TickInterval))
end

function ilya.TICKS_TO_TIME(tick)
    return TickInterval * tick
end

function ilya.ROUND_TO_TICK(time)
    return ilya.TICKS_TO_TIME(ilya.TIME_TO_TICKS(time))
end



/*
    Materials
*/

ilya.chamsMaterials = {
    "Flat", "Textured", "Selfillum",
    "Selfillum additive", "Wireframe", "Metallic",
    "Glass", "Glowing glass","Plasma"
}



























/*
    GUI START
    ---------
    ELEMENTS:

    -------------------------
    Checkbox



    -------------------------
    Slider



    -------------------------
    Combobox



    -------------------------
    Multicombobox

    БЛЯТЬ СВОЯ ВЕЩЬ КАК БЫ ДА

    -------------------------
    Text entry

    Свой индикатор русского и инглиша

    -------------------------

    Кружочек цвета по которому клик и типо окно нахуй всплывает бля

    Color picker ( RGB, HEX )

    Save / Copy / Paste options
    СВОЁ КОЛОР ПИКЕР ОМГ СВОЯ ПАЛЕТКА

    -----------------------------------------------

    Есп превью ( Модель которую можно будет подвигать и тд )

    Драг н Дроп елменты для есп превью

    -----------------------------------------------

    Подсказки к элементам

    Функция вызывающаяся ПОСЛЕ создания елемента! Позволит НЕСКОЛЬКО элементов засунуть в ОДИН!

    Добавить кнопочку которая будет создавать панельку в которую можно засунуть че хочешь

    -----------------------------------------------

    Выбор акцент цвета с градиентом

    -----------------------------------------------

    Запоминание менюшкой позиций элементов после открытия чтоб видно было их
*/

/*
    Detours
*/

do
    local PLAYER = FindMetaTable( "Player" )

    local Name_     = PLAYER.Name
    local Nick_     = PLAYER.Nick
    local GetName_  = PLAYER.GetName

    function PLAYER:Name()

        if ilya.cfg.vars["Hide name"] and self == me then
            return ilya.cfg.vars["Custom name"]
        end

        return Name_( self )
    end

    function PLAYER:Nick()

        if ilya.cfg.vars["Hide name"] and self == me then
            return ilya.cfg.vars["Custom name"]
        end

        return Nick_( self )
    end

    function PLAYER:GetName()

        if ilya.cfg.vars["Hide name"] and self == me then
            return ilya.cfg.vars["Custom name"]
        end

        return GetName_( self )
    end
end









ilya.ui = {}

ilya.validsnd = false

/*
sound.PlayURL ( "https://cdn.discordapp.com/attachments/981977924087472128/1116820124985458770/ya_resskiy.mp3", "noblock", function( s )
    if not IsValid( s ) then return end
    ilya.validsnd = s

    ilya.validsnd:EnableLooping( true )
end )
*/


ilya.activetab = "Aimbot"
ilya.multicombo = false


ilya.hint = false
ilya.hintText = ""
ilya.hintX = 0
ilya.hintY = 0

do
    StoredCursorPos = {}

    function RememberCursorPosition()

        local x, y = input_GetCursorPos()

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

    PANEL.FadeTime = 0

    function PANEL:Init()
        self:SetFocusTopLevel( false )
        self:SetSize( 800, 800 )

        self:SetPaintBackgroundEnabled( false )
        self:SetPaintBorderEnabled( false )
        self:DockPadding( 5, 60, 5, 5 )
        self:MakePopup()

        PANEL.TopPanel = self:Add( "DPanel" )
        PANEL.TopPanel:SetPos( 5, 30 )
        PANEL.TopPanel:SetSize( 790, 25 )

        function PANEL.TopPanel:Paint( w, h )
            surface_SimpleRect( 0, 24, w, 1, Color(100, 150, 255, 100) )
        end
    end

    function PANEL:Think()
        local x,y = input_GetCursorPos()
        local mousex = math_Clamp( x, 1, scrw - 1 )
        local mousey = math_Clamp( y, 1, scrh - 1 )

        if ( self.Dragging ) then

            local x = mousex - self.Dragging[1]
            local y = mousey - self.Dragging[2]

            self:SetPos( x, y )

        end

        self:SetCursor( "arrow" )

        ilya.accent = HSVToColor(  ( CurTime() * 25 ) % 360, 1, 1 )

        ilya.accent.r = math_Clamp( ilya.accent.r, 128, 255 )
        ilya.accent.g = math_Clamp( ilya.accent.g, 128, 255 )
        ilya.accent.b = math_Clamp( ilya.accent.b, 128, 255 )
    end

    function PANEL:IsActive()

        if ( self:HasFocus() ) then return true end
        if ( vgui.FocusedHasParent( self ) ) then return true end

        return false

    end


    function PANEL:OnMousePressed()
        local x,y = input_GetCursorPos()
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

    //local bgmat = Material("ilya.jpg", "noclamp smooth")
    function PANEL:Paint(w, h)
        //local x, y = self:LocalToScreen( 0, 0 )

        //surface_SetDrawColor( 255, 255, 255 )
        //surface_SetMaterial( bgmat )

        //render.SetScissorRect( 0, 0, w, h, true)
        //surface.DrawTexturedRect(0, 0, scrw, scrh)
        //render.SetScissorRect(0, 0, 0, 0, false)

        //for i = 1, 4 do
            //ilya.blur:SetFloat( "$blur", (i / 3) * 4 )
            //ilya.blur:Recompute()
//
            //render.UpdateScreenEffectTexture()
            //surface_DrawTexturedRect( x * -1, y * -1, scrw, scrh )
        //end


        //ilya.surfaceTexture(0, 0, w, h,"krik.png", color_white)
        surface_SimpleRect(0, 0, w, h, ilya.Colors[20])
        surface_SimpleRect(0, 0, w, 25, Color(47, 56, 95, 255))
        surface_SetFont("tbfont")
        surface_SimpleText(8,4,"☪ ILYAWARE RECODE  BUILD V4 | HVH | LEGIT ☪",Color(100, 150, 255, 255))



    end

    function PANEL:GetTopPanel()
        return PANEL.TopPanel
    end

    vgui_Register( "UFrame", PANEL, "EditablePanel" )
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
            surface_SetDrawColor( ilya.Colors[128] )
            surface_DrawRect( 0, 0, w, h )
        end
    end

    function PANEL:Paint( w, h )
    end

    function PANEL:OnMousePressed()
        ilya.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ilya.frame:OnMouseReleased()
    end

    vgui_Register( "UScroll", PANEL, "DScrollPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.ItemPanel = vgui_Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 23, 3, 3 )

        self.ItemPanel.Paint = nil

        function self.ItemPanel:OnMousePressed()
            ilya.frame:OnMousePressed()
        end

        function self.ItemPanel:OnMouseReleased()
            ilya.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface_SetDrawColor( Color(80, 90, 130, 255) )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )

        surface_SetFont( "tbfont" )
        surface_SimpleText( 8, 2, self.txt, Color(180, 200, 255, 255) )

        surface_SimpleRect( 6, 20, w-12, 1, Color(100, 150, 255, 255) )
    end

    function PANEL:OnMousePressed()
        ilya.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ilya.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end

    vgui_Register( "UPanel", PANEL, "Panel" )
end

do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface_SimpleRect( 0, 0, w, h, ilya.Colors[20] )
    end

    vgui_Register( "UPaintedPanel", PANEL, "Panel" )
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

    vgui_Register( "UCBPanel", PANEL, "DPanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self.Label:SetFont("tbfont")
        self.Label:SetTextColor(Color(180, 200, 255, 255))

        self.Button:SetSize( 18, 18 )

        function self.Button:Paint(w,h)
            local v = self:GetChecked()

            surface_SetDrawColor(Color(100, 150, 255, 255))

            surface_DrawOutlinedRect(0,0,w,h,1)

            if !v and !self:IsHovered() then return end

            if v then
                surface_SetDrawColor(Color(100, 150, 255, 255))
            else
                surface_SetDrawColor(Color(80, 100, 150, 255))
            end

            surface_DrawRect(3,3,w-6,h-6)
        end
    end

    function PANEL:PerformLayout()

        local x = self.m_iIndent || 0

        self.Button:SetSize( 18, 18 )
        self.Button:SetPos( x, math_floor( ( self:GetTall() - self.Button:GetTall() ) / 2 ) )

        self.Label:SizeToContents()
        self.Label:SetPos( x + self.Button:GetWide() + 9, math_floor( ( self:GetTall() - self.Label:GetTall() ) / 2 ) )

    end

    vgui_Register( "UCheckboxLabel", PANEL, "DCheckBoxLabel" )
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
        if !self.Dragging then return end

        local w, h = self:GetSize()

        x = math_Clamp(x, 0, w) / w
        y = math_Clamp(y, 0, h) / h

        local value = self.Min + (self.Max - self.Min) * x
        value = math_Round(value, self:GetDecimals())

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

        surface_SetDrawColor(Color(80, 90, 130, 255))
        surface_DrawOutlinedRect(0,0,w,h,1)

        surface_SetDrawColor(Color(100, 150, 255, 255))
        surface_DrawRect(2, 2, self:GetSlideX()*w-4, h-4)
    end

    vgui_Register("USlider", PANEL, "Panel")
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(4,4,4,0)

        self:SetTextColor(Color(180, 200, 255, 255))
        self:SetFont("tbfont")
    end

    function PANEL:Paint(w,h)
        if self:IsHovered() then
            surface_SetDrawColor(Color(100, 150, 255, 100))
            surface_DrawRect(0, 0, w, h)
        end

        surface_SetDrawColor(Color(100, 150, 255, 200))
        surface_DrawOutlinedRect(0,0,w,h,1)
    end

    vgui_Register( "UButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock(TOP)
        self:DockMargin(1,1,1,0)

        self:SetTextColor(Color(180, 200, 255, 255))
        self:SetFont("tbfont")
    end

    function PANEL:Paint(w,h)
        if self:IsHovered() then
            surface_SetDrawColor(Color(100, 150, 255, 150))
            surface_DrawRect(0, 0, w, h)
        end
    end

    vgui_Register( "UESPPButton", PANEL, "DButton" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetTall(20)
        self.DropButton.Paint = nil
    end

    function PANEL:Paint(w,h)
        surface_SetDrawColor(ilya.Colors[25])
        surface_DrawRect(0,0,w,h)

        surface_SetDrawColor(ilya.Colors[32])
        surface_DrawRect(w-25,0,25,25)

        surface_SetTextColor(ilya.Colors[255])
        surface_SetTextPos(w-20,20/2-15/2)
        surface_SetFont("tbfont")
        surface_DrawText("▼")

        surface_SetDrawColor(ilya.Colors[255])
        surface_DrawOutlinedRect(0,0,w,h)
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
        while ( IsValid( parent ) && !parent:IsModal() ) do
            parent = parent:GetParent()
        end
        if ( !IsValid( parent ) ) then parent = self end

        self.Menu = DermaMenu( false, parent )

        function self.Menu:Paint(w,h)
            surface_SetDrawColor(ilya.Colors[24])
            surface_DrawRect(0,0,w,h)
            surface_SetDrawColor(ilya.Colors[255])
            surface_DrawOutlinedRect(0,-1,w,h+1)
        end

        for k, v in pairs( self.Choices ) do
            local option = self.Menu:AddOption( v, function() self:ChooseOption( v, k ) end )
            option.txt = option:GetText()
            option:SetText("")

            function option:Paint(w,h)
                if self:IsHovered() then
                    surface_SimpleRect(1,1,w-2,h-2,ilya.Colors[32])
                end

                surface_SetTextColor(ilya.Colors[255])
                surface_SimpleText(10,4,option.txt,ilya.Colors[255])
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
        self:SetTextColor(ilya.Colors[165])
        self:SetFont("tbfont")
    end

    vgui_Register( "UComboBox", PANEL, "DComboBox" )
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

        local str = input.GetKeyName( self:GetSelectedNumber() )
        if ( !str ) then str = "" end

        str = language.GetPhrase( str )

        self:SetText( "["..str.."]" )
        self:SetTextColor(ilya.Colors[165])
        self:SetFont("tbfont")
    end

    function PANEL:Paint(w,h)
        surface_SetDrawColor(ilya.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h,1)
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

    vgui_Register( "UBinder", PANEL, "DButton" )
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
            surface_SimpleTexturedRect(0,0,w,h,ilya.Colors[255],ilya.Materials["Alpha grid"])
        end

        surface_SetDrawColor(self.Color)
        surface_DrawRect(0,0,w,h)
    end

    vgui_Register( "UCPicker", PANEL, "DButton" )
end

do
    local PANEL = {}

    PANEL.lifeTime = 0

    function PANEL:Paint( w, h )
        surface_SimpleRect( 0, 0, w, h, ilya.Colors[25] )

        surface_SetDrawColor( ilya.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
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

    vgui_Register( "ULifeTimeBase", PANEL, "EditablePanel" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:SetSize(200,200)
    end

    function PANEL:Paint( w, h )
        surface_SimpleRect( 0, 0, w, h, ilya.Colors[25] )

        surface_SetDrawColor( ilya.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui_Register( "UColorPanel", PANEL, "ULifeTimeBase" )
end

do
    local PANEL = {}

    function PANEL:Init()
        self:Dock( FILL )
        self:DockPadding(5, 5, 5, 5)
        self:SetPalette( false )
        self:SetWangs( false )
    end

    vgui_Register( "UColorMixer", PANEL, "DColorMixer" )
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
        if ( !ctrl ) then return 0 end

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
        while ( Remainder != 0 ) do

            local PerPanel = math.floor( Remainder / NumColumns )

            for k, Column in pairs( self.Columns ) do

                Remainder = math.Approach( Remainder, 0, PerPanel )

                local TargetWidth = math.ceil( Column:GetWide() ) + PerPanel
                Remainder = Remainder + ( TargetWidth - Column:SetWidth( TargetWidth ) )

                if ( Remainder == 0 ) then break end

                TotalMaxWidth = TotalMaxWidth + math.ceil( Column:GetMaxWidth() )

            end

            -- Total max width of all the columns is less than the width of the DListView, abort!
            if ( TotalMaxWidth < self.pnlCanvas:GetWide() ) then break end

            Remainder = math.Approach( Remainder, 0, 1 )

        end

        -- Set the positions of the resized columns
        local x = 0
        for k, Column in pairs( self.Columns ) do

            Column.x = x
            x = x + math.ceil( Column:GetWide() )

            Column:SetTall( math.ceil( self:GetHeaderHeight() ) )
            Column:SetVisible( !self:GetHideHeaders() )

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

            if ( !Line:IsVisible() ) then continue end

            Line:SetPos( 1, y )
            Line:SetSize( self:GetWide() - 2, h )
            Line:DataLayout( self )

            Line:SetAltLine( alt )
            alt = !alt

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

            surface_SetDrawColor( c, c, c )
            surface_DrawRect( 0, 0, w, h )
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

        if ( !IsValid( self.VBar ) ) then return end

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
        if ( !bMultiSelect && !bClear ) then return end

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
                    if ( !line:IsLineSelected() ) then self:OnRowSelected( line:GetID(), line ) end
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
        if ( Line:IsSelected() && Line.m_fClickTime && ( !bMultiSelect || bClear ) ) then

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
        if ( !bMultiSelect || bClear ) then
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

            if ( !IsValid( a ) ) then return true end
            if ( !IsValid( b ) ) then return false end

            if ( c1 && a:GetColumnText( c1 ) != b:GetColumnText( c1 ) ) then
                if ( d1 ) then a, b = b, a end
                return a:GetColumnText( c1 ) < b:GetColumnText( c1 )
            end

            if ( c2 && a:GetColumnText( c2 ) != b:GetColumnText( c2 ) ) then
                if ( d2 ) then a, b = b, a end
                return a:GetColumnText( c2 ) < b:GetColumnText( c2 )
            end

            if ( c3 && a:GetColumnText( c3 ) != b:GetColumnText( c3 ) ) then
                if ( d3 ) then a, b = b, a end
                return a:GetColumnText( c3 ) < b:GetColumnText( c3 )
            end

            if ( c4 && a:GetColumnText( c4 ) != b:GetColumnText( c4 ) ) then
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

        if ( !Item ) then return end

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

    vgui_Register( "UListView", PANEL, "DPanel" )
end


do
    local PANEL = {}

    function PANEL:Paint( w, h )
        surface_SetDrawColor( ilya.Colors[24] )
        surface_DrawRect( 0, 0, w, h )

        surface_SetDrawColor( ilya.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )
    end

    vgui_Register( "USettingsPanel", PANEL, "ULifeTimeBase" )
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

    vgui_Register( "USPanelButton", PANEL, "UButton" )
end

do
    local PANEL = {}

    function PANEL:Init()

        self.ButtonPanel = vgui_Create( "DPanel", self )
        self.ButtonPanel:Dock( TOP )
        self.ButtonPanel:DockMargin(3,3,3,2)
        self.ButtonPanel:SetTall(18)

        self.ItemPanel = vgui_Create( "DPanel", self )
        self.ItemPanel:Dock( FILL )
        self.ItemPanel:DockMargin( 3, 0, 3, 3 )

        self.ButtonPanel.Paint = nil
        self.ItemPanel.Paint = nil

        self.ActiveTab = "NIL"

        function self.ItemPanel:OnMousePressed()
            ilya.frame:OnMousePressed()
        end

        function self.ItemPanel:OnMouseReleased()
            ilya.frame:OnMouseReleased()
        end
    end

    function PANEL:Paint( w, h )
        surface_SetDrawColor( ilya.Colors[54] )
        surface_DrawOutlinedRect( 0, 0, w, h, 1 )

        surface_SetFont( "tbfont" )
        surface_SimpleText( 8, 2, self.txt, ilya.Colors[165] )

        surface_SimpleRect( 6, 20, w-12, 1, ilya.Colors[54] )
    end

    function PANEL:OnMousePressed()
        ilya.frame:OnMousePressed()
    end

    function PANEL:OnMouseReleased()
        ilya.frame:OnMouseReleased()
    end

    function PANEL:GetItemPanel()
        return self.ItemPanel
    end

    function PANEL:GetButtonPanel()
        return self.ButtonPanel
    end

    vgui_Register( "UButtonBarPanel", PANEL, "Panel" )
end




// GUI FUNCS

ilya.ui.ColorWindow = false
ilya.ui.SettingsPan = false
ilya.ui.MultiComboP = false

function ilya.ui.RemovePanel( pan )
    if not pan then return end

    pan:Remove()
    pan = false
end

function ilya.ui.Binder( cfg, par )
    local b = vgui_Create( "UBinder", par )
    b:SetValue( ilya.cfg.binds[ cfg ] )

    function b:OnChange()
        ilya.cfg.binds[ cfg ] = b:GetValue()
    end

    return b
end

function ilya.ui.ColorPicker( cfg, par, onChange )
    local b = vgui_Create( "UCPicker", par )

    function b:DoClick()
        local x, y = self:LocalToScreen( 0, self:GetTall() )

        ilya.ui.RemovePanel( ilya.ui.ColorWindow )

        ilya.ui.ColorWindow = vgui_Create( "UColorPanel" )
        ilya.ui.ColorWindow:SetPos( x+25, y-100 )

        local c = vgui_Create( "UColorMixer", ilya.ui.ColorWindow )
        c:SetColor( string_ToColor( ilya.cfg.colors[cfg] ) )

        c.HSV.Knob:SetSize( 5, 5 )

        function c.HSV.Knob:Paint( w, h )
            surface_SimpleRect( 0, 0, w, h, b.Color )

            surface_SetDrawColor( ilya.Colors[255] )
            surface_DrawOutlinedRect( 0, 0, w, h, 1 )
        end

        function c:ValueChanged( col )
            b.Color = col
            ilya.cfg.colors[cfg] = tostring(col.r) .. " " .. tostring(col.g) .. " " .. tostring(col.b) .. " " .. tostring(col.a)
            if onChange then onChange( col ) end
        end

    end

    b.Color = string_ToColor( ilya.cfg.colors[cfg] )
end

function ilya.ui.SPanel( func, p )
    local b = vgui_Create( "USPanelButton", p )

    function b:DoClick()
        local mx, my = input_GetCursorPos()

        ilya.ui.RemovePanel( ilya.ui.SettingsPan )

        ilya.ui.SettingsPan = vgui_Create( "USettingsPanel" )
        ilya.ui.SettingsPan:SetPos( mx+25, my-10 )

        func()
    end
end

function ilya.ui.Label( pan, str, postCreate )
    local p = vgui_Create( "UCBPanel", pan )

    local lbl = vgui_Create( "DLabel", p )
    lbl:SetText( str )
    lbl:SetFont( "tbfont" )
    lbl:SetTextColor( ilya.Colors[165] )
    lbl:Dock( LEFT )
    lbl:DockMargin( 4, 2, 4, 0 )
    lbl:SizeToContents()

    if postCreate then postCreate( p ) end
end

function ilya.ui.CheckBox( par, lbl, cfg, hint, bind, color, spanel, onToggle, postCreate )
    local p = vgui_Create( "UCBPanel", par )

    local c = vgui_Create( "UCheckboxLabel", p )
    c:SetText( lbl )
    c:SetPos( 0, 0 )
    c:SetValue( ilya.cfg.vars[cfg] )

    function c:OnChange( bval )
        ilya.cfg.vars[cfg] = bval

        if onToggle then onToggle(bval) end
    end

    if postCreate then postCreate( p ) end

    if bind then ilya.ui.Binder( cfg, p ) end
    if color then ilya.ui.ColorPicker( cfg, p ) end
    if spanel then ilya.ui.SPanel( spanel, p ) end

    if hint then
        function c.Label:Paint()
            if self:IsHovered() then
                local x, y = input_GetCursorPos()

                ilya.hint = true
                ilya.hintText = hint
                ilya.hintX = x + 45
                ilya.hintY = y - 5
            end
        end
    end
end

function ilya.ui.Slider( p, str, cfg, min, max, dec, onChange )
    local pan = vgui_Create( "DPanel", p )
    pan:Dock( TOP )
    pan:DockMargin( 4, 2, 4, 0 )
    pan:SetTall( 20 )

    function pan:Paint( w, h )
        surface_SetFont("tbfont")

        local s = ilya.cfg.vars[cfg]
        local tw, th = surface_GetTextSize(s)

        surface_SimpleText(2,4,str,ilya.Colors[165])

        surface_SimpleText(w-tw-2,4,ilya.cfg.vars[cfg],ilya.Colors[165])
    end

    local c = vgui_Create( "USlider", p )
    c:Dock( TOP )
    c:DockMargin( 4, 2, 4, 0 )
    c:SetMax( max )
    c:SetMin( min )
    c:SetDecimals( dec )

    c:SetValue( ilya.cfg.vars[cfg] )

    local value, min, max = c:GetValue(), c:GetMin(), c:GetMax()

	c:SetSlideX((value - min) / (max - min))

    function c:OnValueChanged( val )
        ilya.cfg.vars[cfg] = val

        if onChange then onChange(val) end
    end
end

function ilya.ui.Button( str, func, p )
    local b = vgui_Create( "UButton", p )
    b:SetText( str )

    function b:DoClick()
        func()
    end
end

function ilya.ui.TextEntry( str, cfg, pan, chars, postCreate )
    local lbl = vgui_Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,2,4,0)
    lbl:SetText(str)
    lbl:SetFont("tbfont")
    lbl:SetColor(ilya.Colors[165])

    local p = vgui_Create("DPanel",pan)
    p:SetTall(25)
    p:Dock(TOP)
    p:DockMargin(4,2,4,0)

    p.Paint = function(s,w,h)
        surface_SetDrawColor(ilya.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h)
    end

	local txt = vgui_Create("DTextEntry",p)
	txt:Dock(FILL)
	txt:DockMargin(4,4,4,4)
	txt:IsMultiline( false )
	txt:SetMaximumCharCount(chars)
	txt:SetPlaceholderText(str)
	txt:SetFont( "tbfont" )
    txt:SetPaintBackground(false)
    txt:SetTextColor(ilya.Colors[165])

	if ilya.cfg.vars[cfg] != nil and ilya.cfg.vars[cfg] != "" then
		txt:SetValue(ilya.cfg.vars[cfg])
	end

	function txt.Think()
		if txt:IsEditing() then return end
        if ilya.cfg.vars[cfg] == txt:GetValue() then return end

		ilya.cfg.vars[cfg] = txt:GetValue()
	end

	function txt.OnValueChange()
		ilya.cfg.vars[cfg] = txt:GetValue()
	end

    if postCreate then postCreate(p) end
end

function ilya.ui.dropdownButton( str, v, p, a )
    local b = p:Add("DButton")
    b:Dock(TOP)
    b:SetTall(20)
    b:DockMargin(2,2,2,0)
    b:SetText("")

    function b:Paint(w,h)
        if self:IsHovered() then
            surface_SimpleRect(1,1,w-2,h-2,ilya.Colors[32])
        end

        surface_SetTextColor(ilya.Colors[165])

        if ilya.cfg.vars[str.."-"..v] then
            surface_SetTextColor(ilya.Colors[235])
        end

        surface_SetTextPos(5,3)
        surface_SetFont("tbfont")
        surface_DrawText(v)
    end

    function b:DoClick()
        ilya.cfg.vars[str.."-"..v] = not ilya.cfg.vars[str.."-"..v]
    end
end

function ilya.ui.MultiCombo( pan, str, choices )
    local lbl = vgui_Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("tbfont")
    lbl:SetColor(ilya.Colors[165])

    local d = vgui_Create("DButton",pan)
    d:Dock(TOP)
    d:DockMargin(4,1,4,0)
    d:SetTall(20)
    d:SetText("")

    d.preview = {}

    function d:Paint(w,h)
        local preview = ""

        for k, v in pairs(choices) do
            if ilya.cfg.vars[str.."-"..v] == true and (d.preview[v] == false or d.preview[v] == nil) and not table.HasValue(d.preview, v) then
                table_insert(d.preview,v)
            elseif ilya.cfg.vars[str.."-"..v] == false and (d.preview[v] == true or d.preview[v] == nil) and table.HasValue(d.preview, v) then
                table_RemoveByValue(d.preview,v)
            elseif d.preview[v] == false then
                table_RemoveByValue(d.preview,v)
            end
        end

        preview = table_concat(d.preview,", ")

        surface_SetDrawColor(ilya.Colors[25])
        surface_DrawRect(0,0,w,h)

        surface_SetTextColor(ilya.Colors[165])
        surface_SetTextPos(8,20/2-15/2)
        surface_SetFont("tbfont")
        surface_DrawText(preview)

        surface_SetDrawColor(ilya.Colors[32])
        surface_DrawRect(w-25,0,25,25)

        surface_SetTextColor(ilya.Colors[165])
        surface_SetTextPos(w-20,20/2-15/2)
        surface_SetFont("tbfont")
        surface_DrawText("▼")

        surface_SetDrawColor(ilya.Colors[54])
        surface_DrawOutlinedRect(0,0,w,h,1)
    end

    function d:DoClick()
        local x,y = self:LocalToScreen( 0, self:GetTall() )

        ilya.ui.RemovePanel( ilya.ui.MultiComboP )

        local ctoh = #choices

        ilya.ui.MultiComboP = vgui_Create( "ULifeTimeBase" )
        ilya.ui.MultiComboP:SetPos( x, y - 1 )
        ilya.ui.MultiComboP:SetSize( 243, ctoh * 22 + 2 )

        for k, v in pairs(choices) do
            ilya.ui.dropdownButton( str, v, ilya.ui.MultiComboP, d.preview )
        end
    end
end

function ilya.ui.ComboBox( pan, str, cfg, choices )
    local lbl = vgui_Create("DLabel",pan)
    lbl:Dock(TOP)
    lbl:DockMargin(4,1,4,0)
    lbl:SetText(str)
    lbl:SetFont("tbfont")
    lbl:SetColor(ilya.Colors[165])

    local dropdown = vgui_Create("UComboBox",pan)
    dropdown:Dock(TOP)
    dropdown:DockMargin(4,1,4,0)

    if ilya.presets[ cfg ] then
        choices = ilya.presets[ cfg ]
    end

    for k, v in ipairs( choices ) do
        dropdown:AddChoice( v )
    end

    dropdown:SetSortItems(false)

    if ilya.cfg.vars[cfg] <= #choices then
        dropdown:ChooseOptionID(ilya.cfg.vars[cfg])
    else
        dropdown:ChooseOptionID(1)
    end

    function dropdown:OnSelect(index, value, data)
        ilya.cfg.vars[cfg] = index
    end

    return lbl, dropdown
end

function ilya.ui.InitMT( p, postCreate )
    p.ItemPanel:Remove()

    p.ItemPanel = vgui_Create( "DPanel", p )
    p.ItemPanel:Dock( FILL )
    p.ItemPanel:DockMargin( 3, 0, 3, 3 )

    p.ItemPanel.Paint = nil

    if postCreate then postCreate( p.ItemPanel ) end
end

function ilya.ui.MTButton( p, str, postCreate )
    surface_SetFont("tbfont")
    local w, h = surface_GetTextSize(str)

    local fw = w + 5

    local tx, ty = fw/2 - w/2, 18 / 2-h / 2 - 1

    local b = p:GetButtonPanel():Add("DButton")
    b:Dock(RIGHT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")

    function b:DoClick()
        p.ActiveTab = str
        ilya.ui.InitMT( p, postCreate )
    end

    function b:Paint(width,height)
        if p.ActiveTab == str then
            surface_SetTextColor(235,235,235,255)
        else
            surface_SetTextColor(165,165,165,255)
        end

        surface_DrawRect(0,0,width,height)

        surface_SetFont("tbfont")
        surface_SetTextPos(tx,ty)
        surface_DrawText(str)
    end

    p.ActiveTab = str
    ilya.ui.InitMT( p, postCreate )
end

ilya.pty = { 5, 5, 5 }
do
    local xt = {
        [1] = 5,
        [2] = 267,
        [3] = 529
    }

    function ilya.itemPanel( str, tbl, h )
        local p = vgui_Create( "UPanel", ilya.scrollpanel )
        p:SetPos( xt[tbl], ilya.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        ilya.pty[ tbl ] = ilya.pty[ tbl ] + h + 5

        return p
    end

    function ilya.itemPanelB( str, tbl, h, buttonsFunc )
        local p = vgui_Create( "UButtonBarPanel", ilya.scrollpanel )
        p:SetPos( xt[tbl], ilya.pty[tbl] )
        p:SetSize( 257, h )
        p.txt = str

        if buttonsFunc then buttonsFunc( p ) end

        ilya.pty[ tbl ] = ilya.pty[ tbl ] + h + 5

        return p
    end

end

/*
    Drag n drop
*/

ilya.espposes = {"Up","Down","Right","Left"}
ilya.espelements = {"Name pos","Usergroup pos","Health pos","Armor pos","Money pos","Weapon pos","Team pos","Break LC pos","Simtime pos"}
ilya.lastdrag = ""
ilya.esppans = {}

ilya.esppansposes = {
    [1] = {
        x = 85,
        y = 0,
    },
    [2] = {
        x = 85,
        y = 250,
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
    ilya.esppans[i] = {}
end

function ilya.DoDrop( self, panels, bDoDrop, Command, x, y )
    if ( bDoDrop ) then
        local newpos = self.pos

        for i = 1, #panels do
            local v = panels[i]

            ilya.cfg.vars[ v:GetText() ] = newpos
            v:SetParent( self )
        end
    end
end

ilya.spfuncs = {}

// PANEL CREATION

ilya.frame = vgui_Create("UFrame")
ilya.scrollpanel = vgui_Create("UScroll",ilya.frame)

ilya.tabs = {}

// Aimbot


ilya.spfuncs[2] = function()
    ilya.ui.SettingsPan:SetSize( 300, 350 )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Rapid fire", "Rapid fire", "Allows to quickly fire semi-automatic weapons." )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Rapid fire glitch", "Rapid fire glitch", "Allows to quickly fire semi-automatic weapons." )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Bullet time", "Bullet time", "Aim will not work until weapon can fire." )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Rapid fire two method", "Rapid fire 2", "Allows to quickly fire semi-automatic weapons." )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Wait for simtime update", "Wait for simtime update" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "ShootDelay", "ShootDelay", "Waiting for a delay before the shooting" )
    ilya.ui.Slider( ilya.ui.SettingsPan, "ShootDelay time", "ShootDelay time", 0, 1000, 0 )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Alt Rapid fire", "Alt Rapid fire" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Alt Rapid fire two method", "Alt Rapid fire 2" )
end

ilya.spfuncs[3] = function()
    ilya.ui.SettingsPan:SetSize( 250, 68 )

    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Knifebot mode", "Knifebot mode"  )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Facestab", "Facestab" )
end

ilya.spfuncs[4] = function()
    ilya.ui.SettingsPan:SetSize( 250, 85 )

    ilya.ui.Slider( ilya.ui.SettingsPan, "Smooth amount", "Smoothing", 0, 1, 2 )
end

ilya.spfuncs[5] = function()
    ilya.ui.SettingsPan:SetSize( 250, 128 )

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Dynamic fov", "Fov dynamic" )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Aimbot FOV", "Aimbot FOV", 0, 180, 0 )
end

ilya.spfuncs[30] = function()
    ilya.ui.SettingsPan:SetSize(250,200)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "", "" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Random seed", "Wait for seed" )


end

ilya.spfuncs[32] = function()
    ilya.ui.SettingsPan:SetSize(250,200)

    ilya.ui.Slider( ilya.ui.SettingsPan, "Max simulation time", "Crossbow max simtime", 1, 10, 2 )

end

function ilya.tabs.Aimbot()

    local p = ilya.itemPanel("Main",1,160):GetItemPanel()

    ilya.ui.CheckBox( p, "Enable Aimbot", "Enable aimbot", false, false, false, false, false, function( p ) ilya.ui.Binder( "Aim on key", p ) end )
    ilya.ui.CheckBox( p, "Auto fire", "Auto fire", "Automatically fires when targets can be damaged.", false, false, ilya.spfuncs[2] )
    ilya.ui.CheckBox( p, "Auto reload", "Auto reload", "Automatically reloads weapon when clip is empty." )
    ilya.ui.CheckBox( p, "Silent aim", "Silent aim", "Makes the aim visually invisible" )
    ilya.ui.CheckBox( p, "pSilent", "pSilent", "Context vector will be used to make aim completely invisible." )
    ilya.ui.CheckBox( p, "Knife bot", "Knifebot", false, false, false, ilya.spfuncs[3] )

    local p = ilya.itemPanel("Legit",1,140):GetItemPanel()

    ilya.ui.CheckBox( p, "Aimbot smoothing", "Aimbot smoothing", false, false, false, ilya.spfuncs[4] )
    ilya.ui.CheckBox( p, "Fov limit", "Fov limit", false, false, false, ilya.spfuncs[5] )
    ilya.ui.CheckBox( p, "Trigger", "Trigger bot", false, true )

    local p = ilya.itemPanel( "Tickbase", 1, 200 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Engine pred(need for grust)", "need for grust" )

    ilya.ui.CheckBox( p, "NoPlyLag", "NoAimLag", "Off comp lag" )

    ilya.ui.CheckBox( p, "LagCompensation", "LagCompensation", "Compensate ping loss" )
    ilya.ui.CheckBox( p, "LerpTime abjust", "LerpTime", "abuse lerptime target" )


    local p = ilya.itemPanel( "Visualisation", 1, 250 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Show FOV", "Show FOV", false, false, true )
    ilya.ui.CheckBox( p, "Snapline", "Aimbot snapline", false, false, true )
    ilya.ui.CheckBox( p, "Marker", "Aimbot marker", false, false, true )
    ilya.ui.CheckBox( p, "Aimbot point", "ap_enable", false, false, true )


    local p = ilya.itemPanel( "Accuracy", 2, 165 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Compensate recoil", "Norecoil", "Disable PunchAngles" )
    ilya.ui.CheckBox( p, "Compensate recoil for tfa", "gRust NR", "Disable PunchAngles !ONLY GRUST" )
    ilya.ui.CheckBox( p, "Remove spread", "Nospread", "Supported HL2, M9K, FAS2, CW2, SWB", false, false, ilya.spfuncs[30] )

    local p = ilya.itemPanel( "Prediction", 2, 200 ):GetItemPanel()
    ilya.ui.CheckBox( p, "ILYAWARE PREDICT", "ilyapredict", "unique prediction for grust" )
    ilya.ui.CheckBox( p, "Projectile aimbot", "Projectile aimbot" )




    local p = ilya.itemPanel( "Target selection", 3, 360 ):GetItemPanel()

    ilya.ui.ComboBox( p, "Target selection", "Target selection", { "Distance", "FOV" , "FOV for prediction" , "Distance for prediction", "None" } )

    ilya.ui.ComboBox( p, "Sync", "Sync mode", { "None", "Engine", "Engine Time" ,"Velocity", "Based", "LowTickrate", "For breaking interp", "Lag comp" }, "Synchronization position target" )
    ilya.ui.MultiCombo( p, "Ignores", { "Friends", "Steam friends", "Teammates", "Driver", "Break LC", "Head unhitable", "God time", "Nocliping", "Nodraw", "Frozen", "Bots", "Admins" } )

    ilya.ui.CheckBox( p, "Wallz", "Wallz" )
    ilya.ui.Slider( p, "Max targets", "Max targets", 0, 10, 0 )
    local p = ilya.itemPanel( "Hitbox selection", 3, 280 ):GetItemPanel()

    ilya.ui.ComboBox( p, "Hitbox selection", "Hitbox selection", { "Head", "Chest", "Penis" } )
    ilya.ui.CheckBox( p, "Hitscan", "Hitscan" )
    ilya.ui.MultiCombo( p, "Hitscan groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    ilya.ui.CheckBox( p, "Multipoint", "Multipoint" )
    ilya.ui.MultiCombo( p, "Multipoint groups", { "Head", "Chest", "Stomach", "Arms", "Legs", "Generic" } )
    ilya.ui.Slider( p, "Multipoint scale", "Multipoint scale", 0.5, 1, 1 )





    /*






    ilya.ui.CheckBox( p, "", "Disable interpolation", false, false, false, ilya.spfuncs[9])


    local p = ilya.itemPanel("Prediction",2,200):GetItemPanel()


    ilya.ui.CheckBox( p, "Crossbow prediction", "Crossbow prediction", false, false, false, ilya.spfuncs[32] )


*/

    /*
    func = function()
        ilya.settingspan:SetSize(250,64)

        ilya.slider("Forwardtrack time","",0,200,0,ilya.settingspan)
    end

    //ilya.checkbox("Backshoot","Backshoot",p)
    ilya.checkbox("Auto healthkit","Auto healthkit",p:GetItemPanel())
    ilya.multiCombo("Healthkit",{"Self heal","Heal closest"},p:GetItemPanel())
    */
end



ilya.spfuncs[22] = function()
    ilya.ui.SettingsPan:SetSize(250,200)

    ilya.ui.Slider( ilya.ui.SettingsPan, "Lag limit","Lag limit",1,23,0 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Random min","Lag randomisation",1,23,0 )
    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Lag mode", "Lag mode", {"Static","Adaptive","Hybrid","HybridTwo","HybridThree"})
    ilya.ui.MultiCombo( ilya.ui.SettingsPan, "Fake lag options", {"Disable on ladder","Disable in attack","Randomise","On peek","Only in AntiAim"} )
end

ilya.spfuncs[24] = function( p )


    // "Runs act command to make your model dance for other clients"
    //"Forcing istyping for animation desync"
end

ilya.spfuncs[36] = function()
    ilya.ui.SettingsPan:SetSize(250,200)
    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Material", "Antiaim material", ilya.chamsMaterials)
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Antiaim fullbright", "Antiaim fullbright" )
end

ilya.spfuncs[254] = function()
    ilya.ui.SettingsPan:SetSize(250,200)
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Backshoot", "Backshoot" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Fakelag comp new", "Fakelag comp new" )

end

function ilya.tabs.Rage()
    local p = ilya.itemPanel( "Angles", 1, 245 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Enable Anti-Aim", "Anti aim", false, true )
    ilya.ui.CheckBox( p, "Inverter", "Inverter", false, true )
    ilya.ui.ComboBox( p, "Yaw base", "Yaw base" )
    ilya.ui.ComboBox( p, "Yaw", "Yaw" )
    ilya.ui.ComboBox( p, "Pitch", "Pitch" )
    ilya.ui.ComboBox( p, "Edge", "Edge", { "Disabled", "Hide", "Show", "Jitter" } )

    local p = ilya.itemPanel( "Tweaks", 1, 120 ):GetItemPanel()

    ilya.ui.CheckBox( p, "On shot aa", "On shot aa" )
    ilya.ui.CheckBox( p, "Yaw randomisation", "Yaw randomisation" )
    ilya.ui.CheckBox( p, "Freestanding", "Freestanding" )
    ilya.ui.CheckBox( p, "Micromovement", "Micromovement" )

    local p = ilya.itemPanel( "Custom angles", 1, 400 ):GetItemPanel()

    ilya.ui.Slider( p, "Custom real","Custom real", -180, 180, 0 )
    ilya.ui.Slider( p, "Custom fake","Custom fake", -180, 180, 0 )
    ilya.ui.Slider( p, "Custom pitch","Custom pitch", -360, 360, 0 )
    ilya.ui.Slider( p, "Spin speed","Spin speed", -50, 50, 0 )
    ilya.ui.Slider( p, "Min Lby Delta","LBY min delta", 0, 360, 0 )
    ilya.ui.Slider( p, "Break Lby Delta","LBY break delta", 0, 360, 0 )
    ilya.ui.Slider( p, "Sin delta","Sin delta", -360, 360, 0 )
    ilya.ui.Slider( p, "Sin add","Sin add", -180, 180, 0 )
    ilya.ui.Slider( p, "Jitter delta","Jitter delta", -180, 180, 0 )

    local p = ilya.itemPanel( "Fake lag",2,250 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Fake lag", "Fake lag", false, false, false, ilya.spfuncs[22] )
    ilya.ui.CheckBox( p, "Fake duck", "Fake duck", false, true )
    ilya.ui.CheckBox( p, "Air Duck", "Air lag duck" )
    ilya.ui.CheckBox( p, "Water level", "Jesus lag" )
    ilya.ui.CheckBox( p, "Break lagcomp", "Break lagcomp" )
    ilya.ui.CheckBox( p, "Michael Jackson exploit","Allah walk", false, true )

    local p = ilya.itemPanel( "Visualisation", 2,75 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Fake angle chams", "Anti aim chams", false, false, false, ilya.spfuncs[36], false, function( p ) ilya.ui.ColorPicker( "Real chams", p ) end )
    ilya.ui.CheckBox( p, "Angle arrows", "Angle arrows" )

    local p = ilya.itemPanel( "Tickbase", 2, 265 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Enable shift", "Tickbase shift", false, true, false, false, function(b) ded.EnableTickbaseShifting(b) end )

    ilya.ui.ComboBox( p, "Fakelag comp", "Fakelag comp", {"Disable","Compensate"} )
    ilya.ui.CheckBox( p, "Warp on peek", "Warp on peek" )
    ilya.ui.CheckBox( p, "Double tap", "Double tap" )
    ilya.ui.CheckBox( p, "Dodge projectiles", "Dodge projectiles" )
    ilya.ui.CheckBox( p, "Auto recharge", "Auto recharge", false, true )

    ilya.ui.Slider( p, "Shift ticks", "Shift ticks", 1, 99, 0, function( val ) ded.SetMinShift(val) end )
    ilya.ui.Slider( p, "Charge ticks", "Charge ticks", 1, 99, 0, function( val ) ded.SetMaxShift(val) end )

    local p = ilya.itemPanel( "Sequence", 2, 265 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Lagger manip", "Sequence manip", false, true )
    ilya.ui.Slider( p, "Out lagger", "OutSequence", 0.1, 100, 0 )
    ilya.ui.CheckBox( p, "Randomise", "Sequence min random" )
    ilya.ui.Slider( p, "Min lagger", "Sequence min", 0.1, 100, 0 )
    ilya.ui.CheckBox( p, "Animation freezer", "Animation freezer", false, true )
    ilya.ui.ComboBox( p, "Lagger manip mode", "Lagger manip mode", { "Mega", "Slippery", "TICKS", "desync"  } )



    local p = ilya.itemPanel( "Player adjustments", 3, 300 ):GetItemPanel()

    ilya.ui.CheckBox( p, "fix inerpolation grust", "Disable interpolation", false, false, false, false, function( bval ) ded.SetInterpolation( bval ) end )
    ilya.ui.CheckBox( p, "Sequence interpolation", "Disable Sequence interpolation", false, false, false, false, function( bval ) ded.SetSequenceInterpolation( bval ) end )
    ilya.ui.CheckBox( p, "Fix bones", "Bone fix", false, false, false, false, function( bval ) ded.EnableBoneFix( bval ) end )
    ilya.ui.CheckBox( p, "Fix animations", "Update Client Anim fix", false, false, false, false, function( bval ) ded.EnableAnimFix( bval ) end )
    ilya.ui.CheckBox( p, "Extrapolation", "Extrapolation" )
    ilya.ui.CheckBox( p, "Lag fix" , "Lag fix", false, false, false, ilya.spfuncs[254] )
    ilya.ui.CheckBox( p, "Forwardtrack" , "Forwardtrack" )
    ilya.ui.Slider( p, "Forwardtrack time","Forwardtrack time",0,200,0 )


    local p = ilya.itemPanel( "RESOLVER", 3, 140 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Resolver", "Resolver" )
    ilya.ui.ComboBox( p, "Resolver mode", "Resolver mode", { "Defoult", "Adaptive", "Deltalove", "Custom AA", "Classic", "TEST" } )
    ilya.ui.CheckBox( p, "Pitch resolver", "Pitch resolver" )
    ilya.ui.CheckBox( p, "res test", "res test" )


    local p = ilya.itemPanel( "Position adjustment", 3, 215 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Adjust tickcount", "Adjust tickcount" )
    ilya.ui.CheckBox( p, "Backtrack", "Backtrack" )
    ilya.ui.ComboBox( p, "Backtrack mode", "Backtrack mode", { "Last ticks", "Closest", "Scan" } ) // , "Backshoot"
    ilya.ui.Slider( p, "Sampling interval", "Sampling interval", 0, 200, 0 )
    ilya.ui.Slider( p, "Backtrack time", "Backtrack time", 0, 1000, 0 )
    ilya.ui.CheckBox( p, "Always backtrack", "Always backtrack" )

    local p = ilya.itemPanel( "Misc", 3, 115 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Auto detonator", "Auto detonator" )
    ilya.ui.Slider( p, "Detonation distance", "AutoD distance", 16, 128, 0 )


    ilya.ui.CheckBox( p, "Gun switch", "Gun switch" )
    /*
    local function func( p )
        ilya.ui.MTButton( p, "Custom", ilya.spfuncs[37] )
        ilya.ui.MTButton( p, "Anim breakers", ilya.spfuncs[24] )
        ilya.ui.MTButton( p, "Angles", ilya.spfuncs[23] )
    end

    ilya.itemPanelB( "Anti aim",1,300, func )




    local p = ilya.itemPanel("Fake lag",2,105):GetItemPanel()















*/

    //end


     /*
ilya.cfg.vars["Resolver"] = false
ilya.cfg.vars["Yaw mode"] = 1
ilya.cfg.vars["Pitch resolver"] = false
ilya.cfg.vars["Invert first shot"] = false
ilya.cfg.vars["Resolver max misses"] = 2

    ilya.combobox("Edge", {"None","Hide","Jitter"}, "Edge", p:GetItemPanel())

    ilya.checkbox("Show AA","Anti aim chams",p:GetItemPanel())

    local p = ilya.itemPanel("Animation breakers",1,200)




    local p = ilya.itemPanel("Animfix",3,223)

    ilya.cfg.vars["Interpolation-Disable interpolation"] = false
    ilya.cfg.vars["Interpolation-Fast sequences"] = false


    ilya.checkbox("Disable taunts","Disable taunts",p:GetItemPanel())
    ilya.checkbox("Extrapolation","Extrapolation",p:GetItemPanel())
    ilya.checkbox("test","last update",p:GetItemPanel())




    local p = ilya.itemPanel("Fake lag",2,320)





    ilya.checkbox("Fly hacks","Allah fly",p:GetItemPanel())

    //ilya.checkbox("Fake lag","Fake lag",p:GetItemPanel())
    //ilya.slider("Lag limit","Lag limit",0,23,0,p:GetItemPanel())
    //ilya.slider("Lag randomisation","Lag randomisation",0,23,0,p:GetItemPanel())
    //ilya.combobox("Lag mode", {"Static","Adaptive"}, "Lag mode", p:GetItemPanel())

    ilya.checkbox("Michael Jackson exploit","Allah walk",p:GetItemPanel(),"allahwalk")
    ilya.checkbox("","Fake duck",p:GetItemPanel(),"Fake duck")

    local p = ilya.itemPanel("Tickbase",2,250)


    ilya.multiCombo("Triggers",{"In Attack","On Peek","After peek"},p:GetItemPanel())

    // ilya.checkbox("Skip fire tick","Skip fire tick",p:GetItemPanel())


    local p = ilya.itemPanel( "Resolver", 3, 178 )

    ilya.checkbox( "Enable resolver", "Resolver", p:GetItemPanel() )
    ilya.combobox( "Yaw mode", { "Step", "Delta brute" }, "Yaw mode", p:GetItemPanel() )
    ilya.slider( "Max misses", "Resolver max misses", 1, 6, 0, p:GetItemPanel() )
    ilya.checkbox( "Pitch resolver", "Pitch resolver", p:GetItemPanel() )
    ilya.checkbox( "Invert first shot", "Invert first shot", p:GetItemPanel() )
*/
end

/*local p = vgui_Create("UPanel",ilya.scrollpanel)
    p:SetPos(5,y[1])
    p:SetSize(257,200)
    p.txt = "LBY Settings"

    ilya.slider("LBY min delta","LBY min delta",0,360,0,p:GetItemPanel())
    ilya.slider("LBY break delta","LBY break delta",0,360,0,p:GetItemPanel())
    */

ilya.spfuncs[11] = function()
    ilya.ui.SettingsPan:SetSize(250,200)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Team color", "Box team color" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Gradient", "Box gradient" )
    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Style", "Box style", { "Default", "Corner", "Hex", "Poly", "test" })


end

ilya.spfuncs[12] = function()
    ilya.ui.SettingsPan:SetSize(250,48)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Health bar", "Health bar" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Gradient", "Health bar gradient" )
end

ilya.spfuncs[53453453453453453] = function()
    ilya.ui.SettingsPan:SetSize(250,48)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Health bar", "Health bar grust" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Gradient", "Health bar gradient grust" )
end

ilya.spfuncs[14] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Visible material", "Visible mat", ilya.chamsMaterials)
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Weapon chams", "Visible chams w" )

    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Invisible material", "inVisible mat", ilya.chamsMaterials)
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "inVisible chams", "inVisible chams" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Weapon chams", "inVisible chams w" )

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Fullbright", "Supress lighting" )
end

ilya.spfuncs[15] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Material", "Self mat", ilya.chamsMaterials)
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Weapon chams", "Self chams w" )

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Fullbright", "Supress self lighting" )
end

ilya.spfuncs[16] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Material", "Backtrack material", ilya.chamsMaterials)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Fullbright", "Backtrack fullbright" )
end

ilya.spfuncs[17] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Material", "Entity material", ilya.chamsMaterials)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Fullbright", "Entity fullbright" )
end

ilya.spfuncs[18] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.Slider( ilya.ui.SettingsPan, "Die time","Tracers die time",0.1,10,1 )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Bullet tracers muzzle", "Bullet tracers muzzle" )

end

ilya.spfuncs[19] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Material", "Viewmodel chams type", ilya.chamsMaterials)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Fullbright", "Fullbright viewmodel" )
end

ilya.spfuncs[20] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Smoothing", "Third person smoothing" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Collision", "Third person collision" )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Distance","Third person distance",50,220,0 )
end

ilya.spfuncs[21] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.Slider( ilya.ui.SettingsPan, "Freecam speed","Free camera speed",5,100,0 )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Ghetto mode", "Ghetto free cam" )
end

ilya.spfuncs[31] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "3D", "Ent box 3d" )
end


ilya.spfuncs[35] = function( p )
    local mdl = vgui.Create( "DModelPanel", p )
    mdl:SetPos(85,125)
    mdl:SetSize(85,125)
    mdl:SetModel( "models/props_vehicles/truck001a.mdl" )

    mdl:SetCamPos(Vector(0,0,148))

    function mdl:LayoutEntity( Entity ) return end

    for i = 1,4 do
        local poses = ilya.esppansposes

        ilya.esppans[i].panel = vgui_Create( "UPaintedPanel", p )
        ilya.esppans[i].panel:SetPos(poses[i].x,poses[i].y)
        ilya.esppans[i].panel:SetSize(85,125)
        ilya.esppans[i].panel:Receiver( "SwagCock$", ilya.DoDrop )
        ilya.esppans[i].panel.pos = i
    end

    for i = 1, #ilya.espelements do
        local cfgstr = ilya.espelements[i]
        local panel = ilya.esppans[ilya.cfg.vars[cfgstr]].panel

        local b = vgui_Create("UESPPButton")
        b:SetText( cfgstr )
		b:SetSize( 36, 24 )
		b:Dock( TOP )
        b:Droppable( "SwagCock$" )

        b:SetParent( panel )
    end
end

ilya.spfuncs[33] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Show ammo", "Show ammo" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Print name", "Weapon printname" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Show reloading", "Show reloading" )

end

ilya.spfuncs[34] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Material", "chams_hand_mat", ilya.chamsMaterials)

end

ilya.spfuncs[124] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.Slider( ilya.ui.SettingsPan, "Viewmodel X","Viewmodel x", -50, 50, 0 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Viewmodel Y","Viewmodel y", -50, 50, 0 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Viewmodel Z","Viewmodel z", -50, 50, 0 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Viewmodel Pitch","Viewmodel p", -90, 90, 0 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Viewmodel Yaw","Viewmodel ya", -90, 90, 0 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Viewmodel Roll","Viewmodel r", -90, 90, 0 )

end

ilya.spfuncs[123] = function()
    ilya.ui.SettingsPan:SetSize(250,370)

    ilya.ui.Slider( ilya.ui.SettingsPan, "Red","pp_colour_addr", 0, 10, 4 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Green","pp_colour_addg", 0, 10, 4 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Blue","pp_colour_addb", 0, 10, 4 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Brightness","pp_colour_brightness", 0, 3, 4 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Contrast","pp_colour_contrast", 0, 5, 4 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Saturation","pp_colour_colour", 0, 5, 4 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Mul Red", "pp_colour_mulr", 0, 255, 4 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Mul Green", "pp_colour_mulg", 0, 255, 4 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Mul blue", "pp_colour_mulb", 0, 255, 4 )

end



ilya.spfuncs[909] = function()
    ilya.ui.SettingsPan:SetSize(250,200)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Team color", "OOF team color" )

end

ilya.spfuncs[909412421] = function()
    ilya.ui.SettingsPan:SetSize(250,200)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Team color", "Team colorSUCK" )

end

function ilya.tabs.Visuals()

    local p = ilya.itemPanel("Player",1,550):GetItemPanel()

    ilya.ui.CheckBox( p, "Box", "Box esp", false, false, true, ilya.spfuncs[11] )

    ilya.ui.CheckBox( p, "Name", "Name", false, false, true, false, false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "Name pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ilya.ui.CheckBox( p, "Usergroup", "Usergroup", false, false, true, false, false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "Usergroup pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ilya.ui.CheckBox( p, "Health", "Health", false, false, true, ilya.spfuncs[12], false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "Health pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) ilya.ui.ColorPicker( "Health bar gradient", p ) end )
    ilya.ui.CheckBox( p, "Armor", "Armor", false, false, true, false, false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "Armor pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ilya.ui.CheckBox( p, "Weapon", "Weapon", false, false, true, ilya.spfuncs[33], false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "Weapon pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(3,0,0,0) end )
    ilya.ui.CheckBox( p, "Team", "Team", false, false, true, ilya.spfuncs[909412421], false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "Team pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ilya.ui.CheckBox( p, "Money", "DarkRP Money", false, false, true, false, false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "Money pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ilya.ui.CheckBox( p, "Lag compensation", "Break LC", false, false, true, false, false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "Break LC pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ilya.ui.CheckBox( p, "Packets ( Fake lag )", "Simtime updated", false, false, true, false, false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "Simtime pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )
    ilya.ui.CheckBox( p, "Distance", "Print Distance", false, false, true, false, false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "Print Distance pos", {"Up","Down","Right","Left"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) end )

    ilya.ui.Slider( p, "Max distance","ESP Distance",0,100000,0 )

    ilya.ui.CheckBox( p, "Show records", "Show records" )
    ilya.ui.CheckBox( p, "Skeleton", "Skeleton",false,false,true )
    ilya.ui.CheckBox( p, "Hitbox", "Hitbox",false,false,true )
    ilya.ui.CheckBox( p, "OOF Arrows", "OOF Arrows", false, false, false, ilya.spfuncs[909], false, function(p) local lbl, drop = ilya.ui.ComboBox( p, "", "OOF Style", {"Arrow","UkroSwastika"} ) lbl:Remove() drop:Dock(RIGHT) drop:DockMargin(0,0,0,0) ilya.ui.ColorPicker( "OOF Arrows color", p ) end )
    ilya.ui.CheckBox( p, "Sight lines", "Sight lines",false,false,true )
    ilya.ui.CheckBox( p, "InFOV Indicator", "IFOV",false,false,true )
    ilya.ui.CheckBox( p, "Hitbones", "hitbones", false, false, true )

    ilya.ui.ComboBox( p, "Font", "ESP Font", { "Outlined", "Shadow", "Thug", "Arial" } )












    local p = ilya.itemPanel("Entity",1,135):GetItemPanel()

    ilya.ui.CheckBox( p, "Box", "Ent box", false, false, false, ilya.spfuncs[31] )
    ilya.ui.CheckBox( p, "Class", "Ent class" )
    ilya.ui.Slider( p, "Max distance","Ent ESP Distance",0,100000,0 )
    ilya.ui.Label( p, "Add entity key", function( p ) ilya.ui.Binder( "Ent add", p ) end )

    local p = ilya.itemPanel( "Hitmarker", 1, 400 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Hitmarker(dont work on grust)", "Hitmarker", false, false, true )
    ilya.ui.CheckBox( p, "Hitnumbers(dont work on grust)", "Hitnumbers", false, false, true, false, false, function(p) ilya.ui.ColorPicker( "Hitnumbers krit", p ) end )
    ilya.ui.CheckBox( p, "CrosshairSwastika", "crosshair", false, false, false, ilya.spfuncs[23333] )

    //ilya.ui.CheckBox( p, "Hit particles", "Hit particles", false, false, true, ilya.spfuncs[31] )


    ilya.ui.CheckBox( p, "Hitsound(dont work on grust)", "Hitsound" )
    ilya.ui.TextEntry( "Sound path", "Hitsound str", p, 420 )
    ilya.ui.CheckBox( p, "Killsound(dont work on grust)", "Killsound" )
    ilya.ui.CheckBox( p, "Killstreak(dont work on grust)", "Killstreak" )
    ilya.ui.TextEntry( "Sound path", "Killsound str", p, 420 )
    
    

    local p = ilya.itemPanel("Colored models",2,200):GetItemPanel()

    ilya.ui.CheckBox( p, "Player chams", "Visible chams", false, false, true, ilya.spfuncs[14], false, function(p) ilya.ui.ColorPicker( "inVisible chams", p ) end )
    ilya.ui.CheckBox( p, "Self chams", "Self chams", false, false, true, ilya.spfuncs[15] )
    ilya.ui.CheckBox( p, "Backtrack chams", "Backtrack chams", false, false, true, ilya.spfuncs[16] )
    ilya.ui.CheckBox( p, "Entity chams", "Entity chams", false, false, true, ilya.spfuncs[17], false )
    ilya.ui.CheckBox( p, "Viewmodel chams", "Viewmodel chams", false, false, true, ilya.spfuncs[19], false )
    ilya.ui.CheckBox( p, "Hand chams", "chams_hand", false, false, true, ilya.spfuncs[34], false )
    ilya.ui.CheckBox( p, "Rainbow player", "rainbow player" )

    local p = ilya.itemPanel("Material customisation",2,150):GetItemPanel()

    ilya.ui.Slider( p, "Min illumination", "Fresnel minimum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ilya.chamMats.vis[3], ilya.chamMats.vis[4], ilya.chamMats.invis[3], ilya.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ilya.cfg.vars["Fresnel maximum illum"], ilya.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ilya.cfg.vars["Fresnel maximum illum"], ilya.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ilya.cfg.vars["Fresnel maximum illum"], ilya.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( v, ilya.cfg.vars["Fresnel maximum illum"], ilya.cfg.vars["Fresnel exponent"] ) )
    end )

    ilya.ui.Slider( p, "Max illumination", "Fresnel maximum illum", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ilya.chamMats.vis[3], ilya.chamMats.vis[4], ilya.chamMats.invis[3], ilya.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ilya.cfg.vars["Fresnel minimum illum"], v, ilya.cfg.vars["Fresnel exponent"] ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ilya.cfg.vars["Fresnel minimum illum"], v, ilya.cfg.vars["Fresnel exponent"] ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ilya.cfg.vars["Fresnel minimum illum"], v, ilya.cfg.vars["Fresnel exponent"] ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ilya.cfg.vars["Fresnel minimum illum"], v, ilya.cfg.vars["Fresnel exponent"] ) )
    end )

    ilya.ui.Slider( p, "Fresnel exponent", "Fresnel exponent", 0, 1, 1, function( v )
        local v1, v2, v3, v4 = ilya.chamMats.vis[3], ilya.chamMats.vis[4], ilya.chamMats.invis[3], ilya.chamMats.invis[3]

        v1:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ilya.cfg.vars["Fresnel minimum illum"], ilya.cfg.vars["Fresnel maximum illum"], v ) )
        v2:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ilya.cfg.vars["Fresnel minimum illum"], ilya.cfg.vars["Fresnel maximum illum"], v ) )
        v3:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ilya.cfg.vars["Fresnel minimum illum"], ilya.cfg.vars["Fresnel maximum illum"], v ) )
        v4:SetVector( "$selfIllumFresnelMinMaxExp", Vector( ilya.cfg.vars["Fresnel minimum illum"], ilya.cfg.vars["Fresnel maximum illum"], v ) )
    end )

    local p = ilya.itemPanel("Outlines",2,115):GetItemPanel()

    ilya.ui.CheckBox( p, "Player outline", "Player outline", false, false, true )
    ilya.ui.CheckBox( p, "Entity outline", "Entity outline", false, false, true )
    ilya.ui.ComboBox( p, "Style", "Outline style", { "Default", "Subtractive", "Additive" } )

    local p = ilya.itemPanel( "Indicators", 2, 145 ):GetItemPanel()

    ilya.ui.CheckBox( p, "On screen logs", "On screen logs", false, false, true, false, false, function(p) ilya.ui.ColorPicker( "Miss lagcomp", p ) ilya.ui.ColorPicker( "Miss spread", p ) ilya.ui.ColorPicker( "Miss fail", p ) end )
    ilya.ui.CheckBox( p, "Spectator list", "Spectator list" )
    ilya.ui.CheckBox( p, "Tickbase indicator", "Tickbase indicator" )
    --ilya.ui.CheckBox( p, "WaterMark", "WaterMark" )
    ilya.ui.CheckBox( p, "indicators", "Indicators" )



    local p = ilya.itemPanel("World",3,320):GetItemPanel()

    ilya.ui.TextEntry( "Skybox texture", "Custom sky", p, 420 )
    ilya.ui.CheckBox( p, "Sky color", "Sky color", false, false, true )
    ilya.ui.CheckBox( p, "Wall color", "Wall color", false, false, true )
    ilya.ui.CheckBox( p, "Render", "Color_Modify", false, false, false, ilya.spfuncs[123] )
    ilya.ui.CheckBox( p, "Bullet tracers", "Bullet tracers", false, false, true, ilya.spfuncs[18] )
    ilya.ui.TextEntry( "Material", "Bullet tracers material", p, 420 )
    ilya.ui.CheckBox( p, "Fullbright", "Fullbright", false, true )
    ilya.ui.ComboBox( p, "Mode", "Fullbright mode", { "Default", "Corvus extreme" } )
    ilya.ui.CheckBox( p, "Disable shadows", "Disable shadows" )




    local p = ilya.itemPanel("View",3,215):GetItemPanel()

    ilya.ui.CheckBox( p, "Third person", "Third person", false, true, false, ilya.spfuncs[20] )
    ilya.ui.CheckBox( p, "Free camera", "Free camera", false, true, false, ilya.spfuncs[21] )

    ilya.ui.Slider( p, "Fov override","Fov override",70,160,0 )
    ilya.ui.Slider( p, "Viewmodel fov","Viewmodel fov",50,180,0 )
    ilya.ui.CheckBox( p, "Viewmodel manip","Viewmodel manip", false, false, false, ilya.spfuncs[124] )
    ilya.ui.Slider( p, "Aspect ratio","Aspect ratio",0,2,3,function(val) gRunCmd("r_aspectratio",val) end )

    local p = ilya.itemPanel( "Misc", 3, 400 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Skate", "leg_breaker" )
    ilya.ui.CheckBox( p, "Trails", "Trails", false, false, false, false, false, function(pnl) 
        ilya.ui.Slider( p, "Distance", "Trails distance", 1, 90, 0 ) 
        ilya.ui.Slider( p, "Speed", "Trails move", 1, 10, 2 ) 
        ilya.ui.ColorPicker( "Trails", pnl ) 
    end )
    ilya.ui.CheckBox( p, "Kill Effect", "Kill effect enemy" )
    ilya.ui.CheckBox( p, "Screengrab image", "Screengrab image" )
    ilya.ui.CheckBox( p, "Key strokes", "Key strokes" )
    ilya.ui.CheckBox( p, "Nimb", "ass1" )
    ilya.ui.CheckBox( p, "pchelki", "ass11" )



    /*





    ilya.checkbox("Kill sound","Killsound",p:GetItemPanel())


    local p = ilya.itemPanel("World",2,123)



    local p = ilya.itemPanel("Effects",2,142)





    local p = ilya.itemPanel("View",3,275)




    // ilya.ESPPP:Show()
*/
end

ilya.spfuncs[25] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Strafe mode", "Strafe mode", {"Legit","Rage","Multidir"})
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Ground strafer", "Ground strafer" )
    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Sin ( snake ) strafe", "Z Hop", false, true )
end

ilya.spfuncs[26] = function()
    ilya.ui.SettingsPan:SetSize(250,256)

    ilya.ui.Slider( ilya.ui.SettingsPan, "Predict ticks", "CStrafe ticks", 16, 128, 0 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Angle step", "CStrafe angle step", 1, 10, 0 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Angle max step", "CStrafe angle max step", 5, 50, 0 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Ground diff", "CStrafe ground diff", 1, 65, 0 )
end

ilya.spfuncs[27] = function( p )
    ilya.ui.TextEntry( "Name", "Name Convar", p, 250 )
    ilya.ui.Button( "Change name", function() ded.NetSetConVar("name",ilya.cfg.vars["Name Convar"]) end, p )
    ilya.ui.CheckBox( p, "Name stealer", "Name stealer" )
    ilya.ui.CheckBox( p, "Name generator", "Name generator" )

    ilya.ui.TextEntry( "Disconnect reason", "Disconnect reason", p, 250 )
    ilya.ui.Button( "Disconnect", function() ded.NetDisconnect(ilya.cfg.vars["Disconnect reason"]) end, p )
end

function ilya.CustomCvarVal( net )
    local m = net == 1 and "Net Convar mode" or "Cvar mode"
    local n = net == 1 and "Net Convar int" or "Cvar int"
    local s = net == 1 and "Net Convar str" or "Cvar str"

    local mode = ilya.cfg.vars[m]
    local num = ilya.cfg.vars[n]
    local set = mode == 2 and math_Round( num ) or num

    if mode == 1 then set = ilya.cfg.vars[s] end

    return set
end

ilya.spfuncs[28] = function( p )
    ilya.ui.TextEntry( "Cvar name", "Net Convar", p, 250 )
    ilya.ui.Slider( p, "Cvar int", "Net Convar int", 1, 100, 2 )
    ilya.ui.TextEntry( "Cvar str", "Net Convar str", p, 250 )

    ilya.ui.ComboBox( p, "Set mode", "Net Convar mode", {"String","Int","Float"})

    ilya.ui.Button( "Send new val", function() ded.NetSetConVar( ilya.cfg.vars["Net Convar"] ,ilya.CustomCvarVal( 1 ) ) end, p )
end

ilya.FCVAR = {
    str = {
        "Archive", "Archive XBOX", "Cheat", "Client can execute", "Client DLL", "Demo", "Dont record",
        "Game DLL", "Lua client", "Lua server", "Never as string", "None", "Notify", "Not connected",
        "Printable only", "Protected", "Replicated", "Server cannot query", "Server can execute",
        "Sponly", "Unlogged", "Unregistered", "Userinfo"
    },
    int = {
        128, 16777216, 16384, 1073741824, 8, 65536, 131072, 4, 262144, 524288, 4096, 0, 256, 4194304,
        1024, 32, 8192, 536870912, 268435456, 64, 2048, 1, 512
    }
}

ilya.spfuncs[87] = function()
    ilya.ui.SettingsPan:SetSize(180,200)

    ilya.ui.CheckBox( ilya.ui.SettingsPan, "Bhop safe", "Bhop safe" )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Stop bhop in step", "Bhop safe duplex", 1, 10, 0 )
end

ilya.spfuncs[23333] = function()
    ilya.ui.SettingsPan:SetSize(280,180)

    ilya.ui.ComboBox( ilya.ui.SettingsPan, "Type", "crosshair_type", ilya.crosshairTypes)
    ilya.ui.Slider( ilya.ui.SettingsPan, "Scale", "uber_alles_scale", 1, 50, 0 )
    ilya.ui.Slider( ilya.ui.SettingsPan, "Speed", "uber_alles_speed", 1, 500, 0 )
    ilya.ui.Label( ilya.ui.SettingsPan, "Crosshair Color", function( p ) ilya.ui.ColorPicker( "crosshair_color", p ) end )
    ilya.ui.Label( ilya.ui.SettingsPan, "Crosshair Outline", function( p ) ilya.ui.ColorPicker( "crosshair_outline", p ) end )
end



ilya.spfuncs[29] = function( p )
    ilya.ui.TextEntry( "Enter cvar name", "Cvar name", p, 500 )
    ilya.ui.Slider( p, "Custom number", "Cvar int", 1, 1000, 2 )
    ilya.ui.TextEntry( "Custom string", "Cvar str", p, 500 )

    ilya.ui.ComboBox( p, "Cvar mode", "Cvar mode", {"String","Int","Float"})

    ilya.ui.Button( "Change cvar", function()
        local s = ilya.CustomCvarVal( 0 )
        local n = ilya.cfg.vars["Cvar name"]

        local flag = GetConVar(n):GetFlags()

        ded.CVarSetFlags( n, 0 )

        gRunCmd( n, s )

        ded.CVarSetFlags( n, flag )
    end, p )

    ilya.ui.ComboBox( p, "Cvar flag", "Cvar flag", ilya.FCVAR.str)

    ilya.ui.Button( "Change flag", function()
        ded.CVarSetFlags( ilya.cfg.vars["Cvar name"], ilya.FCVAR.int[ ilya.cfg.vars["Cvar flag"] ] )
        print( ilya.cfg.vars["Cvar name"], ilya.FCVAR.int[ ilya.cfg.vars["Cvar flag"] ] )
    end, p )

end

function ilya.tabs.Misc()

    local function func( p )
        ilya.ui.MTButton( p, "Cvar", ilya.spfuncs[29] )
        ilya.ui.MTButton( p, "Net cvar", ilya.spfuncs[28] )
        ilya.ui.MTButton( p, "Net", ilya.spfuncs[27] )
    end

    local p = ilya.itemPanel("Movement",1,350):GetItemPanel()

    ilya.ui.CheckBox( p, "Bunny hop", "Bhop", false, false, false, ilya.spfuncs[87] )
    ilya.ui.CheckBox( p, "Air strafer", "Air strafer", false, false, false, ilya.spfuncs[25] )
    ilya.ui.CheckBox( p, "Circle strafe", "Circle strafe", false, true, false, ilya.spfuncs[26] )
    ilya.ui.CheckBox( p, "Keep sprint", "Sprint" )
    ilya.ui.CheckBox( p, "Abuse sprint", "Bug Sprint" )
    ilya.ui.CheckBox( p, "Fast stop", "Fast stop" )
    ilya.ui.CheckBox( p, "Auto peak", "Auto peak", false, true )
    ilya.ui.CheckBox( p, "Auto teleport back", "Auto peak tp" )
    ilya.ui.CheckBox( p, "Water walk", "Water jump" )
    ilya.ui.CheckBox( p, "FixMovement", "FixMovement" )
    ilya.ui.CheckBox( p, "SlowWalk", "Slow Walk", false, true )
    ilya.ui.Slider( p, "SlowWalk speed", "Slow Walk speed", 0,10,0 )

    local p = ilya.itemPanel("Key spam",1,200):GetItemPanel()

    ilya.ui.CheckBox( p, "Use spam", "Use spam" )
    ilya.ui.CheckBox( p, "Flashlight spam", "Flashlight spam" )
    ilya.ui.CheckBox( p, "Auto GTA", "Auto GTA" )
    ilya.ui.CheckBox( p, "Camera spam", "Camera spam" )
    ilya.ui.CheckBox( p, "Vape spam", "Vape spam" )
    //ilya.ui.CheckBox( p, "Door ебалка", "DoorZaeba" )
    //ilya.ui.CheckBox( p, "Anim bug", "AnimBug" )



    ilya.ui.CheckBox( p, "ModelChanger player", "Modelchanger" )
    ilya.ui.ComboBox( p, "ModelChanger model", "Modelchanger model", {"charple","Bomj(ilya)","gman","Wolter", "Skadi", "Ment", "TT"} )


    local p = ilya.itemPanel("Chat spam",2,250):GetItemPanel()

    ilya.ui.CheckBox( p, "Killsay", "Killsay" )
    ilya.ui.ComboBox( p, "Mode", "Killsay mode", { "Лучшее 22-23", "Унижалка English", "Школа хвх", "AI унижалка", "School HVH" })
    ilya.ui.CheckBox( p, "ChatSpam", "Chatspam" )
    ilya.ui.ComboBox( p, "ChatSpam Mode", "Chatspam mode", {"Пенис деда","Пенис деда 2","Arabic","Turkish","Cursed","Extra fucked","Brawls stars XXX"})
    ilya.ui.Slider( p, "ChatSpam timer", "Chatspam timer", 0,10,0 )

    //ilya.ui.ComboBox( p, "Spam mode", {"Русский сборник сказок","Rage","Multidir"}, "Spam mode")

    ilya.itemPanelB( "Net / Cvar", 3, 345, func )

    local p = ilya.itemPanel( "Animation breaker", 2, 235 ):GetItemPanel()

    ilya.ui.CheckBox( p, "Taunt spam", "Taunt spam" )
    ilya.ui.ComboBox( p, "Taunt", "Taunt", ilya.actCommands )
    ilya.ui.ComboBox( p, "Taunt", "Taunt", ilya.actCommands )
    ilya.ui.CheckBox( p, "Handjob", "Handjob" )
    ilya.ui.ComboBox( p, "Handjob mode", "Handjob mode", {"Up","Parkinson","Ultra cum"} )

    local p = ilya.itemPanel("Memes",3,300):GetItemPanel()

    ilya.ui.CheckBox( p, "Admin Detect Grust", "admin_detect" )
    ilya.ui.CheckBox( p, "Admin Detect Grust 2", "admin detect new" )
    ilya.ui.CheckBox( p, "Ghost follower", "Ghost follower" )
    ilya.ui.TextEntry( "Targets ID", "GFID", p, 500 )
    ilya.ui.CheckBox( p, "Auto Затяг ( Vape )", "Auto Vape" )
    ilya.ui.CheckBox( p, "Fast lockpick", "Fast lockpick" )

   /*
        ilya.checkbox("Safe hop","Safe hop",p:GetItemPanel())
        ilya.checkbox("Edge jump","Edge jump",p:GetItemPanel())
        ilya.checkbox("Air duck","Air duck",p:GetItemPanel())
    */
end


function ilya.updateMenuColor( col )
    local r, g, b = col.r, col.g, col.b

    for i = 1,255 do
        ilya.Colors[i] = Color( i + r, i + g, i + b, 255 )
    end
end



function ilya.tabs.Settings()
    local p = ilya.itemPanel("Config",1,400):GetItemPanel()

    ilya.ui.TextEntry( "Config name", "Config name", p, 64 )

    ilya.ui.ComboBox( p, "Config", "Selected config", ilya.configs)

    ilya.ui.Button( "Save config", function() ilya.SaveConfig() end, p )
    ilya.ui.Button( "Load config", function() ilya.LoadConfig() end, p )



    ilya.ui.Label( p, "Menu color", function( p ) ilya.ui.ColorPicker( "Menu color", p, ilya.updateMenuColor ) end )
    ilya.ui.Label( p, "Unhook cheat", function( p ) ilya.ui.Binder( "Unhook cheat", p ) end )
end

function ilya.tabs.Players()
    local playerlist = vgui.Create( "UListView", ilya.scrollpanel )
    playerlist:SetPos( 5, 5 )
    playerlist:SetSize( 500, 775 )
    playerlist:SetMultiSelect( false )
    playerlist:AddColumn( "Name" )
    playerlist:AddColumn( "SID" )
    playerlist:AddColumn( "SID64" )
    playerlist:AddColumn( "Team" )
    playerlist:AddColumn( "Group" )
    playerlist:AddColumn( "Friend?" )

    local plys = player_GetAll()

    for i = 1, #plys do
        local item = playerlist:AddLine( plys[ i ]:Name(), plys[ i ]:SteamID(), plys[ i ]:SteamID64(), team_GetName( plys[ i ]:Team() ), plys[ i ]:GetUserGroup(), ilya.cfg.friends[plys[ i ]:SteamID64()] and 'true' or 'false' )

        function item:OnRightClick()
            if ilya.cfg.friends[plys[ i ]:SteamID64()] then
                ilya.cfg.friends[plys[ i ]:SteamID64()] = nil
            else
                ilya.cfg.friends[plys[ i ]:SteamID64()] = true
            end

            item:SetColumnText( 6, ilya.cfg.friends[plys[ i ]:SteamID64()] and 'true' or 'false' )
        end
    end

end

ilya.ttable = {}

ilya.ttable["Aimbot"]   = ilya.tabs.Aimbot
ilya.ttable["Rage"]     = ilya.tabs.Rage
ilya.ttable["Visuals"]  = ilya.tabs.Visuals
ilya.ttable["Misc"]     = ilya.tabs.Misc
ilya.ttable["Settings"] = ilya.tabs.Settings
ilya.ttable["Players"]  = ilya.tabs.Players

function ilya.initTab(tab)
    if ilya.scrollpanel != nil then ilya.scrollpanel:Remove() end

    ilya.scrollpanel = vgui_Create("UScroll",ilya.frame)

    ilya.pty = { 5, 5, 5 }
    // ilya.ESPPP:Hide()
    ilya.ttable[tostring(tab)]()
end

function ilya.tabButton(tab,par)
    surface_SetFont("tbfont")
    local w, h = surface_GetTextSize(tab)

    local fw = w + 93

    local tx, ty = fw/2 - w/2, 25/2-h/2 - 1

    local b = par:Add("DButton")
    b:Dock(LEFT)
    b:DockMargin(2,0,2,1)
    b:SetWide(fw)
    b:SetText("")

    function b:DoClick()
        ilya.activetab = tab
        ilya.initTab(tab)
    end

    function b:Paint(width,height)
        if ilya.activetab == tab or self:OnDepressed() then
            surface_SetDrawColor(ilya.Colors[54])
            surface_SetTextColor(245,245,245,255)
        elseif self:IsHovered() then
            surface_SetDrawColor(ilya.Colors[40])
            surface_SetTextColor(225,225,225,255)
        else
            surface_SetDrawColor(ilya.Colors[30])
            surface_SetTextColor(200,200,200,255)
        end

        surface_DrawRect(0,0,width,height)

        surface_SetFont("tbfont")
        surface_SetTextPos(tx,ty)
        surface_DrawText(tab)
    end
end

ilya.tabButton( "Aimbot",        ilya.frame:GetTopPanel() )
ilya.tabButton( "Rage",          ilya.frame:GetTopPanel() )
ilya.tabButton( "Visuals",       ilya.frame:GetTopPanel() )
ilya.tabButton( "Misc",          ilya.frame:GetTopPanel() )
ilya.tabButton( "Settings",      ilya.frame:GetTopPanel() )
ilya.tabButton( "Players",       ilya.frame:GetTopPanel() )

ilya.ttable["Aimbot"]()

// Input

function ilya.IsKeyDown( key )
    if key >= 107 then
        return input_IsMouseDown( key )
    end

    return input_IsKeyDown( key )
end

/*
    Create Move start
*/

// cm stuff

ilya.target             = false
ilya.aimingrn           = false

ilya.targetVector       = Vector()
ilya.predictedVector    = Vector()
ilya.backtrackVector    = Vector()
ilya.nullVec            = Vector() * -1

ilya.trailpos           = {}

ilya.SilentAngle        = me:EyeAngles()

ilya.SkipCommand        = false
ilya.SendPacket         = true

ilya.traceStruct        = { mask = MASK_SHOT, filter = me }
ilya.badSweps           = { ["gmod_camera"] = true, ["manhack_welder"] = true, ["weapon_medkit"] = true, ["gmod_tool"] = true, ["weapon_physgun"] = true, ["weapon_physcannon"] = true, ["weapon_bugbait"] = true, }
ilya.badSeqs            = { [ACT_VM_RELOAD] = true, [ACT_VM_RELOAD_SILENCED] = true, [ACT_VM_RELOAD_DEPLOYED] = true, [ACT_VM_RELOAD_IDLE] = true, [ACT_VM_RELOAD_EMPTY] = true, [ACT_VM_RELOADEMPTY] = true, [ACT_VM_RELOAD_M203] = true, [ACT_VM_RELOAD_INSERT] = true, [ACT_VM_RELOAD_INSERT_PULL] = true, [ACT_VM_RELOAD_END] = true, [ACT_VM_RELOAD_END_EMPTY] = true, [ACT_VM_RELOAD_INSERT_EMPTY] = true, [ACT_VM_RELOAD2] = true }
ilya.cones              = {}
ilya.AimCone              = {}
ilya.parsedbones        = {}

ilya.swbNormal          = bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
ilya.swbWall            = bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
ilya.swbPen             = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}
ilya.swbShit            = { ["swb_knife"] = true, ["swb_knife_m"] = true }

ilya.m9kPenetration     = { ["SniperPenetratedRound"] = 20, ["pistol"] = 9, ["357"] = 12, ["smg1"] = 14, ["ar2"] = 16, ["buckshot"] = 5, ["slam"] = 5, ["AirboatGun"] = 17, }
ilya.m9kMaxRicochet     = { ["SniperPenetratedRound"] = 10, ["pistol"] = 2, ["357"] = 5, ["smg1"] = 4, ["ar2"] = 5, ["buckshot"] = 0, ["slam"] = 0, ["AirboatGun"] = 9, }
ilya.m9kCanRicochet     = { ["SniperPenetratedRound"] = true, ["pistol"] = true, ["buckshot"] = true, ["slam"] = true }
ilya.m9kPenMaterial     = { [MAT_GLASS] = true, [MAT_PLASTIC] = true, [MAT_WOOD] = true, [MAT_FLESH] = true, [MAT_ALIENFLESH] = true }

ilya.activeWeapon       = false
ilya.activeWeaponClass  = false
ilya.moveType           = me:GetMoveType()

ilya.myaw               = GetConVar("m_yaw"):GetFloat()

ilya.backtracktick      = 0

function ilya.AutoWall( dir, plyTarget )
	if not ilya.activeWeapon or ilya.swbShit[ ilya.activeWeaponClass ] then return false end

	local eyePos = me:EyePos()

	local function SWBAutowall()

        ilya.traceStruct.start = eyePos
        ilya.traceStruct.endpos = eyePos + dir * ilya.activeWeapon.PenetrativeRange
        ilya.traceStruct.filter = ilya.Piercable
        ilya.traceStruct.mask = ilya.swbNormal

		local tr = TraceLine( ilya.traceStruct )

		if tr.Hit and !tr.HitSky then
			local dot = -dir:Dot(tr.HitNormal)

			if ilya.activeWeapon.CanPenetrate and dot > 0.26 then

                ilya.traceStruct.start = tr.HitPos
                ilya.traceStruct.endpos = tr.HitPos + dir * ilya.activeWeapon.PenStr * ( ilya.swbPen[tr.MatType] or 1 ) * ilya.activeWeapon.PenMod
                ilya.traceStruct.filter = ilya.Piercable
                ilya.traceStruct.mask = ilya.swbWall

				tr = TraceLine( ilya.traceStruct )

                ilya.traceStruct.start = tr.HitPos
                ilya.traceStruct.endpos = tr.HitPos + dir * 0.1
                ilya.traceStruct.filter = ilya.Piercable
                ilya.traceStruct.mask = ilya.swbNormal

				tr = TraceLine( ilya.traceStruct)

				if tr.Hit then return false end

                ilya.traceStruct.start = tr.HitPos
                ilya.traceStruct.endpos = tr.HitPos + dir * 32768
                ilya.traceStruct.filter = ilya.Piercable
                ilya.traceStruct.mask = MASK_SHOT

				tr = TraceLine( ilya.traceStruct )

                if ilya.cfg.vars["Ignores-Head unhitable"] then
                    return tr.Entity == plyTarget and tr.HitGroup == 1
                else
                    return tr.Entity == plyTarget
                end
			end
		end

		return false
	end




    local function TFAAutoWall()

        local sv_tfa_bullet_penetration = GetConVar("sv_tfa_bullet_penetration")
	    local sv_tfa_penetration_hardlimit = GetConVar("sv_tfa_penetration_hardlimit")
	    local sv_tfa_bullet_penetration_power_mul = GetConVar("sv_tfa_bullet_penetration_power_mul")
        local sv_airaccelerate = GetConVar( "sv_airaccelerate" )
        local sv_gravity = GetConVar( "sv_gravity" )
        local sv_sticktoground = GetConVar( "sv_sticktoground" )

        ilya.AutoWall.Functions.tfa = ENV.RegisterFunctionfunction(self, TraceData)
        if not ilya.AutoWall.TFA:GetBool() then
            return nil
        end

        if ilya.cfg.vars["Ignores-Head unhitable"] then
            return tr.Entity == plyTarget and tr.HitGroup == 1
        else
            return tr.Entity == plyTarget
        end

        local ForceMultiplier = self:GetAmmoForceMultiplier()
        local PenetrationMultiplier = self:GetPenetrationMultiplier(TraceData.MatType)
        local ConVarMultiplier = ilya.AutoWall.TFA_Multiplier:GetFloat()
        local DataTable = ilya.AutoWall.Limits[GetWeaponAmmoName(self)]
        local MaxPen = math.Clamp(DataTable and DataTable[2] or 1, 0, ilya.AutoWall.TFA_HardLimit:GetInt())

        return math_Truncate(((ForceMultiplier / PenetrationMultiplier) * ConVarMultiplier) * 0.9, 5), MaxPen

    end


	local function M9KAutowall()
		if !ilya.activeWeapon.Penetration then
			return false
		end

		local function BulletPenetrate( tr, bounceNum, damage )
			if damage < 1 then
				return false
			end

			local maxPenetration    = 14
            local maxRicochet       = 0
            local isRicochet        = false

            if ilya.m9kPenetration[ ilya.activeWeapon.Primary.Ammo ] then
                maxPenetration = ilya.m9kPenetration[ ilya.activeWeapon.Primary.Ammo ]
            end

            if ilya.m9kMaxRicochet[ ilya.activeWeapon.Primary.Ammo ] then
                maxRicochet = ilya.m9kMaxRicochet[ ilya.activeWeapon.Primary.Ammo ]
            end

            if ilya.m9kCanRicochet[ ilya.activeWeapon.Primary.Ammo ] then
                isRicochet = ilya.m9kMaxRicochet[ ilya.activeWeapon.Primary.Ammo ]
            end

			if tr.MatType == MAT_METAL and isRicochet and ilya.activeWeapon.Primary.Ammo != "SniperPenetratedRound" then
				return false
			end

			if bounceNum > maxRicochet then
				return false
			end

			local penetrationDir = tr.Normal * maxPenetration

			if ilya.m9kPenMaterial[ tr.MatType ] then
				penetrationDir = tr.Normal * ( maxPenetration * 2 )
			end

			if tr.Fraction <= 0 then
				return false
			end

			ilya.traceStruct.endpos    = tr.HitPos
			ilya.traceStruct.start     = tr.HitPos + penetrationDir
			ilya.traceStruct.mask      = MASK_SHOT
			ilya.traceStruct.filter    = ilya.Piercable

			local trace = TraceLine( ilya.traceStruct )

			if trace.StartSolid or trace.Fraction >= 1 then
				return false
			end

			ilya.traceStruct.endpos = trace.HitPos + tr.Normal * 32768
			ilya.traceStruct.start  = trace.HitPos
			ilya.traceStruct.mask   = MASK_SHOT
			ilya.traceStruct.filter = ilya.Piercable

			local penTrace = TraceLine( ilya.traceStruct )

            if ilya.cfg.vars["Ignores-Head unhitable"] then
                return penTrace.Entity == plyTarget and penTrace.HitGroup == 1
            else
                return penTrace.Entity == plyTarget
            end

			local damageMulti = 0.5
			if ilya.activeWeapon.Primary.Ammo == "SniperPenetratedRound" then
				damageMulti = 1
			elseif tr.MatType == MAT_CONCRETE or tr.MatType == MAT_METAL then
				damageMulti = 0.3
			elseif tr.MatType == MAT_WOOD or tr.MatType == MAT_PLASTIC or tr.MatType == MAT_GLASS then
				damageMulti = 0.8
			elseif tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH then
				damageMulti = 0.9
			end

			if penTrace.MatType == MAT_GLASS then
				bounceNum = bounceNum - 1
			end

			return BulletPenetrate( penTrace, bounceNum + 1, damage * damageMulti )
		end

        ilya.traceStruct.start = eyePos
        ilya.traceStruct.endpos = eyePos + dir * 32768
        ilya.traceStruct.filter = ilya.Piercable
        ilya.traceStruct.mask = MASK_SHOT

		local trace = TraceLine( ilya.traceStruct )

		return BulletPenetrate( trace, 0, ilya.activeWeapon.Primary.Damage )
	end

    if StartsWith( ilya.activeWeaponClass, "m9k_" ) then
		return M9KAutowall()
	elseif StartsWith( ilya.activeWeaponClass, "swb_" ) then
		return SWBAutowall()
	elseif StartsWith( ilya.activeWeaponClass, "tfa_" ) then
		return TFAAutowall()

    end


	return false
end



function ilya.SetEntAngles(ent,angles)
    ent:SetRenderAngles(angles)
    ent:SetNetworkAngles(angles)
    ent:InvalidateBoneCache()
end

ilya.Piercable = ents.FindByClass( "func_breakable" )
table.insert( ilya.Piercable, me )


function ilya.VisibleCheck( who, where, predticks, awalldir )
    local start = me:EyePos()

    if predticks then start = start + ( me:GetVelocity() * TickInterval ) * predticks end

    ilya.traceStruct.start = start
	ilya.traceStruct.endpos = where
	ilya.traceStruct.mask = MASK_SHOT
    ilya.traceStruct.filter = ilya.Piercable

    local tr = TraceLine( ilya.traceStruct )

    if tr.Entity:IsValid() and tr.Entity:GetClass() == "func_breakable" and not table.HasValue( ilya.Piercable, tr.Entity ) then
        table.insert( ilya.Piercable, tr.Entity )
    end

    local canhit = tr.Entity == who or tr.Fraction == 1

    if !canhit and awalldir and ilya.cfg.vars["Wallz"] then
        return ilya.AutoWall( awalldir, who )
    end

    if ilya.cfg.vars["Ignores-Head unhitable"] and tr.HitGroup != 1 then return false end

    return canhit
end

function ilya.CanShoot( cmd )
	if not ilya.activeWeapon then return false end
	local seq = ilya.activeWeapon:GetSequence()

    if ilya.cfg.binds["Aim on key"] != 0 and not ilya.IsKeyDown( ilya.cfg.binds["Aim on key"] ) then
        return false
    end

	if ilya.badSweps[ ilya.activeWeaponClass ] then
		return false
	end

    local delay = 0
	if ilya.cfg.vars["ShootDelay"] then
		delay = ilya.cfg.vars["ShootDelay time"] / 1000

        return ( ded.GetServerTime(cmd) - delay ) >= ilya.activeWeapon:GetNextPrimaryFire()

    end

    if ilya.moveType == MOVETYPE_NOCLIP then
        return false
    end

    if ilya.cfg.vars["Auto fire"] and cmd:KeyDown(IN_ATTACK) then
        return false
    end

	if ilya.cfg.vars["Bullet time"] and ilya.activeWeapon:GetNextPrimaryFire() >= ded.GetServerTime(cmd) then
		return false
	end

    if ilya.cfg.vars["Server time"] and ilya.activeWeapon:GetNextPrimaryFire() >= ilya.servertime then
		return false
	end

    // print(ded.GetRandomSeed( cmd ))
    if ilya.cfg.vars["Wait for seed"] and ded.GetRandomSeed( cmd ) then
        return false
    end

	return ilya.activeWeapon:Clip1() != 0 and !ilya.badSeqs[ seq ]
end

function ilya.Spread( cmd, ang, spread )
    if not ilya.activeWeapon or not ilya.cones[ ilya.activeWeaponClass ] then return ang end

	local dir = ded.PredictSpread( cmd, ang, spread )

	local newangle = ang + dir:Angle()
	newangle:Normalize()


	return newangle
end

/*
    Nospread
*/

ilya.CustomSpread = {}

function ilya.CustomSpread.swb( cmd, ang )
    /*
    local vel = me:GetVelocity():Length()
    local dir = ang:Forward()

    if !me.LastView then
        me.LastView = dir
        me.ViewAff = 0
    else
        me.ViewAff = Lerp( 0.25, me.ViewAff, ( dir - me.LastView ):Length() * 0.5 )
    end

    if ilya.activeWeapon.dt and ilya.activeWeapon.meSpread and ilya.activeWeapon.dt.State == SWB_AIMING then
        ilya.activeWeapon.BaseCone = ilya.activeWeapon.meSpread

        if ilya.activeWeapon.Owner.Expertise then
            ilya.activeWeapon.BaseCone = ilya.activeWeapon.BaseCone * ( 1 - ilya.activeWeapon.Owner.Expertise["steadyme"].val * 0.0015 )
        end
    else
        ilya.activeWeapon.BaseCone = ilya.activeWeapon.HipSpread

        if ilya.activeWeapon.Owner.Expertise then
            ilya.activeWeapon.BaseCone = ilya.activeWeapon.BaseCone * ( 1 - ilya.activeWeapon.Owner.Expertise["wepprof"].val * 0.0015 )
        end
    end

    if me:Crouching() then
        ilya.activeWeapon.BaseCone = ilya.activeWeapon.BaseCone * ( ilya.activeWeapon.dt.State == SWB_AIMING and 0.9 or 0.75 )
    end

    ilya.activeWeapon.CurCone = math_Clamp( ilya.activeWeapon.BaseCone + ilya.activeWeapon.AddSpread + ( vel / 10000 * ilya.activeWeapon.VelocitySensitivity ) * ( ilya.activeWeapon.dt.State == SWB_AIMING and ilya.activeWeapon.meMobilitySpreadMod or 1 ) + me.ViewAff, 0, 0.09 + ilya.activeWeapon.MaxSpreadInc )

    if CurTime() > ilya.activeWeapon.SpreadWait then
        ilya.activeWeapon.AddSpread = math_Clamp( ilya.activeWeapon.AddSpread - 0.005 * ilya.activeWeapon.AddSpreadSpeed, 0, ilya.activeWeapon.MaxSpreadInc )
        ilya.activeWeapon.AddSpreadSpeed = math_Clamp( ilya.activeWeapon.AddSpreadSpeed + 0.05, 0, 1 )
    end
    */

    local cone = ilya.activeWeapon.CurCone
    if !cone then return ang end

    if me:Crouching() then
        cone = cone * 0.85
    end

    math_randomseed( cmd:CommandNumber() )
    return ang - Angle( math_Rand(-cone, cone), math_Rand(-cone, cone), 0 ) * 25
end

function ilya.CustomSpread.cw( cmd, ang )
    local cone = ilya.activeWeapon.CurCone
    if !cone then return ang end

    math_randomseed( cmd:CommandNumber() )
    return ang - Angle( math_Rand(-cone, cone), math_Rand(-cone, cone), 0 ) * 25
end

function ilya.CustomSpread.fas2( cmd, ang )
    math_randomseed( CurTime() )

    local dir = Angle( math_Rand( -ilya.activeWeapon.CurCone, ilya.activeWeapon.CurCone ), math_Rand( -ilya.activeWeapon.CurCone, ilya.activeWeapon.CurCone ), 0 ) * 25
    local dir2 = dir

    if ilya.activeWeapon.ClumpSpread and ilya.activeWeapon.ClumpSpread > 0 then
        dir2 = dir + Vector( math_Rand(-1, 1), math_Rand(-1, 1), math_Rand(-1, 1)) * ilya.activeWeapon.ClumpSpread
    end

    return ang - dir2
end

local lastRandomSeed = 0
local lastSpreadCompensation = Angle(0, 0, 0)

-- Клиентский ноуспред
function ilya.CustomSpread.rust(cmd, ang)
    if not IsValid(ilya.activeWeapon) then return ang end
    if ilya.activeWeaponClass == "rust_huntingbow" then return ang end

    local weapon = ilya.activeWeapon
    local cone = weapon.AimCone or 0.2

    -- Учёт прицеливания
    if weapon.IronSightsDelta > 0.1 then
        cone = Lerp(weapon.IronSightsDelta, cone, cone * 0.05)
    end

    -- Генерация предсказуемого разброса
    math.randomseed(cmd:CommandNumber())
    lastRandomSeed = cmd:CommandNumber()

    local spread = Vector(cone, cone, 0) * 16
    lastSpreadCompensation = Angle(
        math.Rand(-spread.x, spread.x),
        math.Rand(-spread.y, spread.y),
        0
    )

    return ang - lastSpreadCompensation
end


/*function ilya.CustomSpread.CSS( cmd, ang )
    math_randomseed( CurTime() )

    local dir = Angle( math_Rand( -ilya.activeWeapon.CurCone, ilya.activeWeapon.CurCone ), math_Rand( -ilya.activeWeapon.CurCone, ilya.activeWeapon.CurCone ), 0 ) * 25
    local dir2 = dir

    if ilya.activeWeapon.ClumpSpread and ilya.activeWeapon.ClumpSpread > 0 then
        dir2 = dir + Vector( math_Rand(-1, 1), math_Rand(-1, 1), math_Rand(-1, 1)) * ilya.activeWeapon.ClumpSpread
    end

    return ang - dir2

end*/

local cssweapon = { "weapon_ak47", "weapon_m4a1","weapon_awp","weapon_aug","weapon_deagle","weapon_elite","weapon_famas","weapon_fiveseven","weapon_g3sg1","weapon_galil","weapon_glock","weapon_m249","weapon_m3","weapon_mac10","weapon_mp5navy","weapon_p228","weapon_p90","weapon_scout","weapon_sg550","weapon_sg552","weapon_tmp","weapon_ump45","weapon_usp","weapon_xm1014" }

ilya.SpreadComps = {noworking}

ilya.SpreadComps["swb"]     = ilya.CustomSpread.swb
ilya.SpreadComps["cw"]      = ilya.CustomSpread.cw
ilya.SpreadComps["fas2"]    = ilya.CustomSpread.fas2
ilya.SpreadComps["rust"]     = ilya.CustomSpread.rust
/*for i = 1, #cssweapon do
    ilya.SpreadComps[cssweapon[ i ]]     = ilya.CustomSpread.CSS
end*/



function ilya.NoSpread(cmd, ang)
    if not ilya.activeWeapon or ilya.swbShit[ ilya.activeWeaponClass ] then return ang end
    local base = string.Split( ilya.activeWeaponClass, "_" )[ 1 ]

    if ilya.SpreadComps[ base ] then
        ang = ilya.SpreadComps[ base ]( cmd, ang )
    elseif ilya.cones[ ilya.activeWeaponClass ] then
        local spread = ilya.cones[ ilya.activeWeaponClass ]
        return ilya.Spread( cmd, ang, spread )
    //elseif ilya.SpreadComps[ basecss ] then
       //ang = ilya.SpreadComps[ basecss ]( cmd, ang )
    end

    return ang
end

ilya.notyui = {
    ["rust_assaultrifle"] = true,
    ["rust_hands"] = true,
    ["rust_huntingbow"] = true,
    ["rust_mp5"] = true,
    ["rust_sar"] = true,
    ["rust_nailgun"] = true,
    ["weapon_crossbow"] = true,
    ["rust_smg"] = true,
    ["rust_thompson"] = true,
    ["rust_sap"] = true,
    ["rust_python"] = true,
    ["rust_lr300"] = true,
    ["rust_m249"] = true,
    ["rust_m39"] = true,
    ["rust_m92"] = true,
    ["rust_revolver"] = true,
    ["rust_crossbow"] = true,
}

ilya.yui = {
    ["rust_pumpshotgun"] = true,
    ["rust_dbarrel"] = true,
    ["rust_spas12"] = true,
    ["rust_waterpipe"] = true,
    ["rust_shotgun"] = true,
}

function ilya.NoRecoil( ang )
    if StartsWith( ilya.activeWeaponClass,"m9k_" ) or StartsWith( ilya.activeWeaponClass,"bb_" ) or StartsWith( ilya.activeWeaponClass,"unclen8_" ) or ilya.activeWeaponClass == "weapon_pistol" then
        return ang
    else
        ang = ang - me:GetViewPunchAngles()
    end
    return ang
end

/*function ilya.gRustNoRecoil( ang )
    ang = ang - me:GetViewPunchAngles()
    return ang
end*/


/*
ilya.ui.ComboBox( p, "Hitscan mode", { "Damage", "Safety", "Scale" }, "Hitscan mode" )

*/

function ilya.ParseBones( ply, bone )
    local mdl = ply:GetModel()

    if ilya.parsedbones[ mdl ] and ilya.parsedbones[ mdl ][ bone ] then
        return ilya.parsedbones[ mdl ][ bone ]
    end

    if not ilya.parsedbones[ mdl ] then
        ilya.parsedbones[ mdl ] = {}
    end

    local set = ply:GetHitboxSet()
    local bonecount = ply:GetBoneCount()

    for i = 0, bonecount - 1 do
		local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

		if bone == group then
			ilya.parsedbones[ mdl ][ bone ] = i

            return i
        end
	end

    for i = 0, bonecount - 1 do
        local group = ply:GetHitBoxHitGroup( i, set )

        if group == nil then continue end

        if bone > 1 and group == 0 then
            ilya.parsedbones[ mdl ][ bone ] = i

            return i
        end
    end

    return 0
end

function ilya.MultipointGroupCheck( group )
    if group == 1 and not ilya.cfg.vars["Multipoint groups-Head"] then return false end
    if group == 2 and not ilya.cfg.vars["Multipoint groups-Chest"] then return false end
    if group == 3 and not ilya.cfg.vars["Multipoint groups-Stomach"] then return false end
    if group == 4 or group == 5 and not ilya.cfg.vars["Multipoint groups-Arms"] then return false end
    if group == 6 or group == 7 and not ilya.cfg.vars["Multipoint groups-Legs"] then return false end
    if group == 0 and not ilya.cfg.vars["Multipoint groups-Generic"] then return false end

    return true
end

/*function GetBoneRanking( ply,tbl,bone )
    local boneName = ply:GetBoneName(bone)
	local rankingCache = boneRankingCache[tbl]


    if rankingCache[boneName] then
		return rankingCache[boneName]
	end

	for i = 1, #tbl do
		local name = tbl[i]
		if boneName:find(name, 1, true) then
			rankingCache[boneName] = i
			return i
		end
	end

	return 1000
end*/

local x = true
local y = true

function ilya.GetBones( ply )
    local scale = ilya.cfg.vars["Multipoint scale"]
    local pos = ply:LocalToWorld( ply:OBBCenter() )
    local set = ply:GetHitboxSet()

    if ilya.cfg.vars["Hitscan"] then
        local set = ply:GetHitboxSet()
        local bonecount = ply:GetBoneCount()

        pos = {}

        for i = 0, bonecount - 1 do
            local group = ply:GetHitBoxHitGroup( i, set )

            if group == nil then continue end

            if group == 1 and not ilya.cfg.vars["Hitscan groups-Head"] then continue end
            if group == 2 and not ilya.cfg.vars["Hitscan groups-Chest"] then continue end
            if group == 3 and not ilya.cfg.vars["Hitscan groups-Stomach"] then continue end
            if group == 4 or group == 5 and not ilya.cfg.vars["Hitscan groups-Arms"] then continue end
            if group == 6 or group == 7 and not ilya.cfg.vars["Hitscan groups-Legs"] then continue end
            if group == 0 and not ilya.cfg.vars["Hitscan groups-Generic"] then continue end

            pos[ #pos + 1 ] = { bone = i, hitgroup = group }

            /*local hitScanMode = ilya.cfg.vars["Hitscan Mode"]
            if hitScanMode == 1 then
                table_sort( bone, function(a, b)
                    local rankA = GetBoneRanking(ply, damageRanking, a[1])
                    local rankB = GetBoneRanking(ply, damageRanking, b[1])

                    return rankA < rankB
                end)
            elseif hitScanMode == 2 then
                table_sort( bone, function(a, b)
                    return a[3] > b[3]
                end)
            elseif hitScanMode == 3 then
                table_sort( bone, function(a, b)
                    local rankA = GetBoneRanking(ply, safetyRanking, a[1])
                    local rankB = GetBoneRanking(ply, safetyRanking, b[1])

                    return rankA < rankB
                end)
            end*/

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

            if ilya.cfg.vars["Multipoint"] and ilya.MultipointGroupCheck( pos[ i ].hitgroup ) then
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

                for i = 1, #points do
                    points[ i ]:Rotate( ang )
                    points[ i ] = points[ i ] + bonepos

                    if i == 1 then continue end

                    points[ i ] = ( ( points[ i ] - points[1] ) * scale ) + points[ 1 ]
                    valid[ #valid + 1 ] = points[ i ]
                end
            end

            mins:Rotate( ang )
            maxs:Rotate( ang )

            valid[ #valid + 1 ] = bonepos + ( ( mins + maxs ) * 0.5 )
        end

        return valid
    else

        local bone = ilya.ParseBones( ply, ilya.cfg.vars["Hitbox selection"] )

        local hitboxbone = ply:GetHitBoxBone( bone, set )

        if hitboxbone == nil then
            return { pos }
        end

        local mins, maxs = ply:GetHitBoxBounds( bone, set )

        if not mins or not maxs then
            return { pos }
        end

        local bonepos, ang = ply:GetBonePosition( hitboxbone )

        if ilya.cfg.vars["Multipoint"] then
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

            for i = 1, #points do
                points[ i ]:Rotate( ang )
                points[ i ] = points[ i ] + bonepos

                if i == 1 then continue end

                points[ i ] = ( ( points[ i ] - points[1] ) * scale ) + points[ 1 ]
            end

            return points
        else
            mins:Rotate( ang )
            maxs:Rotate( ang )

            pos = bonepos + ( ( mins + maxs ) * 0.5 )
        end
    end

    return { pos }
end

function ilya.GetSortedPlayers( mode, selfpred, plypred, vischeck )
    local players   = player_GetAll()
    local eyepos    = me:EyePos()
    local valid     = {}                // sorted lady and gentleman goes here ( niggers and faggots goes to hell )

	if selfpred then
		eyepos = eyepos + (me:GetVelocity() * TickInterval) * selfpred
	end

    for i = 1, #players do
        local v = players[i]

        if v == me then continue end
        if not v:Alive() or v:IsDormant() then continue end
        if ilya.cfg.vars["Ignores-Bots"] and v:IsBot() then continue end
        if ilya.cfg.vars["Ignores-Friends"] and ilya.cfg.friends[v:SteamID64()] then continue end
        if ilya.cfg.vars["Ignores-Steam friends"] and v:GetFriendStatus() == "friend" then continue end
        if ilya.cfg.vars["Ignores-Admins"] and v:IsAdmin() then continue end
        if ilya.cfg.vars["Ignores-Frozen"] and v:IsFlagSet( FL_FROZEN ) then continue end
        if ilya.cfg.vars["Ignores-Nodraw"] and v:IsEffectActive( EF_NODRAW ) then continue end
        if ilya.cfg.vars["Ignores-God time"] and v:GetColor().a < 255 then continue end
        if ilya.cfg.vars["Ignores-Driver"] and v:InVehicle() then continue end
        if ilya.cfg.vars["Ignores-Break LC"] and v.break_lc then continue end
        if st == TEAM_SPECTATOR or ilya.cfg.vars["Ignores-Teammates"] and st == v:Team() then continue end
        if ilya.cfg.vars["Ignores-Nocliping"] and v:IsEFlagSet(EFL_NOCLIP_ACTIVE) then continue end

        if ilya.cfg.vars["admin_detect"] then
            if v:SteamID64() == "76561198293925967" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561199276141767" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: travka | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561198307391005" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561199101866406" and v:SteamID64() == "76561198827382515" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: pivo | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561199548703904" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: TuPiDAn | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561198966084690" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: USA | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561198124074227" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: ньюген какойта | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
            /*if v:SteamID64() == "76561198135631170" then --на всякий случай
                //gRunCmd("disconnect")
                //print("Тебя кикнуло потому что включен админ обнаруживатель")
                //print("основной нейм: Smile | стим айди:",v:SteamID64())
                //print("псведоним админа:",v:Name())
            end*/
            if v:SteamID64() == "76561199305487923" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: george | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561199082487641" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: ВладикНН | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561199222590247" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: KareemYT | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561199419032817" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: Blank | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561198078979803" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: Drelay | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
            if v:SteamID64() == "76561198453470054" then
                gRunCmd("disconnect")
                print("Тебя кикнуло потому что включен админ обнаруживатель")
                print("основной нейм: Fox`si | стим айди:",v:SteamID64())
                print("псведоним админа:",v:Name())
            end
        end
        /*if ilya.cfg.vars["admin detect new"] then
            if rank_GetName( v:Rank() ) and v:SteamID64() == (rank) then
                gRunCmd("disconnect")
            end
        end*/

        if vischeck then
			local bone = ilya.GetBones( v )[1]
			local dir = me:GetShootPos() - bone
			dir:Normalize()

			if !ilya.VisibleCheck( v, bone, selfpred, dir ) then
				continue
			end
		end

        local pos = v:GetPos()
        if plypred then
            pos = pos + (v:GetVelocity() * TickInterval) * plypred
        end

        valid[#valid+1] = { v, pos }
    end

    if mode == 1 then
        table_sort(valid, function( a, b )
           return ( a[2] - eyepos ):LengthSqr() < ( b[2] - eyepos ):LengthSqr()
        end)
    elseif mode == 2 then
        table_sort(valid, function( a, b )
            local aScr, bScr = a[2]:ToScreen(), b[2]:ToScreen()

            local aDist
            do
                local dx = scrwc - aScr.x
                local dy = scrhc - aScr.y
                aDist = dx * dx + dy * dy
            end

            local bDist
            do
                local dx = scrwc - bScr.x
                local dy = scrhc - bScr.y
                bDist = dx * dx + dy * dy
            end

            return aDist < bDist
        end)
    /*elseif mode == 3 then
        table_sort(valid, function( a, b )
            return ( a[2] + eyepos ):LengthSqr() > ( b[2] + eyepos ):LengthSqr()
        end)

    elseif mode == 4 then
        table_sort(valid, function( a, b )
            local aScr, bScr = a[2]:ToScreen(), b[2]:ToScreen()

            local aDist
            do
                local dx = scrwc - aScr.x
                local dy = scrhc - aScr.y
                aDist = dx * dx - dy * dy
            end

            local bDist
            do
                local dx = scrwc - bScr.x
                local dy = scrhc - bScr.y
                bDist = dx * dx - dy * dy
            end

            return aDist > bDist
        end)*/
    elseif mode == 5 then
     return

    end

    if #valid == 0 then return end

    return valid

end

function ilya.IsTickHittable( ply, cmd, tick )
    if ded.GetLatency(0) > 1 then return false end

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - ilya.btrecords[ ply ][ tick ].simulationtime

    if diff > ilya.cfg.vars["Backtrack time"] / 1000 then return false end

    return true
end

function ilya.FindBacktrack( cmd, ply )
    local ticks = #ilya.btrecords[ ply ]
    local canhit = {}

    for i = 1, ticks do
        if ilya.IsTickHittable( ply, cmd, i ) then
            canhit[ #canhit + 1 ] = i
        end
    end

    return canhit
end

function ilya.FindFirstHittableTicks( ply, cmd )
    local tickcount = #ilya.btrecords[ ply ]

    if !tickcount then return 1 end

    for i = 1, tickcount do
        if ilya.IsTickHittable( ply, cmd, i ) then
            return i
        end
    end
end

do
    local lastdist, lasttick = 1337, 1

    function ilya.FindClosestHittableTicks( ply, cmd )
        local mypos = me:EyePos()
        local records = ilya.btrecords[ ply ]
        local firstticks = ilya.FindFirstHittableTicks( ply, cmd )
        local tickcount = #records

        if !tickcount or !firstticks then return 1 end

        lastdist = math_huge

        for i = 1, tickcount - firstticks do
            local mt = i + firstticks

            if ( records[ mt ].aimpos ):DistToSqr( mypos ) < lastdist then
                lastdist = ( records[ mt ].aimpos ):DistToSqr( mypos )
                lasttick = mt
            end
        end

        return lasttick
    end
end

function ilya.SelectTarget( cmd )
    local plys = ilya.GetSortedPlayers( ilya.cfg.vars["Target selection"] )
    ilya.target     = false


    if !plys then return end

    local maxplys       = ilya.cfg.vars["Max targets"]
    local curplys       = #plys

    if maxplys != 0 and curplys > maxplys then
        curplys = maxplys
    end

    local aimAngle
    for i = 1, curplys do
		local ply = plys[i][1]

        if not ilya.cfg.vars["Always backtrack"] then
            local bones = ilya.GetBones( ply )

            for o = 1, #bones do
                local bone = bones[o]
                aimAngle = ( bone - me:EyePos() ):Angle()

                if ilya.VisibleCheck( ply, bone, nil, aimAngle:Forward() ) then
                    ilya.target = ply
                    return ply, bone, aimAngle, false, 0
                end
            end
           /*elseif ilya.cfg.vars["Extrapolation"] and ilya.predicted[ ply ] then
            if not ilya.predicted[ ply ].pos then return end

            aimAngle = ( ilya.predicted[ ply ].pos - me:EyePos() ):Angle()

            ilya.traceStruct.start = me:EyePos()
            ilya.traceStruct.endpos = ilya.predicted[ ply ].pos
            ilya.traceStruct.filter = ilya.Piercable
            ilya.traceStruct.mask = MASK_SHOT

            local tr = TraceLine( ilya.traceStruct )

            if !tr.Hit or tr.Entity == ply then
                ilya.target = ply
                return ply, ilya.predicted[ ply ].pos, aimAngle, false, 0
            end*/
        end

        if ilya.cfg.vars["Backtrack"] then
            local ticks = ilya.FindBacktrack( cmd, ply )

            if ilya.btrecords[ ply ] and not ply.break_lc then
                local ts = 0

                if ilya.cfg.vars["Backtrack mode"] == 3 then
                    for p = 1, #ticks do
                        if not ilya.btrecords[ ply ][ p ] then continue end

                        aimAngle = ( ilya.btrecords[ ply ][ p ].aimpos - me:EyePos() ):Angle()

                        ilya.traceStruct.start = me:EyePos()
                        ilya.traceStruct.endpos = ilya.btrecords[ ply ][ p ].aimpos
                        ilya.traceStruct.filter = ilya.Piercable
                        ilya.traceStruct.mask = MASK_SHOT

                        local tr = TraceLine( ilya.traceStruct )

                        if !tr.Hit or tr.Entity == ply then
                            ilya.target = ply
                            ilya.backtracktick = p

                            return ply, ilya.btrecords[ ply ][ p ].aimpos, aimAngle, true, p
                        end
                    end
                end

                if ilya.cfg.vars["Backtrack mode"] == 3 then return end

                if ilya.cfg.vars["Backtrack mode"] == 1 then
                    ts = ilya.FindFirstHittableTicks( ply, cmd )
                elseif ilya.cfg.vars["Backtrack mode"] == 2 then
                    ts = ilya.FindClosestHittableTicks( ply, cmd )
                end

                if not ilya.btrecords[ ply ][ ts ] then return end

                aimAngle = ( ilya.btrecords[ ply ][ ts ].aimpos - me:EyePos() ):Angle()

                ilya.traceStruct.start = me:EyePos()
                ilya.traceStruct.endpos = ilya.btrecords[ ply ][ ts ].aimpos
                ilya.traceStruct.filter = ilya.Piercable
                ilya.traceStruct.mask = MASK_SHOT

                local tr = TraceLine( ilya.traceStruct )

                if !tr.Hit or tr.Entity == ply then
                    ilya.target = ply
                    ilya.backtracktick = ts

                    return ply, ilya.btrecords[ ply ][ ts ].aimpos, aimAngle, true, ts
                end
            end
        end
	end
end

function ilya.IsMovementKeysDown( cmd )

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

function ilya.MovementFix( cmd, wish_yaw )

	local pitch = math_NormalizeAngle( cmd:GetViewAngles().x )
	local inverted = -1

	if ( pitch > 89 || pitch < -89 ) then
		inverted = 1
	end

	local ang_diff = math_rad( math_NormalizeAngle( ( cmd:GetViewAngles().y - wish_yaw ) * inverted ) )

	local forwardmove = cmd:GetForwardMove()
	local sidemove = cmd:GetSideMove()

	local new_forwardmove = forwardmove * -math_cos( ang_diff ) * inverted + sidemove * math_sin( ang_diff )
	local new_sidemove = forwardmove * math_sin( ang_diff ) * inverted + sidemove * math_cos( ang_diff )

	cmd:SetForwardMove( new_forwardmove )
	cmd:SetSideMove( new_sidemove )
end


function ilya.SilentAngles(cmd)
	if !ilya.SilentAngle then ilya.SilentAngle = cmd:GetViewAngles() end

	ilya.SilentAngle = ilya.SilentAngle + Angle( cmd:GetMouseY() * ilya.myaw, cmd:GetMouseX() * -ilya.myaw, 0)
	ilya.SilentAngle.p = math_Clamp( ilya.SilentAngle.p, -89, 89 )
    ilya.SilentAngle.r = 0

    ilya.SilentAngle:Normalize()
end

// Knife bot ( Etot zaichik knifer )

ilya.knifes = {}

ilya.knifes[1] = {
    str = "csgo_",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

ilya.knifes[2] = {
    str = "swb_",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 50*50,

    rightdmg = 40,
    rightdmgb = 40,
    rightdist = 50*50,
}

ilya.knifes[3] = {
    str = "weapon_crowba",

    canbackstab = false,

    leftdmg = 10,
    leftdmgb = 10,
    leftdist = 75*75,

    rightdmg = 10,
    rightdmgb = 10,
    rightdist = 75*75,
}

ilya.knifes[4] = {
    str = "weapon_knif",

    canbackstab = true,

    leftdmg = 25,
    leftdmgb = 90,
    leftdist = 64*64,

    rightdmg = 65,
    rightdmgb = 180,
    rightdist = 48*48,
}

function ilya:EntityFaceBack( ent )
    local angle = me:GetAngles().y - ent:GetAngles().y

    if angle < -180 then angle = 360 + angle end

    if angle <= 90 and angle >= -90 then return true end

    return false
end

function ilya.CanStab( ent, pos, health )
    local mypos = me:GetShootPos()
    local tbl = ilya.knifes[1]
    local wc = me:GetActiveWeapon():GetClass()
    local canuse = false

    for i = 1, #ilya.knifes do
        if StartsWith(wc,ilya.knifes[i].str) then
            canuse = true
            tbl = ilya.knifes[i]
            break
        end
    end

    if not canuse then return false, false end

    if ilya.canBacktrack( ent ) and ilya.btrecords[ent][ilya.backtracktick] then
        pos = ilya.btrecords[ ent ][ ilya.backtracktick ].aimpos
    end

    local backstab = tbl.canbackstab and ilya:EntityFaceBack( ent ) or false
    local dist = mypos:DistToSqr( pos )
    local mode = ilya.cfg.vars["Knifebot mode"]

    if mode == 1 then // Damage mode - tries to inflict biggest possible damage
        if backstab and dist < tbl.rightdist then
            return true, true
        elseif dist < tbl.leftdist and ( ( backstab and health - tbl.leftdmgb <= 0 ) or ( health - tbl.leftdmg <= 0 ) ) then
            return true, false
        elseif dist < tbl.rightdist or  ( dist < tbl.rightdist and health - tbl.leftdmg > 0 )  then
            return true, true
        end
    elseif mode == 2 then // Fast - tries to hit fast as possible
        if dist < tbl.rightdist then
            return true, true
        elseif dist < tbl.leftdist then
            return true, false
        end
    elseif mode == 3 then // Fatal - deals only fatal damage
        if dist < tbl.leftdist and ( ( backstab and health - tbl.leftdmgb <= 0 ) or ( health - tbl.leftdmg <= 0 ) ) then
            return true, false
        elseif dist < tbl.rightdist and ( ( backstab and health - tbl.rightdmgb <= 0 ) or ( health - tbl.rightdmg <= 0 ) ) then
            return true, true
        end
    end

    return false, false
end

function GetServerTime(cmd)
    if cmd == "get" then
        return os.date("%c", os.time()) -- Возвращаю текущую дату и время в удобочитаемом формате
    else
        return "Invalid command"
    end
end

function ilya.simtimeCheck( v )
    if not ilya.cfg.vars["Wait for simtime update"] then return true end

    return v.simtime_updated
end

function GetServerTime()
    return CurTime()
end

ilya.grabbingEnt = false

function ilya.DrawPhysgunBeamFunc( ply, wep, e, tar, bone, hitpos )
    if ply != me then return end

    ilya.grabbingEnt = IsValid( tar ) and tar or false
end

function ilya.LagCompensation(cmd)
    local ply = ilya.SelectTarget(cmd)
    local ping = ply:Ping()

    local compensationAmount = ping * 0.001


    local serverTime = GetServerTime()
    local compensatedTime = serverTime - compensationAmount
end

function ilya.GetLerpTime()

    local lerpRatio = GetConVar("cl_interp_ratio"):GetFloat()
    if lerpRatio == 0 then
        lerpRatio = 1
    end

    local lerpAmount = GetConVar("cl_interp"):GetFloat()
    if lerpRatio == 0 then
        lerpAmount = 1
    end

    local updateRate = GetConVar("cl_updaterate"):GetFloat()

    -- Calculate the base lerp time
    local baseLerpTime = math_max(lerpAmount, lerpRatio / updateRate)

    -- Get the local player
    local player = LocalPlayer()

    -- Check if the player is valid
    if not IsValid(player) then return baseLerpTime end

    -- Get the player's ping and packet loss
    local ping = player:Ping()
    local packetLoss = player:PacketLoss()

    -- Adjust the lerp time based on the player's actual lag
    -- This is a simplified example; you might need to adjust the formula based on your specific requirements
    local adjustedLerpTime = baseLerpTime + (ping / 1000) + (packetLoss * 0.1)

    return adjustedLerpTime
end

ilya.NotPredictileWep = { ["rust_dbarrel"] = true, ["rust_spas12"] = true,["rust_waterpipe"] = true,["rust_pumpshotgun"] = true,["rust_pickaxe"] = true,["rust_hatchet"] = true,["rust_boneclub"] = true,["rust_combatknife"] = true,["rust_woodenspear"] = true,["rust_stonespear"] = true,["rust_stonepickaxe"] = true,["rust_stonehatchet"] = true,["rust_salvagedsword"] = true,["rust_salvagedcleaver"] = true,["rust_rock"] = true}

function ilya.Aim(cmd)
    ilya.AntiAim(cmd)

    if ilya.SendPacket then
        ilya.fakeAngles.angle = cmd:GetViewAngles()
        ilya.fakeAngles.movex = me:GetPoseParameter("move_x")
        ilya.fakeAngles.movey = me:GetPoseParameter("move_y")

        local layers = {}

        for i = 0, 13 do
            if me:IsValidLayer(i) then
                layers[i] = {
                    cycle = me:GetLayerCycle(i),
                    sequence = me:GetLayerSequence(i),
                    weight = me:GetLayerWeight(i)
                }
            end
        end

        ilya.fakeAngles.origin = me:GetNetworkOrigin()
        ilya.fakeAngles.seq = me:GetSequence()
        ilya.fakeAngles.cycle = me:GetCycle()
    else
        ilya.realAngle = cmd:GetViewAngles()
    end

    local ply, bone, aimAngle, backtracking, bttick = ilya.SelectTarget(cmd)

    local w = me:GetActiveWeapon()

    ilya.targetVector = bone

    if not aimAngle then return end

    aimAngle:Normalize()

    if not ilya.cfg.vars["Enable aimbot"] or not ply then return end

    local targetTime = ded.GetSimulationTime( ply:EntIndex() )
    local timeOffset = ded.GetServerTime(cmd) - targetTime

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - targetTime

    if ilya.cfg.vars["LerpTime"] then
        if serverArriveTick - targetTime < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")
            ded.SetCommandTick(cmd, ilya.TIME_TO_TICKS(targetTime + ilya.GetLerpTime()))
        else
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")
            ded.SetCommandTick(cmd, ilya.TIME_TO_TICKS(targetTime + ilya.GetLerpTime()))
        end
    end

    if diff > 1 and ilya.cfg.vars["Adjust tickcount"] then return end

    local oldangs = Angle(aimAngle)

    if ilya.cfg.vars["Always backtrack"] and not backtracking then return end

    if ilya.cfg.vars["Fov limit"] then
        local fov = ilya.cfg.vars["Aimbot FOV"]

		local view = ilya.cfg.vars["Silent aim"] and ilya.SilentAngle or cmd:GetViewAngles()
		local ang = aimAngle - view

		ang:Normalize()

		ang = math_sqrt(ang.x * ang.x + ang.y * ang.y)

        if fov < ang then
            ilya.targetVector = false
		    return
        end
    end

    if not ilya.CanShoot(cmd) or not ilya.simtimeCheck( ply ) then return end
    if not ilya.cfg.vars["Aimbot smoothing"] and ilya.SkipCommand then return end

    ilya.aimingrn = true

    // Knife bot
    local altfire = false
    local canstab, rightstab = ilya.CanStab( ply, bone, ply:Health() )

    local oldAimAng = aimAngle
    local finalAngle = aimAngle

    if ilya.cfg.vars["Knifebot"] and canstab then
        altfire = rightstab
    elseif ilya.cfg.vars["Knifebot"] and not canstab then
        return
    end

    if ilya.cfg.vars["ilyapredict"] then
        local PredPos = bone
        local Distance      = me:GetShootPos():Distance( PredPos )
        if ilya.NotPredictileWep[ w:GetClass() ] or Distance < 80 then
            PredPos =  bone
        else
            local Velocity = 5000
            local Distance      = me:GetShootPos():Distance( PredPos )
            if string.StartsWith(w:GetClass(), "rust_huntingbow") then
                Velocity = 4000 - (0.60 * Distance) -- $_$
            elseif string.StartsWith(w:GetClass(), "rust_assaultrifle")  or string.StartsWith(w:GetClass(), "rust_boltrifle") then
                Velocity = 10000
            elseif string.StartsWith(w:GetClass(), "rust_revolver") then
                Velocity = 4000
            elseif string.StartsWith(w:GetClass(), "rust_nailgun") then
                Velocity = 2500
            end

            if Distance < 80 then return end

            local TravelTime    = Distance / Velocity
            local PredTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + TravelTime

            ded.StartSimulation( ply:EntIndex() )
                for i = 1, ilya.TIME_TO_TICKS( PredTime ) do
                    ded.SimulateTick()
                end
                local ModuleData = ded.GetSimulationData()
                PredPos = ModuleData.m_vecAbsOrigin + (bone  - ply:GetPos())
            ded.FinishSimulation()

            Distance            = me:GetShootPos():Distance( PredPos )
            TravelTime          = Distance / Velocity

            local Gravity =  (9.81 * 51.4285714 ) * (TravelTime^2) / 2
            PredPos.z = PredPos.z + Gravity

            ilya.traceStruct.start = me:GetShootPos()
            ilya.traceStruct.endpos = PredPos
            ilya.traceStruct.filter = me
            ilya.traceStruct.mask = MASK_SHOT

            local Trace = TraceLine( ilya.traceStruct )

            if Trace.Hit and not Trace.Entity:IsPlayer() then return end
        end

        debugoverlay.Cross( PredPos, 3, 0.1, color_white, true )

        finalAngle = ( Vector( PredPos )  - me:GetShootPos() ):Angle()
        if ilya.cfg.vars["Norecoil"] then
            finalAngle = ilya.NoRecoil(finalAngle)
        end
        if ilya.cfg.vars["Nospread"] then
            finalAngle = ilya.NoSpread(cmd,finalAngle)
        end
        if ilya.cfg.vars["Auto fire"] then
           cmd:AddKey(IN_ATTACK)
        end
    end
    if ilya.cfg.vars["Norecoil"] then
        finalAngle = ilya.NoRecoil(finalAngle)
    end

    if ilya.cfg.vars["gRust NR"] then
        finalAngle = ilya.gRustNoRecoil(finalAngle)
    end

    if ilya.cfg.vars[""] then
        ded.ForceSeed( cmd )
    end

    if ilya.cfg.vars["Nospread"] then
        finalAngle = ilya.NoSpread(cmd,finalAngle)
    end

    if ilya.cfg.vars["On shot aa"] then
        finalAngle.p = -finalAngle.p - 180
        finalAngle.y = finalAngle.y + 180
    end

    if ilya.cfg.vars["Facestab"] then
        local angles = ply:EyeAngles()

        finalAngle.y = angles.y
        finalAngle.p = angles.p

        altfire = true
    end

    if ilya.cfg.vars["Aimbot smoothing"] then
        local va = cmd:GetViewAngles()
        va.r = 0

        local rat = ilya.cfg.vars["Smoothing"] * 100
        local ret = LerpAngle( FrameTime()*rat, va, finalAngle )

        finalAngle = ret
    end


    if ilya.cfg.vars["Projectile aimbot"] then
        local predTime = math.ceil( ( me:EyePos() ):DistToSqr( ply:GetPos() ) / 3600 )

        print( predTime )

        if predTime > 15 then return end

        ded.StartSimulation( ply:EntIndex() )

        for tick = 1, predTime do
            ded.SimulateTick()
        end

        local data = ded.GetSimulationData()
        local vec = data.m_vecAbsOrigin

        ded.FinishSimulation()

        local g = predTime * 1

        print( vec.z, g )

        vec.z = vec.z + g

        finalAngle = ( vec - me:EyePos() ):Angle()
        finalAngle:Normalize()
    end

    //ded.SetContextMenu( cmd, ilya.cfg.vars["pSilent"] or ilya.cfg.vars["Facestab"] )
    if ilya.cfg.vars["Facestab"] then
        cmd:SetViewAngles( finalAngle )
        ded.SetContextVector( cmd, oldaimAngle, true )
    elseif ilya.cfg.vars["pSilent"] then
        ded.SetContextVector( cmd, oldaimAngle, true )
    else
        cmd:SetViewAngles( finalAngle )
    end

    if backtracking then
        targetTime = ilya.btrecords[ply][bttick].simulationtime
        timeOffset = ded.GetServerTime(cmd) - targetTime

        serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
        diff = serverArriveTick - ilya.btrecords[ply][bttick].simulationtime

        if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")
            local tick = ilya.TIME_TO_TICKS(targetTime)
            ded.SetCommandTick(cmd, tick)
        else
            ded.NetSetConVar("cl_interpolate","1")
            ded.NetSetConVar("cl_interp",tostring(ded.GetServerTime(cmd) - targetTime))
            local tick = ilya.TIME_TO_TICKS(ded.GetServerTime(cmd))
            ded.SetCommandTick(cmd, tick - 1)
        end
    elseif ilya.cfg.vars["Adjust tickcount"] then
        if diff < 0.2 then
            ded.NetSetConVar("cl_interpolate","0")
            ded.NetSetConVar("cl_interp","0")

            ded.SetCommandTick(cmd, ilya.TIME_TO_TICKS( ded.GetSimulationTime( ply:EntIndex() ) ) )
        else
            ded.NetSetConVar("cl_interpolate","1")
           ded.NetSetConVar("cl_interp",tostring(ded.GetServerTime(cmd) - targetTime))

            local tick = ilya.TIME_TO_TICKS(ded.GetServerTime(cmd))
            ded.SetCommandTick(cmd, tick - 1)
        end
    end

    if ilya.cfg.vars["Auto fire"] then

        if StartsWith( ilya.activeWeaponClass, "m9k_" ) then
            cmd:RemoveKey( IN_SPEED )
        end

        ilya.SendPacket = true
        me.simtime_updated = true
        //ded.UpdateClientAnimation( me:EntIndex() )

        cmd:AddKey( altfire and IN_ATTACK2 or IN_ATTACK )

        ilya.SkipCommand = true
    end
end

function ilya.autoReload(cmd)
    if !ilya.cfg.vars["Auto reload"] then return end

    local wep = me:GetActiveWeapon()
    if !IsValid(wep) then return end

    if !wep.Primary or wep:GetMaxClip1() <= 0 then return end
    ilya.autoReloadState = ilya.autoReloadState or { reloading = false }
    local currentClip = wep:Clip1()
    if currentClip == 0 then
        if !ilya.autoReloadState.reloading then
            cmd:AddKey(IN_RELOAD)
            ilya.autoReloadState.reloading = true
        end
    else
        ilya.autoReloadState.reloading = false
    end
end

// adaptive Cstrafe

ilya.last_ground_pos = 0
ilya.cstrafe_dir = 0

function ilya.PredictVelocity( velocity, viewangles, dir, maxspeed, accel )

	local forward = viewangles:Forward()
	local right = viewangles:Right()

	local fmove = 0
	local smove = ( dir == 1 ) && -10000 || 10000

	forward.z = 0
	right.z = 0

	forward:Normalize()
	right:Normalize()

	local wishdir = Vector( forward.x*fmove + right.x*smove, forward.y*fmove + right.y*smove, 0 )
	local wishspeed = wishdir:Length()

	wishdir:Normalize()

	if ( wishspeed != 0 && wishspeed > maxspeed ) then
		wishspeed = maxspeed
	end

	local wishspd = wishspeed

	if ( wishspd > 30 ) then
		wishspd = 30
	end

	local currentspeed = velocity:Dot( wishdir )
	local addspeed = wishspd - currentspeed

	if ( addspeed <= 0 ) then
		return velocity
	end

	local accelspeed = accel * wishspeed * TickInterval

	if ( accelspeed > addspeed ) then
		accelspeed = addspeed
	end

	return velocity + ( wishdir * accelspeed )

end

function ilya.PredictMovement( viewangles, dir, angle )

	local pm

	local sv_airaccelerate = GetConVarNumber( "sv_airaccelerate" )
	local sv_gravity = GetConVarNumber( "sv_gravity" )
	local maxspeed = me:GetMaxSpeed()
	local jump_power = me:GetJumpPower()

	local origin = me:GetNetworkOrigin()
	local velocity = me:GetAbsVelocity()

	local mins = me:OBBMins()
	local maxs = me:OBBMaxs()

    local pticks = math_Round(ilya.cfg.vars["CStrafe ticks"])

	local on_ground = me:IsFlagSet( FL_ONGROUND )

	for i = 1, pticks do

		viewangles.y = math_NormalizeAngle( math_deg( math_atan2( velocity.y, velocity.x ) ) + angle )

		velocity.z = velocity.z - ( sv_gravity * TickInterval * 0.5 )

		if ( on_ground ) then

			velocity.z = jump_power
			velocity.z = velocity.z - ( sv_gravity * TickInterval * 0.5 )

		end

		velocity = ilya.PredictVelocity( velocity, viewangles, dir, maxspeed, sv_airaccelerate )

		local endpos = origin + ( velocity * TickInterval )

		pm = TraceHull( {
			start = origin,
			endpos = endpos,
			filter = me,
			maxs = maxs,
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )

		if ( ( pm.Fraction != 1 && pm.HitNormal.z <= 0.9 ) || pm.AllSolid || pm.StartSolid ) then
			return false
		end

		if ( pm.Fraction != 1 ) then

			local time_left = TickInterval

			for j = 1, 2 do

				time_left = time_left - ( time_left * pm.Fraction )

				local dot = velocity:Dot( pm.HitNormal )

				velocity = velocity - ( pm.HitNormal * dot )

				dot = velocity:Dot( pm.HitNormal )

				if ( dot < 0 ) then
					velocity = velocity - ( pm.HitNormal * dot )
				end

				endpos = pm.HitPos + ( velocity * time_left )

				pm = TraceHull( {
					start = pm.HitPos,
					endpos = endpos,
					filter = me,
					maxs = maxs,
					mins = mins,
					mask = MASK_PLAYERSOLID
				} )

				if ( pm.Fraction == 1 || pm.AllSolid || pm.StartSolid ) then
					break
				end

			end

		end

		origin = pm.HitPos

		if ( ( ilya.last_ground_pos - origin.z ) > math_Round(ilya.cfg.vars["CStrafe ground diff"]) ) then
			return false
		end

		pm = TraceHull( {
			start =  Vector( origin.x, origin.y, origin.z + 2 ),
			endpos = Vector( origin.x, origin.y, origin.z - 1 ),
			filter = me,
			maxs = Vector( maxs.x, maxs.y, maxs.z * 0.5 ),
			mins = mins,
			mask = MASK_PLAYERSOLID
		} )

		on_ground = ( ( pm.Fraction < 1 || pm.AllSolid || pm.StartSolid ) && pm.HitNormal.z >= 0.7 )

		velocity.z = velocity.z - ( sv_gravity * TickInterval * 0.5 )

		if ( on_ground ) then
			velocity.z = 0
		end


	end

	return true

end

function ilya.CircleStrafe( cmd )

	local angle = 0

	while ( ilya.cstrafe_dir < 2 ) do

		angle = 0
		local path_found = false
		local step = ( ilya.cstrafe_dir == 1 ) && math_Round(ilya.cfg.vars["CStrafe angle step"]) || -math_Round(ilya.cfg.vars["CStrafe angle step"])

		while ( true ) do

			if ( ilya.cstrafe_dir == 1 ) then

				if ( angle > math_Round(ilya.cfg.vars["CStrafe angle max step"]) ) then
					break
				end

			else

				if ( angle < -math_Round(ilya.cfg.vars["CStrafe angle max step"]) ) then
					break
				end

			end

			if ( ilya.PredictMovement( cmd:GetViewAngles(), ilya.cstrafe_dir, angle ) ) then

				path_found = true
				break

			end

			angle = angle + step

		end

		if ( path_found ) then
			break
		end

		ilya.cstrafe_dir = ilya.cstrafe_dir + 1

	end

	if ( ilya.cstrafe_dir < 2 ) then

		local velocity = me:GetAbsVelocity()
		local viewangles = cmd:GetViewAngles()

		viewangles.y = math_NormalizeAngle( math_deg( math_atan2( velocity.y, velocity.x ) ) + angle )

		cmd:SetViewAngles( viewangles )
		cmd:SetSideMove( ( ilya.cstrafe_dir == 1 ) && -10000 || 10000 )

	else

		ilya.cstrafe_dir = 0

	end

end

do
    local ztick = 0
    local prev_yaw = 0
    local old_yaw = 0.0

    function ilya.AutoStrafe( cmd )
        ztick = ztick + 1

        if ( ilya.IsKeyDown(ilya.cfg.binds["Circle strafe"]) and ilya.cfg.vars["Circle strafe"] ) then

            ilya.CircleStrafe( cmd )

        elseif ( ilya.IsKeyDown(ilya.cfg.binds["Z Hop"]) and ilya.cfg.vars["Z Hop"] ) then
            local handler = ztick / 3.14

            cmd:SetSideMove( 5000 * math_sin(handler) )
        elseif ilya.cfg.vars["Air strafer"] and ilya.cfg.vars["Strafe mode"] == 3 then

            local get_velocity_degree = function(velocity)
                local tmp = math_deg(math_atan(30.0 / velocity))

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
            local velocity = me:GetVelocity()
            velocity.z = 0.0

            local forwardmove = cmd:GetForwardMove()
            local sidemove = cmd:GetSideMove()

            if (!forwardmove || !sidemove) then
                return
            end

            if(velocity:Length2D() <= 15.0 && !(forwardmove != 0 || sidemove != 0)) then
                return
            end

            local flip = cmd:TickCount() % 2 == 0

            local turn_direction_modifier = flip && 1.0 || -1.0
            local viewangles = Angle(ilya.SilentAngle.x, ilya.SilentAngle.y, ilya.SilentAngle.z)

            if (forwardmove || sidemove) then
                cmd:SetForwardMove(0)
                cmd:SetSideMove(0)

                local turn_angle = math_atan2(-sidemove, forwardmove)
                viewangles.y = viewangles.y + (turn_angle * M_RADPI)
            elseif (forwardmove) then
                cmd:SetForwardMove(0)
            end

            local strafe_angle = math_deg(math_atan(15 / velocity:Length2D()))

            if (strafe_angle > 90) then
                strafe_angle = 90
            elseif (strafe_angle < 0) then
                strafe_angle = 0
            end

            local temp = Vector(0, viewangles.y - old_yaw, 0)
            temp.y = math_NormalizeAngle(temp.y)

            local yaw_delta = temp.y
            old_yaw = viewangles.y

            local abs_yaw_delta = math_abs(yaw_delta)

            if (abs_yaw_delta <= strafe_angle || abs_yaw_delta >= 30) then
                local velocity_angles = velocity:Angle()

                temp = Vector(0, viewangles.y - velocity_angles.y, 0)
                temp.y = math_NormalizeAngle(temp.y)

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

            local normalized_x = math.modf(ilya.SilentAngle.x + 180, 360) - 180
            local normalized_y = math.modf(ilya.SilentAngle.y + 180, 360) - 180

            local yaw = math_rad(normalized_y - viewangles.y + angles_move.y)

            if (normalized_x >= 90 || normalized_x <= -90 || ilya.SilentAngle.x >= 90 && ilya.SilentAngle.x <= 200 || ilya.SilentAngle.x <= -90 && ilya.SilentAngle.x <= 200) then
                cmd:SetForwardMove(-math_cos(yaw) * speed)
            else
                cmd:SetForwardMove(math_cos(yaw) * speed)
            end

            cmd:SetSideMove(math_sin(yaw) * speed)

        elseif ilya.cfg.vars["Air strafer"] and ilya.cfg.vars["Strafe mode"] == 2 then
            cmd:SetForwardMove(0)

            if me:IsFlagSet( FL_ONGROUND ) then
                cmd:SetForwardMove(10000)
            else
                cmd:SetForwardMove(5850 / me:GetVelocity():Length2D())
                cmd:SetSideMove((cmd:CommandNumber() % 2 == 0) && -400 || 400)
            end

            /*

local ang_diff = math_NormalizeAngle( ilya.SilentAngle.y - prev_yaw )

            if ( math_abs( ang_diff ) > 0 ) then

                if ( ang_diff > 0 ) then
                    cmd:SetSideMove( -10000 )
                else
                    cmd:SetSideMove( 10000 )
                end

            else

                local vel = me:GetAbsVelocity()
                local vel_yaw = math_NormalizeAngle( math_deg( math_atan2( vel.y, vel.x ) ) )
                local vel_yaw_diff = math_NormalizeAngle( ilya.SilentAngle.y - vel_yaw )

                if ( vel_yaw_diff > 0 ) then
                    cmd:SetSideMove( -10000 )
                else
                    cmd:SetSideMove( 10000 )
                end

                local viewangles = cmd:GetViewAngles() //ilya.SilentAngle //Angle( ilya.SilentAngle.x, ilya.SilentAngle.y, 0 )
                viewangles.y = vel_yaw
                cmd:SetViewAngles( viewangles )

            end

            prev_yaw = ilya.SilentAngle.y
            */




        end
    end
end

/*
    Anti aim

*/

ilya.aatarget = nil

function ilya.PredictedPos(ply)
    return ply:GetPos() + ply:GetVelocity() * TickInterval
end

function ilya.PredictedEyePos()
    return me:EyePos() + me:GetVelocity() * TickInterval
end

function ilya.GetBaseYaw()
    if not IsValid( ilya.aatarget ) or ilya.cfg.vars["Yaw base"] != 2 then
        return ilya.SilentAngle.y
    end

    return math_NormalizeAngle( (ilya.PredictedPos(ilya.aatarget) - ilya.PredictedEyePos()):Angle().y )
end

function ilya.Freestand(cmd)
	if !IsValid(ilya.aatarget) then return false end

	local headpos = me:GetBonePosition(me:LookupBone("ValveBiped.Bip01_Head1"))
	if !headpos then return end

	local selfpos = me:GetPos()
	local headoffset = Vector(selfpos.x, selfpos.y, headpos.z):Distance(headpos) + 5

	local found = true

	local pos = ilya.aatarget:WorldToLocal(selfpos)
	local bearing = math_deg(-math_atan2(pos.y, pos.x)) + 180 + 90
	local left, right = bearing - 180 - 90, bearing - 180 + 90

	local function CheckYaw(yaw)
		yaw = math_rad(yaw)
		local x, y = math_sin(yaw), math_cos(yaw)

		local headoffsetvec = Vector(x, y, 0) * headoffset
		headoffsetvec.z = headpos.z - selfpos.z

		local tr = TraceLine({
			start = ilya.aatarget:EyePos() + ilya.aatarget:GetVelocity() * TickInterval * 4,
			endpos = selfpos + headoffsetvec,
			filter = ilya.aatarget
		})

		return tr.Fraction < 1 and tr.Entity != me
	end

	local function Normalize(ang) return 360 - ang + 90 end

	local leftcheck, rightcheck = CheckYaw(left), CheckYaw(right)

	left, right = Normalize(left), Normalize(right)

	do
		local headlocal = me:WorldToLocal(headpos)
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

ilya.realAngle = me:EyeAngles()
ilya.inverted = false
ilya.oldYaw = 0
ilya.SwaySide = 1

local baseyaw = 0

ilya.CalcYaw = {
    // Backward
    [1] = function( cmd )
        return baseyaw - 178
    end,
    // Fake forward
    [2] = function( cmd )
        return ilya.SendPacket and baseyaw or baseyaw + 178
    end,
    // Legit Delta
    [3] = function( cmd )
        return ilya.SendPacket and baseyaw or baseyaw + ( ilya.inverted and 43 or - 43 )
    end,
    // Sideways
    [4] = function( cmd )
        local delta = ilya.inverted and 89 or -89
        return baseyaw - ( ilya.SendPacket and delta or -delta )
    end,
    // Half Sideways
    [5] = function( cmd )
        local delta = ilya.inverted and 89 or -89
        return baseyaw - ( ilya.SendPacket and delta or 178 )
    end,
    // Fake Spin
    [6] = function( cmd )
        local add = math_NormalizeAngle( CurTime() * ilya.cfg.vars["Spin speed"] * 10 )
        return ilya.SendPacket and ( ilya.inverted and ( baseyaw - 178 ) or add ) or ( ilya.inverted and add or ( baseyaw - 178 ) )
    end,
    // LBY Spin
    [7] = function( cmd )
        return ded.GetCurrentLowerBodyYaw( me:EntIndex() ) + ( ilya.SendPacket and 180 or 0)
    end,
    // LBY Breaker
    [8] = function( cmd )
        local yaw = baseyaw - 178

        if me:GetVelocity():Length2D() > 1 then
            yaw = ded.GetCurrentLowerBodyYaw( me:EntIndex() ) + ( ilya.SendPacket and 180 or 0)
        elseif not ilya.SendPacket then
            local side = ilya.inverted and -1 or 1
            local lbyTarget = ded.GetTargetLowerBodyYaw( me:EntIndex() )

            if math_abs( math_NormalizeAngle( lbyTarget - ilya.oldYaw ) ) < ilya.cfg.vars["LBY min delta"] then
                yaw = math_NormalizeAngle( ilya.oldYaw + ilya.cfg.vars["LBY break delta"] * side)
            else
                yaw = math_NormalizeAngle( ded.GetCurrentLowerBodyYaw( me:EntIndex() ) - 44 * side )
            end
        end

        return yaw
    end,
    // Sin Sway
    [9] = function( cmd )
        local add = ilya.cfg.vars["Sin add"]
        local sin = math_sin( CurTime() ) * ilya.cfg.vars["Sin delta"]
        return ilya.SendPacket and baseyaw + sin + add or baseyaw - sin - add
    end,
    // Pendulum Sway
    [10] = function( cmd )
        local ct = CurTime()
        local delta = ilya.cfg.vars["Sin delta"]
        local ct1 = ( ct % 0.9 )
        local ct2 = ( ct % 2 )

        local x1 = ct2 * math_sin(ct1)
        local y1 = ct2 * -1 * math_cos(ct1)

        local x2 = x1 + ct1 * math_sin(ct2)
        local y2 = y1 - ct1 * math_cos(ct2)

        local sin = ilya.SendPacket and x2 * delta or y2 * delta
        return baseyaw + sin
    end,
    // Lag Sway
    [11] = function( cmd )
        local swaySpeed = (ilya.fakeLagTicks + 1) / 12 * math.pi
        local swayAmount = math_sin(CurTime() * swaySpeed) * 45

        return ( baseyaw - 180 ) + 55 * ilya.SwaySide + swayAmount * ilya.SwaySide * -1
    end,
    // Fake Jitter
    [12] = function( cmd )
        local delta = ilya.cfg.vars["Jitter delta"]

        local a = ilya.SendPacket and baseyaw - 178 or baseyaw - 178 + math_random( -delta, delta )
        local b = ilya.SendPacket and baseyaw - 178 + math_random( -delta, delta ) or baseyaw - 178

        return ilya.inverted and a or b
    end,
    // Kappa Jitter
    [13] = function( cmd )
        local delta = ilya.cfg.vars["Jitter delta"]

        local a = ilya.SendPacket and baseyaw - 178 or baseyaw + ( delta * ilya.SwaySide )
        local b = ilya.SendPacket and baseyaw + ( delta * ilya.SwaySide ) or baseyaw - 178

        return ilya.inverted and a or b
    end,
    // Abu Jitter
    [14] = function( cmd )
        local ctjit = math_sin( CurTime() * 30 ) * 25

        return ctjit + ( ilya.SendPacket and baseyaw - 160 * ilya.SwaySide or baseyaw - 160 * -ilya.SwaySide )
    end,
    // Satanic spinner
    [15] = function( cmd )
        local side = ilya.inverted and 1 or -1
        local satanicvalue = math_sin( CurTime() * 666 ) * 666

        return math_NormalizeAngle( ilya.SendPacket and satanicvalue * side or satanicvalue * -side )
    end,
    // Custom aa
    [16] = function( cmd )
        return ilya.SendPacket and baseyaw + ilya.cfg.vars["Custom real"] or baseyaw + ilya.cfg.vars["Custom fake"]
    end,
    // Custom Abu
    [17] = function( cmd )
        local ctjit = math_sin( CurTime() * 30 ) * 25

        return ctjit + ( ilya.SendPacket and baseyaw - ilya.cfg.vars["Custom real"] * ilya.SwaySide or baseyaw - ilya.cfg.vars["Custom fake"] * -ilya.SwaySide )







    end,
    // Legit AA
    [18] = function( cmd )
        local delta = ilya.inverted and 89 or -89
        return baseyaw - ( ilya.SendPacket and delta or -delta )
    end,
}







do
    local pitch, yaw = 0, 0

    local pitches = {
        [1] = 89,
        [2] = -89,
        [3] = 0,
        [4] = -180,
        [5] = 180,
    }














    local mm_side = false
    local side = false
    local pitchflip = false

    local side = 1

    local function CalcPitch()
        local cfg = ilya.cfg.vars["Pitch"]
        local x = 0

        if cfg <= 5 then return pitches[cfg] end

        if ilya.SendPacket then
            pitchflip = not pitchflip
        end

        if cfg == 6 then
            x = pitchflip and 180 or -180
        elseif cfg == 7 then
            x = pitchflip and -180 or 271
        elseif cfg == 7 then
            x = ilya.SendPacket and 89 or -180
        elseif cfg == 8 then
            x = math_random(-180,95) and math_random(177,180)
        elseif cfg == 9 then
            x = math_random(-180,-55) and math_random(180,55)
        elseif cfg == 10 then
            x = math_random(180,95) and math_random(-180,-95)
        elseif cfg == 11 then
            x = math_random(-180,-95) and math_random(166,179+2)
        elseif cfg == 12 then
            x = math_random(-180,-115) and math_random(177,179+2)
        elseif cfg == 13 then
            x = ilya.cfg.vars["Custom pitch"]
        end

        return x
    end

    /*




        elseif cfg == 7 then

        elseif cfg == 8 then

        elseif cfg == 9 then
            local sin = math_sin( CurTime() ) * 89
            y = ilya.SendPacket and baseyaw + sin or baseyaw - sin
        elseif cfg == 10 then
            local side = ded.GetPreviousTick() % 2 == 1

            y = ilya.SendPacket and baseyaw - 180 or baseyaw + ( side and -89 or 89 )
        elseif cfg == 11 then

        elseif cfg == 12 then
            y = baseyaw + ( ilya.SendPacket && ilya.cfg.vars["Custom fake"] || ilya.cfg.vars["Custom real"] )
        end

        "Backward",
        "Fake forward",
        "Sideways",
        "Half sideways",
        "Fake spin",
        "LBY",
        "Kappa",
        "Sway",
        "VDiff",
        "القضيب الطويل",
        "Lisp",
        "Custom",

    if ilya.cfg.vars["Jitter"] == 2 and ilya.SendPacket then
            local r = math_random(-45,45)
            local lbydiff = ded.GetTargetLBY(me:EntIndex()) - ded.GetCurrentLBY(me:EntIndex())

            if y + r > ded.GetTargetLBY(me:EntIndex()) then
                y = y + math_random(-lbydiff,lbydiff)
            else
                y = y + r
            end

        elseif ilya.cfg.vars["Jitter"] == 3 and ilya.SendPacket then
            y = y + math_random(ded.GetCurrentLBY(me:EntIndex()),ded.GetTargetLBY(me:EntIndex()))
        end

        */

    local function micromovement(cmd)
        if !ilya.cfg.vars["Micromovement"] then return end
        if !me:Alive() then return end
        if !me:IsFlagSet( FL_ONGROUND ) then return end
        if cmd:KeyDown(IN_BACK) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) then return end

        if cmd:GetForwardMove() == 0 and cmd:GetSideMove() == 0 then
            cmd:SetSideMove(mm_side and -15.0 or 15.0)
            mm_side = not mm_side
        end
    end

    local function aacheck(cmd)
        if !ilya.cfg.vars["Anti aim"] then return false end
        if cmd:KeyDown(IN_ATTACK) then return false end
        if cmd:KeyDown(IN_USE) then return false end
        if ilya.moveType == MOVETYPE_LADDER then return false end
        if ilya.moveType == MOVETYPE_NOCLIP then return false end

        if ilya.cfg.binds["Anti aim"] != 0 and not ilya.IsKeyDown(ilya.cfg.binds["Anti aim"]) then
            return false
        end

        return true
    end

    function ilya.AntiAim(cmd)
        local freestandsucc, freestandsafe, freestandunsafe

        if ilya.cfg.vars["Freestanding"] then
            freestandsucc, freestandsafe, freestandunsafe = ilya.Freestand(cmd)
        end

        if ilya.SendPacket then
            ilya.SwaySide = ilya.SwaySide * -1
        end

        baseyaw = ilya.GetBaseYaw()
        pitch = CalcPitch()
        yaw = ilya.CalcYaw[ilya.cfg.vars["Yaw"] ](cmd)

        if ilya.cfg.vars["Yaw randomisation"] then
            yaw = yaw + math_random( -0.9, 0.9 )
        end

        if freestandsucc then
            yaw = ilya.SendPacket and freestandunsafe or freestandsafe
        end

        if aacheck(cmd) then
            local pyAngle = Angle(pitch,yaw,0)

            cmd:SetViewAngles(pyAngle)
            ilya.oldYaw = pyAngle.y
        end
        micromovement(cmd)
    end
end

/*
    Fake lag
*/
ilya.fakeLagTicks = 0
ilya.fakeLagfactor = 0
ilya.chokedTicks = 0

ilya.peeked = false
ilya.peeking = false

function ilya.FakeLagOnPeek()
    ilya.fakeLagTicks = 21 - ilya.chokedTicks - 1

    if ilya.chokedTicks >= 20 then
        ilya.peeked = true
		ilya.peeking = false
		ilya.SendPacket = true
        me.simtime_updated = true
        //ded.UpdateClientAnimation( me:EntIndex() )
		return
    end
end

local FakeEblan

local fakeeblan_factor = 3
if (1 / TickInterval) >= 66  then
	fakeeblan_factor = 4
end

local nextm9k = 0
local prevack = 0
local numerrors = 0

if ilya.cfg.vars["Lag fix"] then
    if ilya.cfg.vars["Backshoot"] then
        local targetTime = ded.GetSimulationTime( ply:EntIndex() )
        local timeOffset = ded.GetServerTime(cmd) - targetTime

        -- Check if we can backtrack without cl_interp
        local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
        local diff = serverArriveTick - ply.aimshots.sw_backshoot_data.simTime
        if diff < 0.2 then
            local tick = ilya.TIME_TO_TICKS(targetTime + ilya.GetLerpTime())
            ded.SetCommandTick(cmd, tick)
        else
            ded.SetTargetInterp(ded.GetServerTime(cmd) - targetTime)

            local tick = ilya.TIME_TO_TICKS(ded.GetServerTime(cmd))
            ded.SetCommandTick(cmd, tick - 1)
        end
    else
        local simTime = ded.GetSimulationTime(ply:EntIndex())
        local tick = ilya.TIME_TO_TICKS(simTime + ilya.GetLerpTime())
        ded.SetCommandTick(cmd, tick)
    end
end

function ilya.WarpOnPeek()
	ded.StartShifting( true )

	ilya.peeked = true
	ilya.peeking = false
end

function ilya.CheckPeeking()
	local plys

	for extr = 1, 8 do
        plys = ilya.GetSortedPlayers( 1, extr, 1, true )
		if plys then break end
	end

	if plys and !ilya.peeking and !ilya.peeked then
		ilya.peeking = true
		ilya.peeked = false
	elseif !plys then
		ilya.peeking = false
		ilya.peeked = false
	end

	if ilya.peeking and !ilya.peeked then
		if !ded.GetIsShifting() and ded.GetCurrentCharge() >= ilya.cfg.vars["Shift ticks"] and ilya.cfg.vars["Warp on peek"] then
			ilya.WarpOnPeek()
        elseif ilya.cfg.vars["Freeze on peek"] then
            ded.SetOutSequenceNr( ded.GetOutSequenceNr() + ilya.maxFreezeTicks - 1 )
		//elseif ilya.cfg.vars["Fake lag options-On peek"] then
		//	ilya.FakeLagOnPeek()
		end
	end
end




do

    local function shouldlag(cmd)
        if not ilya.cfg.vars["Fake lag"] then return false end
        if not me:Alive() then return false end
        if ilya.cfg.vars["Fakelag comp"] == 1 and ded.GetCurrentCharge() > 0 then return false end
        if ilya.cfg.vars["Fake lag options-Disable on ladder"] and ilya.moveType == MOVETYPE_LADDER then return false end
        if ilya.cfg.vars["Fake lag options-Disable in attack"] and cmd:KeyDown(IN_ATTACK) then return false end
        //if ilya.cfg.vars["Fake lag options-Only in AntiAim"] and !ilya.cfg.vars["Anti aim"] or not ilya.IsKeyDown(ilya.cfg.binds["Anti aim"]) then return false end

        if ilya.cfg.vars["Allah fly"] and not me:IsFlagSet( FL_ONGROUND ) then
            return false
        end

        return true
    end

    function ilya.FakeLag(cmd)
        local factor = math_Round(ilya.cfg.vars["Lag limit"])

        if ilya.cfg.vars["Fake lag options-Randomise"] then
            factor =  math_random(ilya.cfg.vars["Lag randomisation"],factor)
        end

        local velocity = me:GetVelocity():Length2D()
        local pertick = velocity * TickInterval
        local adaptive_factor = math_Clamp(math_ceil(64 / pertick),1,factor)

        if ilya.cfg.vars["Lag mode"] == 1 or ilya.cfg.vars["Lag mode"] == 3 then
            ilya.fakeLagfactor = factor
        elseif ilya.cfg.vars["Lag mode"] == 2 then
            ilya.fakeLagfactor = adaptive_factor
        elseif ilya.cfg.vars["Lag mode"] == 3 then
            ilya.fakeLagfactor = 21
        elseif ilya.cfg.vars["Lag mode"] == 5 then
            ilya.fakeLagfactor = 21 and ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 13)
        end

        //if ilya.cfg.vars["Fakelag comp"] == 2 and ded.GetCurrentCharge() > 0 then
        //   local nfactor = ilya.fakeLagfactor - ded.GetMaxShiftTicks() - 1
        //    ilya.fakeLagfactor = math_Clamp( nfactor, 0, 21 )
        //end

        if shouldlag(cmd) then
            ilya.SendPacket = false

            if ilya.fakeLagTicks <= 0 then
                ilya.fakeLagTicks = ilya.fakeLagfactor
                ilya.SendPacket = true
                me.simtime_updated = true
                //ded.UpdateClientAnimation( me:EntIndex() )
            else
                ilya.fakeLagTicks = ilya.fakeLagTicks - 1
            end

        else
            if ilya.fakeLagfactor > 0 then ilya.fakeLagfactor = 0 end
            ilya.SendPacket = true
            me.simtime_updated = true
            //ded.UpdateClientAnimation( me:EntIndex() )
        end
    end
end

function ilya.ClampMovementSpeed(cmd, speed)
	local final_speed = speed;

	local squirt = math_sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

	if (squirt > speed) then
		local squirt2 = math_sqrt((cmd:GetForwardMove() * cmd:GetForwardMove()) + (cmd:GetSideMove() * cmd:GetSideMove()));

		local cock1 = cmd:GetForwardMove() / squirt2;
		local cock2 = cmd:GetSideMove() / squirt2;

		local Velocity = me:GetVelocity():Length2D();

		if (final_speed + 1.0 <= Velocity) then
			cmd:SetForwardMove(0)
			cmd:SetSideMove(0)
		else
			cmd:SetForwardMove(cock1 * final_speed)
			cmd:SetSideMove(cock2 * final_speed)
        end
    end
end

function ilya.FastWalk2( cmd )
    if not ilya.cfg.vars["Ground strafer"] then return end
    if math_abs(cmd:GetSideMove()) < 1 or math_abs(cmd:GetForwardMove()) > 1 then return end
    if not me:IsFlagSet( FL_ONGROUND ) then return end

    if ilya.moveType == MOVETYPE_NOCLIP or ilya.moveType == MOVETYPE_LADDER then return end

    local waterLevel = me:WaterLevel()

    if waterLevel >= 2 then return end

	cmd:SetForwardMove(cmd:CommandNumber() % 2 == 0 and -5250 or 5250)
end

function ilya.FastWalk( cmd )
    if not ilya.cfg.vars["Ground strafer"] then return end
    if math_abs(cmd:GetSideMove()) > 1 or math_abs(cmd:GetForwardMove()) < 1 then return end
    if not me:IsFlagSet( FL_ONGROUND ) then return end

    if ilya.moveType == MOVETYPE_NOCLIP or ilya.moveType == MOVETYPE_LADDER then return end

    local waterLevel = me:WaterLevel()

    if waterLevel >= 2 then return end

	cmd:SetSideMove(cmd:CommandNumber() % 2 == 0 and -5250 or 5250)
end

local function FastWalkUltimatium( cmd )
    if math_abs(cmd:GetSideMove()) > 1 then
        ilya.FastWalk(cmd)
    elseif math_abs(cmd:GetForwardMove()) < 1 then
        ilya.FastWalk2(cmd)
    end
end

hook.Add( "CreateMove", "MovementFix", FastWalkUltimatium )

local directionalMove = { IN_BACK, IN_MOVERIGHT, IN_MOVELEFT }

local function FixMovement( cmd )
    if not ilya.cfg.vars["FixMovement"] then return end
    for i = 1, #directionalMove do
        cmd:RemoveKey( directionalMove[ i ] )
    end
end

hook.Add( "CreateMove", "MovementFix", FixMovement )

function ilya.validMoveType()
    return ilya.moveType != MOVETYPE_LADDER and ilya.moveType != MOVETYPE_NOCLIP and ilya.moveType != MOVETYPE_OBSERVER
end

function ilya.isMoving(cmd)
    if not cmd then
        return false
    end

    return ilya.hoppin or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) and not cmd:KeyDown(IN_JUMP)
end

function ilya.Stop(cmd)
    if ilya.validMoveType() and me:IsFlagSet( FL_ONGROUND ) then

        local moving = ilya.isMoving(cmd)

        if not moving then

            local vel = me:GetVelocity()
            local dir = vel:Angle()

            dir.yaw = ilya.SilentAngle.y - dir.yaw

            local newmove = dir:Forward() * vel:Length2D()

            cmd:SetForwardMove(0 - newmove.x)
            cmd:SetSideMove(0 - newmove.y)

        end

    end
end

// Slidewalk

function ilya.SlideWalk( cmd )
    local ticksToStop = ilya.fakeLagfactor





end

--для сравнения вложил сюда

/*function HERMES:Autopistol( ucmd )
	if( HERMES.GetGamemode( "terror town", "terrortown" ) ) then return end
	local ply = LocalPlayer()

	local w = ply:GetActiveWeapon()
	if( ValidEntity( w ) && HERMES.item['autopistol'] && ( ( w.Primary && w.Primary.Automatic == false || w.Automatic == false ) || table.HasValue( hl2, w:GetClass() ) ) ) then
		if( input.IsMouseDown( MOUSE_LEFT ) ) then
			HERMES.hermes.RunCommand( "+attack" )
			timer.Simple( 0.05, function() HERMES.hermes.RunCommand( "-attack" ) end )
		end
	end
end*/





// Auto peak

ilya.startedPeeking = false
ilya.needToMoveBack = false
ilya.startPeekPosition = Vector(0,0,0)

function ilya.MoveTo( cmd, pos )
    local ang = ( pos - me:GetPos() ):Angle().y

    cmd:SetForwardMove(1000)
    cmd:SetSideMove(0)

    cmd:AddKey(IN_SPEED)

    ilya.MovementFix( cmd, ang )
end

function ilya.checkAutopeak( cmd )
    if ilya.startedPeeking and cmd:KeyDown(IN_ATTACK) then
        ilya.needToMoveBack = true
    elseif !ilya.startedPeeking and !cmd:KeyDown(IN_ATTACK) then
        ilya.needToMoveBack = false
    end
end

do
    local colorA = Color( 235, 75, 75 )
    local colorB = Color( 75, 235, 75 )

    local apmat = Material( "gui/npc.png" )

    local nullangle = Angle(0,0,0)

    function ilya.drawAutopeak()
        local col = ilya.needToMoveBack and colorA or colorB

        cam_Start3D2D( ilya.startPeekPosition, nullangle, 0.5 )
            cam_IgnoreZ( true )

            surface_SetDrawColor( col )
            surface_SetMaterial( apmat )
            surface_DrawTexturedRect( -32, -32, 64, 64 )

            cam_IgnoreZ( false )
        cam_End3D2D()
    end
end

function ilya.autopeakThink()
    if ilya.IsKeyDown(ilya.cfg.binds["Auto peak"]) then
        if not ilya.startedPeeking then
            ilya.startPeekPosition = me:GetPos()
        end

        ilya.startedPeeking = true
    else
        ilya.startedPeeking = false
    end
end







/*// Movement
ilya.holdingOnGround = false
ilya.badMoveTypes = {
    ["MOVETYPE_NOCLIP"] = true, ["MOVETYPE_LADDER"] = true, ["MOVETYPE_OBSERVER"] = true
}

function ilya.BunnyHop(cmd)
    local moveType = me:GetMoveType()
    local waterLevel = me:WaterLevel()

    if ilya.badMoveTypes[moveType] then return end

    if me:IsFlagSet( FL_ONGROUND ) then

        --[[if ilya.holdingOnGround then
            ilya.holdingOnGround = false

            cmd:RemoveKey(IN_JUMP)
        end

        if cmd:KeyDown(IN_JUMP) then
            ilya.holdingOnGround = true
        end

        return ]]
    else
        cmd:RemoveKey(IN_JUMP)
        return
    end

    //if waterLevel >= 2 then return end
end
*/

// Sequence Manipulation




ilya.seqshit = false
function ilya.SequenceShit(cmd)
    if not ilya.cfg.vars["Sequence manip"] or not ilya.IsKeyDown(ilya.cfg.binds["Sequence manip"]) then



        if ilya.seqshit then
            ilya.seqshit = false
        end

        if ilya.SendPacket then
            ilya.chokedTicks = 0
        else
            ilya.chokedTicks = ilya.chokedTicks + 1
        end

        return
    end

    local amt = ilya.cfg.vars["Sequence min random"] and math_random(ilya.cfg.vars["Sequence min"],ilya.cfg.vars["OutSequence"]) or ilya.cfg.vars["OutSequence"]

    ded.SetBSendPacket(ilya.SendPacket)

    ded.SetOutSequenceNr(ded.GetOutSequenceNr() + amt)

    if ilya.cfg.vars["Lagger manip mode"] == 1 then
        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + math_random(0, amt))
    elseif ilya.cfg.vars["Lagger manip mode"] == 2  then
        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + fakeeblan_factor * amt )
    elseif ilya.cfg.vars["Lagger manip mode"] == 3 then
        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 13 )
    elseif ilya.cfg.vars["Lagger manip mode"] == 4 then
        if ilya.SendPacket then
            if ilya.chokedTicks > 0 then
                ded.SetOutSequenceNr(ded.GetOutSequenceNr() + amt)
                ilya.chokedTicks = 0  -- Reset choked ticks after sending the packet
            else
                ded.SetNetChokedPackets(127)
            end
        else
            ilya.chokedTicks = ilya.chokedTicks + 1
        end
    end



end

// Handjob ( arm breaker )

function ilya.PerformHandjob( cmd )
    local mode = ilya.cfg.vars["Handjob mode"]
    local shouldjerk = true

    if mode == 2 then
        shouldjerk = (cmd:CommandNumber() % 12) >= 6
    elseif mode == 3 then
        shouldjerk = math_random(0, 1) == 0
    end

    ded.SetTyping(cmd, shouldjerk)
end

// create move hook

ilya.norf = {
    ["laserjetpack"] = true,
    ["weapon_physgun"] = true,
    ["rust_assaultrifle"] = true,
    ["rust_thompson"] = true,
    ["rust_smg"] = true,
    ["rust_mp5"] = true,
    ["rust_buildingplan"] = true,
}

ilya.vapecd = false
ilya.tyaga = 0
ilya.maxvape = ilya.TIME_TO_TICKS(5)
ilya.hoppin = false
local ic = false

ilya.slams = {}

hook.Add( "OnEntityCreated", "Aawwawawawawawawaawawa", function( ent )
    if ent:GetClass() == "npc_satchel" and ent:GetOwner() == me then
        ilya.slams[ #ilya.slams + 1 ] = ent
    end
end )



function ilya.ShootTime()
    if !IsFirstTimePredicted then return end
    ilya.servertime = CurTime(1) + TickInterval
end


function ilya.CreateMove(cmd, UserCmd, mv )
    ilya.SilentAngles(cmd)

    ilya.aimingrn = false

    //if ( ded.GetChokedPackets() > 14 ) then ded.SetChokedPackets( 14 ) end

    if cmd:CommandNumber() == 0 then return end

    //if ded.GetIsShifting() then ilya.shiftedTicks = ilya.shiftedTicks + 1 end

    local w = me:GetActiveWeapon()
    ilya.activeWeapon       = IsValid( w ) and w or false
    ilya.activeWeaponClass  = IsValid( w ) and w:GetClass() or false
    ilya.moveType           = me:GetMoveType()

    //if ilya.cfg.vars["Passive recharge"] and ded.GetCurrentCharge() < ded.GetMaxShiftTicks() and not me:Alive() then
    //    ded.SetReloadKeyPressed( true )
    //end


    if ilya.cfg.vars["Silent aim"] then cmd:SetViewAngles(ilya.SilentAngle) end

    //if ded.GetIsShifting() then
        //  ded.AdjustTickbase()
    //    print("shifting")
    //end

    if ilya.cfg.vars["Flashlight spam"] and input_IsKeyDown( KEY_F ) then
        cmd:SetImpulse(100)
    end

    if ilya.cfg.vars["Auto Vape"] then
        if cmd:KeyDown( IN_ATTACK ) then
            if ilya.tyaga >= ilya.maxvape then
                cmd:RemoveKey( IN_ATTACK )
                ilya.tyaga = 0
            elseif ilya.tyaga < ilya.maxvape then
                ilya.tyaga = ilya.tyaga + 1
            end
        else
            ilya.tyaga = 0
        end
    end


    if ilya.vapecd then
        ilya.vapecd = false
        cmd:RemoveKey( IN_ATTACK2 )
    elseif ilya.cfg.vars["Vape spam"] and ilya.activeWeapon and not ilya.vapecd and StartsWith( ilya.activeWeaponClass, "weapon_vape" ) then
        cmd:AddKey( IN_ATTACK2 )
        ilya.vapecd = true
    end

    if ilya.cfg.vars["Handjob"] then
        ilya.PerformHandjob( cmd )
    end

    //if ilya.cfg.vars["Fake latency"] then
    //    local amt = ilya.cfg.vars["Max latency"]
    //    ded.SetInSequenceNr(ded.GetInSequenceNr() - amt)
    //end

    if ilya.SkipCommand then
        cmd:RemoveKey( IN_ATTACK )

        ilya.SkipCommand = !ilya.SkipCommand
    end

    if ( me:IsFlagSet( FL_ONGROUND ) ) then
		ilya.last_ground_pos = me:GetNetworkOrigin().z
	end

    if ilya.cfg.vars["Animation freezer"] then ilya.AnimationFreezer() end

	ilya.SequenceShit(cmd)

    if not ilya.seqshit then
        ilya.FakeLag(cmd)

        if ilya.cfg.vars["Allah walk"] and ilya.IsKeyDown(ilya.cfg.binds["Allah walk"]) then

            if (ded.SetBSendPacket( ilya.SendPacket )) then

                if (seqshift > 0) then

                    if (!bRunning) then

                        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + seqshift)

                        bRunning = true

                    else

                        ded.SetNetChokedPackets(127)

                    end

                else

                    bRunning = false

                end

            end

            --print(ilya.fakeLagTicks,me:GetVelocity():Length2D())
        end
    end

    if ilya.cfg.vars["Fake lag options-On peek"] or ilya.cfg.vars["Warp on peek"] or ilya.cfg.vars["Freeze on peek"] then
        ilya.CheckPeeking()
    end

    // Movement

    ilya.FastWalk( cmd )
    ilya.FastWalk2( cmd )

    if ilya.cfg.vars["Sprint"] then
        cmd:AddKey(IN_SPEED)
    end

    local commandNumber = cmd:CommandNumber()
    if ilya.cfg.vars["Bug Sprint"] and ( cmd:KeyDown(IN_SPEED) and commandNumber % 2 == 0 ) then
        cmd:RemoveKey(IN_SPEED)
    end

    HasJumped = me:IsFlagSet( FL_ONGROUND )
    ilya.hoppin = false
    if ( cmd:KeyDown( IN_JUMP ) ) then

		if ( !me:IsFlagSet( FL_ONGROUND ) ) and ilya.cfg.vars["Bhop"] then
			cmd:RemoveKey( IN_JUMP )
            ilya.hoppin = true
            HasJumped = 1
        elseif ilya.cfg.vars["Bhop safe"] then
            if HasJumped > ilya.cfg.vars["Bhop safe duplex"] then
                cmd:AddKey( IN_JUMP )
                ilya.hoppin = false
                HasJumped = 0
            end
        end



		ilya.AutoStrafe( cmd )
	end


    /*if ilya.cfg.vars["Slow Walk"] then
        if ilya.cfg.binds["Slow Walk"] then
            if(input_IsKeyDown(KEY_A)) then
                cmd:SetForwardMove(ilya.cfg.vars["Slow Walk speed"])
            end
            if(input_IsKeyDown(KEY_D)) then
                cmd:SetForwardMove(ilya.cfg.vars["Slow Walk speed"])
            end
            if(input_IsKeyDown(KEY_W)) then
                cmd:SetSideMove(ilya.cfg.vars["Slow Walk speed"])
            end
            if(input_IsKeyDown(KEY_S)) then
                cmd:SetSideMove(ilya.cfg.vars["Slow Walk speed"])
            end
        end
    end*/

	if ilya.cfg.vars["Fast stop"] then
        ilya.Stop(cmd)
    end

    if ilya.cfg.vars["Water jump"] and me:WaterLevel() > 1 then
        cmd:AddKey( IN_JUMP )

    elseif ilya.cfg.vars["Jesus lag"] and ilya.SendPacket and me:WaterLevel() == 1 then
        cmd:AddKey( IN_DUCK )
    end

    if ilya.cfg.vars["Fake duck"] and ilya.IsKeyDown(ilya.cfg.binds["Fake duck"]) then
        if ilya.fakeLagTicks > (ilya.fakeLagfactor / 2) then
            cmd:AddKey(IN_DUCK)
        else
            cmd:RemoveKey(IN_DUCK)
        end
    end

    ilya.targetVector = false
    if ilya.cfg.vars["engine pred need for grust"] then ded.StartPrediction(cmd) end

        local wish_yaw = ilya.SilentAngle.y

        if ( ilya.IsKeyDown(ilya.cfg.binds["Circle strafe"]) and ilya.cfg.vars["Circle strafe"] ) then
            wish_yaw = cmd:GetViewAngles().y
        end


        ilya.Aim(cmd)
        ilya.SelectTarget(cmd)


        if ilya.cfg.vars["Silent aim"] then
            ilya.MovementFix( cmd, wish_yaw )
        end

    if ilya.cfg.vars["Engine pred"] then ded.FinishPrediction() end

    if ilya.cfg.vars["Trigger bot"] and ilya.IsKeyDown( ilya.cfg.binds["Trigger bot"] ) then
        local tr = me:GetEyeTrace().Entity

        if tr and tr:IsPlayer() then
            cmd:AddKey( IN_ATTACK )
        end
    end

    if ilya.cfg.vars["Double tap"] and ilya.cfg.vars["Tickbase shift"] and cmd:KeyDown( IN_ATTACK ) then
        //ilya.shiftedTicks = 0
        print( cmd:KeyDown( IN_ATTACK ) )
        ded.StartShifting( true )
    end

    if ilya.cfg.vars["Rapid fire"] and me:Alive() and not ilya.cfg.vars["Rapid fire glitch"] then
        local commandNumber = cmd:CommandNumber()
        local w = me:GetActiveWeapon()

        if IsValid(w) and not ilya.norf[ w:GetClass() ] and (cmd:KeyDown(IN_ATTACK) and commandNumber % 2 == 0)  then
            cmd:RemoveKey(IN_ATTACK)
        end
    end

    if ilya.cfg.vars["Alt Rapid fire"] and me:Alive() and not ilya.cfg.vars["Rapid fire glitch"] then
        local commandNumber = cmd:CommandNumber()
        local w = me:GetActiveWeapon()

        if IsValid(w) and (cmd:KeyDown(IN_ATTACK2) and commandNumber % 2 == 0)  then
            cmd:RemoveKey(IN_ATTACK2)
        end
    end

    if ilya.cfg.vars["Auto detonator"] and #ilya.slams > 0 then
        local d = ilya.cfg.vars["AutoD distance"]
        d = d * d

        local plys = player_GetAll()

        for jjj = 1, #plys do
            if plys[ jjj ] == me then continue end

            for k, v in pairs(ilya.slams) do
                if not IsValid(v) then ilya.slams[k] = nil continue end

                local pos = v:GetPos()

                if pos:DistToSqr( plys[ jjj ]:GetPos() + plys[ jjj ]:GetVelocity() * ( TickInterval * 4 ) ) < d then
                    cmd:AddKey( IN_ATTACK2 )
                    break
                end
            end
        end
    end

    if ilya.cfg.vars["Auto peak"] then
        local ppos = ilya.startPeekPosition
        local pposd = me:GetPos():DistToSqr(ppos)

        if ilya.needToMoveBack and pposd < 1024 then //or ilya.IsMovementKeysDown( cmd )
            ilya.needToMoveBack = false
        end

        if ilya.startedPeeking then
            //if not ilya.IsMovementKeysDown( cmd ) then
            //    ilya.needToMoveBack = true
            //end

            if ilya.needToMoveBack then
                ilya.MoveTo( cmd, ppos )

                if ilya.cfg.vars["Auto peak tp"] and ilya.cfg.vars["Tickbase shift"] then
                    //ilya.shiftedTicks = 0
                    print("NIGGER")
                    ded.StartShifting( true )
                end
            end
        end

        ilya.checkAutopeak( cmd )
    end

    ilya.autoReload(cmd)

    if ilya.cfg.vars["Use spam"] then
        local commandNumber = cmd:CommandNumber()

        if ( cmd:KeyDown( IN_USE ) and commandNumber % 2 == 0 ) then
            cmd:RemoveKey( IN_USE )
        end
    end

    if ilya.cfg.vars["Auto GTA"] then
        local tr = me:GetEyeTrace().Entity

        if IsValid( tr ) and tr:IsVehicle() then
            cmd:AddKey(IN_USE)
        end
    end

    if ilya.cfg.vars["Ghost follower"] then
        local tar = player.GetBySteamID( ilya.cfg.vars["GFID"] )

        if IsValid( tar ) then
            local tang = ( tar:GetPos() - me:EyePos() ):Angle()

            cmd:ClearMovement()
            cmd:ClearButtons()

            cmd:SetForwardMove( 10000 )
            cmd:SetSideMove(0)

            cmd:AddKey(IN_SPEED)

            cmd:SetViewAngles( tang )
            ilya.MovementFix( cmd, tang.y )
        end
    end

    if ilya.cfg.vars["Air lag duck"] and ilya.SendPacket then
        local startPosUnducked = me:GetPos()
        local isDucking = bit.band(me:GetFlags(), FL_DUCKING) != 0
        if isDucking then
            startPosUnducked.z = startPosUnducked.z - (72 - 36)
        end

        ded.StartSimulation( me:EntIndex() )

        local shouldduck = true

        for i = 1, 4 do
            ded.SimulateTick()

            local simData = ded.GetSimulationData()

            local maxs = me:OBBMaxs()
            maxs.z = 72

            if isDucking then
                simData.m_vecAbsOrigin.z = simData.m_vecAbsOrigin.z - (72 - 36)
            end

            local trace = TraceHull({
                start = startPosUnducked,
                endpos = simData.m_vecAbsOrigin,
                mins = me:OBBMins(),
                maxs = maxs,
                filter = me,
                mask = MASK_PLAYERSOLID
            })

            if me:IsOnGround() and trace.Hit then
                shouldduck = false
                break
            end
        end

        ded.FinishSimulation()

        if shouldduck and !me:IsFlagSet( FL_ONGROUND ) then
            cmd:AddKey( IN_DUCK )
        end
    end

    if ilya.fcenabled then
        cmd:ClearMovement()
        cmd:ClearButtons()

        cmd:SetViewAngles(ilya.fcangles)
    end

    /*if ilya.cfg.vars["Dodge projectiles"] and ded.GetCurrentCharge() >= ded.GetMaxShiftTicks() and not ded.GetIsShifting() then
        local entitys = ents_GetAll()

        for i = 1, #entitys do
            local v = entitys[ i ]

            if v:GetClass() != "crossbow_bolt" then continue end

            local mypos = me:GetPos() + me:GetVelocity() * TickInterval
            local entpos = v:GetPos() + ( v:GetAngles():Forward() * 3500 ) * TickInterval

            if mypos:DistToSqr( entpos ) > 320 then
                cmd:ClearMovement()
                cmd:ClearButtons()

                cmd:AddKey( IN_SPEED )
                cmd:SetSideMove( 10000 )
                ded.StartShifting( true )
            end
        end
    end*/

    if ilya.SendPacket then
        ilya.chokedTicks = 0
    else
        ilya.chokedTicks = ilya.chokedTicks + 1
    end

    if not ilya.cfg.vars["Silent aim"] then ilya.SilentAngle = cmd:GetViewAngles() end

    ded.SetBSendPacket( ilya.SendPacket )

    if ilya.cfg.vars["Lag mode"] == 3 and ilya.SendPacket then
        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 13)
    end
end


gandon = {
    ["rust_woodenspear"] = true,
    ["rust_stonespear"] = true,
    ["rust_salvagedsword"] = true,
    ["rust_salvagedcleaver"] = true,
    ["rust_pickaxe"] = true,
}

hook_Add( "CreateMove", "ilya.CreateMove", ilya.CreateMove ) // Post

/*sosuhui = ilya.activeWeaponClass
local pidorok = 4
if sosuhui == "rust_woodenspear" or "rust_stonespear" then
    pidorok = 0.645
else
    pidorok = 1
end
local cli = 0

hook.Add("Think", "123", function()
    local w = me:GetActiveWeapon()
    if not IsValid(me) then return end
    if not IsValid(w) then return end

    if me:KeyDown(IN_ATTACK) and gandon[w:GetClass()] and me:Alive() then
        if CurTime() >= cli then
            cli = CurTime() + pidorok
            RunConsoleCommand("+attack2")
            timer.Simple(0.00001, function() RunConsoleCommand("-attack2") end)
        end
    end
end)*/

/*
    Render Scene / Anti screengrab
*/
ilya.UnSafeFrame = false
ilya.renderTarget = GetRenderTarget( "YaPidoras" .. os.time(), scrw, scrh )

do
    local oldsky, oldskycolor, oldwallcolor = ilya.cfg.vars["Custom sky"], ilya.cfg.vars["Sky color"], ilya.cfg.vars["Wall color"]
    local oldskyclr, oldwallclr = ilya.cfg.colors["Sky color"], ilya.cfg.colors["Wall color"]

    local worldcollerp = string_ToColor( ilya.cfg.colors["Wall color"] )
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
        local cfg = string_ToColor( ilya.cfg.colors["Sky color"] )
        local vector = setcolor and Vector( cfg.r/255, cfg.g/255, cfg.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, 6 do
            skymat[i]:SetVector( "$color", vector )
        end
    end



    local function setWallColor( setcolor )
        local cfg = string_ToColor( ilya.cfg.colors["Wall color"] )
        worldcollerp = ilya.ColorLerp( worldcollerp, cfg )
        local vector = setcolor and Vector( worldcollerp.r/255, worldcollerp.g/255, worldcollerp.b/255 ) or Vector( 1, 1, 1 )

        for i = 1, #worldmats do
            local value = worldmats[i]

            Material( value ):SetVector( "$color", vector )
            Material( value ):SetFloat( "$alpha", setcolor and (cfg.a / 255) or 255 )
        end
    end

    function ilya.hRenderScene()

        local newname, newcolor, newcolor2 = ilya.cfg.vars["Custom sky"], ilya.cfg.vars["Sky color"], ilya.cfg.vars["Wall color"]
        local newskyclr, newwallclr = ilya.cfg.colors["Sky color"],ilya.cfg.colors["Wall color"]

        if newskyclr != oldskyclr or newcolor != oldskycolor then
            setSkyColor( newcolor )

            oldskyclr = newskyclr
            oldskycolor = newcolor
        end

        if newwallclr != tostring( worldcollerp ) or newcolor2 != oldwallcolor then
            setWallColor( newcolor2 )

            oldwallcolor = newcolor2
        end

        if newname != oldsky then
            setSkyboxTexture( newname )
            oldsky = newname
        end

        // Esp shit

        if ( !gui.IsConsoleVisible() && !gui.IsGameUIVisible() ) || ilya.UnSafeFrame then
            local view = {
                x = 0,
                y = 0,
                w = scrw,
                h = scrh,
                dopostprocess = true,
                origin = vOrigin,
                angles = vAngle,
                fov = vFOV,
                drawhud = true,
                drawmonitors = true,
                drawviewmodel = true
            }

            render_RenderView( view )
            render.CopyTexture( nil, ilya.renderTarget )

            cam_Start2D()
                hook_Run( "Ungrabbable2D" )
            cam_End2D()

            cam_Start3D()
                hook_Run( "Ungrabbable3D" )
            cam_End3D()

            render.SetRenderTarget( ilya.renderTarget )

            return true
        end
    end

end

function render.Capture( data )
    ilya.PreScreenGrab()

    if ilya.cfg.vars["Screengrab image"] then
        cam.Start2D()
            render.DrawTextureToScreen( ilya.prikol )
        cam.End2D()
    end

	return render_Capture( data )
end

function ilya.Shutdown()
    render.SetRenderTarget()
end

function _G.render.Capture( data )
    ilya.PreScreenGrab()

    if ilya.cfg.vars["Screengrab image"] then
        cam.Start2D()
            render.DrawTextureToScreen( ilya.prikol )
        cam.End2D()
    end

	return render_Capture( data )
end

function ilya.PreScreenGrab()
    if ilya.UnSafeFrame then return end
	ilya.UnSafeFrame = true

	render_Clear( 0, 0, 0, 255, true, true )
	render_RenderView( {
		origin = me:EyePos(),
		angles = me:EyeAngles(),
		x = 0,
		y = 0,
		w = scrw,
		h = scrh,
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	} )

	ilya.UnSafeFrame = false
end


       





/*
    ESP, Chams
*/

function ilya.IsValidPlayer(pl)
    if pl == me then return false end
    if not IsValid(pl) then return false end
    if not pl:Alive() then return false end


    return true
end

function ilya.GetEntPos(ent)
    local min, max = ent:OBBMins(), ent:OBBMaxs()

    local points = {
        Vector( max.x, max.y, max.z ),
        Vector( max.x, max.y, min.z ),
        Vector( max.x, min.y, min.z ),
        Vector( max.x, min.y, max.z ),
        Vector( min.x, min.y, min.z ),
        Vector( min.x, min.y, max.z ),
        Vector( min.x, max.y, min.z ),
        Vector( min.x, max.y, max.z )
    }

    local MaxX, MinX, MaxY, MinY
    local isVisible = false

    for i = 1, #points do
        local v = points[i]
        local p = ent:LocalToWorld( v ):ToScreen()
        isVisible = p.visible

		if MaxX != nil then
            MaxX, MaxY, MinX, MinY = math_max( MaxX, p.x ), math_max( MaxY, p.y), math_min( MinX, p.x ), math_min( MinY, p.y)
        else
            MaxX, MaxY, MinX, MinY = p.x, p.y, p.x, p.y
        end

    end

    return MaxX, MaxY, MinX, MinY, isVisible
end

function ilya.getTextX(tw,pos)
    if pos == 1 or pos == 2 then
        return tw/2
    elseif pos == 3 then
        return 0
    elseif pos == 4 then
        return tw
    end
end

function ilya.getTextY(max,min,th,pos,tbpos)
    if pos == 1 then
        return min-th-th*tbpos
    elseif pos == 2 then
        return max+th*tbpos
    elseif pos == 3 then
        return min+th*tbpos
    elseif pos == 4 then
        return min+th*tbpos
    end
end

function ilya.SortByDistance( f, s )
    return f[1]:GetPos():DistToSqr( EyePos() ) > s[1]:GetPos():DistToSqr( EyePos() )
end

function ilya.GenerateArrowPoss(x, y, scale, ang)
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

function ilya.DrawOutlinedPoly( poly )
    local last = nil
    for i = 1, #poly do
        local v = poly[ i ]
        if last then
            surface_DrawLine(last.x, last.y, v.x, v.y)
            last = v
        else
            last = v
        end
    end
    surface_DrawLine(last.x, last.y, poly[1].x, poly[1].y)
end

ilya.Fonts = {
    [1] = "veranda",
    [2] = "veranda_s",
    [3] = "thug",
    [4] = "arial",
}

/*local PLAYER = FindMetaTable("Player")
PLAYER.gRust = true
function PLAYER:HealthHUI(health)
    return self:Health("Health",1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100)
end

function PLAYER:GetHP(health)
    return self:Health(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100)
end

function PLAYER:GetMaxHP(health)
    return self:GetMaxHealth("Health",100)
end*/

function ilya.DrawESP()
    local d = ilya.cfg.vars["ESP Distance"]
    local ed = ilya.cfg.vars["Ent ESP Distance"]
    local pos = me:GetPos()
    d = d * d
    ed = ed * ed

    surface_SetFont( ilya.Fonts[ ilya.cfg.vars["ESP Font"] ] )

    if ilya.cfg.vars["Ent box 3d"] then
        cam_Start3D()
            for i = 1, #ilya.entityCache do
                local v = ilya.entityCache[ i ]

                if not IsValid( v.entity ) then return end

                if v.position:DistToSqr( pos ) > ed then continue end

                render_DrawWireframeBox( v.position, v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), ilya.Colors[255], true )
            end
        cam_End3D()
    end

    for i = 1, #ilya.entityCache do
        local v = ilya.entityCache[ i ]

        if not IsValid( v.entity ) then return end

        if v.position:DistToSqr( pos ) > ed then continue end

        local MaxX, MaxY, MinX, MinY, isVisible = ilya.GetEntPos( v.entity )
        local XLen, YLen = MaxX - MinX, MaxY - MinY

        if not isVisible then continue end

        surface_SetAlphaMultiplier( v.entity:IsDormant() and 0.35 or 1 )

        surface_SetTextColor( ilya.Colors[255] )

        if ilya.cfg.vars["Ent box"] and not ilya.cfg.vars["Ent box 3d"] then
            surface_SetDrawColor( 0, 0, 0 )
            surface_DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)

            surface_SetDrawColor( 255, 255, 255 )
            surface_DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
        end

        if ilya.cfg.vars["Ent class"] then
            local tw, th = surface_GetTextSize( v.class )

            surface_SetTextPos( ( MaxX + (MinX - MaxX) / 2 ) - tw / 2 , MinY - th )
            surface_DrawText( v.class )
        end
    end

    local plys = player_GetAll()

    local color_box     = string_ToColor( ilya.cfg.colors["Box esp"] )
    local color_box_g   = string_ToColor( ilya.cfg.colors["Box gradient"] )
    local color_arrow   = string_ToColor( ilya.cfg.colors["OOF Arrows color"] )

    local myEyePos = me:EyePos()

    for i = 1, #plys do
        local v = plys[i]

        if not ilya.IsValidPlayer(v) or not ilya.playerCache[ v ] then continue end

        local vp = ilya.playerCache[ v ].GetPos
        local distance = vp:DistToSqr(pos)
		if distance > d then continue end

        surface_SetAlphaMultiplier( v:IsDormant() and 0.35 or 1 )

        local MaxX, MaxY, MinX, MinY, isVisible = ilya.GetEntPos( v )
        local XLen, YLen = MaxX - MinX, MaxY - MinY

        local teamcolor = ilya.playerCache[ v ].TeamColor

        if ilya.cfg.vars["OOF Arrows"] then
            local xScale, yScale = scrw / 250, scrh / 250
            local xScale, yScale = xScale * 50, yScale * 50

            local angle = ( v:EyePos() - myEyePos ):Angle()
            local addPos = Angle(0, (ilya.SilentAngle.y - angle.y) - 90, 0):Forward()
            local pos = Vector(scrw / 2, scrh / 2, 0) + Vector(addPos.x * xScale, addPos.y * yScale, 0)

            if math.abs( math.NormalizeAngle(angle.y - ilya.SilentAngle.y) ) >= 60 then
                local poly = ilya.GenerateArrowPoss(pos.x, pos.y, 16, (ilya.SilentAngle.y - angle.y) - 90)
                local poly1 = ilya.GenerateArrowPoss(pos.x, pos.y, 17, (ilya.SilentAngle.y - angle.y) - 90)
                local poly2 = ilya.GenerateArrowPoss(pos.x, pos.y, 15, (ilya.SilentAngle.y - angle.y) - 90)

                if ilya.cfg.vars["OOF Style"] == 1 then
                    surface_SetDrawColor( ilya.Colors[0] )
                    ilya.DrawOutlinedPoly( poly1 )
                    ilya.DrawOutlinedPoly( poly2 )

                    surface_SetDrawColor(  ilya.cfg.vars["OOF team color"] and teamcolor or color_arrow )
                    ilya.DrawOutlinedPoly( poly )
                else
                    local ang2 = Angle(0, (ilya.SilentAngle.y - angle.y) - 90 + 120, 0):Forward() * (scale - 1)
                    surface_SetDrawColor( teamcolor )

                    surface_DrawLine( pos.x, pos.y, pos.x, pos.y + ang2.y )
                    surface_DrawLine(last.x, last.y, v.x, v.y)
                    surface_DrawLine(last.x, last.y, v.x, v.y)
                    surface_DrawLine(last.x, last.y, v.x, v.y)
                end

            end
        end






        if not isVisible then continue end

        if ilya.cfg.vars["Box esp"] then
            if ilya.cfg.vars["Box style"] == 1 then
                surface_SetDrawColor(ilya.Colors[0])
                surface_DrawOutlinedRect(MinX-1,MinY-1,XLen+2,YLen+2,3)

                surface_SetDrawColor( ilya.cfg.vars["Box team color"] and teamcolor or color_box )
                surface_DrawOutlinedRect(MinX,MinY,XLen,YLen,1)
            elseif ilya.cfg.vars["Box style"] == 2 then
                local wlen, hlen = math_floor( XLen / 3 ), math_floor( YLen / 3 )

                surface_SetDrawColor(ilya.Colors[0])

                // Left up
                surface_DrawRect( MinX - 1, MinY - 1, wlen, 3 )
                surface_DrawRect( MinX - 1, MinY - 1, 3, hlen )

                // Right up
                surface_DrawRect( MaxX - wlen + 2, MinY - 1, wlen, 3 )
                surface_DrawRect( MaxX - 1, MinY - 1, 3, hlen )

                // Left down
                surface_DrawRect( MinX - 1, MaxY - 2, wlen, 3 )
                surface_DrawRect( MinX - 1, MaxY - hlen, 3, hlen )

                // Right down
                surface_DrawRect( MaxX - wlen + 2, MaxY - 2, wlen, 3 )
                surface_DrawRect( MaxX - 1, MaxY - hlen, 3, hlen )

                surface_SetDrawColor( ilya.cfg.vars["Box team color"] and teamcolor or color_box )

                wlen = wlen - 2
                hlen = hlen - 2

                // Left up
                surface_DrawRect( MinX, MinY, wlen, 1 )
                surface_DrawRect( MinX, MinY, 1, hlen )

                // Right up
                surface_DrawRect( MaxX - wlen + 1, MinY, wlen, 1 )
                surface_DrawRect( MaxX, MinY, 1, hlen )

                // Left down
                surface_DrawRect( MinX, MaxY - 1, wlen, 1 )
                surface_DrawRect( MinX, MaxY - hlen - 1, 1, hlen )

                // Right down
                surface_DrawRect( MaxX - wlen + 1, MaxY - 1, wlen, 1 )
                surface_DrawRect( MaxX, MaxY - hlen - 1, 1, hlen )
            elseif ilya.cfg.vars["Box style"] == 3 then
                local wlen, hlen = math_floor( XLen / 3 ), math_floor( YLen / 3 )
                local xc = math_floor( XLen / 2 )

                surface_SetDrawColor(ilya.Colors[0])

                // Left
                surface_DrawRect( MinX - 1, MinY - 1 + hlen, 3, hlen )

                surface_DrawLine( MinX - 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )
                surface_DrawLine( MinX + 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )

                surface_DrawLine( MinX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )
                surface_DrawLine( MinX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )

                // Right
                surface_DrawRect( MaxX - 1, MinY - 1 + hlen, 3, hlen )

                surface_DrawLine( MaxX - 1, MinY - 1 + hlen, MinX + xc, MinY + 1 )
                surface_DrawLine( MaxX + 1, MinY - 1 + hlen, MinX + xc, MinY - 1 )

                surface_DrawLine( MaxX - 1, MinY - 2 + hlen * 2, MinX + xc, MinY - 1 + YLen )
                surface_DrawLine( MaxX + 1, MinY - 2 + hlen * 2, MinX + xc, MinY + 1 + YLen )

                surface_SetDrawColor( ilya.cfg.vars["Box team color"] and teamcolor or color_box )

                // Left
                surface_DrawRect( MinX, MinY + hlen - 1, 1, hlen )
                surface_DrawLine( MinX, MinY - 1 + hlen, MinX + xc, MinY )
                surface_DrawLine( MinX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )

                // Right
                surface_DrawRect( MaxX, MinY + hlen - 1, 1, hlen )
                surface_DrawLine( MaxX, MinY - 1 + hlen, MinX + xc, MinY )
                surface_DrawLine( MaxX, MinY - 2 + hlen * 2, MinX + xc, MinY + YLen )
            elseif ilya.cfg.vars["Box style"] == 4 then
                local wlen, hlen = math_floor( XLen / 3 ) + 3, math_floor( YLen / 3 ) + 3
                local x, y, xw, xh = MinX - 3, MinY - 3, MaxX + 3, MaxY + 3
                local polys = {}

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

                    surface_SetDrawColor( i == 2 and teamcolor or ilya.Colors[0] )
                    ilya.DrawOutlinedPoly( polys )

                    wlen, hlen = wlen - i, hlen - i

                    y, x = y + i, x + i
                    xw, xh = xw - i, xh - i
                end
            elseif ilya.cfg.vars["Box style"] == 5 then


                surface_DrawLine( MaxX, MaxY, MinX + XLen * 0.7, MaxY)
                surface_DrawLine( MinX, MaxY, MinX + XLen * 0.3, MaxY)
                surface_DrawLine( MaxX, MaxY, MaxX, MinY + YLen * 0.75)
                surface_DrawLine( MaxX, MinY, MaxX, MinY + YLen * 0.25)
                surface_DrawLine( MinX, MinY, MaxX - XLen * 0.7, MinY )
                surface_DrawLine( MaxX, MinY, MaxX - XLen * 0.3, MinY )
                surface_DrawLine( MinX, MinY, MinX, MaxY - YLen * 0.75)
                surface_DrawLine( MinX, MaxY, MinX, MaxY - YLen * 0.25)

                surface_SetDrawColor( ilya.cfg.vars["Box team color"] and teamcolor or color_box )








            end
        end

        // Sight lines

        if ilya.cfg.vars["Sight lines"] then
            local tr = v:GetEyeTrace()
            local startpos, hitpos = tr.StartPos:ToScreen(), tr.HitPos:ToScreen()

            surface_SetDrawColor( string_ToColor(ilya.cfg.colors["Sight lines"]) )
            surface_DrawLine( startpos.x, startpos.y, hitpos.x, hitpos.y )
        end

        // text

        local ttbl = { [1] = 0, [2] = 0, [3] = 0, [4] = 0 }
        local poses = { [1] = MaxX + (MinX - MaxX) / 2, [3] = MaxX+5, [4] = MinX-5 }
        poses[2] = poses[1]


        if ilya.cfg.vars["Name"] then
            local name = ilya.playerCache[ v ].Name
            local pos = ilya.cfg.vars["Name pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextColor( string_ToColor(ilya.cfg.colors["Name"]) )
            surface_SetTextPos(poses[pos]-ilya.getTextX(tw,pos),ilya.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ilya.cfg.vars["Usergroup"] then
            local name = ilya.playerCache[ v ].GetUserGroup
            local pos = ilya.cfg.vars["Usergroup pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextColor( string_ToColor(ilya.cfg.colors["Usergroup"]) )
            surface_SetTextPos(poses[pos]-ilya.getTextX(tw,pos),ilya.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ilya.cfg.vars["Weapon"] then
            local name = ilya.cfg.vars["Show ammo"] and ilya.playerCache[ v ].WeaponClass .. " (" .. ilya.playerCache[ v ].WeaponAmmo .. ")" or ilya.playerCache[ v ].WeaponClass

            if ilya.cfg.vars["Show reloading"] then
                for i = 0, 13 do
                    if v:IsValidLayer(i) then
                        if v:GetSequenceActivityName(v:GetLayerSequence(i)):find("RELOAD") then
                            name = "RELOADING"
                            break
                        end
                    end
                end
            end

            local pos = ilya.cfg.vars["Weapon pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextColor( string_ToColor(ilya.cfg.colors["Weapon"]) )
            surface_SetTextPos(poses[pos]-ilya.getTextX(tw,pos),ilya.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ilya.cfg.vars["Armor"] then
            local name = ilya.playerCache[ v ].Armor
            local pos = ilya.cfg.vars["Armor pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextColor( string_ToColor(ilya.cfg.colors["Armor"]) )
            surface_SetTextPos(poses[pos]-ilya.getTextX(tw,pos),ilya.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ilya.cfg.vars["Team"] then
            local name = ilya.playerCache[ v ].TeamName
            local pos = ilya.cfg.vars["Team pos"]
            local tw, th = surface_GetTextSize(name)

            if ilya.cfg.vars["Team colorSUCK"] then
                surface_SetTextColor( teamcolor )
            elseif not ilya.cfg.vars["Team colorSUCK"] then
                surface_SetTextColor( string_ToColor(ilya.cfg.colors["Team"]) )
            end


            surface_SetTextPos(poses[pos]-ilya.getTextX(tw,pos),ilya.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ilya.cfg.vars["DarkRP Money"] then
            local name = ilya.playerCache[ v ].MoneyVar
            local pos = ilya.cfg.vars["Money pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextColor( string_ToColor(ilya.cfg.colors["DarkRP Money"]) )
            surface_SetTextPos(poses[pos]-ilya.getTextX(tw,pos),ilya.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        local health = ilya.playerCache[ v ].Health

        if ilya.cfg.vars["Health bar"] then
            local maxhealth = ilya.playerCache[ v ].GetMaxHealth

			local healthfrac = math_min( health / maxhealth, 1 )
		    local height = math_floor( healthfrac * YLen )

            surface_SetDrawColor( 0, 0, 0 )
            surface_DrawRect( MinX-6, MinY-1, 4, YLen+2 )

			surface_SetDrawColor( string_ToColor( ilya.cfg.colors["Health"] ) )
			surface_DrawRect(MinX - 5, MinY+YLen-height, 2, height)

            if ilya.cfg.vars["Health bar gradient"] then
                surface_SimpleTexturedRect( MinX - 5, MinY+YLen-height, 2, height, string_ToColor( ilya.cfg.colors["Health bar gradient"] ) , ilya.Materials["Gradient"] )
            end
            if ilya.cfg.vars["Health bar gradient grust"] then
                surface_SimpleTexturedRect( MinX - 5, MinY+YLen-height, 2, height, string_ToColor( ilya.cfg.colors["Health bar gradient"] ) , ilya.Materials["Gradient"] )
            end
        end

        if ilya.cfg.vars["Print Distance"] then
            local distance_in_units = vp:DistToSqr(pos) -- расстояние в игровых единицах
            local rounded_distance = math.floor(math.sqrt(distance_in_units)) -- берем корень и округляем

            local pos = ilya.cfg.vars["Print Distance pos"]
            local tw, th = surface_GetTextSize(tostring(rounded_distance)) -- преобразуем в строку
            surface_SetTextPos(poses[pos] - ilya.getTextX(tw, pos), ilya.getTextY(MaxY, MinY, th, pos, ttbl[pos]))

            -- Отображаем округленное расстояние в юнитах
            surface_DrawText(tostring(rounded_distance))

            ttbl[pos] = ttbl[pos] + 0.8
            surface_SetDrawColor(string_ToColor(ilya.cfg.colors["Print Distance"]))
        end



        if ilya.cfg.vars["Health"] then
            local pos = ilya.cfg.vars["Health pos"]
            local tw, th = surface_GetTextSize(health)

            surface_SetTextPos(poses[pos]-ilya.getTextX(tw,pos),ilya.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(health)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ilya.cfg.vars["Break LC"] and v.break_lc then
            local name = "Breaking LC"
            local pos = ilya.cfg.vars["Break LC pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextColor( string_ToColor(ilya.cfg.colors["Break LC"]) )
            surface_SetTextPos(poses[pos]-ilya.getTextX(tw,pos),ilya.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ilya.cfg.vars["Simtime updated"] then
            local name = v.simtime_updated and "Updated" or "Same"
            local pos = ilya.cfg.vars["Simtime pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextColor( string_ToColor(ilya.cfg.colors["Simtime updated"]) )
            surface_SetTextPos(poses[pos]-ilya.getTextX(tw,pos),ilya.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ilya.cfg.vars["IFOV"] then
            local angle = ( v:EyePos() - myEyePos ):Angle()
            local infov = math_abs( math_NormalizeAngle( angle.y ) ) > 75
            local name = infov and "Я БЛЯТЬ В FOV!" or "Я СЬЕБАЛСЯ С FOV!"
            local pos = ilya.cfg.vars["Simtime pos"]
            local tw, th = surface_GetTextSize(name)

            surface_SetTextColor( string_ToColor(ilya.cfg.colors["IFOV"]) )
            surface_SetTextPos(poses[pos]-ilya.getTextX(tw,pos),ilya.getTextY(MaxY,MinY,th,pos,ttbl[pos]))
            surface_DrawText(name)

            ttbl[pos] = ttbl[pos] + 0.8
        end

        if ilya.cfg.vars["Skeleton"] then
            surface_SetDrawColor( string_ToColor( ilya.cfg.colors["Skeleton"] ) )

		    for i = 0, v:GetBoneCount() - 1 do

			    local parent = v:GetBoneParent(i)

			    if(!parent) then continue end

			    local bonepos = v:GetBonePosition(i)

			    if(bonepos == v:GetPos() ) then continue end

			    local parentpos = v:GetBonePosition(parent)

			    if(!bonepos or !parentpos) then continue end

			    local screen1, screen2 = bonepos:ToScreen(),parentpos:ToScreen()

			    surface_DrawLine(screen1.x,screen1.y,screen2.x,screen2.y)
		    end
        end

        if ilya.cfg.vars["Hitbox"] then

            if v:GetHitBoxGroupCount() != nil then
                for group = 0, v:GetHitBoxGroupCount() - 1 do
                    for hitbox = 0, v:GetHitBoxCount( group ) - 1 do
                        local pos, ang = v:GetBonePosition( v:GetHitBoxBone(hitbox, group) )
                        local mins, maxs = v:GetHitBoxBounds(hitbox, group)
                        cam_Start3D()
                        render_DrawWireframeBox( pos, ang, mins, maxs, string_ToColor(ilya.cfg.colors["Hitbox"]), true)
                        cam_End3D()
                    end
                end

            end

        end

        if ilya.cfg.vars["Show records"] and ilya.canBacktrack(v) then
            local len = #ilya.btrecords[ v ]

            for i = 1, len do
                local pos = ( ilya.btrecords[v][i].aimpos ):ToScreen()
                surface_SetDrawColor( ilya.backtracktick == i and ilya.Colors["Red"] or ilya.Colors[255] )
                surface_DrawRect(pos.x,pos.y,2,2)
            end
        end

        if ilya.cfg.vars["Backtrack skeleton"] and ilya.canBacktrack(v) then
            local len = #ilya.btrecords[ v ]

            surface_SetDrawColor( ilya.Colors[255] )

            for i = 1, len do
                local data = ilya.btrecords[ v ][ i ].skeleton

                for nbone = 1, #data do
                    local screen1, screen2 = data[nbone][1]:ToScreen(), data[nbone][2]:ToScreen()

                    surface_DrawLine(screen1.x,screen1.y,screen2.x,screen2.y)
                end
            end
        end
    end

    surface_SetAlphaMultiplier(1)
end


surface.CreateFont("DTFont", { font = "Verdana", size = 15, antialias = false, outline = true } )

ilya.fovColor = Color( 255, 255, 255 )
ilya.gradFov = false

ilya.antiboba = function(text, maxChars)
    local str = ""

    for i=1, maxChars do
        str = str .. (text[i] || "")
    end

    return str
end






//ilya.bgmaterial = Material( "a/paws.png", "noclamp smooth" )



do
    local lc, blc = Color(125,255,64), Color(255,64,125)

    local indx, indy = scrw / 2 - 100, scrh/2 + 250
    local charge = 0

    local gradcolor, chargedcolor, unchargedcolor = Color(200,200,200,128), Color(0,255,128), Color(255,155,0)

    local chargestate, ccharge, chargecolor = "NOT CHARGED", 0, chargedcolor
    local watermarkx = scrw + 245
    local watermarkc = Color( 232, 232, 232, 235)

    function ilya.DrawSomeShit()

        //if ilya.frame:IsVisible() then
        //    surface_SetDrawColor( ilya.accent )
        //    surface_SetMaterial( ilya.bgmaterial )
        //    surface_DrawTexturedRect( 0, 0, scrw, scrh )
        //end

        surface_SetFont("DTFont")

        if ilya.cfg.vars["Trails"] then
            local alpha = math.abs(math.sin(CurTime() * ilya.cfg.vars["Trails move"]) * 255)
            local hsv = string.ToColor(ilya.cfg.colors["Trails"])
            local fadedColor = Color(hsv.r, hsv.g, hsv.b, alpha)
            surface_SetDrawColor(hsv.r, hsv.g, hsv.b)
            for i = 1, #ilya.trailpos-1 do
                local pos = ilya.trailpos[i]:ToScreen()
                local prevpos = ilya.trailpos[i+1]:ToScreen()
                if pos and prevpos then
                    surface_SetDrawColor(fadedColor)
                    surface_DrawLine(pos.x, pos.y, prevpos.x, prevpos.y)
                end
            end
        end
        ilya.trailpos[#ilya.trailpos+1] = LocalPlayer():GetPos()

        if #ilya.trailpos > 1 * ilya.cfg.vars["Trails distance"] then
            table.remove(ilya.trailpos, 1)
        end

        if ilya.cfg.vars["Velocity crosshair"] then
            local sSDC = surface_SetDrawColor
            sSDC(string.ToColor(ilya.cfg.colors["Velocity crosshair"]))
            surface_SetMaterial(Material("vgui/white"))
            draw.Circle(scrwc, scrhc, me:GetVelocity():Length() / 4, 180)
        end

        if ilya.cfg.vars["Key strokes"] then
            local function AddKeySquare(text, key, x, y)
                local rainbow_col = HSVToColor((CurTime() * 50) % 360, 1, 1)
                local color_white = Color(255, 255, 255)
                local color_black = Color(20, 20, 20)
                local gray = Color(30, 30, 30)
                local size = 35
                if me:KeyDown(key) then
                    surface_SetDrawColor(rainbow_col.r, rainbow_col.g, rainbow_col.b)
                    surface_DrawRect(x, y, size * 3, size)
                    draw.SimpleText("" .. text .. "", "KeyStroke", x + 26, y + 7, color_black)
                else
                    surface_SetDrawColor(gray)
                    surface_DrawRect(x, y, size * 3, size)
                    draw.SimpleText("" .. text .. "", "KeyStroke", x + 26, y + 7, color_white)
                end
            end
            local function AddKeyRectangle(text, key, x, y)
                local rainbow_col = HSVToColor((CurTime() * 50) % 360, 1, 1)
                local color_white = Color(255, 255, 255)
                local color_black = Color(20, 20, 20)
                local gray = Color(30, 30, 30)
                local size = 35
                surface_SetDrawColor(rainbow_col.r, rainbow_col.g, rainbow_col.b, 100)
                if me:KeyDown(key) then
                    surface_DrawRect(x, y, size, size)
                    draw.SimpleText("" .. text .. "", "KeyStroke", x + 11, y + 7, color_black)
                else
                    surface_SetDrawColor(gray)
                    surface_DrawRect(x, y, size, size)
                    draw.SimpleText("" .. text .. "", "KeyStroke", x + 11, y + 7, color_white)
                end
            end
            local function AddKeyRectangleMouse(text, key, x, y)
                local rainbow_col = HSVToColor((CurTime() * 50) % 360, 1, 1)
                local color_white = Color(255, 255, 255)
                local color_black = Color(20, 20, 20)
                local gray = Color(30, 30, 30)
                local size = 53
                surface_SetDrawColor(rainbow_col.r, rainbow_col.g, rainbow_col.b, 100)
                if me:KeyDown(key) then
                    surface_DrawRect(x, y, size, 35)
                    draw.SimpleText("" .. text .. "", "KeyStroke", x + 11, y + 7, color_black)
                else
                    surface_SetDrawColor(gray)
                    surface_DrawRect(x, y, size, 35)
                    draw.SimpleText("" .. text .. "", "KeyStroke", x + 11, y + 7, color_white)
                end
            end

            AddKeyRectangle("W", IN_FORWARD, 35, 550)
            AddKeyRectangle("A", IN_MOVELEFT, 0, 550 + 35)
            AddKeyRectangle("D", IN_MOVERIGHT, 70, 550 + 35)
            AddKeyRectangle("S", IN_BACK, 35, 550 + 35)
            AddKeyRectangleMouse("LMB", IN_ATTACK, 0, 550 + 70)
            AddKeyRectangleMouse("RMB", IN_ATTACK2, 52, 550 + 70)
            AddKeySquare("SPACE", IN_JUMP, 0, 550 + 105)
        end

        if ilya.cfg.vars["Indicators"] then

            local latency = math_Round( ( ded.GetLatency(0) + ded.GetLatency(1) ) * 1000 )


            surface_SimpleText(38,scrh-120,"LC",me.break_lc and blc or lc)
            surface_SimpleText(38,scrh-140,"FT: "..ilya.fakeLagTicks,ilya.SendPacket and blc or lc)
            surface_SimpleText(38,scrh-160,math_Round(me:GetVelocity():Length2D()),lc)
            surface_SimpleText(38,scrh-180,"AT: "..latency.." ms",latency > 50 and blc or lc)

        end
        if ilya.cfg.vars["Auto Vape"] then
            surface_SimpleText(38,scrh-220,"Vape: ", ilya.tyaga == 0 and blc or lc)

            surface_SetDrawColor( 0, 0, 0 )
            surface_DrawRect( 78, scrh-219, 60, 14 )

            surface_SetDrawColor( lc )
            surface_DrawRect( 79, scrh-218, ilya.tyaga / ilya.maxvape * 58, 12 )
        end




        if ilya.cfg.vars["Tickbase shift"] and ilya.cfg.vars["Tickbase indicator"] then
            /*local max, cur = ilya.cfg.vars["Charge ticks"], ded.GetCurrentCharge()
            local dtw = cur / max * 30

            local x, y = scrwc - 7, scrhc + 10

            surface_SimpleText( x, y, "DT", blc ) //

            render.SetScissorRect( x, y, x + dtw, y + 30, true )
                surface_SimpleText( x, y, "DT", lc )
            render.SetScissorRect( 0, 0, 0, 0, false )*/

            if ded.GetCurrentCharge() <= ilya.cfg.vars["Shift ticks"] then
                ccharge = ded.GetCurrentCharge() * 196 / ilya.cfg.vars["Shift ticks"]
            end

            charge = math_Approach(charge,ccharge,FrameTime()*700)

            if ded.GetCurrentCharge() == 0 then
                chargestate = "NO CHARGE"
                chargecolor = unchargedcolor
            elseif ded.GetCurrentCharge() < ilya.cfg.vars["Shift ticks"] and ilya.IsKeyDown( ilya.cfg.binds["Auto recharge"] ) then
                chargestate = "CHARGING"
                chargecolor = unchargedcolor
            else
                chargestate = "READY"
                chargecolor = chargedcolor
            end

            local tw, th = surface_GetTextSize(chargestate)

            surface_SetDrawColor(ilya.Colors[12])
            surface_DrawRect(indx,indy,200,30)

            surface_SetDrawColor(chargecolor)
            surface_DrawRect(indx+2,indy+2,charge,26)

            surface_SimpleTexturedRect(indx+2,indy+2,charge,26,gradcolor,ilya.Materials["Gradient right"])

            surface_SimpleText(indx+2,indy-20,"CHARGE "..ded.GetCurrentCharge(),ilya.Colors[245])
            surface_SimpleText(indx+196-tw,indy-20,chargestate,ilya.Colors[245])
        end


        local CT = CurTime()
        local FT = FrameTime() * 128

        if ilya.cfg.vars["Hitmarker"] and #ilya.hitmarkers > 0 then
            local hm = string_ToColor( ilya.cfg.colors["Hitmarker"] )

            surface_SetDrawColor( hm )

            for i = #ilya.hitmarkers, 1, -1  do
                local v = ilya.hitmarkers[ i ]

                if v.time < CT - 1 then table_remove( ilya.hitmarkers, i ) continue end

                v.add = math_Approach( v.add, v.add - (CT - 1) * 5, FT )

                surface_DrawLine( scrwc - v.add, scrhc - v.add, scrwc - 10 - v.add, scrhc - 10 - v.add )
                surface_DrawLine( scrwc + v.add, scrhc - v.add, scrwc + 10 + v.add, scrhc - 10 - v.add )
                surface_DrawLine( scrwc - v.add, scrhc + v.add, scrwc - 10 - v.add, scrhc + 10 + v.add )
                surface_DrawLine( scrwc + v.add, scrhc + v.add, scrwc + 10 + v.add, scrhc + 10 + v.add )
            end
        end

        if ilya.cfg.vars["Hitnumbers"] and #ilya.hitnums > 0 then
            local n, c = string_ToColor( ilya.cfg.colors["Hitnumbers"] ), string_ToColor( ilya.cfg.colors["Hitnumbers krit"] )

            surface_SetFont( "veranda_scr" )

            for i = #ilya.hitnums, 1, -1 do
                local v = ilya.hitnums[ i ]

                if v.time < CT - 1 then table_remove( ilya.hitnums, i ) continue end

                surface_SetTextColor( v.crit and c or n )

                v.add = math_Approach( v.add, v.add - (CT - 1) * 5, FT / 2 )

                surface_SetTextPos( scrwc - v.add * v.xdir, scrhc - v.add * v.ydir )
                surface_DrawText( v.dmg )
            end
        end

if ilya.cfg.vars["crosshair"] then
            local centerX = ScrW() / 2
            local centerY = ScrH() / 2
            local crosshairType = ilya.cfg.vars["crosshair_type"]

            ilya.RotationAngle = ilya.RotationAngle or 0
            local scale = ilya.cfg.vars["uber_alles_scale"]
            local speed = ilya.cfg.vars["uber_alles_speed"]
            local crosshairColor = string_ToColor(ilya.Colors["crosshair_color"])
            local outlineColor = string_ToColor(ilya.Colors["crosshair_outline"])

            local frameTime = FrameTime()
            ilya.RotationAngle = ilya.RotationAngle - (frameTime * speed)

            if ilya.RotationAngle <= -180 then
                ilya.RotationAngle = ilya.RotationAngle + 180
            elseif ilya.RotationAngle >= 180 then
                ilya.RotationAngle = ilya.RotationAngle - 180
            end

            if crosshairType == 1 then
                local function DrawCrosshairLine(red, x, y)
                if red == 0 then
                    surface.SetDrawColor(outlineColor.r, outlineColor.g, outlineColor.b, outlineColor.a)
                else
                    surface.SetDrawColor(crosshairColor.r, crosshairColor.g, crosshairColor.b, crosshairColor.a)
                end

                local points = {}
                local angle1_rad = math.rad(ilya.RotationAngle - 90)
                points[1] = math.floor(scale * math.sin(angle1_rad))
                points[2] = math.floor(scale * math.cos(angle1_rad))
                points[3] = math.floor(scale * math.cos(angle1_rad + 1))

                local angle2_rad = math.rad(ilya.RotationAngle)
                points[4] = math.floor(scale * math.sin(angle2_rad))
                points[5] = math.floor(scale * math.cos(angle2_rad))
                points[6] = math.floor(scale * math.sin(angle2_rad + 1))

                local angle3_rad = math.rad(ilya.RotationAngle + 90)
                points[7] = math.floor(scale * math.sin(angle3_rad))
                points[8] = math.floor(scale * math.cos(angle3_rad))
                points[9] = math.floor(scale * math.cos(angle3_rad + 1))

                local angle4_rad = math.rad(ilya.RotationAngle + 180)
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
                    local angle = ilya.RotationAngle + (i * 360 / numCircles)
                    local angleRad = math.rad(angle)

                    local circleX = centerX + orbitRadius * math.cos(angleRad)
                    local circleY = centerY + orbitRadius * math.sin(angleRad)

                    DrawCircle(circleX, circleY, circleRadius + 1, 12, outlineColor)
                    DrawCircle(circleX, circleY, circleRadius, 12, crosshairColor)
                end
            end
        end




        if ilya.cfg.vars["Fov limit"] and ilya.cfg.vars["Show FOV"] then
            local col = string_ToColor( ilya.cfg.colors["Show FOV"] )

            local radius = ilya.GetFovRadius()

            surface_SetDrawColor( 0, 0, 0, 128 )
            surface.DrawCircle( scrwc, scrhc, radius + 1 )

            surface_SetDrawColor( col.r, col.g, col.b )
            surface.DrawCircle( scrwc, scrhc, radius )

            surface_SetDrawColor( 0, 0, 0, 128 )
            surface.DrawCircle( scrwc, scrhc, radius - 1 )
        end

        if ilya.target and ilya.targetVector then
            if ilya.cfg.vars["Aimbot snapline"] then
                local pos = ilya.targetVector:ToScreen()
                surface_SetDrawColor( string_ToColor( ilya.cfg.colors["Aimbot snapline"] ) )
                surface_DrawLine( pos.x, pos.y, scrwc, scrhc )
            end

            if ilya.cfg.vars["Aimbot marker"] then
                local pos = ilya.targetVector:ToScreen()

                surface_SetDrawColor( 0, 0, 0 )
                surface_DrawRect( pos.x - 6, pos.y - 6, 5, 3 )
                surface_DrawRect( pos.x + 2, pos.y - 6, 5, 3 )

                surface_DrawRect( pos.x - 6, pos.y + 4, 5, 3 )
                surface_DrawRect( pos.x + 2, pos.y + 4, 5, 3 )

                surface_DrawRect( pos.x - 6, pos.y - 6, 3, 5 )
                surface_DrawRect( pos.x + 4, pos.y - 6, 3, 5 )

                surface_DrawRect( pos.x - 6, pos.y + 2, 3, 5 )
                surface_DrawRect( pos.x + 4, pos.y + 2, 3, 5 )

                surface_SetDrawColor( string_ToColor( ilya.cfg.colors["Aimbot marker"] ) )

                surface_DrawRect( pos.x - 5, pos.y - 5, 3, 1 )
                surface_DrawRect( pos.x + 3, pos.y - 5, 3, 1 )

                surface_DrawRect( pos.x - 5, pos.y + 5, 3, 1 )
                surface_DrawRect( pos.x + 3, pos.y + 5, 3, 1 )

                surface_DrawRect( pos.x - 5, pos.y - 5, 1, 3 )
                surface_DrawRect( pos.x + 5, pos.y - 5, 1, 3 )

                surface_DrawRect( pos.x - 5, pos.y + 3, 1, 3 )
                surface_DrawRect( pos.x + 5, pos.y + 3, 1, 3 )

            end



            local trgv = ilya.targetVector:ToScreen()

            hook.Add("HUDPaint", "BOX", function()
                if ilya.cfg.vars["ap_enable"] then
                    local avc = string.ToColor(ilya.cfg.colors["ap_enable"])
                    if ilya.target != nil and ilya.targetVector != nil then
                        if ilya.cfg.vars["ap_box"] then
                            surface.SetDrawColor(avc)
                            surface.DrawRect(trgv.x-2, trgv.y-2, 4,4)
                        else
                            ilya.surfaceTexture(trgv.x-8, trgv.y-8, 15,15, "sprites/glow04_noz_gmod",avc)
                        end
                    end
                end
            end)

            /*hook.Add("HUDPaint", "kryjok", function()
                if ilya.cfg.vars["Aimbot_krujok"] then
                    local pos = ilya.targetVector:ToScreen()

                    local circleRadius = 5
                    local circleColor = string_ToColor(ilya.cfg.colors["Aimbot_krujok"])

                    surface_SetDrawColor(circleColor)
                    surface.DrawCircle(pos.x, pos.y, circleRadius, circleColor)  -- Draw a circle at the target position
                end
            end)

            hook.Add("HUDPaint", "fillkryg", function()
                if ilya.cfg.vars["Aimbot_fill"] then
                    local pos = ilya.targetVector:ToScreen()

                    local circleRadius = 5
                    local circleColor = string_ToColor(ilya.cfg.colors["Aimbot_fill"])

                    local segments = 360
                    local circle = {}

                    for i = 1, segments do
                        local segment = math.rad(i * 360 / segments)
                        table.insert(circle, {
                            x = pos.x + math.cos(segment) * circleRadius,
                            y = pos.y + math.sin(segment) * circleRadius
                        })
                    end

                    surface_SetDrawColor(circleColor)
                    draw.NoTexture()
                    surface.DrawPoly(circle)
                end
            end)

            hook.Add("HUDPaint", "petyh", function()
                if ilya.cfg.vars["Aimbot_markers"] then
                    local pos = ilya.targetVector:ToScreen()

                    --surface.SetDrawColor(0, 0, 0)
                    --surface.DrawRect(pos.x - 10, pos.y - 10, 20, 2) -- Top
                    --surface.DrawRect(pos.x - 10, pos.y + 8, 20, 2) -- Bottom
                    --surface.DrawRect(pos.x - 10, pos.y - 10, 2, 20) -- Left
                    --surface.DrawRect(pos.x + 8, pos.y - 10, 2, 20) -- Right

                    surface_SetDrawColor(string_ToColor(ilya.cfg.colors["Aimbot_markers"]))
                    surface_DrawRect(pos.x - 5, pos.y - 5, 10, 2) -- Top
                    surface_DrawRect(pos.x - 5, pos.y + 3, 10, 2) -- Bottom
                    surface_DrawRect(pos.x - 5, pos.y - 5, 2, 10) -- Left
                    surface_DrawRect(pos.x + 3, pos.y - 5, 2, 10) -- Right
                end
            end)

            hook.Add("HUDPaint", "swastonch1k", function()
                if ilya.cfg.vars["Aimbot_swaston"] then
                    local pos = ilya.targetVector:ToScreen()

                    surface_DrawLine( pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2 )
                    surface_DrawLine( pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2 )
                    surface_DrawLine( pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2 )
                    surface_DrawLine( pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2 )

                    surface_SetDrawColor( string_ToColor( ilya.cfg.colors["Aimbot_swaston"] ) )
                    --surface.DrawLine(pos.x - 6, pos.y, pos.x + 6, pos.y)  -- Horizontal line
                    --surface.DrawLine(pos.x, pos.y - 6, pos.x, pos.y + 7)  -- Vertical line
                end
            end)*/

        end

        surface_SetFont( "veranda" )

        if ilya.cfg.vars[ "On screen logs" ] and table.Count( ilya.onScreenLogs ) > 0 then
            local tick = engine.TickCount()
            local x, y = scrw / 2, scrh / 2 + 45

            for k, v in pairs( ilya.onScreenLogs ) do

                if ilya.TICKS_TO_TIME( tick - ilya.onScreenLogs[ k ].tick ) > 8 then
                    ilya.onScreenLogs[ k ] = nil
                    continue
                end

                local data = ilya.onScreenLogs[ k ]
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
                    surface.SetTextColor( data[ 2 ][ p ] )
                    surface.DrawText( str )

                    x = x + tw
                end

                x, y = scrw / 2, y + th
            end
        end

if ilya.cfg.vars["WaterMark"] then

            surface.SetFont("veranda")

            local txt = "ilyaware.waib.cc | Version: v4"

            local txtsizex, txtsizey = surface.GetTextSize(txt)
            draw.RoundedBox(3, 7, 4, txtsizex+10, txtsizey+3, Color(13, 13, 13,234))
            draw.RoundedBox(3, 7, 4,  txtsizex+10, 3, string.ToColor(ilya.cfg.colors.WaterMarkColor))
            draw.SimpleText(txt, "veranda", 10, 6, Color(255,255,255))

            
        local plys = player.GetAll()

        if ilya.cfg.vars[ "Spectator list" ] then
            local y = scrh / 2 

            for i = 1, #plys do
                local v = plys[ i ]

                if not ilya.playerCache[ v ] then continue end
                if ilya.playerCache[ v ].ObserverMode == 0 then continue end 

                surface.SetTextPos( 15, y )
                surface.SetTextColor( ilya.Colors[255] )
                surface.DrawText( v:Name() .. " spectating " .. tostring( ilya.playerCache[ v ].ObserverTarget ) )
            
                y = y + 15
            end
        end 

        



        
    end






    end



end


        if ilya.cfg.vars["crosshair"] then
            local centerX = ScrW() / 2
            local centerY = ScrH() / 2
            local crosshairType = ilya.cfg.vars["crosshair_type"]

            ilya.RotationAngle = ilya.RotationAngle or 0
            local scale = ilya.cfg.vars["uber_alles_scale"]
            local speed = ilya.cfg.vars["uber_alles_speed"]
            local crosshairColor = string_ToColor(ilya.Colors["crosshair_color"])
            local outlineColor = string_ToColor(ilya.Colors["crosshair_outline"])

            local frameTime = FrameTime()
            ilya.RotationAngle = ilya.RotationAngle - (frameTime * speed)

            if ilya.RotationAngle <= -180 then
                ilya.RotationAngle = ilya.RotationAngle + 180
            elseif ilya.RotationAngle >= 180 then
                ilya.RotationAngle = ilya.RotationAngle - 180
            end

            if crosshairType == 1 then
                local function DrawCrosshairLine(red, x, y)
                if red == 0 then
                    surface.SetDrawColor(outlineColor.r, outlineColor.g, outlineColor.b, outlineColor.a)
                else
                    surface.SetDrawColor(crosshairColor.r, crosshairColor.g, crosshairColor.b, crosshairColor.a)
                end

                local points = {}
                local angle1_rad = math.rad(ilya.RotationAngle - 90)
                points[1] = math.floor(scale * math.sin(angle1_rad))
                points[2] = math.floor(scale * math.cos(angle1_rad))
                points[3] = math.floor(scale * math.cos(angle1_rad + 1))

                local angle2_rad = math.rad(ilya.RotationAngle)
                points[4] = math.floor(scale * math.sin(angle2_rad))
                points[5] = math.floor(scale * math.cos(angle2_rad))
                points[6] = math.floor(scale * math.sin(angle2_rad + 1))

                local angle3_rad = math.rad(ilya.RotationAngle + 90)
                points[7] = math.floor(scale * math.sin(angle3_rad))
                points[8] = math.floor(scale * math.cos(angle3_rad))
                points[9] = math.floor(scale * math.cos(angle3_rad + 1))

                local angle4_rad = math.rad(ilya.RotationAngle + 180)
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
                    local angle = ilya.RotationAngle + (i * 360 / numCircles)
                    local angleRad = math.rad(angle)

                    local circleX = centerX + orbitRadius * math.cos(angleRad)
                    local circleY = centerY + orbitRadius * math.sin(angleRad)

                    DrawCircle(circleX, circleY, circleRadius + 1, 12, outlineColor)
                    DrawCircle(circleX, circleY, circleRadius, 12, crosshairColor)
                end
            end
        end





/*
hook.Add( "PostDrawTranslucentRenderables", "test", function()
    if ilya.targetVector then
        render.DrawWireframeSphere( ilya.targetVector, 0.5, 10, 10, Color( 255, 0, 64 ) )
    end
end)
*/


ilya.kd = false
function ilya.togglevisible()
    if ilya.frame:IsVisible() then
        ilya.frame:SetVisible(false)

        if ilya.ui.MultiComboP then ilya.ui.RemovePanel( ilya.ui.MultiComboP ) end
        if ilya.ui.ColorWindow then ilya.ui.RemovePanel( ilya.ui.ColorWindow ) end
        if ilya.ui.SettingsPan then ilya.ui.RemovePanel( ilya.ui.SettingsPan ) end

        RememberCursorPosition()

        if ilya.validsnd then ilya.validsnd:Pause() end
    else
        ilya.frame:SetVisible(true)

        RestoreCursorPosition()
        if ilya.validsnd then ilya.validsnd:Play() end
    end
end

// dormant esp

function ilya.SetEntPos(ent,pos)
    if not IsValid(ent) or ent == me or not ent:IsDormant() then return end

    ent:SetNetworkOrigin(pos)
    ent:SetRenderOrigin(pos)
end



--[[]


function ilya.SetEntPos(ent,pos)
    if not IsValid(ent) or ent == me or not ent:IsDormant() then return end

    ent:SetNetworkOrigin(pos)
    ent:SetRenderOrigin(pos)
end

hook.Add( "EntityEmitSound", "EntSounds", function( data )
    local ent = data.Entity
    local pos = data.Pos

    if ent:IsPlayer() and ent:Alive() and ent:IsDormant() then
        ilya.SetEntPos(ent,pos)
        print(ent,pos)
    elseif ent:IsWeapon() then
        print(ent)
    end
end)

hook.Add( "PlayerStepSoundTime", "StepSounds", function( ent, type, walking )
    local pos = ent:GetPos()

    if ent:Alive() and ent:IsDormant() then
        ilya.SetEntPos(ent,pos)
        print("steps ",ent,pos)
    end
end)
]]




hook.Add("PrePlayerDraw", "ilya.PrePlayerDraw", function(ply, falgs)
	if ply != me then
        ply.ChatGestureWeight = 0
		for i = 0, 13 do
			if ply:IsValidLayer(i) then
				local seqname = ply:GetSequenceName(ply:GetLayerSequence(i))
				if seqname:StartWith("taunt_") or seqname:StartWith("act_") or seqname:StartWith("gesture_") then
                    ply:SetLayerDuration(i, 0.001)
					break
				end
			end
		end

    /*
	elseif ply == me then
        local ndata = ilya.GetLocalNetworkData()
        //local ntang = Angle( 0, ndata.angles_y, 0 )

        //ply:SetPoseParameter("aim_yaw", ndata.angles_y)
        //ply:SetPoseParameter("head_yaw", ndata.angles_y)

        //ply:SetPoseParameter("aim_pitch", ndata.angles_x)
        //ply:SetPoseParameter("head_pitch", ndata.angles_x)

        //ply:InvalidateBoneCache()
        //ply:SetupBones()

        ply:SetNetworkOrigin( ndata.origin )
        ply:SetRenderOrigin( ndata.origin )




*/





    end

    if ilya.cfg.vars["Visible chams"] then
        //ply:SetNoDraw( true )
    end
end)


// Chams

CreateMaterial("textured", "VertexLitGeneric")
CreateMaterial("flat", "UnLitGeneric")
CreateMaterial("flat_z", "UnLitGeneric",{["$ignorez"] = 1})
CreateMaterial("textured_z", "VertexLitGeneric",{["$ignorez"] = 1})

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

ilya.chamMats = {
    vis = {
        Material("!flat"), -- flat
        Material("!textured"), -- textured
        Material("!selfillum"), -- glow
        Material("!selfillum_a"), -- glow outline
        Material("!wireframe"), -- wireframe
        Material("!metallic"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
        Material("models/props_combine/portalball001_sheet"),
    },
    invis = {
        Material("!flat_z"), -- flat
        Material("!textured_z"), -- textured
        Material("!selfillum_z"), -- glow
        Material("!selfillum_a_z"), -- glow outline
        Material("!wireframe_z"), -- wireframe
        Material("!metallic_z"), -- metallic
        Material("effects/nightvision"), -- _rt_fullframefb
        Material("effects/flashbang"), -- _rt_fullframefb
        Material("models/props_combine/portalball001_sheet_z"),
    }
}

do
    local f = (1/255)

    function ilya.drawChams()
        if ilya.UnSafeFrame then return end

        if ilya.cfg.vars["Color_Modify"] then
            local rse = {
                [ "$pp_colour_addr" ] = ilya.cfg.vars["pp_colour_addr"],
                [ "$pp_colour_addg" ] = ilya.cfg.vars["pp_colour_addg"],
                [ "$pp_colour_addb" ] = ilya.cfg.vars["pp_colour_addb"],
                [ "$pp_colour_brightness" ] = ilya.cfg.vars["pp_colour_brightness"],
                [ "$pp_colour_contrast" ] = ilya.cfg.vars["pp_colour_contrast"],
                [ "$pp_colour_colour" ] = ilya.cfg.vars["pp_colour_colour"],
                [ "$pp_colour_mulr" ] = ilya.cfg.vars["pp_colour_mulr"],
                [ "$pp_colour_mulg" ] = ilya.cfg.vars["pp_colour_mulg"],
                [ "$pp_colour_mulb" ] = ilya.cfg.vars["pp_colour_mulb"]
            }
            DrawColorModify( rse )
        end

        if ilya.cfg.vars["motion_blur"] then
            DrawMotionBlur( ilya.cfg.vars[ "mb_aa" ], ilya.cfg.vars[ "mb_da" ],  ilya.cfg.vars[ "mb_d" ])
        end


        local vm, invm = ilya.cfg.vars["Visible mat"], ilya.cfg.vars["inVisible mat"]
        local sin = math_floor( math_sin( CurTime() * 4 ) * 45 )

        local vc = string_ToColor(ilya.cfg.colors["Visible chams"])
        local invc = string_ToColor(ilya.cfg.colors["inVisible chams"])
        local sc = string_ToColor(ilya.cfg.colors["Self chams"])

        cam_Start3D()
            for k, v in pairs(player_GetAll()) do
                if not IsValid(v) or v == me or not v:Alive() or v:IsDormant() then continue end

                if ilya.cfg.vars["Supress lighting"] then
                    render_SuppressEngineLighting(true)
                end

                if ilya.cfg.vars["inVisible chams"] then
                    ilya.chamMats.invis[6]:SetVector( "$envmaptint", Vector( invc.r / 255, invc.g / 255, invc.b / 255 ) )
                    render_MaterialOverride(ilya.chamMats.invis[invm])
                    render_SetColorModulation(invc.r/255,invc.g/255,invc.b/255)

                    if invm == 7 then
                        render_SetBlend( (sin + 100) / 255 )
                    end

                    v:SetRenderMode(1)
                    v:DrawModel()

                    if ilya.cfg.vars["inVisible chams w"] then
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if ilya.cfg.vars["Visible chams"] then
                    ilya.chamMats.vis[6]:SetVector( "$envmaptint", Vector( vc.r / 255, vc.g / 255, vc.b / 255 ) )
                    render_MaterialOverride(ilya.chamMats.vis[vm])
                    render_SetColorModulation(vc.r/255,vc.g/255,vc.b/255)

                    if vm == 7 then
                        render_SetBlend( (sin + 100) / 255 )
                    end

                    v:DrawModel()

                    if ilya.cfg.vars["Visible chams w"] then
                        local w = v:GetActiveWeapon()
                        if IsValid(w) then w:DrawModel() end
                    end
                end

                if ilya.cfg.vars["Supress lighting"] then
                    render_SuppressEngineLighting(false)
                end

            end

            if ilya.cfg.vars["Self chams"] and IsValid(me) and me:Alive() then

                if ilya.cfg.vars["Supress self lighting"] then
                    render_SuppressEngineLighting(true)
                end

                ilya.chamMats.invis[6]:SetVector( "$envmaptint", Vector( sc.r / 255, sc.g / 255, sc.b / 255 ) )
                render_MaterialOverride(ilya.chamMats.vis[ilya.cfg.vars["Self mat"]])
                render_SetColorModulation(sc.r/255,sc.g/255,sc.b/255)

                if ilya.cfg.vars["Self mat"] == 7 then
                    render_SetBlend( (sin + 100) / 255 )
                end

                me:SetRenderMode(1)
                me:DrawModel()

                if ilya.cfg.vars["Self chams w"] then
                    local w = me:GetActiveWeapon()
                    if IsValid(w) then w:DrawModel() end
                end

                if ilya.cfg.vars["Supress self lighting"] then
                    render_SuppressEngineLighting(false)
                end

            end




        cam_End3D()

        render_SetColorModulation(1, 1, 1)
        render_SetBlend(1)
        render_MaterialOverride()
    end
end

ilya.rukient = me
hook.Add("PreDrawPlayerHands", "ChamsHand", function(hands,vm,ply,wep)

    local col = string_ToColor(ilya.cfg.colors["chams_hand"])
    ilya.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    local mat = ilya.chamMats.vis[ilya.cfg.vars["chams_hand_mat"]]
    if ilya.cfg.vars["chams_hand"] then
        render_SetBlend(col.a/255)
        render_SetColorModulation(col.r/255,col.g/255,col.b/255)
        render_MaterialOverride(mat)
    end

end)
hook.Add("PostDrawPlayerHands", "ChamsHandBlend", function(hands,vm,ply,wep)
    --print(vm,hands)
    if ilya.cfg.vars["chams_hand"] then
        render_SetBlend(1)
        render_SetColorModulation(1, 1, 1)
        render_MaterialOverride(Material(""))

    end
    ilya.rukient = vm
end)

// Client side models

function ilya.CS_Model(mdl)
    local model = ClientsideModel(mdl)
	model:SetNoDraw(true)

    return model
end

function ilya.CS_Model_update(ply,model,tbl)
    if !tbl then return end

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

function ilya.PostDrawTranslucentRenderables()
    if ilya.UnSafeFrame then return end

    ilya.drawCSModels_backtrack()
    ilya.drawCSModels_real()

    render_SetBlend(1)
    render_MaterialOverride()
end


// Backtracking

ilya.btrecords = {}
ilya.predicted = {}

















function ilya.canBacktrack(ply)
    if not ilya.cfg.vars["Backtrack"] then return false end
    if not IsValid(ply) then return false end
    if not ilya.btrecords[ply] then return false end
    if ply.break_lc then return false end

    return true
end

function ilya.recordBacktrack(ply)
	local deadtime = CurTime() - ilya.cfg.vars["Backtrack time"] / 1000

	local records = ilya.btrecords[ply]

	if !records then
        records = {}
		ilya.btrecords[ply] = records
	end

	local i = 1
	while i < #records do
		local record = records[i]

		if record.simulationtime < deadtime then
			table_remove(records, i)
			i = i - 1
		end

		i = i + 1
	end

	if !ply:Alive() then return end
    if ply.break_lc then return end

	local simulationtime = ded.GetSimulationTime(ply:EntIndex())
	local len = #records
	local simtimechanged = true

	if len > 0 then
		simtimechanged = records[len].simulationtime < simulationtime
	end

	if !simtimechanged then return end

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

    /*
    for i = 0, ply:GetBoneCount() - 1 do

        local parent = ply:GetBoneParent(i)

        if(!parent) then continue end

        local bonepos = ply:GetBonePosition(i)

        if(bonepos == ply:GetPos() ) then continue end

        local parentpos = ply:GetBonePosition(parent)

        if(!bonepos or !parentpos) then continue end

        skeletondata[ 1 ] = bonepos:ToScreen()
        skeletondata[ 2 ] = parentpos:ToScreen()
    end
    */

	records[len + 1] = {
		simulationtime =    ded.GetSimulationTime(ply:EntIndex()),
		angles =            Angle(x,y,0),
		origin =            ply:GetNetworkOrigin(),
		aimpos =            ilya.GetBones( ply )[1],
		sequence =          ply:GetSequence(),
		cycle =             ply:GetCycle(),
		layers =            layers,
        movex =             ply:GetPoseParameter("move_x"),
        movey =             ply:GetPoseParameter("move_y"),
        bonedata =          bdata,
        //hitboxdata =        hdata,
        //skeleton =          skeletondata
    }
end

ilya.btmodel = ilya.CS_Model("models/player/kleiner.mdl")

function ilya.drawCSModels_backtrack()
    if not ilya.cfg.vars["Backtrack chams"] then return end
    if not ilya.canBacktrack(ilya.target) then return end

    local len = #ilya.btrecords[ilya.target]
    local tbl = ilya.btrecords[ilya.target][ilya.backtracktick]
    local m = ilya.btmodel

    ilya.CS_Model_update(ilya.target,m,tbl)

    if ilya.cfg.vars["Backtrack fullbright"] then
        render_SuppressEngineLighting(true)
    end

    local col = string_ToColor(ilya.cfg.colors["Backtrack chams"])
    ilya.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render_MaterialOverride(ilya.chamMats.invis[ilya.cfg.vars["Backtrack material"]])
    render_SetColorModulation(col.r/255,col.g/255,col.b/255)
    m:SetRenderMode(1)
    m:DrawModel()

    if ilya.cfg.vars["Backtrack fullbright"] then
        render_SuppressEngineLighting(false)
    end
end

ilya.hitmarkers = {}
ilya.hitnums = {}

gameevent.Listen( "player_hurt" )
hook_Add("player_hurt", "penissss1337", function(data)
    local health = data.health
	local priority = SERVER and data.Priority or 5
	local hurted = Player( data.userid )
	local attackerid = data.attacker

	if attackerid == me:UserID() then

        if ilya.cfg.vars[ "On screen logs" ] then
            local hlcolor = string_ToColor( ilya.cfg.colors[ "On screen logs" ] )
            local data = {
                tick = engine.TickCount(),
                {
                    "Hit ",
                    hurted:Name(),
                    " for ",
                    hurted:Health() - health,
                    " damage"
                },
                {
                    ilya.HitLogsWhite,
                    hlcolor,
                    ilya.HitLogsWhite,
                    hlcolor,
                    ilya.HitLogsWhite,
                }
            }

            ilya.onScreenLogs[ engine.TickCount() ] = data
            print( "hurt", engine.TickCount() )
        end

        if ilya.cfg.vars["Hitmarker"] then
            ilya.hitmarkers[ #ilya.hitmarkers + 1 ] = { time = CurTime(), add = 0 }
        end

        if ilya.cfg.vars["Hitnumbers"] then
            local hp = hurted:Health() - health
            ilya.hitnums[ #ilya.hitnums + 1 ] = { time = CurTime(), add = 0, xdir = math_random(-1,1), ydir = math_random(-1,1), dmg = hp, crit = health <= 0 }
        end

        if ilya.cfg.vars["Hitsound"] then
            surface_PlaySound( ilya.cfg.vars["Hitsound str"] )
        end

        if ilya.cfg.vars["Resolver"] then
            hurted.aimshots = (hurted.aimshots or 0) - 1
        end

    end
end)

/*
    Player vars
*/

function ilya.initPlayerVars( v )
    v.ult_prev_pos = Vector()

    v.ult_prev_simtime = 0
    v.flticks = 0
    v.aimshots = 0
    v.missedanimticks = 0

    v.break_lc = false
    v.simtime_updated = false
    v.fakepitch = false

    ilya.btrecords[ v ] = {}
    ilya.predicted[ v ] = {}
end

for k, v in ipairs(player_GetAll()) do
	ilya.initPlayerVars( v )
end

ilya.chatmsg = {
    killsay = {
        { // Лучшие 22-23
        "чел у тебя каждый патрон в голову летит",
        "чел с аимом играет",
        "чел ты деб",
        "моя мама в больнице",
        "эхх",
        "жалко тебя",
        "Чел мне жаль но твоя мать еще жива",
        "ребята давайте друг другу помогать, давайте???",
        "(((((",
        "ураа победа",
        "я твой на могилу жидиньким насрал её аж затапило",
        "пасть захлопни результат порватово презека",
        "узбек",
        "а я девочка",
        "скин девкив",
        "что делать если парвалзя презек??",
        "ахахах",
        "ДА ТЫ ЗАДОЛБАЛ",
        "ТЕБЯ ЗАБАНЯТ НА ДОЛГО",
        "да пожалуй нек сахраню",
        "da bla che c pb",
        "если у них скрипт они не получал бан",
        "ахапхап",
        "Чел в бан летиш",
        "мои мозги меньше моеи груди",
        "не наступи мне на тяги",
        "гучи тяги",
        "Смешной Шрек2014",
        "Хуйв омне",
        "дегустатар",
        "сheting",
        "Откисай молодой!",
        "че твоя мама по дому голая бегает исправляй",
        "в школу собирайся сосунок",
        "ботинок ебаный чо слетел",
        "чё упал нищие",
        "не противник",
        "а ты че клоун???",
        "я обоссал тебя (",
        "ты че там отлетел то?",
        "XD",
        "упал хуета ебаная типа -  no resolver",
        "ливай с хвх (",
        "до связи башмак",
        "сынтупой дуры играть учись",
        "опущен сын твари",
        "нищий улетел",
        "пофикси нищ",
        "где же твой резольвер",
        "животное выйди с игры а то падаешь",
        "твой сиська бы вжик вжик дура",
        "сука не позорься и ливни",
        "улетел тапочек ебаный",
        "единицей свалился сын аборта",
        "Вот тебе паяльник , запаяй себе ебальник",
        "зачем ты играешь тут безмозглый", "иди в школу собирайся очередняра",
        "свежий кабанчик",
        "ты на подскоке пёсик гав",
        "скажи маме чтоб голая не бегала",
        "ахуеть ты красиво на бутылку присел)))",
        "Извини дорогая , не хотел на лицо",
        "прости что без смазки)",
        "алло это скорая? тут такая ситуация парню который упал нужна скорая)",
        "ало ты мапу лузаешь , дура очнись",
        "аниме ублюдок про тебя же?)?",
        "але , а противники то где???",
        "ты с цфф зашёл ?",
        "ХУЕПРЫГАЛО УНИЖЕНОЕ КУДА ПОЛЕТЕЛО",
        "ты куда жертва козьего аборта",
        "iq?", "x_x 3", "щас я тебя разьебу лошок ебаны",
        "ты то куда лезешь сын фантомного стационарного спец изолированого металлформовочного механизма",
        "а где противник одни боты",
        "Тебе в ротик или на животик ?",
        "Ушка, лапки, хвостик 03 Бурятия",
        "٠●•۩۞۩[̲̲̅И̲̅Д̲̅И̲̲̅(ٿ)̲̅H̲̅A̲̅X̲̅У̲̅Й̲̲̅]۩۞۩•●٠",
        },
        { // Унижалка English
        "man, every bullet goes to your head",
        "a man plays with aim",
        "man you Deb",
        "my mother is in the hospital",
        "ehh",
        "I feel sorry for you",
        "Man, I'm sorry, but your mother's still alive.",
        "guys, let's help each other, let's???",
        "(((((",
        "uraa Pobeda",
        "I took a shit on your Jewish grave and it was already flooded",
        "close your mouth and tear up the prezek",
        "Uzbek",
        "and I'm a girl",
        "skin of girls",
        "what should I do if parvalzya prezek??",
        "ahahah",
        "YOU'RE FUCKED UP.",
        "YOU WILL BE BANNED FOR A LONG TIME",
        "yes, apparently Nek sakhranyu",
        "da bla che c pb",
        "if they have a script they didn't get banned",
        "ahaphap",
        "People in the ban fly",
        "my brain is smaller than my chest",
        "don't step on my traction",
        "Gucci traction",
        "Funny Shrek2014",
        "Fuck Omne",
        "taster",
        "cheting",
        "Otkissay young!",
        "Che your mother runs around the house naked fix it",
        "get ready for school, sucker",
        "Cho's fucking shoe flew off",
        "Che fell beggars",
        "not the enemy",
        "are you a clown???",
        "I pissed you (",
        "why did you fly there?",
        "XD",
        "fallen fuck type- no resolver",
        "Levi with khvh",
        "to the connection of shoes",
        "sintupoy fools learn to play",
        "the fallen son of a creature",
        "the beggar flew away",
        "pofixi nishch",
        "where is your resolver",
        "animal get out of the game otherwise you fall",
        "your boob would whack whack Fool",
        "Bitch Don't shame and take a shower",
        "the fucking Slipper flew away",
        "the son of abortion collapsed as a unit",
        "Here's a soldering iron for you, solder your fucker",
        "why are you playing",
        },
        { // Школа хвх
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

            -- Vovse ne sp1zd1l
            "Найс софт чел без читов ты 0",
            "Чел ты без читов 0",
            "Го 1 на 1 или зассал?Точно ты же до 1 считать не умееш...",
            "Мы в НОНРП Зоне как бы да чел отлетаеш",
            "Найс баг абуз чел папа жива?",
            "Ало скорая тут такой случай шкiла упала в месорубку",
            "Откисай молодой!",
            "говори буду плохо говорить буду сосать, буду плохо сосать буду пересасывать",
            "долбаеб иди башмачки в сундучок школьный собирай",
            "ботинок ебаный чо слетел",
            "братик маме привет передай",
            "не противник",
            "а ты че клоун???",
            "я обоссал тебя (",
            "ты че там отлетел то?",
            "Я твою маму дуже сильно поважаю , нехай береже її Степан Бендера",
            "упал хуета ебаная , но в боди забрал да похуй все равно упал",
            "ливай с хвх (",
            "до связи башмак",
            "нищета глупейшая играть учись",
            "опущен сын твари",
            "сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
            "животное аддон скачай а то падаешь",
            "оттарабанен армянская королева",
            "сука не позорься и ливни",
            "улетел тапочек ебаный",
            "единицей свалился фуфлыжник",
            "Вот тебе паяльник , запаяй себе ебальник",
            "зачем ты играешь тут безмозглый", "иди кумыса попей очередняра",
            "Ты как кофе , 3 в одном - пидр , чмошник и гандон",
            "откисай сочняра",
            "АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК [XML-RPC] No-Spread 24/7 | aim_ag_texture_2 ONLY!",
            "на мыло и веревку то деньги есть????",
            "ИЩИ СЕБЯ НА pornoeb.cc/so4niki",
            "свежий кабанчик",
            "до связи на подскоке кабанчик",
            "скажи маме сухарики купить долбаеб",
            "ебать ты красиво на бутылку присел , тебе дать альт ?",
            "Извини дорогая , не хотел на лицо",
            "прости что без смазки)",
            "алло это скорая? тут такая ситуация парню который упал нужна скорая)",
            "ало ты мапу лузаешь , дура очнись",
            "ЕБУЧЕСТЬ ВТОРОГО РАЗРЯДА ВЫДВИЖЕНЕЦ ОТКИС",
            "але , а противники то где???",
            "ты по легиту играешь ?",
            "ХУЕПРЫГАЛО ТУСОВОЧНОЕ КУДА ПОЛЕТЕЛО",
            "ты куда жертва козьего аборта",
            "iq?", "·٠●•۩۞۩ОтДыХаЙ (ٿ) НуБяРа۩۞۩•●٠·",
            "ты то куда лезешь сын фантомного стационарного спец изолированого металлформовочного механизма",
            "╭∩╮( ⚆ ʖ ⚆)╭∩╮ ДоПрыГался(ت)ДрУжоЧеК",
            "Тебе в ротик или на животик ?"
        },
        { // AI унижалка
        "чол у тебе кожен патрон в голову летить",
        "чол з аімом грає",
        "чол ти деб",
        "моя мама в лікарні",
        "ехх",
        "шкода тебе",
        "Чол мені шкода але твоя мати ще жива",
        "хлопці давайте один одному допомагати, давайте???",
        "(((((",
        "ураа перемога",
        "я Твій на могилу жидиньким насрав її аж затапило",
        "паща зачини результат порватово презека",
        "узбек",
        "а я дівчинка",
        "скін девків",
        "що робити якщо парвалзя презек??",
        "ахахах",
        "ТА ТИ ЗАДОВБАВ",
        "ТЕБЕ ЗАБАНЯТЬ НА ДОВГО",
        "та мабуть нек сахраню",
        "da bla che c pb",
        "якщо у них скрипт вони не отримував бан",
        "ахапхап",
        "Чол в бан летиш",
        "мої мізки менше моеі грудей",
        "не наступай мені на тяги",
        "гучі тяги",
        "Смішний Шрек2014",
        "Хуйв омне",
        "дегустатар",
        "сheting",
        "Откісай молодий!",
        "че твоя мама по дому Гола бігає виправляй",
        "в школу збирайся сосунок",
        "черевик йобаний чо злетів",
        "че впав жебраки",
        "не противник",
        "а ти че клоун???",
        "я обоссал тебе (",
        "ти че там відлетів то?",
        "XD",
        "впав хуета ебаная типу- no resolver",
        "Лівай з хвх (",
        "до зв'язку черевик",
        "синтупой дурепи грати вчися",
        "опущений син тварі",
        "жебрак полетів",
        "пофікси нищ",
        "де ж твій резольвер",
        "тварина вийди з гри а то падаєш",
        "твій сиська б вжик вжик дура",
        "сука не ганьбіть і зливи",
        "полетів тапочок йобаний",
        "одиницею звалився син аборту",
        "Ось тобі паяльник, запаяй собі ебальнік",
        "навіщо ти граєш",
        "Іди в школу збирайся очередняра",
        "свіжий кабанчик",
        "ти на підскоку песик гав",
        "скажи мамі щоб Гола не бігала",
        "ахуеть ти красиво на пляшку присів)))",
        "Вибач дорога, не хотів на обличчя",
        "прости що без мастила)",
        "алло це швидка? тут така ситуація хлопцю який впав потрібна швидка)",
        "ало ти мапу лузаєш, дура Прокинься",
        "Аніме ублюдок про тебе ж?)?",
        "але, а противники то де???",
        "ти з цфф зайшов ?",
        "ХУЕПРИГАЛО ПРИНИЖЕНЕ КУДИ ПОЛЕТІЛО",
        "ти куди жертва козячого аборту",
        "iq?", "x_x 3",
        "ти то куди лізеш син фантомного стаціонарного спец ізольованого металлформовочного механізму",
        "а де противник одні боти",
        "Тобі в ротик або на животик ?",
        },
        { // School HVH
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
    },
    spam = {
        { // Пенис деда
            "Buy a ilya and fuck everyone!",
            "All you need is Grandpa's penis!Trust me",
            "Buy a ilya and you can live not in a shoe box",
            "ilya is the best solution",
            "Would you choose to be raped in prison or buy ilya?",
            "Do you have a small penis?It doesn't matter!Buy a ilya",
            "Tired of playing with a bad cheat?Buy ilya",
            "I want to sleep but can't get up from the table?There is a solution - ilya!",
            "Tired of dying from ilya?Buy ilya and kill everyone!",
        },
        { // Пенис деда 2
            "Купи ультимейт и разьеби всех!",
            "Хочется посрать но не можеш? Купи ультимейт!СЕЙЧАС ЖЕ БЛЯТЬ!",
            "Лучший чит это ультимейт!КУПИ БЛЯТЬ!",
            "Еще не купил ультимейт?Чего ждеш?ТВАРЬ КУПИ БЛЯДИНА!",
            "Кто прочитал тот гей!Купи ультимейт и будеш не гей!",
            "Что то застряло у тебя в попке кажется это мой пенис!",
            "Удаляй свой кал и качай ультимейт!",
            "ультимейт лучшее решение!Хватит жить в коробке от обуви!",
        },
        { // Arabic
            "هل مؤخرتك تحصل مارس الجنس مرة أخرى?تحميل الجد القضيب",
            "سقط الحور الرجراج....",
            "أنا مستعد لقطع الأطفال جميعا هنا!",
            "لقد زرعت قنبلة في مدرستك أمس!",
            "سكين بلدي على استعداد لقطع رأسك!",
            "سأمزقك أيها المغفل القذر",
            "إذا كنا في المنطقة ، وأود أن يكون لك بوم بوم بوم",
            "السائبة ليخ توبشيك",
            "وقد أصدرت المحكمة حكما! سيتم مصادرة قضيبك!",
            "أوتكيساي بودوسينوفيك",
            "إيي المتسول ليس ضرطة",
            "أنا قاتل لطفلين! على ركبتيك أيها الأوغاد",
            "كنت مهرج الذهاب إلى السيرك",
            "أنا داست فمك اللعين الأغنام",
            "وأنت تسير أن يموت قريبا (انها ليست تهديدا إذا كان أي شيء)",
            "أنا سحقت لك كاماز",
            "عندما تم إنشاء هذا الغش ، بكى إبليس",
            "بارد خيانة الدولة الآن وأنت تسير على الجلوس ل 100 سنوات?)",
            "الذهاب لمس العشب المعرفة",
            "الذهاب أنبوب ابن",
            "جدي القضيب حريصة على القتال",
            "أنت محتجز)",
            "من يقرأ هو مثلي الجنس",
        },
        { // Turkish
            "Ben burada kral ve tanrıyım! köleler dizlerinin üstüne çök",
            "Kim eşcinsel değil duş alsın",
            "Sikimi ağzına koydum",
            "Sana bir şişeyle tecavüz ettim",
            "Ben senin duvarındayım",
            "Arkana dönüp arkana dönüyorum",
            "BEN 140 TECAVÜZE UĞRADIM VE SEN NE YAPTIN?",
            "Dizlerinden kalk ve yaşamak istiyorsan büyükbabanın penisini al!",
            "Ne kadar acınası olduğunuzu görünce komik buldum!Diz çökün millet! Gözlerini aç!Büyükbabanın penisini al",
        },
        { // Cursed
            "ТОПОВЫЙ СОФТ  ОТ ХЕЛЛКЕТА ТУТ !!-https://t.me/hellcatcc-!!",
            "ТОПОВЫЙ СОФТ  ОТ ХЕЛЛКЕТА ТУТ !!-https://t.me/hellcatcc-!!",
            "ТОПОВЫЙ СОФТ  ОТ ХЕЛЛКЕТА ТУТ !!-https://t.me/hellcatcc-!!",
            "ТОПОВЫЙ СОФТ  ОТ ХЕЛЛКЕТА ТУТ !!-https://t.me/hellcatcc-!!",
            "ТОПОВЫЙ СОФТ  ОТ ХЕЛЛКЕТА ТУТ !!-https://t.me/hellcatcc-!!",
            "ТОПОВЫЙ СОФТ  ОТ ХЕЛЛКЕТА ТУТ !!-https://t.me/hellcatcc-!!",
            "ТОПОВЫЙ СОФТ  ОТ ХЕЛЛКЕТА ТУТ !!-https://t.me/hellcatcc-!!",
            "ТОПОВЫЙ СОФТ ТУТ ОТ ХЕЛЛКЕТА !!-https://t.me/hellcatcc-!!",
            "ТОПОВЫЙ СОФТ  ОТ ХЕЛЛКЕТА ТУТ !!-https://t.me/hellcatcc-!!",
        },
        { // Extra fucked
            "buy 4 6r4ndf47h3r'5 p3n15 4nd fuck 3v3ry0n3!",
            "4ll y0u n33d 15 6r4ndp4'5 p3n15!7ru57 m3",
            "buy 4 6r4ndf47h3r'5 p3n15 4nd y0u c4n l1v3 n07 1n 4 5h03 b0x",
            "6r4ndf47h3r'5 p3n15 15 7h3 b357 50lu710n",
            "w0uld y0u ch0053 70 b3 r4p3d 1n pr150n 0r buy 6r4ndf47h3r'5 p3n15?",
            "Do you have a small penis?It doesn't matter!Buy a ilya",
            "d0 y0u h4v3 4 5m4ll p3n15?17 d035n'7 m4773r!buy 4 6r4ndf47h3r'5 p3n15",
            "1 w4n7 70 5l33p bu7 c4n'7 637 up fr0m 7h3 74bl3?7h3r3 15 4 50lu710n - 6r4ndf47h3r'5 p3n15!",
            "71r3d 0f dy1n6 fr0m 6r4ndf47h3r'5 p3n15?buy 6r4ndf47h3r'5 p3n15 4nd k1ll 3v3ry0n3!",
        },
        { // Brawls stars XXX
            "Девочки пишите мне в телеграм обменяемся интимками",
            "Кто в Барнауле?) Телеграмм вверху. Пишите(я пацан) поебёмся",
            "Девушки, накидайте интимок в тг aexcasas буду вам очень благодарен)",
            "Скиньте пизду плиз телега fruti",
            "Кто нибудь скиньте мне хуй я гей",
            "Скиньте киску свою в тг _The_best_",
            "Дамы и господа присылайте свои половые органы в телеграмм имя сверху жду.",
            "Скиньте свои интимками я вам хуй) только девушки @FaresFaru",
            "Хочю трахаца! Мой тг @zxc_Youpeser",
            "девочки давайте обменяемся интим фото вот мои тг matvejb1",
            "давайте перекинемся интим фото",
            "Кто может скинуть свои сиськи в тг",
            "Я лезбиянка скинть свою пизду и грудь",
            "Кто обмен интимками я мальчик тгDad Anime",
            "Я бы жоска выебал амбер и кончил ей на лицо",
            "Кто хочет быть трахнутым пишите тг:@shhhegx",
            "Кто скинет интимку из девочек, пишите",
            "Скиньте пизду",
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
            "Выебите меня во все щели! Ах ааа я кончаю!!!!!!! Кончи мне на лицо!!!! Твоя сперма такая вкусная!!!!!",
            "Выеби меня в жопу!!!!!! Ещё не ещё!! Сука да блядь! Я снова кончаю!!!!",
            "У меня большооооой",
            "Кто хочет у меня отсосать ",
            "Амбер ты гаряча давай ка мне первому пжжжж!",
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
        }
    }










}

ilya.killstreak = 0

// Init player vars
gameevent.Listen("player_spawn")
gameevent.Listen( "player_activate" )
gameevent.Listen( "entity_killed" )

hook.Add( "entity_killed", "entity_killed_example", function( data )
    local aid = Entity(data.entindex_killed)
	local vid = Entity(data.entindex_attacker)

    ilya.killstreak = ilya.killstreak + 1

    if vid == me and vid != aid and !aid:IsNPC() and (aid:IsPlayer() or aid:IsBot() ) then

        if ilya.cfg.vars["Killsay"] then
            local tbl = ilya.chatmsg.killsay[ ilya.cfg.vars["Killsay mode"] ]
            local str = tbl[ math_random( 1, #tbl) ]
            gRunCmd( "say", str )
        end

        if ilya.cfg.vars["Killsound"] then
            surface_PlaySound( ilya.cfg.vars["Killsound str"] )
        end

        if ilya.cfg.vars["Killstreak"] then
            if ilya.killstreak > 0 then
                if ilya.killstreak == math_floor(1) then
                    surface_PlaySound("firstkill.wav")
                elseif ilya.killstreak == math_floor(2) then
                    surface_PlaySound("unstoppable.wav")
                elseif ilya.killstreak == math_floor(3) then
                    surface_PlaySound("doublekill.wav")
                elseif ilya.killstreak == math_floor(4) then
                    surface_PlaySound("killingspree.wav")
                elseif ilya.killstreak == math_floor(5) then
                    surface_PlaySound("triplekill.wav")
                elseif ilya.killstreak == math_floor(7) then
                    surface_PlaySound("wickedsick.wav")
                elseif ilya.killstreak == math_floor(9)  then
                    surface_PlaySound("dominating.wav")
                elseif ilya.killstreak == math_floor(11)  then
                    surface_PlaySound("ultrakill.wav")
                elseif ilya.killstreak == math_floor(15)  then
                    surface_PlaySound("holyshit.wav")
                elseif ilya.killstreak == math_floor(17)  then
                    surface_PlaySound("godlike.wav")
                elseif ilya.killstreak == math_floor(20)  then
                    surface_PlaySound("rampage.wav")
                elseif ilya.killstreak > 20 then
                    ilya.killstreak = -1
                end


            end
        end
    end
end )


function ilya.updatePlayerVars( data )
    local id = data.userid

    local ply = Player( id )

    ply.ult_prev_pos = Vector()
    // ply.ult_prev_hitbox_pos = Vector()

    ply.ult_prev_simtime = 0
    ply.flticks = 0

    ply.simtime_updated = false
    ply.break_lc = false
    ply.fakepitch = false

    ilya.btrecords[ ply ] = {}
    ilya.predicted[ ply ] = {}
end

// Menu hints

function ilya.drawOverlay()
    if ilya.UnSafeFrame then return end
    if not ilya.frame:IsVisible() then return end

    if not ilya.hint then
        ilya.hintText = ""
        return
    end

    surface_SetTextColor(ilya.Colors[165])
    surface_SetFont("tbfont")

    local tw, th = surface_GetTextSize(ilya.hintText)

    surface_SetDrawColor(ilya.Colors[35])
    surface_DrawRect(ilya.hintX,ilya.hintY,tw+20,th+10)
    surface_SetDrawColor(ilya.Colors[54])
    surface_DrawOutlinedRect(ilya.hintX,ilya.hintY,tw+20,th+10,1)

    surface_SetTextPos(ilya.hintX+10,ilya.hintY+5)
    surface_DrawText(ilya.hintText)

    ilya.hint = false
end


// Gamemode UpdateClientsideAnimation
--[[]
local function RunSandboxAnims(ply, velocity, maxseqgroundspeed)
    local len = velocity:Length()
	local movement = 1.0

	if ( len > 0.2 ) then
		movement = ( len / maxseqgroundspeed )
	end

	local rate = math.min( movement, 2 )

	-- if we're under water we want to constantly be swimming..
	if ( ply:WaterLevel() >= 2 ) then
		rate = math.max( rate, 0.5 )
	elseif ( !ply:IsOnGround() && len >= 1000 ) then
		rate = 0.1
	end

	ply:SetPlaybackRate( rate )

	-- We only need to do this clientside..
	if ( CLIENT ) then
		if ( ply:InVehicle() ) then
			--
			-- This is used for the 'rollercoaster' arms
			--
			local Vehicle = ply:GetVehicle()
			local Velocity = Vehicle:GetVelocity()
			local fwd = Vehicle:GetUp()
			local dp = fwd:Dot( Vector( 0, 0, 1 ) )

			ply:SetPoseParameter( "vertical_velocity", ( dp < 0 && dp || 0 ) + fwd:Dot( Velocity ) * 0.005 )

			-- Pass the vehicles steer param down to the player
			local steer = Vehicle:GetPoseParameter( "vehicle_steer" )
			steer = steer * 2 - 1 -- convert from 0..1 to -1..1
			if ( Vehicle:GetClass() == "prop_vehicle_prisoner_pod" ) then steer = 0 ply:SetPoseParameter( "aim_yaw", math.NormalizeAngle( ply:GetAimVector():Angle().y - Vehicle:GetAngles().y - 90 ) ) end
			ply:SetPoseParameter( "vehicle_steer", steer )

		end
	end
end

function GAMEMODE:UpdateAnimation(plr, velocity, maxSeqGroundSpeed)
    local hResult = self.BaseClass.UpdateAnimation(self, plr, velocity, maxSeqGroundSpeed)

    RunSandboxAnims(plr, velocity, maxSeqGroundSpeed)
    return hResult;
end
]]



/*
    Libs -> Color
*/



//function ilya.


function ilya.ColorLerp( first, second )
    local FT = FrameTime() * 350

    first.r = math_Approach( first.r, second.r, FT )
    first.g = math_Approach( first.g, second.g, FT )
    first.b = math_Approach( first.b, second.b, FT )
    first.a = math_Approach( first.a, second.a, FT )

    math_Round( first.r, 0 )
    math_Round( first.g, 0 )
    math_Round( first.b, 0 )
    math_Round( first.a, 0 )

    return first
end

function ilya.ColorEqual( first, second )
    if first.r != second.r or first.g != second.g or first.b != second.b or first.a != second.a then
        return false
    end

    return true
end





/*
    hooks -> Think
*/

ilya.ekd = false
ilya.fbkd = false

// Dancer ( act / taunt spam )

ilya.nextact = 0
ilya.actCommands = {"robot","muscle","laugh","bow","cheer","wave","becon","agree","disagree","forward","group","half","zombie","dance","pers","halt","salute"}

// Name changer

do
    local cooldown = GetConVarNumber("sv_namechange_cooldown_seconds")
    local curtime = CurTime()
    local lastname = me:Name()
    local changed = 0

    local nameParts = {
        "КLUMOCК", "BZABEК", "FIKYSALIК", "JoJoBizzare", "Den4ik",
        "Atroks", "хикка девочка няша", "Weak?", "Pudge", "Naomi",
        "noqe", "LinoBlond", "Myz ego", "obessed", "suicide",
        "kitsu","KT", "ogok", "Cheppaev", "Toyoshi",
        "xdxd", "Urxis", "4yDo", "leil", "Sasha2342"
    }

    local namelgbt = {
        "1", "#YRS", "#MYRUST", "^_^", ";)",
        "$$", "", "", "#rep", "!$$", "42", "1337"
    }

    -- Генерация случайного ника
    local function generateRandomName()
        local part1 = nameParts[math.random(1, #nameParts)]
        local part2 = namelgbt[math.random(1, #namelgbt)]
        return part1..""..part2 -- добавляем случайное число для уникальности
    end

    local function check(pl,mn,ptbl)
        if pl == me then return false end

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

    function ilya.nameChanger()
        if curtime > CurTime() then return end

        local pltbl = player_GetAll()

        local len = me:Name():len()

        local mname = string.sub(me:Name(),1,len-1)

        local i = math_random(1,#pltbl)

        if not check(pltbl[i],mname,pltbl) then return end

        changename(pltbl[i]:Name())
    end
    function ilya.nameChangerGenerator()
        if curtime > CurTime() then return end

        -- Генерируем новое имя
        local newName = generateRandomName()

        -- Проверяем, не совпадает ли новое имя с последним именем
        if newName == lastname then
            newName = generateRandomName()  -- Если совпадает, генерируем новое
        end

        -- Меняем имя на сгенерированное
        changename(newName)
    end
end

do
    local tply
    local chatdelay = CurTime()
    local inverterdown = false

    function ilya.hThink()
        if ilya.IsKeyDown( ilya.cfg.binds["Unhook cheat"] ) and not ilya.mkd then
            ilya.Unload()
        end

        if input_IsKeyDown(KEY_DELETE) and not ilya.kd then
            ilya.togglevisible()

            CloseDermaMenus()
        end

        ilya.kd = input_IsKeyDown(KEY_DELETE)

        if ilya.IsKeyDown( ilya.cfg.binds["Ent add"] ) and not ilya.ekd then
            local tr = me:GetEyeTrace().Entity

            if IsValid( tr ) then
                local class = tr:GetClass()

                //print( ilya.allowedClasses[ class ] )

                if not ilya.allowedClasses[ class ] then
                    ilya.allowedClasses[ class ] = true
                else
                    ilya.allowedClasses[ class ] = not ilya.allowedClasses[ class ]
                end
            end
        end

        if ilya.cfg.vars["Inverter"] and ilya.IsKeyDown( ilya.cfg.binds["Inverter"] ) and not inverterdown then
            ilya.inverted = !ilya.inverted
        end

        inverterdown = ilya.IsKeyDown( ilya.cfg.binds["Inverter"] )

        ilya.ekd = ilya.IsKeyDown( ilya.cfg.binds["Ent add"] )

        ilya.mkd = ilya.IsKeyDown( ilya.cfg.binds["Unhook cheat"] )


        if ilya.IsKeyDown( ilya.cfg.binds["Fullbright"] ) and not ilya.fbkd then
            ilya.fbe = not ilya.fbe
        end

        ilya.fbkd = ilya.IsKeyDown( ilya.cfg.binds["Fullbright"] )

        if ilya.cfg.vars["FSpec ClickTP"] and ilya.IsKeyDown( ilya.cfg.binds["FSpec ClickTP"] ) then
            local pos = me:GetEyeTrace().HitPos

            //print(pos)

            //gRunCmd( "ba", "spec" )

            gRunCmd( "FTPToPos", string_format("%d, %d, %d", pos.x, pos.y, pos.z), string_format("%d, %d, %d", 0, 0, 0) )
        end



        // ilya.cfg.vars["FSpec Teleport"] = false
        // ilya.cfg.binds["FSpec Teleport"] = 0

        // ilya.cfg.vars["FSpec Masskill"] = false
        // ilya.cfg.binds["FSpec Masskill"] = 0

        // ilya.cfg.vars["FSpec Velocity"] = false
        // ilya.cfg.binds["FSpec Velocity"] = 0

        if ilya.cfg.vars["Chatspam"] and CurTime() > chatdelay then
            local cmsg = ilya.chatmsg.spam[ilya.cfg.vars["Chatspam mode"]]
            local fmsg = cmsg[math_random(#cmsg)]

            gRunCmd("say",fmsg)

            chatdelay = CurTime() + ilya.cfg.vars["Chatspam timer"]
        end

        if ilya.cfg.vars["Name stealer"] then ilya.nameChanger() end

        if ilya.cfg.vars["Name generator"] then ilya.nameChangerGenerator() end

        if ded.GetCurrentCharge() < ilya.cfg.vars["Shift ticks"] then ded.StartShifting( false ) end

        if ilya.cfg.vars["Tickbase shift"] then
            if ilya.IsKeyDown( ilya.cfg.binds["Tickbase shift"] ) then
                ded.StartShifting( true )
            end

            local shouldcharge =  ded.GetCurrentCharge() < ilya.cfg.vars["Charge ticks"] and ilya.IsKeyDown( ilya.cfg.binds["Auto recharge"] )

            ded.StartRecharging( shouldcharge )

            if shouldcharge then
                ded.StartShifting( false )
            end
        end

        if ilya.cfg.vars["Taunt spam"] and ilya.nextact < CurTime() and me:Alive() and !me:IsPlayingTaunt() then
            local act = ilya.actCommands[ilya.cfg.vars["Taunt"]]

            gRunCmd("act", act)
            ilya.nextact = CurTime() + 0.3
        end

        if ilya.cfg.vars["Yaw base"] == 2 then
            tply = ilya.GetSortedPlayers( 1, 0, 1, false )

            if tply then
                ilya.aatarget = tply[1][1]
            end
        end

        if ilya.cfg.vars["Auto peak"] then
            ilya.autopeakThink()
        end
    end
end


/*
    hooks -> CalcView
*/

ilya.vieworigin = me:EyePos()
ilya.viewfov    = 0
ilya.znear      = 0

ilya.tpenabled = false
ilya.tptoggled = false

ilya.fcvector = me:EyePos()
ilya.fcangles = me:EyeAngles()
ilya.fcenabled = false
ilya.fctoggled = false


/* // TODO
ilya.checkbox("Collision","Third person collision",p:GetItemPanel())
ilya.checkbox("Smoothing","Third person smoothing",p:GetItemPanel())

ilya.slider("X","Viewmodel x",1,180,0,p:GetItemPanel())
ilya.slider("Y","Viewmodel y",1,180,0,p:GetItemPanel())
ilya.slider("Z","Viewmodel z",1,180,0,p:GetItemPanel())
ilya.slider("Roll","Viewmodel r",1,360,0,p:GetItemPanel())
*/

ilya.cameraHullMax = Vector( 3, 3, 3 )
ilya.cameraHullMin = Vector( -3, -3, -3 )
function ilya.hCalcView( ply, origin, angles, fov, znear, zfar )

    if ilya.UnSafeFrame then
        return { origin = origin, angles = angles, fov = fov }
    end

    local view = {}

    local tppressed = ilya.IsKeyDown(ilya.cfg.binds["Third person"])
    local fcpressed = ilya.IsKeyDown(ilya.cfg.binds["Free camera"])

    if ilya.cfg.vars["Third person"] and tppressed and not ilya.tptoggled then
        ilya.tpenabled = not ilya.tpenabled
    end

    if ilya.cfg.vars["Free camera"] and fcpressed and not ilya.fctoggled then
        ilya.fcenabled = not ilya.fcenabled
        ilya.fcangles = me:EyeAngles()
    elseif ilya.fcenabled and not ilya.cfg.vars["Free camera"] then
        ilya.fcenabled = false
    end

    ilya.tptoggled = tppressed
    ilya.fctoggled = fcpressed


    if ilya.cfg.vars["Fake duck"] and ilya.IsKeyDown(ilya.cfg.binds["Fake duck"]) then
        origin.z = me:GetPos().z + 64
    end

    local fangs = ilya.cfg.vars["Silent aim"] and ilya.SilentAngle or angles

    //angles = fangs
    //if not ilya.cfg.vars[ "Norecoil" ] then
    //    angles:Add( ply:GetViewPunchAngles() )
    //end

    if ilya.fcenabled then
        local speed = ilya.cfg.vars["Free camera speed"]

        if input_IsKeyDown(KEY_W) then
            ilya.fcvector = ilya.fcvector + ilya.SilentAngle:Forward() * speed
        end

        if input_IsKeyDown(KEY_S) then
            ilya.fcvector = ilya.fcvector - ilya.SilentAngle:Forward() * speed
        end

        if input_IsKeyDown(KEY_A) then
            ilya.fcvector = ilya.fcvector - ilya.SilentAngle:Right() * speed
        end

        if input_IsKeyDown(KEY_D) then
            ilya.fcvector = ilya.fcvector + ilya.SilentAngle:Right() * speed
        end

        if input_IsKeyDown(KEY_SPACE) then
            ilya.fcvector.z = ilya.fcvector.z + speed
        end

        if input_IsKeyDown(KEY_LSHIFT) then
            ilya.fcvector.z = ilya.fcvector.z - speed
        end

        view.origin = ilya.fcvector
        view.angles = fangs
        view.fov = ilya.cfg.vars["Fov override"]
        view.drawviewer = !ilya.cfg.vars["Ghetto free cam"]
    else
        ilya.fcvector = origin
        view.origin = ilya.tpenabled and origin - ( (fangs):Forward() * ilya.cfg.vars["Third person distance"] ) or origin

        if ilya.tpenabled and ilya.cfg.vars["Third person collision"] then
            local tr = {}

            tr.start = origin
            tr.endpos = origin - ( (fangs):Forward() * ilya.cfg.vars["Third person distance"] )
            tr.mins = ilya.cameraHullMin
            tr.maxs = ilya.cameraHullMax
            tr.filter = ply
            tr.mask = MASK_BLOCKLOS

            local res = TraceHull( tr )

            view.origin = res.HitPos
        end

        view.angles = fangs
        view.fov = ilya.cfg.vars["Fov override"]
        view.drawviewer = ilya.tpenabled
    end

    ilya.vieworigin = ( ilya.cfg.vars["Ghetto free cam"] and ilya.fcenabled ) and ilya.fcvector or origin
    ilya.viewfov    = view.fov
    ilya.znear      = znear

	return view
end

function ilya.GetFovRadius()
    local Radius = ilya.cfg.vars["Aimbot FOV"]

    local Ratio = scrw / scrh
    local AimFOV = Radius * (math.pi / 180)
    local GameFOV = ilya.viewfov * (math.pi / 180)
    local ViewFOV = 2 * math.atan(Ratio * (ilya.znear / 2) * math.tan(GameFOV / 2))



    return (math.tan(AimFOV) / math.tan(ViewFOV / 2)) * scrw
end

/*
    hooks -> CalcViewModelView
*/

function ilya.hCalcViewModelView(wep, vm, oldPos, oldAng, pos, ang)


    pos = ilya.vieworigin
	ang = ilya.cfg.vars["Silent aim"] and ilya.SilentAngle or ang

    if ilya.cfg.vars["Viewmodel manip"] then
		local OverridePos = Vector(ilya.cfg.vars["Viewmodel x"], ilya.cfg.vars["Viewmodel y"], ilya.cfg.vars["Viewmodel z"])
		local OverrideAngle = Angle(ilya.cfg.vars["Viewmodel p"], ilya.cfg.vars["Viewmodel ya"], ilya.cfg.vars["Viewmodel r"])

		ang = ang * 1

		ang:RotateAroundAxis(ang:Right(), OverrideAngle.x * 1.0)
		ang:RotateAroundAxis(ang:Up(), OverrideAngle.y * 1.0)
		ang:RotateAroundAxis(ang:Forward(), OverrideAngle.z* 1.0)

		pos = pos + OverridePos.x * ang:Right() * 1.0
		pos = pos + OverridePos.y * ang:Forward() * 1.0
		pos = pos + OverridePos.z * ang:Up() * 1.0
    end

	return pos, ang
end

/*
    hooks -> Pre / Post DrawViewModel
*/

do
    local drawing = false

    function ilya.hPreDrawViewModel( vm, ply, w, hands )
        if ilya.UnSafeFrame then return end
        if ply != me then return end

        if ilya.cfg.vars["Viewmodel chams"] then
            local col = string_ToColor( ilya.cfg.colors["Viewmodel chams"] )
            ilya.chamMats.vis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
            local mat = ilya.chamMats.vis[ilya.cfg.vars["Viewmodel chams type"]]

            render_SetBlend(col.a/255)
            render_SetColorModulation(col.r/255,col.g/255,col.b/255)
            render_MaterialOverride(mat)
        end


        if ilya.cfg.vars["Fullbright viewmodel"] then
            render_SuppressEngineLighting( true )
        end

        if ilya.cfg.vars["Viewmodel fov"] != GetConVar("viewmodel_fov"):GetInt() and not drawing then
            cam.IgnoreZ(true)
                cam.Start3D(nil, nil, ilya.cfg.vars["Viewmodel fov"])
                drawing = true

                vm:DrawModel()

                drawing = false
                cam.End3D()
            cam.IgnoreZ(false)
        else
            return
        end

        return true
    end

end

function ilya.hPostDrawViewModel( vm, ply, w )
    render_SetColorModulation(1, 1, 1)
    render_MaterialOverride()
    render_SetBlend(1)
    render_SuppressEngineLighting(false)
end

/*
    hooks -> OnImpact ( c++ module )
*/
ilya.bulletImpacts = {}

function ilya.hOnImpact( data )
    local startpos = data.m_vStart

    if ilya.cfg.vars[ "Bullet tracers muzzle" ] and data.m_vStart == me:EyePos() then
        local vm = me:GetViewModel()
	    local wep = me:GetActiveWeapon()

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

    ilya.bulletImpacts[#ilya.bulletImpacts + 1] = {
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
    local oldtrmat = ilya.cfg.vars["Bullet tracers material"]
    local tracemat = Material("sprites/tp_beam001")

    local realcolor, fakecolor, lbycolor = Color( 0, 255, 0 ), Color( 255, 0, 0 ), Color( 0, 0, 255 )

    function ilya.hPostDrawOpaqueRenderables()
        if ilya.UnSafeFrame then return end

        if ilya.cfg.vars["Angle arrows"] then
            local pos = me:GetPos()

            cam_IgnoreZ(true)

            cam_Start3D2D( pos, Angle(0, ilya.realAngle.y + 45, 0), 1 )
                surface_SetDrawColor( realcolor )
                surface_DrawLine( 0, 0, 25, 25 )
            cam_End3D2D()

            cam_Start3D2D( pos, Angle(0, ilya.fakeAngles.angle.y + 45, 0), 1 )
                surface_SetDrawColor( fakecolor )
                surface_DrawLine( 0, 0, 25, 25 )
            cam_End3D2D()

            local lby = ded.GetCurrentLowerBodyYaw( me:EntIndex() )
            cam_Start3D2D( pos, Angle(0, lby + 45, 0), 1 )
                surface_SetDrawColor( lbycolor )
                surface_DrawLine( 0, 0, 25, 25 )
            cam_End3D2D()

            cam_IgnoreZ( false )
        end

        if ilya.cfg.vars["Bullet tracers"] then
            local trmat = ilya.cfg.vars["Bullet tracers material"]


            //print( trmat, oldtrmat )
            if trmat != oldtrmat then
                tracemat = Material( trmat )
                oldtrmat = trmat
            end

            local tracercolor = string_ToColor(ilya.cfg.colors["Bullet tracers"])

            local curTime = CurTime()
            local dieTime = ilya.cfg.vars["Tracers die time"]

            for i = #ilya.bulletImpacts, 1, -1 do
                local impact = ilya.bulletImpacts[i]

                // impact.alpha = impact.alpha - 0.15

                if (curTime - impact.shootTime) > dieTime then
                    table_remove(ilya.bulletImpacts, i)
                    continue
                end

                tracercolor.a = impact.alpha

                render_SetMaterial( tracemat )
                render_DrawBeam( impact.startPos, impact.endPos, 4, 1, 1, tracercolor )
            end
        end



        if ilya.cfg.vars["Auto peak"] and ilya.startedPeeking then
            ilya.drawAutopeak()
        end


    end
end

/*
    hooks -> FrameStageNotify ( c++ module )
*/

// Player data tables

ilya.playerTbl = FindMetaTable("Player")

ilya.playerCache = {}
function ilya.playerTableUpdate( ply )
    ilya.playerCache[ ply ].Name = ply:Name()

    local t = ply:Team()

    ilya.playerCache[ ply ].Team = t
    ilya.playerCache[ ply ].TeamColor = team_GetColor( t )
    ilya.playerCache[ ply ].TeamName = team_GetName( t )

    ilya.playerCache[ ply ].GetUserGroup = ply:GetUserGroup()

    ilya.playerCache[ ply ].Health = ply:Health()
    ilya.playerCache[ ply ].GetMaxHealth = ply:GetMaxHealth()



    ilya.playerCache[ ply ].Armor = ply:Armor()
    ilya.playerCache[ ply ].GetMaxArmor = ply:GetMaxArmor()

    ilya.playerCache[ ply ].GetPos = ply:GetPos()

    ilya.playerCache[ ply ].ObserverMode = ply:GetObserverMode()
    ilya.playerCache[ ply ].ObserverTarget = ply:GetObserverTarget()

    local w = ply:GetActiveWeapon()

    ilya.playerCache[ ply ].WeaponClass = IsValid(w) and ( ilya.cfg.vars["Weapon printname"] and language.GetPhrase( w:GetPrintName() ) or w:GetClass() ) or "Unarmed"
    ilya.playerCache[ ply ].WeaponAmmo = IsValid(w) and w:Clip1() or "-"

    ilya.playerCache[ ply ].MoneyVar = ilya.playerTbl.getDarkRPVar and DarkRP.formatMoney(ply:getDarkRPVar("money")) or "beggar"
end

function ilya.playerDataUpdate( ply )
    if not ilya.playerCache[ ply ] then
        ilya.playerCache[ ply ] = {}

        ilya.playerTableUpdate( ply )
        return
    end

    ilya.playerTableUpdate( ply )
end

// Entity data

ilya.entityCache = {}
ilya.allowedClasses = {}

function ilya.entTableUpdate()
    local entitys = ents_GetAll()

    ilya.entityCache = {}

    for i = 1, #entitys do
        local ent = entitys[ i ]

        if not IsValid( ent ) then continue end
        if not ilya.allowedClasses[ ent:GetClass() ] then continue end

        ilya.entityCache[ #ilya.entityCache + 1 ] = {
            entity = ent,
            class = ent:GetClass(),
            position = ent:GetPos(),
        }
    end
end



// Resolver

ilya.bruteYaw = { 0, -30, 30, -60, 60, -90, 90, -120, 120, -150, 150, -179, 179  }
ilya.bruteYawClassic = { -90, 0, 90, 180, -180, 180, 90, 0, -90 }

ilya.bruteYawhui = { 89.121, 89.824, 11.953, 1.055, 178.945, 72.070, 178.770, 87.012, -262 }
ilya.delta = { 0, 45, -45, 180 }

ilya.deltas = {
    -89,
    0,
    89,
    180,
    -185,
    -85,
}

ilya.headBruteforceAngles = {45, 0, -45}











do
    local localData = {}

    localData.origin = Vector()

    function ilya.FillLocalNetworkData( netdata )
        localData.origin     =   netdata[1]
    end

    function ilya.GetLocalNetworkData()
        return localData
    end
end


do
    local missedTicks = 0
    local lastSimTime = 0

    local FRAME_START = 0
    local FRAME_NET_UPDATE_START = 1
    local FRAME_NET_UPDATE_POSTDATAUPDATE_START = 2
    local FRAME_NET_UPDATE_POSTDATAUPDATE_END = 3
    local FRAME_NET_UPDATE_END = 4
    local FRAME_RENDER_START = 5
    local FRAME_RENDER_END = 6

    function ilya.hFrameStageNotify( stage )
        local plys = player.GetAll()

        if stage == FRAME_NET_UPDATE_POSTDATAUPDATE_END then

            ilya.entTableUpdate()

            plys = player.GetAll()

            local orig = me:GetNetworkOrigin()

            local data = {}

            data[1] = orig      // last networked origin

            ilya.FillLocalNetworkData( data )

            for i = 1, #plys do
                local v = plys[i]

                //if !v.ult_prev_pos then continue end

                local cur_simtime = ded.GetSimulationTime(v:EntIndex())
                local cur_pos = v:GetNetworkOrigin()

                --v.ult_cur_pos = cur_pos

                if not v.ult_prev_simtime then
                    v.ult_prev_simtime = cur_simtime
                    v.ult_prev_pos = cur_pos
                    // v.ult_prev_hitbox_pos = cur_pos
                    v.flticks = 0
                    v.missedanimticks = 0
                    v.simtime_updated = false
                    v.break_lc = false

                    ilya.btrecords[ v ] = {}
                    ilya.predicted[ v ] = {}

                    v.aimshots = 0
                    v.fakepitch = v:EyeAngles().p > 90

                elseif v.ult_prev_simtime != cur_simtime then
                    local flticks = ilya.TIME_TO_TICKS(cur_simtime-v.ult_prev_simtime)

                    // print(v,flticks )

                    ded.SetMissedTicks( flticks )
                    ded.AllowAnimationUpdate( true )

                    v.flticks = math_Clamp(flticks,1,24)

                    v.ult_prev_simtime = cur_simtime

                    v.break_lc = cur_pos:DistToSqr(v.ult_prev_pos) > 4096

                    --if v.ult_prev_pos != v.ult_cur_pos then
                    v.ult_prev_pos = cur_pos

                    // v.ult_prev_hitbox_pos = ilya.getHitbox(v)
                    --end
                    v.fakepitch = v:EyeAngles().p > 90

                    v.simtime_updated = true
                else
                    v.simtime_updated = false
                end

                if ilya.canBacktrack(v) and v != me and v.simtime_updated then
                    ilya.recordBacktrack(v)
                end

                if v.break_lc then
                    ilya.btrecords[ v ] = {}
                end

                /*
                if ilya.cfg.vars["Extrapolation"] and v.simtime_updated and v != me then
                    local predTime = ded.GetLatency(0) + ded.GetLatency(1)
                    local pos = v:GetNetworkOrigin()

                    ded.StartSimulation( v:EntIndex() )

                    for tick = 1, ilya.TIME_TO_TICKS( predTime ) do
                        ded.SimulateTick()
                        local data = ded.GetSimulationData()

                        debugoverlay.Cross( data.m_vecAbsOrigin, 6, 0.1, ilya.Colors["Red"], true )
                        pos = data.m_vecAbsOrigin
                    end

                    local data = ded.GetSimulationData()

                    v:SetRenderOrigin( data.m_vecAbsOrigin )
                    v:SetNetworkOrigin( data.m_vecAbsOrigin )

                    debugoverlay.Box( pos, v:OBBMins(), v:OBBMaxs(), 0.1, color_white )

                    local p = ilya.GetBones( v )[ 1 ]

                    //v:SetRenderOrigin( v.ult_prev_pos )
                    //v:SetNetworkOrigin( v.ult_prev_pos )

                    ilya.predicted[ v ] = { pos = p, tick = ilya.TIME_TO_TICKS( ded.GetSimulationTime( v:EntIndex() ) + predTime  ) }

                    ded.FinishSimulation()


                end
                */

                if ilya.cfg.vars["Extrapolation3"] and v ~= me then
                    local latency = ded.GetLatency(0) + ded.GetLatency(1)
                            local tickCount = ilya.TIME_TO_TICKS(latency)

                            ded.StartSimulation(v:EntIndex())

                            local stop = v:GetNetworkOrigin()

                    for tick = 1, tickCount do
                        ded.SimulateTick()

                        if tick == tickCount then
                            local data = ded.GetSimulationData()
                            local pos = data.m_vecAbsOrigin

                            local aimOffset = Vector(0, 25, 0) --
                            local predictedPos = pos + aimOffset

                            v:SetPos(aimOffset) --
                            v:SetNetworkOrigin(predictedPos)  --
                            v:SetRenderOrigin(aimOffset)  -- меняй типо гибрид вектор воу
                            v:InvalidateBoneCache()
                            v:SetupBones()
                        end
                    end

                    ded.FinishSimulation()
                end


                if ilya.cfg.vars["Extrapolation2"] and v ~= LocalPlayer() then
                    local predTime = ded.GetLatency(1) + ded.GetLatency(1)
                    ded.StartSimulation(v:EntIndex())

                    local pos = v:GetPos()
                    local forwardVector = v:GetForward()
                    local distanceToMove = 100  -- желаемое расстояние

                    for tick = 1, ilya.TIME_TO_TICKS(predTime) do
                        ded.SimulateTick()

                        local data = ded.GetSimulationData()
                        debugoverlay.Box(data.m_vecAbsOrigin, v:OBBMins(), v:OBBMaxs(), 0.1, Color(255, 25, 25, 8))

                        -- позиция
                        pos = pos + forwardVector * distanceToMove / ilya.TIME_TO_TICKS(predTime)
                        v:SetPos(pos)
                    end

                    ded.FinishSimulation()
                    v:SetRenderOrigin(pos)
                    v:SetNetworkOrigin(pos)
                    v:InvalidateBoneCache()
                    v:SetupBones()
                end

                if ilya.cfg.vars["Extrapolation"] and v != me then
                    local predTime = ( ded.GetLatency(0) + ded.GetLatency(1) )

                    ded.StartSimulation( v:EntIndex() )

                    local pos = v:GetNetworkOrigin()

                    for tick = 1, ilya.TIME_TO_TICKS( predTime ) do
                        ded.SimulateTick()

                        local data = ded.GetSimulationData()
                        debugoverlay.Box( data.m_vecAbsOrigin, v:OBBMins(), v:OBBMaxs(), 0.1, Color( 255, 25, 25, 8 ) )
                    end

                    local data = ded.GetSimulationData()
                    pos = data.m_vecAbsOrigin

                    ded.FinishSimulation()

                    v:SetRenderOrigin( pos )
                    v:SetNetworkOrigin( pos )
                    v:InvalidateBoneCache()
                    v:SetupBones()
                end

            end
        elseif stage == FRAME_RENDER_START then
            plys = player.GetAll()

            for i = 1, #plys do
                local v = plys[i]

                if v == me then continue end

                if ilya.cfg.vars["Forwardtrack"] then
                    local predTime = ( ded.GetLatency(0) + ded.GetLatency(1) ) * ilya.cfg.vars["Forwardtrack time"]
                    ded.StartSimulation( v:EntIndex() )

                    local prevPos = v:GetNetworkOrigin()
                    for tick = 1, ilya.TIME_TO_TICKS(predTime) do
                        ded.SimulateTick()

                        local data = ded.GetSimulationData()
                        debugoverlay.Line(prevPos, data.m_vecAbsOrigin, 0.1, color_white, true)

                        prevPos = data.m_vecAbsOrigin
                    end

                    local data = ded.GetSimulationData()



                    ded.FinishSimulation()
                end

                if ilya.cfg.vars["Resolver"] then
                    local mode = ilya.cfg.vars["Resolver mode"]
                    if mode == 1 then
                      local angs = Angle()
                      angs.y = ilya.bruteYaw[ v.aimshots % #ilya.bruteYaw + 1 ] + v:EyeAngles().y

                      v:SetRenderAngles( angs )
                      v:SetNetworkAngles( angs )

                      //local headAngle =  ilya.headBruteforceAngles[v.aimshots % # ilya.headBruteforceAngles + 1]
                      //v:SetPoseParameter("aim_yaw", headAngle)
                      //v:SetPoseParameter("head_yaw", headAngle)


                      ded.SetCurrentLowerBodyYaw( v:EntIndex(), angs.y )



                    elseif mode == 2 then
                        local angs = Angle()
                        angs.y = ilya.bruteYawhui[ v.aimshots % #ilya.bruteYawhui + 1 ] + v:EyeAngles().y

                        v:SetRenderAngles( angs )
                        v:SetNetworkAngles( angs )

                        //local headAngle =  ilya.headBruteforceAngles[v.aimshots % # ilya.headBruteforceAngles + 1]
                        //v:SetPoseParameter("aim_yaw", headAngle)
                        //v:SetPoseParameter("head_yaw", headAngle)

                        ded.SetCurrentLowerBodyYaw( v:EntIndex(), angs.y )

                    elseif mode == 3 then
                        local angs = Angle()
                        angs.y = ilya.deltas[ v.aimshots % #ilya.deltas + 1 ] + v:EyeAngles().y

                        v:SetRenderAngles( angs )
                        v:SetNetworkAngles( angs )

                        //local headAngle =  ilya.headBruteforceAngles[v.aimshots % # ilya.headBruteforceAngles + 1]
                        //v:SetPoseParameter("aim_yaw", headAngle)
                        //v:SetPoseParameter("head_yaw", headAngle)

                        ded.SetCurrentLowerBodyYaw( v:EntIndex(), angs.y )

                    elseif mode == 4 then
                        local angs = Angle()
                        angs.y = angs.y + (ilya.delta[ v.aimshots ] or 0) + v:EyeAngles().y

                        v:SetRenderAngles( angs )
                        v:SetNetworkAngles( angs )

                        //local headAngle = ilya.headBruteforceAngles[v.aimshots % # ilya.headBruteforceAngles + 1]
                        //v:SetPoseParameter("aim_yaw", headAngle)
                        //v:SetPoseParameter("head_yaw", headAngle)

                        ded.SetCurrentLowerBodyYaw( v:EntIndex(), angs.y )
                    elseif mode == 5 then
                        local angs = Angle()
                        angs.y = ilya.bruteYawClassic[ v.aimshots % #ilya.bruteYawClassic + 1 ] + v:EyeAngles().y

                        v:SetRenderAngles( angs )
                        v:SetNetworkAngles( angs )

                        //local headAngle = ilya.headBruteforceAngles[v.aimshots % # ilya.headBruteforceAngles + 1]
                        //v:SetPoseParameter("aim_yaw", headAngle)
                        //v:SetPoseParameter("head_yaw", headAngle)

                        ded.SetCurrentLowerBodyYaw( v:EntIndex(), angs.y )
                    elseif mode == 6 then
                        local function DynamicResolver(v)
                            local currentAngles = v:EyeAngles()
                            local bestAngle = nil
                            local bestScore = -math.huge

                            for _, delta in ipairs(ilya.deltas) do
                                local testAngle = Angle(currentAngles.x, currentAngles.y + delta, currentAngles.z)
                                local score = EvaluateAngleScore(v, testAngle)

                                if score > bestScore then
                                    bestScore = score
                                    bestAngle = testAngle
                                end
                            end

                            function EvaluateAngleScore(v, angle)
                                local score = 0
                                local target = GetClosestTarget(v)

                                if target then
                                    local targetPosition = target:GetPos()
                                    local playerPosition = v:GetPos()
                                    local distance = (targetPosition - playerPosition):Length()

                                    -- Оценка на основе расстояния
                                    score = score - distance

                                    -- Оценка на основе угла разницы
                                    local angleDifference = AngleDiff(v:EyeAngles().y, angle.y)
                                    score = score + (180 - math.abs(angleDifference))

                                    -- Можно добавить дополнительные факторы, такие как скорость движения
                                    local velocity = v:GetVelocity():Length()
                                    score = score + (1000 - velocity) -- Чем меньше скорость, тем выше оценка
                                end

                                return score
                            end

                            function GetClosestTarget(v)
                                local closestTarget = nil
                                local closestDistance = math.huge

                                for _, target in ipairs(GetAllPlayers()) do
                                    if target ~= v and target:Alive() then
                                        local distance = (target:GetPos() - v:GetPos()):Length()
                                        if distance < closestDistance then
                                            closestDistance = distance
                                            closestTarget = target
                                        end
                                    end
                                end

                                return closestTarget
                            end

                            function AngleDiff(a, b)
                                local diff = a - b
                                if diff > 180 then
                                    diff = diff - 360
                                elseif diff < -180 then
                                    diff = diff + 360
                                end
                                return diff
                            end

                            if bestAngle then
                                v:SetRenderAngles(bestAngle)
                                v:SetNetworkAngles(bestAngle)
                                ded.SetCurrentLowerBodyYaw(v:EntIndex(), bestAngle.y)
                            end
                        end
                    end




                    /*elseif mode == 2 then
                        local angs = Angle()
                        angs.y = ilya.bruteYaw2[ v.aimshots % #ilya.bruteYaw2 + 1 ] + v:EyeAngles().y

                        v:SetRenderAngles( angs )
                        v:SetNetworkAngles( angs )

                        ded.SetCurrentLowerBodyYaw( v:EntIndex(), angs.y )

                    elseif mode == 3 then
                        local angs = Angle()
                        angs.y = math_NormalizeAngle( angs.y + ilya.delta1[ v.aimshots % #ilya.delta1 + 1 ] + v:EyeAngles().y)

                        v:SetRenderAngles( angs )
                        v:SetNetworkAngles( angs )

                        ded.SetCurrentLowerBodyYaw( v:EntIndex(), angs.y )

                    elseif mode == 4 then
                        local angs = Angle()
                        angs.y = angs.y + (ilya.bruteYaw2[ v.aimshots ] or 0) + v:EyeAngles().y

                        v:SetRenderAngles( angs )
                        v:SetNetworkAngles( angs )

                        ded.SetCurrentLowerBodyYaw( v:EntIndex(), angs.y )
                    */



                    /*if ilya.cfg.vars["Resolver mode"] == "Absolute" or ilya.cfg.vars["Resolver mode"] == "Relative" then
                        local bruteforceAngles = {-90, 0, 90, 180, -180, 180, 90, 0, -90}
                        local headBruteforceAngles = {45, 0, -45}
                        local angs = Angle()
                        angs.y = ilya.bruteYaw[ v.aimshots % #ilya.bruteYaw + 1 ] + v:EyeAngles().y

                        if ilya.cfg.vars["Resolver mode"] == "Relative" then
                            angs.y = angs.y + v:EyeAngles().y
                        end

                        v:SetRenderAngles(angs)

                        local headAngle = headBruteforceAngles[v.aimshots % #headBruteforceAngles + 1]
                        v:SetPoseParameter("aim_yaw", headAngle)
                        v:SetPoseParameter("head_yaw", headAngle)
                    elseif ilya.cfg.vars["Resolver mode"] == "StatAbs" or ilya.cfg.vars["Resolver mode"] == "StatRel" then
                        if !v.sw_resolve_stats then
                            v.sw_resolve_stats = {}
                            for i = -180, 180, 45 do
                                v.sw_resolve_stats[i] = 1
                            end
                        end


                        local weightSum = 0
                        for _, weight in pairs(v.sw_resolve_stats) do
                            weightSum = weightSum + weight
                        end

                        local sel = math_Random(weightSum)
                        local selYaw
                        for yaw, weight in pairs(v.sw_resolve_stats) do
                            sel = sel - weight
                            if sel <= 0 then
                                selYaw = yaw
                                break
                            end
                        end

                        v:SetPoseParameter("aim_yaw", 0)
                        v:SetPoseParameter("head_yaw", 0)

                        ded.SetCurrentLowerBodyYaw( v:EntIndex(), angs.y )

                    end*/

                end



            end




            // Extrapolate aim target vector
            /*
            if ilya.cfg.vars["Extrapolation"] and ilya.target and ilya.targetVector then
                local t = ilya.target

                if t.break_lc then
                    local predTicks = ilya.TIME_TO_TICKS( ded.GetLatency(0) + ded.GetLatency(1) ) // ilya.TIME_TO_TICKS( ded.GetLatency(0) + ded.GetLatency(1) ) / t.flticks

                    ded.StartSimulation(t:EntIndex())

                    for tick = 1, predTicks do
                        ded.SimulateTick()
                    end

                    local data = ded.GetSimulationData()

                    print("[pre set] network" , t:GetNetworkOrigin(), "render", t:GetRenderOrigin())

                    t:SetRenderOrigin(data.m_vecAbsOrigin)
                    t:SetNetworkOrigin(data.m_vecAbsOrigin)

                    // v:InvalidateBoneCache()
                    // v:SetupBones()

                    ilya.extrapolatedVector = ilya.getHitbox(t)

                    print("[pre finish] network" , t:GetNetworkOrigin(), "render", t:GetRenderOrigin())

                    ded.FinishSimulation()

                    print("[post finish] network" , t:GetNetworkOrigin(), "render", t:GetRenderOrigin())

               //ilya.extrapolatedVector = t.ult_prev_hitbox_pos

                end
            end
            */



            // Anim fix




            // [pre set] network	-453.500000 1271.375000 1.031250	render	-465.303375 1267.841431 1.031250
            // [pre finish] network	-465.303375 1267.841431 1.031250	render	-465.303375 1267.841431 1.031250
            // [post finish] network	-453.500000 1271.375000 1.000000	render	-465.303375 1267.841431 1.031250


         end
    end
end

function ilya.hPostFrameStageNotify( stage )
    if stage != 3 then return end

    local plys = player_GetAll()

    for i = 1, #plys do
        local v = plys[i]

        if v == me then continue end

        ilya.playerDataUpdate( v )
    end

end

/*
    hooks -> ShouldUpdateAnimation ( cpp )
*/

ilya.fakeAngles = {
    angle = me:EyeAngles(),
    movex = 0,
    movey = 0,
    layers = {},
    seq = 0,
    cycle = 0,
    origin = me:GetPos(),
}


function ilya.hUpdateAnimation( v )

    if ilya.cfg.vars["Pitch resolver"] and v.fakepitch then
        v:SetPoseParameter( "aim_pitch", -89 )
        v:SetPoseParameter( "head_pitch", -89 )
    end


    if ilya.cfg.vars["res test"] and v.fakepitch then
        v:SetPoseParameter( "aim_pitch", -45 )
        v:SetPoseParameter( "head_pitch", -45 )
    end

    v:InvalidateBoneCache()
end

function ilya.hShouldUpdateAnimation( entIndex )
    local ent = Entity( entIndex )

    if not ent.simtime_updated then return end

    ded.SetMissedTicks( ent.flticks )
    ded.AllowAnimationUpdate( true )
end

// AA shit
ilya.realModel = ilya.CS_Model( me:GetModel() )
ilya.fakeModel = ilya.CS_Model( me:GetModel() )

ilya.newModel = me:GetModel()

function ilya.drawCSModels_real()
    if not ilya.cfg.vars["Anti aim chams"] and IsValid(me) then
        return
    end
    if not me:Alive() then
        return
    end

    local mymodel = me:GetModel()

    if ilya.newModel != mymodel then
        ilya.CS_Model( mymodel )
        ilya.newModel = mymodel
    end

    local tbl = {
        layers = ilya.fakeAngles.layers,
        angles = ilya.fakeAngles.angle,
        sequence = ilya.fakeAngles.seq,
        cycle = ilya.fakeAngles.cycle,
        origin = ilya.fakeAngles.origin,
        movex = ilya.fakeAngles.movex,
        movey = ilya.fakeAngles.movey,
    }

    ilya.CS_Model_update( me, ilya.realModel, tbl )

    if ilya.cfg.vars["Antiaim fullbright"] then
        render_SuppressEngineLighting(true)
    end

    local col = string_ToColor(ilya.cfg.colors["Real chams"])
    ilya.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render_MaterialOverride(ilya.chamMats.invis[ilya.cfg.vars["Antiaim material"]])
    render_SetColorModulation(col.r/255,col.g/255,col.b/255)
    render_SetBlend(col.a/255)
    ilya.realModel:SetRenderMode(1)
    ilya.realModel:DrawModel()

    if ilya.cfg.vars["Antiaim fullbright"] then
        render_SuppressEngineLighting(false)
    end
end

/*
    hooks -> PostDrawEffects
*/

do
    /*


    */

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

    ilya.cfg.vars["Player outline"] = false
    ilya.cfg.vars["Entity outline"] = false
    ilya.cfg.colors["Player outline"] = "45 255 86 255"
    ilya.cfg.colors["Entity outline"] = "255 86 45 255"

    local StoreTexture	= render.GetScreenEffectTexture(0)
    local DrawTexture	= render.GetScreenEffectTexture(1)

    function ilya.RenderOutline()
        local renderEnts = {}

        if ilya.cfg.vars["Player outline"] then
            local plys = player.GetAll()

            for i = 1, #plys do
                local v = plys[ i ]

                if not IsValid( v ) or v == me or not v:Alive() or v:IsDormant() then continue end

                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if ilya.cfg.vars["Entity outline"] then
            for i = 1, #ilya.entityCache do
                local v = ilya.entityCache[ i ].entity

                if not IsValid( v ) or v:IsDormant() then continue end

                renderEnts[ #renderEnts + 1 ] = v
            end
        end

        if #renderEnts == 0 then return end

        local scene = render.GetRenderTarget()
        render.CopyRenderTargetToTexture(StoreTexture)

        if subclear[ ilya.cfg.vars["Outline style"] ] then
            render.Clear( 255, 255, 255, 255, true, true )
        else
            render.Clear( 0, 0, 0, 0, true, true )
        end

        render.SetStencilEnable(true)
            cam_IgnoreZ(true)
            render.SuppressEngineLighting(true)

            render.SetStencilWriteMask(255)
            render.SetStencilTestMask(255)

            render.SetStencilCompareFunction(STENCIL_ALWAYS)
            render.SetStencilFailOperation(STENCIL_KEEP)
            render.SetStencilZFailOperation(STENCIL_REPLACE)
            render.SetStencilPassOperation(STENCIL_REPLACE)

            cam_Start3D()
                for i = 1, #renderEnts do
                    render.SetStencilReferenceValue( i )

                    renderEnts[i]:DrawModel()
                end
            cam_End3D()

            render.SetStencilCompareFunction(STENCIL_EQUAL)

            cam_Start2D()
                for i = 1, #renderEnts do
                    local c = renderEnts[i]:IsPlayer() and string_ToColor( ilya.cfg.colors["Player outline"] ) or string_ToColor( ilya.cfg.colors["Entity outline"] )

				    render.SetStencilReferenceValue( i )

                    surface_SetDrawColor( c )
                    surface_DrawRect( 0, 0, scrw, scrh )

                    // surface_SimpleTexturedRect( 0, 0, scrw, scrh, string_ToColor( ilya.cfg.colors["Health bar gradient"] ) , ilya.Materials["Gradient"] )
                end
            cam_End2D()

            render_SuppressEngineLighting(false)
            cam_IgnoreZ(false)
        render.SetStencilEnable(false)

        render.CopyRenderTargetToTexture(DrawTexture)

        if ilya.cfg.vars["Outline style"] > 1 then
            render.BlurRenderTarget( DrawTexture, 1, 1, 1 )
        end

        render.SetRenderTarget(scene)
        CopyMat:SetTexture("$basetexture",StoreTexture)
        render.SetMaterial(CopyMat)
        render.DrawScreenQuad()

        render.SetStencilEnable(true)
            render.SetStencilReferenceValue(0)
            render.SetStencilCompareFunction(STENCIL_EQUAL)

            local mat = outline_mats[ ilya.cfg.vars["Outline style"] ]

            mat:SetTexture( "$basetexture", DrawTexture )
            render_SetMaterial( mat )

            for x=-1,1 do
                for y=-1,1 do
                    if x==0 and x==0 then continue end

                    render.DrawScreenQuadEx(x,y,scrw,scrh)
                end
            end
        render.SetStencilEnable(false)
    end
end


function ilya.surfaceTexture(x,y,w,h,material,color,rot)
	if material == nil or material == "" then return end
    if rot == nil then
        surface.SetDrawColor( color.r, color.g, color.b, color.a )
        surface.SetMaterial(Material(material))
        surface.DrawTexturedRect(x,y,w,h)
    else
        surfaceSetDrawColor( color.r, color.g, color.b, color.a )
        surface.SetMaterial(Material(material))
        surface.DrawTexturedRectRotated(x,y,w,h,rot)
    end
end

hook.Add("PrePlayerDraw",  "WIP", function()
	for k, v in ipairs(player_GetAll()) do
        if ilya.cfg.vars["Modelchanger"] then
            LocalPlayer():InvalidateBoneCache()
			LocalPlayer():SetSequence(LocalPlayer():GetSequence())
            local state = LocalPlayer():GetPredictable()
            LocalPlayer():SetPredictable(not state)
            LocalPlayer():SetPredictable(state)
            if ilya.cfg.vars["Modelchanger model"] == 1 then
                LocalPlayer():SetModel("models/player/charple.mdl")
            elseif ilya.cfg.vars["Modelchanger model"] == 2 then
                LocalPlayer():SetModel("models/player/corpse1.mdl")
            elseif ilya.cfg.vars["Modelchanger model"] == 3 then
                LocalPlayer():SetModel("models/player/gman_high.mdl")
            elseif ilya.cfg.vars["Modelchanger model"] == 4 then
                LocalPlayer():SetModel("models/player/walterv2.mdl")
            elseif ilya.cfg.vars["Modelchanger model"] == 5 then
                LocalPlayer():SetModel("models/skadi/arknights/rstar/skadi/skadi.mdl")
            elseif ilya.cfg.vars["Modelchanger model"] == 6 then
                LocalPlayer():SetModel("models/player/Custom_terrorists/t_leet.mdl")
            elseif ilya.cfg.vars["Modelchanger model"] == 7 then
                LocalPlayer():SetModel("models/player/leet.mdl")
            elseif ilya.cfg.vars["Modelchanger model"] == 7 then
                LocalPlayer():SetModel("models/Luria/Sonic_Adventure/Sonic.mdl")
            end
            LocalPlayer():SetupBones()
        end
        /*if ilya.cfg.vars["Player_modelchanger"] then
            v:InvalidateBoneCache()
            v:SetupBones()
            if ilya.cfg.vars["Player_modelchanger_agent"] == 1 then
                v:InvalidateBoneCache()
                v:SetupBones()
                v:SetModel("models/player/charple.mdl")
            elseif ilya.cfg.vars["Player_modelchanger_agent"] == 2 then
                v:InvalidateBoneCache()
                v:SetupBones()
                v:SetModel("models/player/Group01/male_03.mdl")
            elseif ilya.cfg.vars["Player_modelchanger_agent"] == 3 then
                v:InvalidateBoneCache()
                v:SetupBones()
                v:SetModel("models/player/gman_high.mdl")
            elseif ilya.cfg.vars["Player_modelchanger_agent"] == 4 then
                v:InvalidateBoneCache()
                v:SetupBones()
                v:SetModel("models/player/zombie_classic.mdl")
                elseif ilya.cfg.vars["Player_modelchanger_agent"] == 5 then
                v:InvalidateBoneCache()
                v:SetupBones()
                v:SetModel("models/player/Astolfo.mdl")
            end
        end*/

    end


end)



hook.Add("PrePlayerDraw","nicespastil",function(chel)
    if ilya.cfg.vars["leg_breaker"] then
    if chel != LocalPlayer() then return end
    chel:SetAnimTime(CurTime()+1,00001)
end
end)

/*function ilya.DisableWorldModulation()
	for k, v in pairs( Entity( 0 ):GetMaterials() ) do
   		Material( v ):SetVector( "$color", Vector(1, 1, 1) )
   		Material( v ):SetFloat( "$alpha", 1 )
	end
end
function ilya.DisablePropModulation()

	for k, v in pairs(ents.FindByClass("prop_physics")) do
		v:SetColor(Color(255, 255, 255, 255))
		v:SetRenderMode( RENDERMODE_NORMAL )
	end

    for k, v in pairs(ents.FindByClass("prop_dynamic")) do
		v:SetColor(Color(255, 255, 255, 255))
		v:SetRenderMode( RENDERMODE_NORMAL )
	end

    for k, v in pairs(ents.FindByClass("prop_static")) do
		v:SetColor(Color(255, 255, 255, 255))
		v:SetRenderMode( RENDERMODE_NORMAL )
	end

end*/


hook.Add("PostPlayerDraw", "07777", function(player)
    if not ilya.cfg.vars["ass11"] then return end
    local particle = {}

    local headBone = LocalPlayer():LookupBone("ValveBiped.Bip01_Head1")
    if not headBone then return end

    local bonePos, boneAng = LocalPlayer():GetBonePosition(headBone)
    local circle_pos = bonePos + Vector(0, 0, 10)

particle.x = circle_pos.x + math.random(-10, 10)  
particle.y = circle_pos.y + math.random(-10, 10)  
particle.z = circle_pos.z + math.random(-10, 10)  

particle.velX = math.random(-10, 10)  
particle.velY = math.random(-10, 10)  
particle.velZ = math.random(5, 15)     

--particle.size = math.random(3, 6)      


idiot = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )


local emitter = ParticleEmitter(circle_pos)
local particle = emitter:Add("sprites/glow04_noz", Vector(particle.x, particle.y, particle.z))
if particle then
    particle:SetVelocity(Vector(particle.velX, particle.velY, particle.velZ))
    particle:SetDieTime(1)
    particle:SetStartAlpha(255)
    particle:SetEndAlpha(0)
    particle:SetStartSize(math.random(1, 2))
    particle:SetEndSize(0)
    particle:SetColor(idiot.r, idiot.g, idiot.b)
    particle:SetGravity(Vector(0, 0, -150))
end
emitter:Finish()

    --[[local player = LocalPlayer()
    local snowParticles = {}
    local numParticles = 1

    -- Create snow particles
    for i = 1, numParticles do
        local particle = {
            x = player:GetPos().x + math.random(-17, 17),  -- position around the player
            y = player:GetPos().y + math.random(-17, 17),
            size = math.random(1, 3),
            speed = math.random(1, 3)
        }
        table.insert(snowParticles, particle)
    end

    cam.Start3D(EyePos(), EyeAngles())
    for _, particle in ipairs(snowParticles) do
        particle.y = particle.y + particle.speed

        if particle.y > player:GetPos().y + 100 then
            particle.x = player:GetPos().x + math.random(-100, 100)
            particle.y = player:GetPos().y - 100
        end

        -- Draw
        render.DrawBox(Vector(particle.x, particle.y, player:GetPos().z), Angle(0,0,0), Vector(-particle.size/2, -particle.size/2, 0), Vector(particle.size/2, particle.size/2, 0), Color(255, 255, 255))
    end
    cam.End3D()]]
end)


hook.Add("PostPlayerDraw", "0677766", function(player)
    if not ilya.cfg.vars["ass1"] then return end

local headBone = LocalPlayer():LookupBone("ValveBiped.Bip01_Head1")
if not headBone then return end

local bonePos, boneAng = LocalPlayer():GetBonePosition(headBone)
local circle_pos = bonePos + Vector(0, 0, 10)  

local circle_color = Color(255, 0, 0)  
local circle_radius = 20
local rotation_angle = CurTime() * 100


render.SetMaterial(Material("effects/select_ring"))
render.DrawQuadEasy(circle_pos, Vector(0, 0, 1), circle_radius, circle_radius, circle_color, rotation_angle)

-- Создание и отображение уникальных частиц
    --[[local emitter = ParticleEmitter(circle_pos)
    if emitter then
        local smoke_particle = emitter:Add("particle/smokesprites_000" .. math.random(1, 9), circle_pos)
        if smoke_particle then
            smoke_particle:SetDieTime(1)
            smoke_particle:SetStartAlpha(200)
            smoke_particle:SetEndAlpha(0)
            smoke_particle:SetStartSize(10)
            smoke_particle:SetEndSize(50)
            smoke_particle:SetGravity(Vector(0, 0, 50))
            smoke_particle:SetColor(150, 150, 150)
        end
        emitter:Finish()]]
end)







function ilya.hPostDrawEffects()
    if ilya.UnSafeFrame then return end
    if not ilya.cfg.vars["Player outline"] and not ilya.cfg.vars["Entity outline"] then return end

    ilya.PostRender()
    ilya.RenderOutline()
end

/*
    hooks -> FireBullets ( Player cpp )
*/

//function ilya.hFireBullets( data )
//    PrintTable(data)
//end

/*
    Misc hooks
*/

ilya.landing = false
function ilya.OnLand( ply, inWater, onFloater, speed )
    if !onFloater and !inWater then
        ilya.landing = true
        timer.Simple(1,function() ilya.landing = false end)
    end
end

function ilya.DSADJ( s )
    return ilya.cfg.vars["Disable SADJ"] and -1 or nil
end

ilya.lmc = false
ilya.fbe = false

function ilya.PreRender()
    if ilya.cfg.vars["Fullbright"] or ilya.fbe then
        render.SetLightingMode( ilya.cfg.vars["Fullbright mode"] )
        ilya.lmc = true
    end
end

function ilya.PostRender()
    if ilya.lmc then
        render.SetLightingMode( 0 )
        ilya.lmc = false
    end
end


/*
    ConVar manipulation
*/

ded.ConVarSetFlags( "mat_fullbright", 0 )
ded.ConVarSetFlags( "r_aspectratio", 0 )
ded.ConVarSetFlags( "cl_showhitboxes", 0 )



/*
    Hooks
*/

ilya.hooks          = {}
ilya.hooks.tbl      = {}
ilya.hooks.removed  = {}

hook.Add("Think", "RAINBOWPLAYER", function()
    if ilya.cfg.vars["rainbow player"] then
    local RainbowPlayer = HSVToColor( CurTime() % 6 * 60, 1, 1 )
        LocalPlayer():SetPlayerColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
end
end)

function ilya.hooks.Add( event, func )
    local str =  event .. me:SteamID64()
    ilya.hooks.tbl[ event ] = str

    hook_Add( event, str, func )
end

function ilya.hooks.Remove( event, func )
    ilya.hooks.tbl[ event ] = nil

    hook_Remove( event, event..me:SteamID64() )
end

function hook.Add( str1, str2, func )
    //if ilya.hooks.tbl[ str1 ] == str2 then return end

    hook_Add( str1, str2, func )
end

function hook.Remove( str1, str2 )
    if ilya.hooks.tbl[ str1 ] == str2 then return end

    hook_Remove( str1, str2 )
end

function ilya.Unload()

    if ilya and ilya.frame and IsValid(ilya.frame) then
        ilya.frame:Remove()
    end

    if ilya and ilya.scrollpanel and IsValid(ilya.scrollpanel) then
        ilya.scrollpanel:Remove()
        ilya.scrollpanel = nil
    end


    if ilya and ilya.avatar and IsValid(ilya.avatar) then
        ilya.avatar:Remove()
        ilya.avatar = nil
    end

    if ilya and ilya.userInfoTabsPanel and IsValid(ilya.userInfoTabsPanel) then

        if ilya.userInfoTabButtons then
            for _, btn in ipairs(ilya.userInfoTabButtons) do
                if IsValid(btn) then btn:Remove() end
            end
            ilya.userInfoTabButtons = nil
        end
        ilya.userInfoTabsPanel:Remove()
        ilya.userInfoTabsPanel = nil
    end


    if ilya and ilya.ui then
        if ilya.ui.MultiComboP then
            pcall(function() ilya.ui.RemovePanel( ilya.ui.MultiComboP ) end)
            ilya.ui.MultiComboP = nil
        end
        if ilya.ui.ColorWindow then
            pcall(function() ilya.ui.RemovePanel( ilya.ui.ColorWindow ) end)
            ilya.ui.ColorWindow = nil
        end
        if ilya.ui.ilyaPan then
            pcall(function() ilya.ui.RemovePanel( ilya.ui.ilyaPan ) end)
            ilya.ui.ilyaPan = nil
        end
    end


    if multicomboP and IsValid(multicomboP) then multicomboP:Remove() multicomboP = nil end


    ded.SetBSendPacket( true )
    ded.SetInterpolation( true )
    ded.SetSequenceInterpolation( true )


    ilya.RemoveAllHooks()

    if ilya.RestoreDetours then
        ilya.RestoreDetours()
    end


    ilya.onScreenLogs = {}
    ilya.hitmarkers = {}
    ilya.hitnums = {}
    ilya.playerTrail = {}
    ilya.bulletImpacts = {}

    render.SetLightingMode( 0 )
    ilya.fbe = false
    RunConsoleCommand("mat_fullbright", "0")
end


/*
function hook.Call(  )

end

function hook.Run(  )

end
*/

function hook.GetTable()
    local hooks = hook_GetTable()
    local empty = {}

    for eventName, hookTable in pairs( hooks ) do
        empty[ eventName ] = {}

        for hookName, hookFunc in pairs( hookTable ) do
            if ilya.hooks.tbl[ eventName ] != hookName then
                empty[ eventName ][ hookName ] = hookFunc
            end
        end
    end

    return empty
end

// Gamemode hooks

function GAMEMODE:CreateMove( cmd ) return true end
function GAMEMODE:CalcView( view )  return true end
function GAMEMODE:ShouldDrawLocal() return true end


GAMEMODE["EntityFireBullets"] = function( self, p, data )
    if not ilya.activeWeapon then return end

    local tick = engine.TickCount()
    if ilya.cfg.vars[ "On screen logs" ] and data.Src == me:EyePos() and ilya.aimingrn and ilya.target and not ilya.onScreenLogs[ tick ] and IsFirstTimePredicted() then
        local reason = 1

        local tr = {}
        tr.filter = me
        tr.start = data.Src
        tr.endpos = data.Src + data.Dir * 13337
        tr.mask = MASK_SHOT

        tr = TraceLine( tr )

        if ilya.target.break_lc then
            reason = 4
        elseif ded.GetLatency( 0 ) > 0.2 then
            reason = 3
        elseif tr.StartSolid or tr.Hit and tr.Entity != ilya.target then
            reason = 2
        end

        local hlcolor = string_ToColor( ilya.cfg.colors[ ilya.MissReasons[ reason ].var ] )
        local data = {
            tick = tick,
            { "Shot at ", ilya.target:Name(), " missed due to ", ilya.MissReasons[ reason ].str, },
            { ilya.HitLogsWhite, hlcolor, ilya.HitLogsWhite, hlcolor, }
        }

        ilya.onScreenLogs[ tick ] = data
    end

    local spread = data.Spread * -1

	if ilya.cones[ ilya.activeWeaponClass ] == spread or spread == ilya.nullVec then return end

    ilya.cones[ ilya.activeWeaponClass ] = spread;
end


surface.CreateFont("HitNumberFont", {
    font = "Tahoma",
    extended = false,
    shadow = true,
    outline = true,
    size = 20,
    weight = 900,
    antialias = true
})

surface.CreateFont("CriticalHitNumberFont", {
    font = "Tahoma",
    extended = false,
    shadow = true,
    outline = true,
    size = 20,
    weight = 900,
    antialias = true
})


local hitLocations = {}


local HITGROUP_HEAD = "ValveBiped.Bip01_Head1"


hook.Add("HUDPaint", "DrawHitLocations", function()
    if ilya.cfg.vars["hitbones"] then
        local newHitLocations = {}

        for _, hitLocation in pairs(hitLocations) do
            cam.Start3D()
            local screenPos = hitLocation.pos:ToScreen()
            local posX = screenPos.x
            local posY = screenPos.y
            cam.End3D()

            cam.Start2D()
            surface.SetFont("HitNumberFont")
            local textWidth, textHeight = surface.GetTextSize(hitLocation.text)

            surface.SetTextColor(255, 45, 0, 255 * hitLocation.life)
            surface.SetTextPos(posX - textWidth / 2, posY)
            surface.DrawText(hitLocation.text)

            surface.SetFont("CriticalHitNumberFont")
            surface.SetTextPos(posX - textWidth / 2, posY)
            surface.DrawText(hitLocation.text)

            hitLocation.pos = hitLocation.pos + Vector(0, 0, RealFrameTime() * 32)
            hitLocation.pos = hitLocation.pos + hitLocation.vec * RealFrameTime() * 8
            hitLocation.life = hitLocation.life - RealFrameTime() * 1 / 0.75

            if hitLocation.life > 0 then
                table.insert(newHitLocations, hitLocation)
            end
            cam.End2D()
        end

        hitLocations = newHitLocations
    end
end)


hook.Add("player_hurt", "AddHitLocation", function(info)
    if ilya.cfg.vars["hitbones"] then
        local victim = nil
        local attacker = nil

        for _, player in pairs(player.GetAll()) do
            if player:UserID() == info.userid then
                victim = player
            end
            if player:UserID() == info.attacker then
                attacker = player
            end
        end

        if not (victim and attacker and attacker == LocalPlayer()) then
            return
        end

        if victim:Health() == 0 then
            return
        end

        local location = ""
        if info.hitgroup == HITGROUP_HEAD or info.hitgroup == HITGROUP_STOMACH or info.hitgroup == HITGROUP_LOWER_CHEST or info.hitgroup == HITGROUP_UPPER_CHEST then
            location = "Голова"
        elseif info.hitgroup == HITGROUP_CHEST or info.hitgroup == HITGROUP_STOMACH or info.hitgroup == HITGROUP_LOWER_CHEST or info.hitgroup == HITGROUP_UPPER_CHEST then
            location = "Тело"
        end -- GOVNO DODELAT SUKA

        if location == "" then
            return
        end

        local position = victim:GetPos() + Vector(0, 0, 100)
        table.insert(hitLocations, {pos = position, life = 1, text = location, vec = VectorRand()})
    end
end)

// Hooks

ilya.hooks.Add( "Think",                            ilya.hThink )
ilya.hooks.Add( "RenderScene",                      ilya.hRenderScene )
ilya.hooks.Add( "Ungrabbable2D", function() ilya.DrawESP() ilya.DrawSomeShit() end )
ilya.hooks.Add( "CalcView",                         ilya.hCalcView )
ilya.hooks.Add( "CalcViewModelView",                ilya.hCalcViewModelView )
ilya.hooks.Add( "PreDrawViewModel",                 ilya.hPreDrawViewModel )
ilya.hooks.Add( "PostDrawViewModel",                ilya.hPostDrawViewModel )
ilya.hooks.Add( "PostDrawOpaqueRenderables",        ilya.hPostDrawOpaqueRenderables )
ilya.hooks.Add( "PostDrawEffects",                  ilya.hPostDrawEffects )
ilya.hooks.Add( "OnImpact",                         ilya.hOnImpact )
ilya.hooks.Add( "PreFrameStageNotify",              ilya.hFrameStageNotify )
ilya.hooks.Add( "PostFrameStageNotify",             ilya.hPostFrameStageNotify )
ilya.hooks.Add( "UpdateAnimation",                  ilya.hUpdateAnimation )
ilya.hooks.Add( "ShouldUpdateAnimation",            ilya.hShouldUpdateAnimation )
ilya.hooks.Add( "AdjustMouseSensitivity",           ilya.DSADJ )
ilya.hooks.Add( "RenderScreenspaceEffects",         ilya.drawChams )
ilya.hooks.Add( "PostDrawTranslucentRenderables",   ilya.PostDrawTranslucentRenderables )
ilya.hooks.Add( "DrawOverlay",                      ilya.drawOverlay )
ilya.hooks.Add( "PreRender",                        ilya.PreRender )
ilya.hooks.Add( "PostRender",                       ilya.PostRender )
ilya.hooks.Add( "PreDrawHUD",                       ilya.PostRender )
ilya.hooks.Add( "OnPlayerHitGround",                ilya.OnLand )
ilya.hooks.Add( "DrawPhysgunBeam",                  ilya.DrawPhysgunBeamFunc )
ilya.hooks.Add( "Move",                             ilya.ShootTime)
ilya.hooks.Add( "Shutdown",                         ilya.Shutdown )







