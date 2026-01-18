surface.CreateFont( "font-02", {
	font = "Arial",
	extended = true,
	size = 16,
	weight = 800,
	antialias = true,
})

if IsValid(statsFrame) then
    statsFrame:Close()
end

local statsFrame = vgui.Create("DFrame")
statsFrame:SetTitle("Cheat information")
statsFrame:SetSize(300, 150)
statsFrame:Center()
statsFrame:MakePopup()

statsFrame:SetAlpha(0)

statsFrame:AlphaTo(255, 0.5, 0, function()
    statsFrame:SetAlpha(255)
end)

statsFrame.Paint = function(self, w, h)
    surface.SetDrawColor(50, 50, 50, 255)
    surface.DrawRect(0, 0, w, h)

    draw.SimpleText(self:GetTitle(), "font-02", 10, 5, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

    local colors = {
        Color(255, 255, 333),
        Color(444, 66, 888)
    }

    for i = 1, #colors - 1 do
        surface.SetDrawColor(colors[i])
        surface.DrawLine(0, 20 + i * 5, w, 20 + i * 5)
    end
end

local hyeta = vgui.Create("DLabel", statsFrame)
hyeta:SetPos(10, 30)
hyeta:SetText("Cheat - IlyaWare\nbuild 0.7\nOwner - sevostyanovdima")
hyeta:SizeToContents()
hyeta:SetWrap(true)
hyeta:SetTextColor(Color(255, 255, 255))

local pidorzxc = vgui.Create("DButton", statsFrame)
pidorzxc:SetText("Закрыть")
pidorzxc:SetPos(100, 100)
pidorzxc:SetSize(100, 30)
pidorzxc:SetTextColor(Color(255, 255, 255))
pidorzxc.Paint = function(self, w, h)
    if self:IsHovered() then
        surface.SetDrawColor(70, 70, 70, 200)
    else
        surface.SetDrawColor(100, 100, 100, 200)
    end
    surface.DrawRect(0, 0, w, h)

    draw.SimpleText(self:GetText(), "font-02", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

pidorzxc.DoClick = function()
    statsFrame:AlphaTo(0, 0.5, 0, function()
        statsFrame:Close()
    end)
end

function main()
--local function TIME_TO_TICKS( Time )
--    return math.floor( 0.7 - 0.8 + Time / engine.TickInterval() )
--end

--local discordia = require('zxcmodule')
--local client = discordia.Client()

SV_MAXVEL = GetConVar("sv_maxvelocity"):GetFloat()
SV_GRAVITY = GetConVar("sv_gravity"):GetFloat()
SV_FRICTION = GetConVar("sv_friction"):GetFloat()
SV_AIRACCELERATE = GetConVar("sv_airaccelerate"):GetFloat()
SV_ACCELERATE = GetConVar("sv_accelerate"):GetFloat()
SV_STOPSPEED = GetConVar("sv_stopspeed"):GetFloat()
--SV_UNLAG = GetConVar("sv_unlag"):GetFloat()

--local STEPTIME = engine.TickInterval()
local vecOrigin = Vector(0,0,0)
local gMAX_SAMPLE_TIME = 1

function TIME_TO_TICKS(time)
    return math.floor(1 + (time / engine.TickInterval()))
end
function TICKS_TO_TIME(tick)
    return engine.TickInterval() * tick
end
function ROUND_TO_TICK(time)
    return TICKS_TO_TIME(TIME_TO_TICKS(time))
end

--function Think()
--    for i = 1, 444 do
--        LocalPlayer():ShowProfile()
--        SetClipboardText( string.rep("WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW", 1337, " ") )
--    end
--end

--hook.Add( "Think", ":)", Think )
-- чтобы я знал

--function ServerTime()
--	return TickToTime(LPLY:GetInternalVariable("m_nTickBase"))
--end

--int32_t iTargetTickDiff = TIME_TO_TICKS(flSimTime - flOldAnimTime) +  1;

--if (target)

--cmd->tick_count = TIME_TO_TICKS(target->GetSimulationTime() + (cl_interp_ratio / cl_updaterate));

--else

--cmd->tick_count += TIME_TO_TICKS(cl_interp_ratio / cl_updaterate);


--cmd->tickcount += iTargetTickDiff;

--function TICKS_TO_TIME(ticks)
--    return TickInterval * ticks
--end

--function ROUND_TO_TICK(time)
--    return TICKS_TO_TIME(TIME_TO_TICKS(time))
--end

require("zxcmodule")

local serj = {}

local global 		                    = table.Copy( _G )
local gRender = global.render
local tO                                = draw.SimpleTextOutlined
local sSF                               = surface.SetFont
local sSDC = surface.SetDrawColor
local sDL                               = surface.DrawLine
local sDR = surface.DrawRect
local sSTC = surface.SetTextColor
local sSTP = surface.SetTextPos
local sDT = surface.DrawText
local sGTS = surface.GetTextSize
local sDC = surface.DrawCircle
local sDTE = surface.DrawTexturedRect

local scrw                              = ScrW()
local IsDormant                         = Dormant
local scrh                              = ScrH()
local scrwc                             = scrw / 2
local scrhc                             = scrh / 2

local surface, draw = surface, draw
local math, player = math, player
local table, util = table, util
local CurTime = CurTime

local scrw, scrh = ScrW(), ScrH()

local Vector, Angle, Color = Vector, Angle, Color
local IsValid = IsValid
local TraceLine, TraceHull = util.TraceLine, util.TraceHull

local mtan = math.tan
local mabs, msin, mcos, mClamp, mrandom, mRand = math.abs, math.sin, math.cos, math.Clamp, math.random, math.Rand
local mceil, mfloor, msqrt, mrad, mdeg = math.ceil, math.floor, math.sqrt, math.rad, math.deg
local mmin, mmax = math.min, math.max
local mNormalizeAng = math.NormalizeAngle
local band, bor, bnot = bit.band, bit.bor, bit.bnot

local TICK_INTERVAL = engine.TickInterval()
local me = LocalPlayer()
--local player_GetAll = gPlys.GetAll
local global = table.Copy( _G )
local gPlys = global.player
local player_GetAll = gPlys.GetAll
local gString = global.string
local StartsWith = gString.StartWith
local gTable = global.table
local table_sort = gTable.sort
local TablePlys             = {}
--local TickInterval = gEngine.TickInterval()

local sSDC = surface.SetDrawColor
local surfaceSetDrawColor = surface.SetDrawColor
local surfaceDrawLine = surface.DrawLine
local surfaceDrawRect = surface.DrawRect
local surfaceSetTextColor = surface.SetTextColor
local surfaceSetTextPos = surface.SetTextPos
local surfaceSetFont = surface.SetFont
local surfaceDrawText = surface.DrawText
local surfaceGetTextSize = surface.GetTextSize
local surfaceDrawCircle = surface.DrawCircle
local surfaceDrawOutlinedRect = surface.DrawOutlinedRect
local render_DrawBeam = gRender.DrawBeam
local Ent                   = Entity
                    local UpdatedVars = TablePlys[ i ]
--local StartsWith                        = gString.StartWith

function DrawPie(indicatorX, indicatorY, indicatorRadius, startAngle, endAngle)
    local step = 2
    for angle = startAngle, endAngle, step do
        local startX = indicatorX + math.cos(math.rad(angle)) * indicatorRadius
        local startY = indicatorY + math.sin(math.rad(angle)) * indicatorRadius
        local endX = indicatorX + math.cos(math.rad(angle + step)) * indicatorRadius
        local endY = indicatorY + math.sin(math.rad(angle + step)) * indicatorRadius

        surface.DrawLine(startX, startY, endX, endY)
    end
end

function serj.Petyshara(x,y,w,h,speed)
	local hsv
	for i = 0,w do
		hsv = HSVToColor( ( CurTime() * speed + i ) % 360, 1, 1 )
		surfaceSetDrawColor(hsv.r,hsv.g,hsv.b,255)
		surfaceDrawRect(x+i,y,1,h)
	end
end

function serj.Pidoras( speed, str, font, x, y )
	surface.SetFont( font )
	surface.SetTextPos( x, y )

	for i = 1, #str do
		local col = HSVToColor(  ( CurTime() * speed + (i * 5) ) % 360, 1, 1 )
		surface.SetTextColor( col.r, col.g, col.b )
		surface.DrawText( string.sub( str, i, i ) )
	end
end

function serj.inRect(x,y,w,h)
    local mousex, mousey = gui.MousePos();
    return(mousex < w and mousex > x and mousey < h and mousey > y);
end

--Misc
math, player = math, player
table, util = table, util
pairs, ipairs = pairs, ipairs
Vector, Angle, Color = Vector, Angle, Color
IsValid = IsValid
TraceLine, TraceHull = util.TraceLine, util.TraceHull
--mNormalizeAng = math.NormalizeAngle
band, bor, bnot = bit.band, bit.bor, bit.bnot
TICK_INTERVAL = engine.TickInterval()

local FindMetaTable = FindMetaTable;

local em = FindMetaTable"Entity";
local pm = FindMetaTable"Player";
local cm = FindMetaTable"CUserCmd";
local wm = FindMetaTable"Weapon";
local am = FindMetaTable"Angle";
local vm = FindMetaTable"Vector";

--[[
	Other vars
]]

serj.garbage = false
function serj.surfaceOutline(x,y,w,h,thikness,color)
	surfaceSetDrawColor(Color(color.r,color.g,color.b,color.a))
	surfaceDrawOutlinedRect(x,y,w,h,thikness)
end
serj.blur = Material 'pp/blurscreen'
function serj.blurPanel(pnl)
	local x, y = pnl:LocalToScreen(0, 0)
	surfaceSetDrawColor(255, 255, 255, 255)
	surface.SetMaterial(serj.blur)
	for i = 1, 6 do
		serj.blur:SetFloat('$blur', (i / 3))
		serj.blur:Recompute()
		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(x * -1, y * -1, ScrW(), ScrH())
	end
end
function serj.surfaceTexture(x,y,w,h,material,color,rot)
	if material == nil or material == "" then return end
    if rot == nil then
        surfaceSetDrawColor( color.r, color.g, color.b, color.a )
        surface.SetMaterial(Material(material))
        surface.DrawTexturedRect(x,y,w,h)
    else
        surfaceSetDrawColor( color.r, color.g, color.b, color.a )
        surface.SetMaterial(Material(material))
        surface.DrawTexturedRectRotated(x,y,w,h,rot)
    end
end

function LerpColor(t, from, to)
    local newColor = Color(
        Lerp(t, from.r, to.r),
        Lerp(t, from.g, to.g),
        Lerp(t, from.b, to.b),
        Lerp(t, from.a, to.a)
    )
    return newColor
end

function draw.SimpleTextRainbow(text, font, x, y, color, xalign, yalign)
    local rainbow = math.sin(CurTime()) * 93 + 93
    local textlen = string.len(text)
    local shift = 360 / textlen

    for i = 1, textlen do
        local char = string.sub(text, i, i)
        local hue = (i * shift + rainbow) % 360
        local newcolor = HSVToColor(hue, 1, 1)

        draw.SimpleText(char, font, x + (i - 1) * 10, y, newcolor, xalign, yalign)
    end
end

function draw.Circle( x, y, radius, seg , percent )
	local cir = {}
	if percent == nil then 	percent = 100 end
	percent = percent / 100.0
	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ((( i / seg ) * -360) * percent ) + 180)
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end
	local a = math.rad( 0 )
	surface.DrawPoly( cir )
end

--[[
    Contact
]]

cont = {}
function serj.contact()
    table.insert(cont, {
        DISCORD = sevostyanovdima,
    })
    updateContactConsoleDisplay()
end

function updateContactConsoleDisplay()
    if IsValid(contactPanel) then
        contactPanel:Remove()
    end

    contactPanel = vgui.Create("DFrame")
    contactPanel:SetSize(400, 300)
    contactPanel:SetTitle("Contact Information")
    contactPanel:Center()
    contactPanel:MakePopup()

    local contactList = vgui.Create("DListView", contactPanel)
    contactList:Dock(FILL)
    contactList:SetMultiSelect(false)
    contactList:AddColumn("DISCORD = sevostyanovdima")

    for _, data in ipairs(cont) do
        contactList:AddLine(data[1])
        contactList:AddLine(data[2])
        contactList:AddLine(data[3])
    end
end

--[[
    Checker
]]

checker = {}
function serj.Checker(text, color)
    table.insert(checker, {
        LocalPlayer():Nick(),
        LocalPlayer():GetActiveWeapon():GetClass(),
        LocalPlayer():Health(),
    })
    updateCheckerConsoleDisplay()
end

function updateCheckerConsoleDisplay()
    if IsValid(checkerPanel) then
        checkerPanel:Remove()
    end

    -- Create a new console panel
    checkerPanel = vgui.Create("DFrame")
    checkerPanel:SetSize(400, 300)
    checkerPanel:SetTitle("Checker Logs")
    checkerPanel:Center()
    checkerPanel:MakePopup()

    local checkerList = vgui.Create("DListView", checkerPanel)
    checkerList:Dock(FILL)
    checkerList:SetMultiSelect(false)
    checkerList:AddColumn("Player Nick")
    checkerList:AddColumn("Active Weapon")
    checkerList:AddColumn("Health")

    for _, data in ipairs(checker) do
        checkerList:AddLine(data[1], data[2], data[3])
    end
end

--[[
	Console
]]

--[[consoleLogs = {}
function serj.addLogs(text, color)
    table.insert(consoleLogs, {
        text,
        color.r,
        color.g,
        color.b,
        os.date("%X"),
    })

    updateConsoleDisplay()
end

function updateConsoleDisplay()
    if IsValid(consolePanel) then
        consolePanel:Remove()
    end

    consolePanel = vgui.Create("DFrame")
    consolePanel:SetSize(500, 400)
    consolePanel:SetTitle("Console Logs")
    consolePanel:Center()
    consolePanel:MakePopup()

    local logList = vgui.Create("DListView", consolePanel)
    logList:Dock(FILL)
    logList:SetMultiSelect(false)
    logList:AddColumn("Text")
    logList:AddColumn("Time")
    logList:AddColumn("Check")

    for _, log in ipairs(consoleLogs) do
        logList:AddLine(log[1], log[5])
    end

    timer.Simple(5, function()
        if IsValid(consolePanel) then
            consolePanel:Close()
        end
    end)
end]]

--[[
    Fonts
]]
surface.CreateFont( "hitlogs", {
    font = "Verdana",
    size = 15,
    antialias = true
})
surface.CreateFont( "EternityFont", {
	font = "Arial",
	extended = false,
	size = 15,
	weight = 250,
	antialias = true,
})
surface.CreateFont( "font-09", {
	font = "Arial",
	extended = true,
	size = 12,
	weight = 2000,
	antialias = true,
})
surface.CreateFont( "icon-font", {
	font = "menu_font",
	extended = true,
	size = 55,
	weight = 100,
	antialias = true,
})
surface.CreateFont( "font-01", {
	font = "Arial",
	extended = true,
	size = 14,
	weight = 650,
	antialias = true,
})
surface.CreateFont( "font-02", {
	font = "Arial",
	extended = true,
	size = 15,
	weight = 500,
	antialias = true,
    shadow = true,
})
surface.CreateFont( "font-03", {
	font = "Arial",
	extended = true,
	size = 13,
	weight = 1000,
	antialias = true,
    outline = false,
})
surface.CreateFont( "font-04", {
    size = 15,
    weight = 500,
    antialias = true,
    outline = true,
    font = "Arial",
})
surface.CreateFont( "THUDFONT", {
	font = "Arial",
	extended = true,
	size = 18,
	weight = 700,
	antialias = true,
    shadow = true,
    blursize = 0,
    scanlines = 0,
    material = "!MovingWireframe"
})
surface.CreateFont( "IndicatorFont", {
	font = "Verdana",
	extended = true,
	size = 16,
	weight = 600,
	antialias = true,
    shadow = true,
})
surface.CreateFont( "KeybinderFont", {
	font = "Arial",
	extended = true,
	size = 14,
	weight = 1000,
	antialias = true,
})
surface.CreateFont( "ESP Font", {
	font = "Verdana",
	extended = true,
	size = 12,
	weight = 550,
	antialias = true,
    shadow = true,
    outline = false
})
surface.CreateFont( "SpectatorFont", {
    font = "Verdana",
    extended = true,
    size = 12,
    weight = 550,
    antialias = true,
    shadow = true,
    outline = false
} )

local PLAYER = FindMetaTable( "Player" )

--[[
    Config
]]

serj.cfg = {
	["newcfg"] = "newcfg",
	Vars = {

		["aim_enable"] = false,
        --["Force_seed"] = false,
        ["eyes_e"] = false,
		["af_enable"] = false,
		["ar_enable"] = false,
		["aw_enable"] = false,
        ["sa_enable"] = true,
		["as_enable"] = false,
        ["ap_enable"] = false,
        ["ap_box"] = false,
        ["pred_ictik"] = 3,
        ["pred_ict"] = false,

        ["hitbox_arms"] = false,
        ["hitbox_legs"] = false,

        ["leg_breaker"] = false,
        ["Extrapolation"] = false,
        ["Extrapolation2"] = false,
        ["Extrapolation3"] = false,
        ["no_lag4"] = false,

		["res_enable"] = false,
		["res_step"] = 57,
        ["res_type"] = 1,
		["res_pitch"] = false,
        --["lag_fix"] = false,
        ["no_lag"] = false,
        ["no_lage"] = false, --nolage_time
        ["nolage_time"] = false,
        ["ticker"] = false,
        ["ticki"] = false,
        ["ticki2"] = false,
        ["tickPred"] = false,
        ["update_client_anim_fix"] = false,

        ["legit_trigger"] = false,
        ["legit_fov"] = false,
        ["legit_update"] = false,
        ["legit_fov_draw"] = false,
        ["legit_fov_val"] = 15,
        ["legit_smooth"] = false,
        ["legit_smooth_amount"] = 10,

        ["legit_spread_recoil"] = false,
        ["legit_rcs"] = 100,
        ["legit_scs"] = 100,

		["af_r"] = false,
		["servertime"] = false,

        ["Disable_taunts"] = false, --armorkit
        ["armorkit"] = false,
        ["healthkit"] = false,
        ["Door_Zaeba"] = false,

        ["aim_nospread"] = false,
        ["aim_norecoil"] = false,
        ["aim_nospread_alw"] = false,
        ["aim_norecoil_alw"] = false,

        ["flicker_aa"] = false,

		["aimbot_ignore_bgod"] = false,
   		["aimbot_ignore_nodraw"] = false,
   		["aimbot_ignore_admin"] = false,
   		["aimbot_ignore_bots"] = false,
   		["aimbot_ignore_steam"] = false,
    	["aimbot_ignore_noclip"] = false,
    	["aimbot_ignore_team"] = false,
    	["aimbot_ignore_fr"] = false,

        ["Disable_interpolation"] = false,

        ["backstab"] = false,

		["target_selection"] = 1,
		["hitbox_selection"] = 1,
		["baim_always"] = false,
		["baim_healthbased"] = false,
		["baim_healthbased_a"] = 65,
        ["bog_smerti_resolver_step"] = 66,
        --["samolet_tap"] = false,
        ["lines_aa"] = false,
        ["esp_self_laser_sight"] = false,
        ["cros3d"] = false,

		["hs_h"] = false,
		["hs_b"] = false,
		["hs_a"] = false,
		["hs_l"] = false,

        ["Backtrack"] = false,
        ["Backtrack_time"] = false,
        ["Backtrack_chams"] = false,
        ["Backtrack_skeleton"] = false,
        ["Backtrack_mode"] = 1,

        ["airduck"] = false,
        ["airduck_method"] = 1,

        ["esp_player_modelchanger"] = false,
        ["esp_player_modelchanger_agent"] = 1,
        ["esp_self_customagent"] = false,
        ["esp_self_customagent_agent"] = 1,

		["aa_enable"] = false,
		["yaw_base"] = 1,
		["yaw_real"] = 1,
		["yaw_fake"] = 1,
		["pitch"] = 1,

        ["fast_stop"] = false,
        ["fix_move"] = false,
        ["Name stealer"] = false,

		["c_pitch"] = 1,
		["c_ryaw"] = 1,
		["c_fyaw"] = 1,
		["antiaim_jitterrange"] = 15,
        ["brute_jj"] = 34,
        ["brute_jja"] = 34,
		["antiaim_spinspeed"] = 32,

        ["pitch_zero_land"] = false,
        ["invert_on_shot"] = false,
        ["Effect_sparks"] = false,
        ["grust_crate"] = false,
        ["Air lag duck"] = false,

		["edge_enable"] = false,
        ["edge_side"] = 1,

		["fake_flick"] = false,
		["anti_brute"] = false,
		["avoid_overlap"] = false,
        ["avoid_overlap_add"] = 1,
		["movement_desync"] = false,
		["aa_autodir"] = false,

        ["debugcam"] = false,
        ["debugcam_speed"] = false,

		["aa_off_ladder"] = false,
		["aa_off_use"] = false,

		["dancer"] = false,
		["dance"] = 1,

        ["snaplines"] = false,
        ["snaplines_pos"] = 1,

		["fl_enable"] = false,
        ["fl_peek"] = false,
		["fl_mode"] = 1,
		["fl_maxchoke"] = 3,
        ["fl_lagger"] = false,
		["fl_use"] = false,

		["misc_hitsound"] = true,
		["misc_hitsound_sound"] = 1,

        ["bug_anim"] = false,

        ["misc_infinitduck"] = false,
        ["misc_3rdp"] = false,
        ["misc_3rdp_d"] = 10,
        ["misc_3rdp_s"] = 25,
        ["misc_ofov"] = false,
        ["misc_ofov_v"] = 90,
        ["misc_3rdp_coll"] = false,
        ["misc_shakeoverride"] = false,
        ["misc_msa"] = false,

		["misc_hitsound"] = false,
        ["misc_hitsound_method"] = 1,
        ["misc_hitsound_sound"] = 1,
        ["misc_killsound"] = false,
        ["misc_killsound_ks"] = false,
        ["misc_killsound_sound"] = 1,

		["dance_spam_kt"] = false,
        ["mir_cam"] = false,

		["misc_chatspam"] = false,
        ["misc_killsay"] = false,
        ["misc_killsay_o"] = false,
        ["misc_killsay_lang"] = 1,
        ["dead_kill"] = false,
        ["misc_chatspam_ar"] = false,
        ["misc_chatspam_lang"] = 1,
        ["misc_chatspam_timer"] = 1,
        ["misc_chat_timer"] = 1,
        ["misc_chatbot"] = false,
        ["misc_avtoobsh"] = false,
        ["allah_damage_force"] = false,

        ["Viewmodel_chams"] = false,
        ["Viewmodel_chams_type"] = 1,

		["move_bhop"] = true,
        ["move_ap"] = false,
        ["move_ap_ar"] = false,
        ["move_ap_s"] = 1,
        ["move_ap_sp"] = false,
        ["move_ap_apb"] = false,
        ["move_ap_anim"] = false,
        ["move_strafe"] = false,
        ["move_strafe_backward"] = false,
        --["move_ls"] = false,
        ["move_autodir"] = false,
        ["move_gstrafe"] = false,
        ["move_circle_strafe"] = false,
        --["move_auto_rasprig"] = false,
        ["move_add_speed"] = false,
        --["move_awalls"] = false,

        ["move_ad"] = false,
        ["Handjob_mode"] = 1,
        ["Handjob"] = false,

        ["move_fd"] = false,
        ["move_fd_m"] = 1,

        ["lby_abuseprotect"] = 75,

        ["lgbt_pers"] = false,
        ["lgbt_persik"] = false,

        ["Disable_Sequence_interpolation"] = false,

        ["move_sw"] = false,
        ["move_sws"] = 10,
        ["move_ds"] = false,
        ["move_aw"] = false,
        ["move_aw_d"] = false,

        ["move_aw_len"] = 100,
        ["move_aw_speed"] = 2500,

		["oof_arrows"] = false,
        ["oof_arrows_d"] = false,
        ["oof_arrows_b"] = false,
        ["oof_arrows_bs"] = 2,
        ["oof_arrows_as"] = 10,
        ["oof_arrows_ad"] = 25,
        ["radar_3d"] = false,
        ["mirror_cam"] = false,

        ["hit_effect"] = false,
        ["hitboxes"] = false,
        ["miss_ind"] = false,
        ["engine_pred"] = false,
        ["engineC_pred"] = false,
        ["bullet_pred"] = 1,
        ["Simulation_limit"] = 1,
        ["velocity_pred"] = false,
        ["classic_pred"] = false,
        ["LagFix"] = false,

        ["esp_box_r"] = false,
        ["esp_box_grad_r"] = false,
        ["esp_box_f_r"] = false,  -- dlight dlight_hsv
        ["dlight"] = false,
        ["dlight_hsv"] = false,

        ["esp_box"] = false,
        ["esp_box_grad"] = false,
        ["esp_box_f"] = false,
        --["esp_box_ff"] = 1,
        ["esp_box_type"] = 1,
        ["esp_box_fr"] = false,
        ["esp_box_trg"] = false,
        ["esp_box_team"] = false,
        ["esp_skeleton"] = false,

        ["esp_name"] = false,
        ["esp_ping"] = false,
        ["esp_wep"] = false,
        ["esp_rwep"] = false,
        ["show_ammo"] = false,
        ["show_reloading"] = false,
        ["esp_hp"] = false,
        ["esp_ap"] = false,
        ["esp_team"] = false,
        ["esp_group"] = false,
        ["esp_money"] = false,
        ["hud_disable_hl2_hud"] = false,
        ["tickfix_time"] = 2,



        ["esp_hp_bar"] = false,
        ["esp_hp_bar_ac"] = false,
        ["esp_hp_bar_gradient"] = false,

        ["chams_visible"] = false,
        ["chams_visible_att"] = false,
        ["chams_invisible"] = false,
        ["chams_invisible_att"] = false,
        ["chams_hand"] = false,
        ["chams_handmove"] = 2,
        ["chams_weapon"] = false,
        ["chams_ragdolls"] = false,

        ["chams_visible_mat"] = 1,
        ["chams_invisible_mat"] = 1,
        ["chams_weapon_mat"] = 1,
        ["chams_hand_mat"] = 1,
        ["chams_ragdolls_mat"] = 1,
        ["esp_self_hat"] = false,
        ["esp_self_hat_type"] = 1,
        ["sus_agent"] = false,
        ["susik_agent"] = 1,
        ["menu_d"] = 2,

        ["fake_chams"] = false,
        ["real_chams"] = false,
        ["fakelag_chams"] = false,
        ["real_chams_real"] = false,
        ["real_chams_realtype"] = 8,

        ["paganie_strelochki"] = false,
        ["Allah_walk"] = false,

        ["glow_esp"] = false,
        ["glow_esp_a"] = false,
        ["glow_esp_att"] = false,

        ["fake_chams_m"] = 1,
        ["real_chams_m"] = 1,
        ["fakelag_chams_m"] = 1,
        ["self_trailm"] = 2,
        ["self_traild"] = 25,

        ["name_custom"] = false,
        ["custom_name"] = "ilyaware",
        ["NoAimLag"] = false,
        ["penis_s"] = false,
        ["skull"] = false,
        ["angle_info"] = false,
        ["Aimbot_swaston"] = false,
        ["Aimbot_markers"] = false,
        ["Aimbot_fill"] = false,
        ["Aimbot_krujok"] = false,
        ["Aimbot_marker"] = false,

		["misc_hitmarker"] = false,
        ["misc_hitmarker_pos"] = 1,

        ["misc_inds"] = false,
        ["misc_inds_grad"] = false,
        ["misc_inds_r"] = 5,
        ["misc_inds_hsv"] = false,
        ["misc_inds_hsv_g"] = false,
        ["misc_inds_s"] = 1,

        ["misc_heartmarker"] = false,
        ["misc_heartmarker_color"] = 1,

        ["misc_bullettrace"] = false,
        ["misc_bullettrace_type"] = 1,
        ["misc_bullettrace_blinking"] = false,
        ["misc_bullettrace_time"] = 1,

        ["misc_bulletimpact"] = false,
        ["misc_bulletimpact_time"] = 3,
        ["misc_bulletimpact_glow"] = false,

        ["misc_bullettrace_e"] = false,
        ["misc_bullettrace_type_e"] = 1,
        ["misc_bullettrace_blinking_e"] = false,
        ["misc_bullettrace_time_e"] = 1,

        ["misc_bulletimpact_e"] = false,
        ["misc_bulletimpact_time_e"] = 3,
        ["misc_bulletimpact_glow_e"] = false,

        ["misc_bullettrace_onlyt"] = false,

        ["fast_walk"] = false, --misc_hitmarker_die
        ["misc_hitmarker_die"] = 1,

        ["no_fall"] = false,
        ["auto_sprint"] = false,
        ["custom_n"] = false,

        ["misc_so2_hands"] = false,

        ["wall_color"] = false,
        ["prop_color"] = false,

        ["sky_3d"] = false,
        ["sky_b"] = false,
        ["sky_f"] = false,
        ["sky_c"] = false,
        ["skyboxname"] = "sky_wasteland02",
        ["sky_ch"] = false,

        ["hit_box"] = false,

        ["fall_predict"] = false,
        ["fall_predict1"] = false,
        ["fall_predict2"] = false,
        ["csgo_bscope"] = false,
        ["csgo_bscope_dl"] = false,
        ["csgo_bscope_alt"] = false,
        ["viewmodel_wireframe"] = false,
        ["viewmodel_wiretype"] = 1,
        ["viewmodel_move"] = 5,
        ["esp_self_killeffect_s"] = false,
        ["esp_self_killeffect_s_a"] = 350,

        ["Spectator_type"] = 1,

        ["fog_e"] = false,
        ["snow_particles_count"] = 2,
        ["fog_s"] = 0,
        ["fog_end"] = 1000,
        ["fog_d"] = 0.3,
        ["skininput"] = "models/wireframe",

        ["tracer"] = false, --dormant
        ["dormant"] = false,
        ["alpha_dormant"] = 122,
        ["t_pose"] = false,
        ["hitnumbers"] = false,

        ["misc_observerlist"] = false,
["misc_adminlist"] = false,
["misc_adminlist_x"] = 3,
["misc_adminlist_y"] = 35,

        ["misc_viewmodel"] = false,
        ["viewmodel_flip"] = false,
        ["viewmodel_flip_e"] = false,
        ["misc_bob"] = false,
        ["misc_sway"] = false,
        ["misc_vm_x"] = 0,
        ["misc_vm_y"] = 0,
        ["misc_vm_z"] = 0,
        ["misc_vm_p"] = 0,
        ["misc_vm_ya"] = 0,
        ["misc_vm_r"] = 0,

        ["i_s"] = 1,
        ["i_f"] = 1,
        ["i_a"] = 1,

        ["i_static"] = false,
        ["i_mine_ast"] = false,

        ["i_watermark"] = false,
        ["estetika"] = false,
        ["estetika_num"] = 100,
        ["estetika_r"] = false,
        ["estetika_fill"] = false,
        ["i_indicators"] = false,  --i_indicators_move
        ["i_indicators_move"] = 9,
        ["i_indicators_move2"] = 2,
        ["i_indicators_h"] = false,
        ["i_indicators_fps"] = false,
        ["i_keybinds"] = false,
        ["i_keybinds_x"] = 5,
        ["i_keybinds_y"] = 255,
        ["info_list"] = false,
        ["info_list_x"] = scrw/2-150,
        ["info_list_y"] = scrh/2+150,
        ["i_targethud"] = false,
        ["i_targethud_x"] = scrw/2-150,
        ["i_targethud_y"] = scrh/2+150,

        ["chat_text"] = false,
        ["chat_text1"] = false,
        ["chat_text2"] = false,
        ["chat_text3"] = false,
        ["Knife_bot"] = false,
        ["Forwardtrack_time"] = 100,
        ["slow_slider"] = 6,

        ["i_ignore_ks"] = false,

        ["logs_enable"] = false,

        ["logs_connects"] = false,
        ["logs_hurt"] = false,
        ["logs_misses"] = false,
        ["logs_kills"] = false,

        ["logs_pos"] = 1,
        ["logs_autocolor"] = false,

        ["ch_e"] = false,
        ["ch_type"] = 1,
        ["ch_size"] = 1,

        ["color_modify"] = false,
        ["self_trail"] = false,
        ["hand_glow"] = false,
        ["hand_glow_a"] = false,
        ["hand_glow_r"] = false,

        [ "pp_colour_addr" ] = 0.02,
        [ "pp_colour_addg" ] = 0.02,
        [ "pp_colour_addb" ] = 0,
        [ "pp_colour_brightness" ] = 0,
        [ "pp_colour_contrast" ] = 1,
        [ "pp_colour_colour" ] = 3,
        [ "pp_colour_mulr" ] = 0,
        [ "pp_colour_mulg" ] = 0.02,
        [ "pp_colour_mulb" ] = 0,

        ["motion_blur"] = false,
        [ "X_i" ] = 20,
        [ "X_y" ] = 20,
        [ "mb_aa" ] = 0.4,
        [ "mb_da" ] = 0.8,
        [ "mb_d" ] = 0.01,

        ["motion_blur_e"] = false,
        [ "emb_h" ] = 1,
        [ "emb_v" ] = 2,
        [ "emb_f" ] = 3,
        [ "emb_r" ] = 4,

        ["skininput"] = "metallic",
        ["skininput"] = "models/wireframe",
        ["skininput"] = "debug/env_cubemap_model",
        ["skininput"] = "models/shadertest/shader3",
        ["skininput"] = "models/shadertest/shader4",
        ["skininput"] = "models/shadertest/shader5",
        ["skininput"] = "Models/effects/comball_sphere",
        ["skininput"] = "models/props_combine/tprings_globe",
        ["skininput"] = "Models/effects/comball_tape",
        ["skininput"] = "Models/effects/splodearc_sheet",
        ["skininput"] = "Models/effects/vol_light001",
        ["skininput"] = "models/props_combine/stasisshield_sheet",
        ["skininput"] = "models/props_combine/portalball001_sheet",
        ["skininput"] = "models/props_combine/com_shield001a",
        ["skininput"] = "models/props_c17/frostedglass_01a",
        ["skininput"] = "models/props_lab/Tank_Glass001",
        ["skininput"] = "models/props_combine/tprings_globe",
        ["skininput"] = "models/screenspace",
        ["skininput"] = "brick/brick_model",
        ["skininput"] = "models/props_pipes/GutterMetal01a",
        ["skininput"] = "models/props_pipes/Pipesystem01a_skin3",
        ["skininput"] = "models/props_wasteland/wood_fence01a",
        ["skininput"] = "models/props_foliage/tree_deciduous_01a_trunk",
        ["skininput"] = "models/props_c17/FurnitureFabric003a",
        ["skininput"] = "models/props_c17/FurnitureMetal001a",
        ["skininput"] = "models/props_c17/paper01",
        ["skininput"] = "models/flesh",
        ["skininput"] = "phoenix_storms/metalset_1-2",
        ["skininput"] = "phoenix_storms/metalfloor_2-3",
        ["skininput"] = "phoenix_storms/plastic",
        ["skininput"] = "phoenix_storms/wood",
        ["skininput"] = "phoenix_storms/bluemetal",
        ["skininput"] = "phoenix_storms/cube",
        ["skininput"] = "phoenix_storms/stripes",
        ["skininput"] = "phoenix_storms/wire/pcb_green",
        ["skininput"] = "phoenix_storms/wire/pcb_red",
        ["skininput"] = "phoenix_storms/wire/pcb_blue",
        ["skininput"] = "hunter/myplastic",
        ["skininput"] = "models/XQM/LightLinesRed_tool",

        ["modelinput"] = "models/buggy.mdl",
        ["modelinput"] = "models/weapons/v_eq_fraggrenade.mdl",
        ["modelinput"] = "models/weapons/v_eq_flashbang.mdl",
        ["modelinput"] = "models/weapons/v_c4.mdl",
        ["modelinput"] = "models/weapons/v_irifle.mdl",
        ["modelinput"] = "models/weapons/v_crossbow.mdl",
        ["modelinput"] = "models/weapons/v_crowbar.mdl",
        ["modelinput"] = "models/weapons/v_grenade.mdl",
        ["modelinput"] = "models/weapons/v_physcannon.mdl",
        ["modelinput"] = "models/weapons/v_grenade.mdl",
        ["modelinput"] = "models/weapons/v_pistol.mdl",
        ["modelinput"] = "models/weapons/v_rpg.mdl",
        ["modelinput"] = "models/weapons/v_shotgun.mdl",
        ["modelinput"] = "models/weapons/v_slam.mdl",
        ["modelinput"] = "models/weapons/v_smg1.mdl",
        ["modelinput"] = "models/weapons/v_stunstick.mdl",
        ["modelinput"] = "models/weapons/c_arms.mdl",
        ["modelinput"] = "models/weapons/c_medkit.mdl",
        ["modelinput"] = "models/weapons/c_superphyscannon.mdl",
        ["modelinput"] = "models/weapons/v_toolgun.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_pist_glock18.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_pist_p228.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_pist_deagle.mdl ",
        ["modelinput"] = "models/weapons/cstrike/c_pist_usp.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_pist_usp.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_pist_elite.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_pist_fiveseven.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_shot_m3super90.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_shot_xm1014.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_smg_p90.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_smg_mp5.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_smg_mac10.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_smg_ump45.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_mach_m249para.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_rif_galil.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_rif_ak47.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_rif_m4a1.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_rif_m4a1.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_rif_sg552.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_snip_awp.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_snip_scout.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_snip_g3sg1.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_snip_sg550.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_rif_famas.mdl",
["modelinput"] = "tfa_cso_savery",
["modelinput"] = "tfa_cso_savery_v6",
["modelinput"] = "tfa_cso_m95tiger",
["modelinput"] = "tfa_cso_bendita_v6",
["modelinput"] = "models/weapons/cstrike/c_rif_famas.mdl",
        ["modelinput"] = "models/weapons/cstrike/c_rif_aug.mdl",
        ["modelinput"] = "models/weapons/v_knife_t.mdl",
        ["dprot_e"] = false,

        --["dprot_file_lyb"] = false,
        ["dprot_file_lyb"] = false,
        ["dprot_data_clear"] = false,
        ["dprot_data_clear_"] = 1,
        ["velocity_crosshair"] = false,
        ["dprot_html"] = false,
        ["dprot_qmenu"] = false,
        ["dprot_http"] = false,
        ["dprot_dupes"] = false,
        ["dprot_sql"] = false,
        ["dprot_cg"] = false,
        ["dprot_sw"] = false,
        ["dprot_clcgameui"] = false,
        ["hitbox"] = false, -- Hide_name Custom_name
        ["Hide_name"] = false,
        ["Custom_name"] = false,

        ["cpp_ruka"] = false,
        ["cpp_ebanina"] = false,
        ["cpp_ruka_prikol"] = 1,
        ["Stan_Pudge"] = false,

        ["use_spam"] = false,

        ["map_enable"] = false,
["map_zoom"] = 35,
["map_size"] = 230,
["map_x"] = 5,
["map_y"] = 150,
["map_names"] = false,
["map_teams"] = false,

	},
	Colors = {
        ["hand_glow"] = "15 255 15 255",
        ["logs_hurt"] = "255 15 15 255",
        ["chams_ragdolls"] = "255 255 255 255",
        ["legit_fov_draw"] = "255 25 25 255",
        ["chams_hand"] = "255 255 255 255",
        ["chams_hand1"] = "255 255 255 255",
        ["chams_weapon"] = "255 255 255 255",
        ["estetika"] = "255 255 255 255",
        ["estetika_fill"] = "0 0 0 128",
        ["ch_e"] = "0 255 0 255",
        ["Viewmodel_chams_type"] = "0 255 0 255",
        ["logs_enable"] = "255 25 128 255",
        ["i_watermark"] = "255 255 255 255",
        ["i_keybinds"] = "255 125 45 255",
		["as_enable"] = "255 255 255 255",
        ["ap_enable"] = "255 75 75 255",
		["viewmodel_wireframe"] = "255 0 0 255",
["viewmodel_wireframe1"] = "255 0 0 255",
["real_chams"] = "255 0 0 255",
        ["move_ap"] = "255 25 128 255",
        ["csgo_bscope"] = "255 128 128 215",
        ["sky_f"] = "128 128 128 255",
        ["fog_e"] = "128 128 255 255",
        ["sky_c"] = "128 128 255 255",

        ["misc_eventlog"] = "255 255 255 255",
        ["misc_eventlog_connects"] = "255 255 255 255",
        ["misc_eventlog_dconects"] = "255 255 255 255",
        ["misc_eventlog_hurt"] = "255 255 255 255",
        ["hitbox"] = "255 255 255 100",
        ["dlight"] = "255 255 255 225",
        ["self_trail"] = "255 255 255 225",
        ["i_indicators"] = "255 255 255 225",
        ["i_indicators_h"] = "255 255 255 225",
        ["i_indicators_fps"] = "255 255 255 225",
        ["i_indicators_target"] = "255 255 255 225",

        ["wall_color"] = "255 255 255 255",
        ["prop_color"] = "0 0 0 128",

        ["Hitnumbers"] = "255 255 255 255",
        ["Hitnumbers krit"] = "255 35 35 255",
        ["velocity_crosshair"] = "255 35 35 255",

        ["oof_arrows"] = "255 0 0 255",
        ["oof_arrows_d"] = "128 128 128 128",
        ["tracer"] = "128 128 128 128",

        ["glow_esp"] = "255 0 0 255",

        ["hit1"] = "255 0 0 255",
        ["hit2"] = "255 0 0 255",
        ["hit3"] = "255 0 0 255",
        ["hit4"] = "255 0 0 255",


        ["misc_inds"] = "0 255 0 255",
        ["misc_inds_grad"] = "255 0 0 255",

        ["chams_selfillum"] = "0 255 0 255",
        ["chams_metallic"] = "0 255 0 255",
        ["chams_visible"] = "0 255 0 255",
        ["chams_invisible"] = "255 0 0 255",
        ["esp_self_laser_sight"] = "5 5 5 120",

        ["chat_text"] = "255 255 255 255",
        ["chat_text1"] = "255 255 255 255",
        ["chat_text2"] = "255 255 255 255",
        ["chat_text3"] = "255 255 255 255",
        ["chat_text_color"] = "255 255 255 255",
        ["chat_text1_color"] = "255 255 255 255",
        ["chat_text2_color"] = "255 255 255 255",
        ["chat_text3_color"] = "255 255 255 255",

        ["esp_hp_bar"] = "0 255 0 255",
        ["esp_hp_bar_gradient"] = "255 0 0 255",
        ["esp_rwep"] = "255 255 255 255",
        ["esp_wep"] = "255 255 255 255",
        ["esp_name"] = "255 255 255 255",
        ["esp_ping"] = "255 255 255 255",
        ["esp_hp"] = "25 255 25 255",
        ["esp_ap"] = "100 100 255 255",
        ["esp_box"] = "255 255 255 255",
        ["esp_box_grad"] = "255 25 25 85",
        ["esp_box_f"] = "255 255 255 55",
        ["esp_box_fr"] = "0 255 0 255",
        ["esp_box_trg"] = "255 0 200 255",
        ["esp_skeleton"] = "255 255 255 255",
        ["esp_group"] = "255 0 0 255",
        ["esp_money"] = "15 255 45 255",
        ["hat_color"] = "15 255 45 255",



        ["misc_hitmarker"] = "255 255 255 255",
        ["misc_heartmarker"] = "255 255 255 255",

        ["misc_bullettrace"] = "25 25 255 200",
        ["Aimbot_swaston"] = "255 255 255 255",
        ["Aimbot_marker"] = "255 255 255 255",
        ["Aimbot_markers"] = "255 255 255 255",
        ["Aimbot_fill"] = "255 255 255 255",
        ["Aimbot_krujok"] = "255 255 255 255",

        ["fake_chams"] = "255 45 45 200",
        ["real_chams_real"] = "45 255 45 200",
        ["fakelag_chams"] = "2 183 255 200",

        ["misc_bulletimpact"] = "25 25 255 200",
        ["misc_bullettrace_e"] = "255 25 25 200",
        ["misc_bulletimpact_e"] = "255 25 25 200",
        ["aimbot_snapline"] = "255 255 255 255",
        ["lines_aa"] = "255 255 255 255",
        ["lines2_aa"] = "255 255 255 255",
        ["i_targethudcolor"] = "255 255 255 255",
        ["paganie_strelochki"] = "255 255 255 255",
        ["line2_aa"] = "255 255 255 255",
	},
	Keybinds = {
        showInBinds = {
            ["baim_key"] = true,
            ["key_tp"] = true,
            ["key_cstrafe"] = true,
            ["key_fd"] = true,
            ["key_ap"] = true,
            ["key_af"] = true,
            ["key_tick"] = true,
            ["key_aim"] = true,
            ["key_aaml"] = true,
            ["key_aamr"] = true,
            ["key_armor"] = true,
            ["key_health"] = true,
            ["key_lag"] = true,
            ["key_ff"] = true,
            ["key_aw"] = true,
            ["key_sw"] = true,
            ["strafe_key"] = true,
            ["backstab"] = true,
            ["slow_key"] = true,
            ["lag_key"] = true,
            ["KnifeBot"] = true,
            ["Allah_walkk"] = true,
            ["key_bind"] = true,
        },
        mode = {
            ["baim_key"] = 1,
            ["key_tp"] = 1,
            ["key_cstrafe"] = 1,
            ["key_fd"] = 1,
            ["key_ap"] = 1,
            ["key_af"] = 1,
            ["key_tick"] = 1,
            ["key_aim"] = 1,
            ["key_aaml"] = 1,
            ["key_aamr"] = 1,
            ["key_armor"] = 1,
            ["key_health"] = 1,
            ["key_lag"] = 1,
            ["key_ff"] = 1,
            ["key_aw"] = 1,
            ["key_sw"] = 1,
            ["strafe_key"] = 1,
            ["backstab"] = 1,
            ["slow_key"] = 1,
            ["lag_key"] = 1,
            ["KnifeBot"] = 1,
            ["Allah_walkk"] = 1,
            ["key_bind"] = 1,
        },
		["baim_key"] = 0,
		["key_tp"] = 0,
        ["key_cstrafe"] = 0,
        ["key_fd"] = 0,
        ["key_ap"] = 0,
        ["key_af"] = 0,
        ["key_tick"] = 0,
        ["key_aim"] = 0,  --key_armor --key_health
        ["key_aaml"] = 0,
        ["key_aamr"] = 0,
        ["key_armor"] = 0,
        ["key_health"] = 0,
        ["key_lag"] = 0,
        ["key_ff"] = 0,
        ["key_aw"] = 0,
        ["key_sw"] = 0,
        ["strafe_key"] = 0,
        ["backstab"] = 0,
        ["slow_key"] = 0,
        ["lag_key"] = 0,
        ["KnifeBot"] = 0,
        ["Allah_walkk"] = 0,
        ["key_bind"] = 0,
	},
	Cvarmanager = {},
	Spoofedcvars = {},
	gunSkins = {},
    gunModels = {},
	["friends"] = {},
    ["forcedpitch"] = {},
    AdaptiveConfig = {},
}
serj.cfg.Colors["alpha_menu"] = "122 512 312 255"
serj.cfg.Colors["menu_color"] = "122 512 312 255"

serj.activebinds = {
    ["baim_key"] = false,
    ["key_tp"] = false,
    ["key_cstrafe"] = false,
    ["key_fd"] = false,
    ["key_ap"] = false,
    ["key_af"] = false,
    ["key_tick"] = false,
    ["key_aim"] = false,
    ["key_aaml"] = false,
    ["key_aamr"] = false,
    ["key_armor"] = false,
    ["key_health"] = false,
    ["key_lag"] = false,
    ["key_ff"] = false,
    ["key_aw"] = false,
    ["key_sw"] = false,
    ["strafe_key"] = false,
    ["backstab"] = false,
    ["slow_key"] = false,
    ["lag_key"] = false,
    ["KnifeBot"] = false,
    ["Allah_walkk"] = false,
    ["key_bind"] = false,
}
serj.translateKeybinds = {
    name = {
        ["baim_key"] = "Body aim",
        ["key_tp"] = "Thirdperson",
        ["key_cstrafe"] = "Circle strafe",
        ["key_fd"] = "Fake duck",
        ["key_ap"] = "Autopeak",
        ["key_af"] = "Auto Fire",
        ["key_tick"] = "Tick predict",
        ["key_aim"] = "Aim enable",
        ["key_aaml"] = "Manual Right",
        ["key_aamr"] = "Manual Left",
        ["key_armor"] = "Armorkit",
        ["key_health"] = "Healthkit",
        ["key_lag"] = "Lagger",
        ["key_ff"] = "Fake flick",
        ["key_aw"] = "Avoid walls",
        ["key_sw"] = "Slowwalk",
        ["strafe_key"] = "Air strafe",
        ["backstab"] = "Force Backstab",
        ["slow_key"] = "Slowmode",
        ["lag_key"] = "Lag mode",
        ["KnifeBot"] = "Knife bot",
        ["Allah_walkk"] = "Allaw walk",
        ["key_bind"] = "Angle",
    },
    mode = {
        [1] = "Hold",
        [2] = "Toggle",
    }
}

do
    local tickrate = tostring(math.Round(1 / engine.TickInterval()))

	RunConsoleCommand("cl_cmdrate", tickrate)
	RunConsoleCommand("cl_updaterate", tickrate)

    --ded.NetSetConVar("cl_interpolate", "0")
    --ded.NetSetConVar("cl_interp", "0")

    --local maxshift = GetConVar("sv_maxusrcmdprocessticks"):GetInt() - 1
    --local tickrate = tostring(math_Round(1 / TickInterval))

	--gRunCmd("cl_cmdrate", tickrate)
	--gRunCmd("cl_updaterate", tickrate)

	--gRunCmd("cl_interp_ratio", "0")

    --ded.SetInterpolation(false)
    --ded.SetSequenceInterpolation(false)
    --ded.EnableAnimFix( false )
end

function strToColor(str) -- цвета
    local cnt = 0
    local r
    local g
    local b
    local a
    for w in string.gmatch(str, "%d+") do
        cnt = cnt + 1
        if cnt == 1 then
            r = w
        elseif cnt == 2 then
            g = w
        elseif cnt == 3 then
            b = w
        elseif cnt == 4 then
            a = w
        end
    end
    return Color(r,g,b,a)
end

serj.screenShake = util.ScreenShake
serj.oldCreateDir = file.CreateDir
serj.oldFileDelete = file.Delete
serj.oldFileWrite = file.Write
serj.oldFileExists = file.Exists
serj.oldFileFind = file.Find
serj.oldFileOpen = file.Open

serj.oldSqlBegin = sql.Begin
serj.oldSqlCommit = sql.Commit
serj.oldSqlQuery = sql.Query
serj.oldSqlQueryRow = sql.QueryRow
serj.oldSqlQueryValue = sql.QueryValue

serj.oldSpawnMenu1 = spawnmenu.DoSaveToTextFiles
serj.oldSpawnMenu2 = spawnmenu.SaveToTextFiles

serj.oldOpenDupe = engine.OpenDupe
serj.oldWriteDupe = engine.WriteDupe

local fm = FindMetaTable"File"

serj.OldSeek = fm.Seek
serj.OldSize = fm.Size
serj.OldWriteBool = fm.WriteBool
serj.OldReadFloat = fm.ReadFloat

local pnl = FindMetaTable"Panel"

serj.OldHTML = pnl.SetHTML
serj.OldOpenURL = pnl.OpenURL
serj.OldGuiOpenUrl = gui.OpenURL
serj.OldJSOnetapCrack2022 = pnl.RunJavascript

serj.oldCG = collectgarbage

serj.oldSteamWorksDownload = steamworks.Download
serj.oldSteamWorksDownloadUGC = steamworks.DownloadUGC
serj.oldSteamWorksSub = steamworks.IsSubscribed
serj.oldSteamWorksOW = steamworks.OpenWorkshop
serj.oldSteamWorksReq = steamworks.RequestPlayerInfo
serj.oldSteamWorksSMA = steamworks.ShouldMountAddon

serj.OldHttpFetch = http.Fetch
serj.OldHttpPost = http.Post

serj.oldguiHide = gui.HideGameUI
serj.oldguiActivate = gui.ActivateGameUI
serj.oldClicker = gui.EnableScreenClicker

local ctdi = FindMetaTable"CTakeDamageInfo"

serj.oldDamageForce = ctdi.SetDamageForce
serj.oldDamageType = ctdi.SetDamageType --67108864 - dissolve

--[[]
serj.oldgetbone = em.GetBoneName

function em:GetBoneName(ind)
    if !isnumber(ind) then
        return "generic"
    end

    return serj.oldgetbone(ind)
end
]]



--serj.samoletweapon = me:GetActiveWeapon()

files, dir = serj.oldFileFind( "serj/*.json", "DATA" )
serj.cfgDropdown = nil
serj.loadedCfg = {}
serj.verifyconfig = serj.cfg
function serj.VerifyConfig()
    for k, v in pairs(serj.verifyconfig) do
		if serj.cfg[k] == nil then
			serj.cfg[k] = serj.verifyconfig[k]
            serj.addLogs("cfg table differs from new!",Color(255,87,87))
        end
	end
    for k, v in pairs(serj.verifyconfig.Vars) do
		if serj.cfg.Vars[k] == nil then
			serj.cfg.Vars[k] = serj.verifyconfig.Vars[k]
            serj.addLogs("cfg var table differs from new!",Color(255,87,87))
        end
	end
	for k, v in pairs(serj.verifyconfig.Colors) do
		if serj.cfg.Colors[k] == nil then
			serj.cfg.Colors[k] = serj.verifyconfig.Colors[k]
            serj.addLogs("color table differs from new!",Color(255,87,87))
		end
	end
	for k, v in pairs(serj.verifyconfig.Keybinds) do
		if serj.cfg.Keybinds[k] == nil then
			serj.cfg.Keybinds[k] = serj.verifyconfig.Keybinds[k]
            serj.addLogs("keybind table differs from new!",Color(255,87,87))
		end
	end
end

function serj.SaveConfig()
	if serj.cfgDropdown:GetSelected() == nil then return end
	local selected = serj.cfgDropdown:GetSelected()
	local JSONconfig = util.TableToJSON(serj.cfg, true)
	serj.oldFileWrite("serj/"..selected, JSONconfig)
    serj.addLogs("Config saved!",Color(107,255,87))
end
function serj.CloseFrame()
	RememberCursorPosition()
	serj.Panels.framex, serj.Panels.framey = serj.Panels.frame:GetPos()
    serj.Panels.framew, serj.Panels.frameh = serj.Panels.frame:GetWide(), serj.Panels.frame:GetTall()
	serj.Panels.frame:Remove()
	serj.Panels.frame = false
end
function serj.LoadConfig()

	if serj.cfgDropdown:GetSelected() == nil then return end

	local selected = serj.cfgDropdown:GetSelected()
	local JSONconfig = file.Read("serj/"..selected, "DATA")
    if JSONconfig == "" then
        serj.addLogs("CONFIG TABLE IS NIL!",Color(255,0,0))
    end
    if JSONconfig == "" then return end
	serj.cfg = util.JSONToTable(JSONconfig)

	serj.VerifyConfig()

	serj.loadedCfg[0] = selected
	for k, v in ipairs(files) do
		if v == selected then
			serj.loadedCfg[1] = k
		end
	end

	serj.CloseFrame()
	OpenGUI()

    --serj.Checker("Checker",Color(87,255,255))
    serj.addLogs("Config loaded!",Color(87,255,255))

   -- ded.SetInterpolation( serj.cfg.Vars["Disable_interpolation"] )
   -- ded.SetSequenceInterpolation( serj.cfg.Vars["Disable_Sequence_interpolation"] )
    --ded.EnableAnimFix( serj.cfg.Vars["Update Client Anim fix"] )

end

function serj.CreateConfig()
	if serj.cfg["newcfg"] == nil then return end
	if serj.oldFileExists("serj/"..serj.cfg["newcfg"]..".json", "DATA") then return end
	local JSONconfig = util.TableToJSON(serj.cfg, true)
	serj.oldCreateDir("serj")
	serj.oldFileWrite("serj/"..serj.cfg["newcfg"]..".json", JSONconfig)

	serj.CloseFrame()
	OpenGUI()

    serj.addLogs("Config created!",Color(93,255,87))
end

function serj.DeleteConfig()
	if serj.cfgDropdown:GetSelected() == nil then return end

	local selected = serj.cfgDropdown:GetSelected()
	serj.oldFileWrite("serj/"..selected)

	serj.loadedCfg = {}

	serj.CloseFrame()
	OpenGUI()

    serj.addLogs("Config deleted!",Color(255,87,87))
end
/*
	Materials
*/

CreateMaterial( "MovingWireframe", "VertexLitGeneric",
{
    ["$basetexture"] = "sprites/physbeam",
    ["$nodecal"] = 1,
    ["$model"] = 1,
    ["$additive"] = 1,
    ["$nocull"] = 1,
    ["$wireframe"] = 1,

    ["proxies"] = {
        ["texturescroll"] = {
            ["texturescrollvar"] = "$basetexturetransform",
            ["texturescrollrate"] = "0.9",
            ["texturescrollangle"] = "180",
        }
    }
})
CreateMaterial( "MovingWireframe_z", "VertexLitGeneric",
{
    ["$basetexture"] = "sprites/physbeam",
    ["$nodecal"] = 1,
    ["$model"] = 1,
    ["$additive"] = 1,
    ["$nocull"] = 1,
    ["$wireframe"] = 1,
    ["$ignorez"] = 1,

    ["proxies"] = {
        ["texturescroll"] = {
            ["texturescrollvar"] = "$basetexturetransform",
            ["texturescrollrate"] = "0.9",
            ["texturescrollangle"] = "180",
        }
    }
})

CreateMaterial( "MovingShiny", "VertexLitGeneric",
{
    ["$basetexture"] = "sprites/physbeam",
    ["$nodecal"] = 1,
    ["$model"] = 1,
    ["$additive"] = 1,
    ["$nocull"] = 1,
    ["$wireframe"] = 1,

    ["proxies"] = {
        ["texturescroll"] = {
            ["texturescrollvar"] = "$basetexturetransform",
            ["texturescrollrate"] = "0.1",
            ["texturescrollangle"] = "99",
        }
    }
})
CreateMaterial( "MovingShiny_z", "VertexLitGeneric",
{
    ["$basetexture"] = "sprites/physbeam",
    ["$nodecal"] = 1,
    ["$model"] = 1,
    ["$additive"] = 1,
    ["$nocull"] = 1,
    ["$wireframe"] = 1,
    ["$ignorez"] = 1,

    ["proxies"] = {
        ["texturescroll"] = {
            ["texturescrollvar"] = "$basetexturetransform",
            ["texturescrollrate"] = "0.1",
            ["texturescrollangle"] = "99",
        }
    }
})
CreateMaterial( "hoverball", "VertexLitGeneric", {
    ["$basetexture"] = "models/props_combine/portalball001_sheet",
        ["$nodecal"] = 1,
        ["$model"] = 1,
        ["$additive"] = 1,
        ["$nocull"] = 1,
        ["Proxies"] = {
            ["TextureScroll"] = {
                ["texturescrollvar"] = "$basetexturetransform",
                ["texturescrollrate"] = 0.9,
                ["texturescrollangle"] = 350,
            }
        }
    })
CreateMaterial( "hoverball_z", "VertexLitGeneric", {
    ["$basetexture"] = "models/props_combine/portalball001_sheet",
        ["$nodecal"] = 1,
        ["$model"] = 1,
        ["$additive"] = 1,
        ["$nocull"] = 1,
        ["$ignorez"] = 1,
        ["Proxies"] = {
            ["TextureScroll"] = {
                ["texturescrollvar"] = "$basetexturetransform",
                ["texturescrollrate"] = 0.9,
                ["texturescrollangle"] = 350,
        }
    },
})
CreateMaterial( "portal", "VertexLitGeneric", {
    ["$basetexture"] = "models/dav0r/hoverball",
        ["$nodecal"] = 1,
        ["$model"] = 1,
        ["$additive"] = 1,
        ["$nocull"] = 1,
        --["$ignorez"] = 1,
        ["Proxies"] = {
            ["TextureScroll"] = {
                ["texturescrollvar"] = "$basetexturetransform",
                ["texturescrollrate"] = 0.2,
                ["texturescrollangle"] = 50,
            }
        }
    })
CreateMaterial( "portal_z", "VertexLitGeneric", {
    ["$basetexture"] = "models/dav0r/hoverball",
    ["$nodecal"] = 1,
    ["$model"] = 1,
    ["$additive"] = 1,
    ["$nocull"] = 1,
    ["$ignorez"] = 1,
    ["Proxies"] = {
        ["TextureScroll"] = {
            ["texturescrollvar"] = "$basetexturetransform",
            ["texturescrollrate"] = 0.2,
            ["texturescrollangle"] = 50,
            }
        },
    })
CreateMaterial( "blaze", "VertexLitGeneric", {
    ["$basetexture"] = "sprites/physbeam",
        ["$nodecal"] = 1,
        ["$model"] = 1,
        ["$additive"] = 1,
        ["$nocull"] = 1,
        ["Proxies"] = {
            ["TextureScroll"] = {
                ["texturescrollvar"] = "$basetexturetransform",
                ["texturescrollrate"] = 0.4,
                ["texturescrollangle"] = 70,
            }
        }
    })
CreateMaterial( "blaze_z", "VertexLitGeneric", {
    ["$basetexture"] = "sprites/physbeam",
        ["$nodecal"] = 1,
        ["$model"] = 1,
        ["$additive"] = 1,
        ["$nocull"] = 1,
        ["$ignorez"] = 1,
        ["Proxies"] = {
            ["TextureScroll"] = {
                ["texturescrollvar"] = "$basetexturetransform",
                ["texturescrollrate"] = 0.4,
                ["texturescrollangle"] = 70,
        }
    },
})
CreateMaterial("textured", "VertexLitGeneric")
CreateMaterial("flat", "UnLitGeneric")
CreateMaterial("flat_z", "UnLitGeneric",{["$ignorez"] = 1})
CreateMaterial("textured_z", "VertexLitGeneric",{["$ignorez"] = 1})
CreateMaterial( "glowcham2", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )
CreateMaterial( "glowcham2_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "0",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )
CreateMaterial( "selfillum_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )
CreateMaterial( "selfillum", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )
CreateMaterial( "glow_additive", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
} )
CreateMaterial( "glow_additive_z", "VertexLitGeneric", {
    ["$basetexture"] = "vgui/white_additive",
    ["$bumpmap"] = "vgui/white_additive",
    ["$model"] = "1",
    ["$nocull"] = "1",
    ["$nodecal"] = "1",
    ["$additive"] = "1",
    ["$selfillum"] = 1,
    ["$selfIllumFresnel"] = 1,
    ["$selfIllumFresnelMinMaxExp"] = "[0 0.3 0.6]",
    ["$selfillumtint"] = "[0 0 0]",
    ["$ignorez"] = 1,
} )
CreateMaterial("metallic", "UnlitGeneric", {
	["$envmap"] = "env_cubemap",
    ["$normalmapalphaenvmapmask"] = 1,
    ["$envmapcontrast"] = 1,
    ["$color"] = "255 0 0",
})
CreateMaterial("metallic_z", "UnlitGeneric", {
    ["$envmap"] = "env_cubemap",
    ["$normalmapalphaenvmapmask"] = 1,
    ["$envmapcontrast"] = 1,
    ["$color"] = "255 0 0",
    ["$ignorez"] = 1,
})
CreateMaterial("wireframe", "VertexLitGeneric", {
	["$wireframe"] = 1,
})
CreateMaterial("wireframe_z", "VertexLitGeneric", {
	["$wireframe"] = 1,
    ["$ignorez"] = 1,
})
CreateMaterial("glass", "VertexLitGeneric", {
	["$phong"] = 1,
	["$bumpmap"] = "sprites/physbeama",
	["$phongexponent"] = 5,
	["$phongexponenttexture"] =	"sprites/physbeama",
	["$phongboost"] = 1.0,
	["$phongfresnelranges"] = "[0 0.5 1]",
})
CreateMaterial("glass_z", "VertexLitGeneric", {
    ["$ignorez"] = 1,
	["$phong"] = 1,
	["$bumpmap"] = "sprites/physbeama",
	["$phongexponent"] = 5,
	["$phongexponenttexture"] =	"sprites/physbeama",
	["$phongboost"] = 1.0,
	["$phongfresnelranges"] = "[0 0.5 1]",
})
/*
    Panels
*/

serj.Panels = {
    frame = false,
	framex = 15,
	framey = 15,
	framew = 800,
	frameh = 725,
    colorPicker = false,
    adapCfg = false,
    binder = false,
	saved = "aim",
}
serj.Expanded = {}
serj.Expanded["aim"] = false
serj.Expanded["camera"] = false
serj.Expanded["hitmarker"] = false
serj.Expanded["bullettrace"] = false
serj.Expanded["bullettrace_e"] = false
serj.Expanded["visual_self"] = false
serj.Expanded["aimbottarget"] = false
serj.Expanded["aimbotfilter"] = false
serj.Expanded["airstrafe"] = false
serj.Expanded["player_box"] = false
serj.Expanded["esp_elements"] = false
serj.Expanded["esp_elements_bars"] = false
serj.Expanded["chams"] = false
serj.Expanded["aw"] = false
serj.Expanded["flaa"] = false
serj.Expanded["aa"] = false
serj.Expanded["aaaa"] = false
serj.Expanded["chat"] = false
serj.Expanded["visual_selfaa"] = false
serj.Expanded["oofarrows"] = false
serj.Expanded["world"] = false
serj.Expanded["world1"] = false
serj.Expanded["ap"] = false
serj.Expanded["vm"] = false
serj.Expanded["adapcfg"] = false
serj.Expanded["crosshair"] = false
serj.Expanded["color_mod"] = false
serj.Expanded["mblur"] = false
serj.Expanded["dprot"] = false
serj.Expanded["huevini"] = false
serj.Expanded[""] = false
serj.Expanded[""] = false
serj.Expanded[""] = false


function serj.PanelPaint(pan,name,w,h)
	surfaceSetDrawColor(40,40,40,200)
	surfaceDrawRect(0,0,w,h)
	surfaceSetDrawColor(10,15,10,200)
	surfaceDrawRect(2,2,w-4,h-4)
	surfaceSetDrawColor(255,255,255)
    serj.Petyshara(6,23,w - 13,2,scrw/25,6)

	if name != nil then
		surfaceSetTextColor(255,255,255)
		surfaceSetTextPos(5,5)
		surfaceSetFont("font-02")
		surfaceDrawText(name)
	end
end

function serj.guiButton(name, func, pan, centered)
    local p = pan:Add("DPanel")
    p:Dock(TOP)
    if centered then
        p:DockMargin(15, 5, 15, 0)
    else
        p:DockMargin(32, 5, 0, 0)
    end
    p:SetTall(36)
    p:SetWide(200)
    p.Paint = function() end

    local b = p:Add("DButton")
    b:Dock(FILL)
    b:DockMargin(4, 4, 4, 4)
    b:SetText("")

    b.Paint = function(s, w, h)
        surface.SetDrawColor(35, 35, 35)
        surface.DrawRect(0, 0, w, h)
        serj.surfaceTexture(0, 0, w, h, "gui/gradient_up", Color(0, 0, 0, 55))
        serj.surfaceOutline(0, 0, w, h, 1, Color(12, 12, 12))
        serj.surfaceOutline(1, 1, w - 2, h - 2, 1, Color(50, 50, 50))
        draw.SimpleText(name, "font-02", w / 2, h / 2, Color(200, 200, 200), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    b.OnCursorEntered = function()
        -- Add hover effect here, for example, change button color on hover
        b:SetColor(Color(100, 100, 100))
    end

    b.OnCursorExited = function()
        -- Reset color when cursor exits
        b:SetColor(Color(255, 255, 255))
    end

    b.DoClick = function()
        func()
        local newX = b.x + 2
        local animTime = 0.1

        b:MoveTo(newX, b.y, animTime, 0, -1, function()

        end)
    end
end

function serj.guiSelectorAIM(name,pan,show,savename)
    local b = vgui.Create("DButton",pan)
    b:Dock(TOP)
    b:SetTall(96)
    b:SetText("Aim")
    b:DockMargin(0,3,0,0)

    b.Paint = function(s,w,h)
        if serj.Panels.saved == savename then
            surfaceSetDrawColor(0,0,0)
            surfaceDrawRect(0,0,w-1,h)
            surfaceSetDrawColor(40,40,40)
            surfaceDrawRect(0,1,w,h-2)
            serj.surfaceTexture(0,2,w,h-4,"data/aim.png",color_white)
        end

        if serj.Panels.saved == savename then
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(210,210,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(90,90,90,90),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
    end

    b.DoClick = function()
        hidePanels()
        serj.Panels.saved = savename
        show:Show()
    end
end

function serj.guiSelectorHVH(name,pan,show,savename)
    local b = vgui.Create("DButton",pan)
    b:Dock(TOP)
    b:SetTall(96)
    b:SetText("HvH")
    b:DockMargin(0,3,0,0)

    b.Paint = function(s,w,h)
        if serj.Panels.saved == savename then
            surfaceSetDrawColor(0,0,0)
            surfaceDrawRect(0,0,w-1,h)
            surfaceSetDrawColor(40,40,40)
            surfaceDrawRect(0,1,w,h-2)
            serj.surfaceTexture(0,2,w,h-4,"data/hvh.png",color_white)
        end

        if serj.Panels.saved == savename then
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(210,210,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(90,90,90),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
    end

    b.DoClick = function()
        hidePanels()
        serj.Panels.saved = savename
        show:Show()
    end
end

function serj.guiSelectorLEGIT(name,pan,show,savename)
    local b = vgui.Create("DButton",pan)
    b:Dock(TOP)
    b:SetTall(96)
    b:SetText("Legit")
    b:DockMargin(0,3,0,0)

    b.Paint = function(s,w,h)
        if serj.Panels.saved == savename then
            surfaceSetDrawColor(0,0,0)
            surfaceDrawRect(0,0,w-1,h)
            surfaceSetDrawColor(40,40,40)
            surfaceDrawRect(0,1,w,h-2)
            serj.surfaceTexture(0,2,w,h-4,"data/Legit.png",color_white)
        end

        if serj.Panels.saved == savename then
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(210,210,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(90,90,90),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
    end

    b.DoClick = function()
        hidePanels()
        serj.Panels.saved = savename
        show:Show()
    end
end

function serj.guiSelectorESP(name,pan,show,savename)
    local b = vgui.Create("DButton",pan)
    b:Dock(TOP)
    b:SetTall(96)
    b:SetText("Esp")
    b:DockMargin(0,3,0,0)

    b.Paint = function(s,w,h)
        if serj.Panels.saved == savename then
            surfaceSetDrawColor(0,0,0)
            surfaceDrawRect(0,0,w-1,h)
            surfaceSetDrawColor(40,40,40)
            surfaceDrawRect(0,1,w,h-2)
            serj.surfaceTexture(0,2,w,h-4,"data/ESP.png",color_white)
        end

        if serj.Panels.saved == savename then
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(210,210,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(90,90,90),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
    end

    b.DoClick = function()
        hidePanels()
        serj.Panels.saved = savename
        show:Show()
    end
end

function serj.guiSelectorMISC(name,pan,show,savename)
    local b = vgui.Create("DButton",pan)
    b:Dock(TOP)
    b:SetTall(96)
    b:SetText("Misc")
    b:DockMargin(0,3,0,0)

    b.Paint = function(s,w,h)
        if serj.Panels.saved == savename then
            surfaceSetDrawColor(0,0,0)
            surfaceDrawRect(0,0,w-1,h)
            surfaceSetDrawColor(40,40,40)
            surfaceDrawRect(0,1,w,h-2)
            serj.surfaceTexture(0,2,w,h-4,"data/misc.png",color_white)
        end

        if serj.Panels.saved == savename then
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(210,210,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(90,90,90),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
    end

    b.DoClick = function()
        hidePanels()
        serj.Panels.saved = savename
        show:Show()
    end
end

function serj.guiSelectorSKINS(name,pan,show,savename)
    local b = vgui.Create("DButton",pan)
    b:Dock(TOP)
    b:SetTall(96)
    b:SetText("Skinchanger")
    b:DockMargin(0,3,0,0)

    b.Paint = function(s,w,h)
        if serj.Panels.saved == savename then
            surfaceSetDrawColor(0,0,0)
            surfaceDrawRect(0,0,w-1,h)
            surfaceSetDrawColor(40,40,40)
            surfaceDrawRect(0,1,w,h-2)

            serj.surfaceTexture(0,2,w,h-4,"data/skin.png",color_white)
        end

        if serj.Panels.saved == savename then
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(210,210,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(90,90,90),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
    end

    b.DoClick = function()
        hidePanels()
        serj.Panels.saved = savename
        show:Show()
    end
end

function serj.guiSelectorCONFIG(name,pan,show,savename)
    local b = vgui.Create("DButton",pan)
    b:Dock(TOP)
    b:SetTall(96)
    b:SetText("Config")
    b:DockMargin(0,3,0,0)

    b.Paint = function(s,w,h)
        if serj.Panels.saved == savename then
            surfaceSetDrawColor(0,0,0)
            surfaceDrawRect(0,0,w-1,h)
            surfaceSetDrawColor(40,40,40)
            surfaceDrawRect(0,1,w,h-2)

            serj.surfaceTexture(0,2,w,h-4,"data/config.png",color_white)
        end

        if serj.Panels.saved == savename then
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(210,210,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(90,90,90),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
    end

    b.DoClick = function()
        hidePanels()
        serj.Panels.saved = savename
        show:Show()
    end
end

function serj.guiSelectorLUARUN(name,pan,show,savename)
    local b = vgui.Create("DButton",pan)
    b:Dock(TOP)
    b:SetTall(106)
    b:SetText("Server's")
    b:DockMargin(0,3,0,0)

    b.Paint = function(s,w,h)
        if serj.Panels.saved == savename then
            surfaceSetDrawColor(0,0,0)
            surfaceDrawRect(0,0,w-1,h)
            surfaceSetDrawColor(40,40,40)
            surfaceDrawRect(0,1,w,h-2)
            serj.surfaceTexture(0,2,w,h-4,"luarun.png",color_white)
        end

        if serj.Panels.saved == savename then
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(210,210,210),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText(name,"icon-font",w/2,h/2,Color(90,90,90),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
    end

    b.DoClick = function()
        hidePanels()
        serj.Panels.saved = savename
        show:Show()
    end
end

function serj.drawRect(x,y,w,h,color)
    surfaceSetDrawColor(color)
    surfaceDrawRect(x, y, w, h)
end

function serj.labelColor(name,config,panel)
	local p = panel:Add("DPanel")
	p:Dock(TOP)
	p:SetTall(22)
	p:DockMargin(5,5,5,0)

	p.Paint = function(ilysha, krutoi, chuvak)
		draw.SimpleText(name,"font-02",30,chuvak/2,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end

    local b = p:Add("DButton")
    b:Dock(RIGHT)
    b:DockMargin(0,5,15,5)
    b:SetText("")
    b:SetWide(25)

    b.Paint = function(s,w,h)
        local mycolor = string.ToColor(serj.cfg.Colors[config])
        serj.surfaceTexture(0,0,w,h,"gui/alpha_grid.png",Color(128,128,128,255))
        draw.RoundedBox(0,0,0,w,h,Color(mycolor.r,mycolor.g,mycolor.b,mycolor.a))
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(mycolor.r-55,mycolor.g-55,mycolor.b-55,mycolor.a))
        serj.surfaceOutline(0,0,w,h,1,color_black)
    end

    b.DoClick = function()
        local mousex, mousey = input.GetCursorPos()
        if IsValid(serj.Panels.colorPicker) then
            serj.Panels.colorPicker:Remove()
        end

        serj.Panels.colorPicker = vgui.Create("DFrame")
        serj.Panels.colorPicker:SetSize(300, 225)
        serj.Panels.colorPicker:SetTitle(" ")
        serj.Panels.colorPicker:ShowCloseButton(false)
        serj.Panels.colorPicker.Paint = function(self, w, h)
            serj.PanelPaint(self,name .. " color",w,h)
        end

        serj.Panels.colorPicker:SetPos(mousex+45,mousey-45)

        local colorWindowCloser = vgui.Create( "DButton", serj.Panels.colorPicker )
        colorWindowCloser:SetText( "" )
        colorWindowCloser:SetPos( 250, 8 )
        colorWindowCloser:SetSize( 40, 20 )
        colorWindowCloser.DoClick = function() serj.Panels.colorPicker:Close() end
        colorWindowCloser.Paint = function(s,w,h)
            draw.SimpleText("Close", "font-02", w/2, h/2-4, color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
        end
        serj.Panels.colorPicker:MakePopup()

        local colorSelector = vgui.Create("DColorMixer", serj.Panels.colorPicker)
			colorSelector:Dock(FILL)
			colorSelector:DockPadding(5, 5, 5, 5)
			colorSelector:SetPalette(false)
			colorSelector:SetWangs(false)
			colorSelector:SetColor(string.ToColor(serj.cfg.Colors[config]))
			function colorSelector:ValueChanged(val)
				local r = tostring(val.r)
				local g = tostring(val.g)
				local b = tostring(val.b)
				local a = tostring(val.a)
				local col = r.." "..g.." "..b.." "..a
				serj.cfg.Colors[config] = col
        end
    end

end

function serj.idiot()
	local p = panel:Add("DPanel")
	p:Dock(TOP)
	p:SetTall(22)
	p:DockMargin(5,5,5,0)

	p.Paint = function(ilysha, krutoi, chuvak)
		draw.SimpleText(name,"font-02",30,chuvak/2,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end

    local b = p:Add("DButton")
    b:Dock(RIGHT)
    b:DockMargin(0,5,15,5)
    b:SetText("")
    b:SetWide(25)

    b.Paint = function(s,w,h)
        local mycolor = string.ToColor(serj.cfg.Colors[config])
        serj.surfaceTexture(0,0,w,h,"gui/alpha_grid.png",Color(128,128,128,255))
        draw.RoundedBox(0,0,0,w,h,Color(mycolor.r,mycolor.g,mycolor.b,mycolor.a))
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(mycolor.r-55,mycolor.g-55,mycolor.b-55,mycolor.a))
        serj.surfaceOutline(0,0,w,h,1,color_black)
    end

    b.DoClick = function()
        local mousex, mousey = input.GetCursorPos()
        if IsValid(serj.Panels.colorPicker) then
            serj.Panels.colorPicker:Remove()
        end

        serj.Panels.colorPicker = vgui.Create("DFrame")
        serj.Panels.colorPicker:SetSize(300, 225)
        serj.Panels.colorPicker:SetTitle(" ")
        serj.Panels.colorPicker:ShowCloseButton(false)
        serj.Panels.colorPicker.Paint = function(self, w, h)
            serj.PanelPaint(self,name .. " color",w,h)
        end

        serj.Panels.colorPicker:SetPos(mousex+45,mousey-45)

        local colorWindowCloser = vgui.Create( "DButton", serj.Panels.colorPicker )
        colorWindowCloser:SetText( "" )
        colorWindowCloser:SetPos( 250, 8 )
        colorWindowCloser:SetSize( 40, 20 )
        colorWindowCloser.DoClick = function() serj.Panels.colorPicker:Close() end
        colorWindowCloser.Paint = function(s,w,h)
            draw.SimpleText("Close", "font-02", w/2, h/2-4, color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
        end
        serj.Panels.colorPicker:MakePopup()

        local colorSelector = vgui.Create("DColorMixer", serj.Panels.colorPicker)
        colorSelector:Dock(FILL)
        colorSelector:DockPadding(5, 5, 5, 5)
        colorSelector:SetPalette(false)
        colorSelector:SetWangs(false)
        colorSelector:SetColor(string.ToColor(serj.cfg.Colors[config]))
        function colorSelector:ValueChanged(val)
            local r = tostring(val.r)
            local g = tostring(val.g)
            local b = tostring(val.b)
            local a = tostring(val.a)
            local col = r.." "..g.." "..b.." "..a
            serj.cfg.Colors[config] = col
        end
    end

end

function serj.CreateTextInput(lbl, cfgg, config, chars, par, centered)
	local p = vgui.Create("DPanel",par)
	p:Dock(TOP)
    if centered then
	    p:DockMargin(18,5,15,0)
    else
        p:DockMargin(36,5,0,0)
    end
	p:SetTall(36)
	p.Paint = function(s,w,h)
		surfaceSetDrawColor(35,35,35)
        surfaceDrawRect(0,0,w-4,h)
        serj.surfaceTexture(0,0,w-4,h,"gui/gradient_up",Color(0,0,0,55))
		serj.surfaceOutline(0,0,w-4,h,1,Color(12,12,12))
        serj.surfaceOutline(1,1,w-4-2,h-2,1,Color(50,50,50))
	end

	local x, y = p:GetPos()
	local w, h = p:GetSize()

	local textInput = p:Add("DTextEntry")
	textInput:Dock(FILL)
	textInput:DockMargin(10,10,10,10)
	textInput:IsMultiline( false )
	textInput:SetMaximumCharCount(chars)
	textInput:SetPlaceholderText(lbl)
	textInput:SetFont( "font-02" )
    textInput:SetPaintBackground(false)
    textInput:SetTextColor(Color(255,255,2555))

	if cfgg[config] != nil and cfgg[config] != "" then
		textInput:SetValue(cfgg[config])
	end

	textInput.Think = function()
		if textInput:IsEditing() then
			editingText	= true
		else
			editingText = false
		end
		cfgg[config] = textInput:GetValue()
	end

	textInput.OnValueChange = function()
		cfgg[config] = textInput:GetValue()
	end
end


surface.CreateFont("KeyStroke", {
    font = "Roboto",
    size = 20,
    weight = 2000,
    antialias = true
})

hook.Add("HUDPaint", "Keystroke", function()

    if serj.cfg.Vars["velocity_crosshair"] then
        sSDC(string.ToColor(serj.cfg.Colors["velocity_crosshair"]))
        surface.SetMaterial(Material("vgui/white"))
        draw.Circle(ScrW() / 2, ScrH() / 2, LocalPlayer():GetVelocity():Length() / 4, 180)
    end

    if serj.cfg.Vars["key_stroke"] then
        local function AddKeySquare(text, key, x, y)
            local neonColor = Color(0, 255, 255) -- Небесно-голубой цвет для киберпанка
            local color_white = Color(255, 255, 255)
            local color_black = Color(20, 20, 20)
            local gray = Color(30, 30, 30)
            local size = 35

            -- Эффект свечения
            if LocalPlayer():KeyDown(key) then
                surface.SetDrawColor(neonColor.r, neonColor.g, neonColor.b)
                surface.DrawRect(x, y, size * 3, size)
                draw.SimpleText("" .. text .. "", "KeyStroke", x + 26, y + 7, color_black)
            else
                surface.SetDrawColor(gray)
                surface.DrawRect(x, y, size * 3, size)
                draw.SimpleText("" .. text .. "", "KeyStroke", x + 26, y + 7, color_white)
            end

            -- Добавление эффекта свечения
            surface.SetDrawColor(neonColor.r, neonColor.g, neonColor.b, 50)
            surface.DrawRect(x - 5, y - 5, size * 3 + 10, size + 10)
        end

        local function AddKeyRectangle(text, key, x, y)
            local neonColor = Color(0, 255, 255) -- Небесно-голубой цвет для киберпанка
            local color_white = Color(255, 255, 255)
            local color_black = Color(20, 20, 20)
            local gray = Color(30, 30, 30)
            local size = 35

            -- Эффект свечения
            surface.SetDrawColor(neonColor.r, neonColor.g, neonColor.b, 100)
            if LocalPlayer():KeyDown(key) then
                surface.DrawRect(x, y, size, size)
                draw.SimpleText("" .. text .. "", "KeyStroke", x + 11, y + 7, color_black)
            else
                surface.SetDrawColor(gray)
                surface.DrawRect(x, y, size, size)
                draw.SimpleText("" .. text .. "", "KeyStroke", x + 11, y + 7, color_white)
            end

            -- Добавление эффекта свечения
            surface.SetDrawColor(neonColor.r, neonColor.g, neonColor.b, 50)
            surface.DrawRect(x - 5, y - 5, size + 10, size + 10)
        end

        local function AddKeyRectangleMouse(text, key, x, y)
            local neonColor = Color(0, 255, 255) -- Небесно-голубой цвет для киберпанка
            local color_white = Color(255, 255, 255)
            local color_black = Color(20, 20, 20)
            local gray = Color(30, 30, 30)
            local size = 53

            -- Эффект свечения
            surface.SetDrawColor(neonColor.r, neonColor.g, neonColor.b, 100)
            if LocalPlayer():KeyDown(key) then
                surface.DrawRect(x, y, size, 35)
                draw.SimpleText("" .. text .. "", "KeyStroke", x + 11, y + 7, color_black)
            else
                surface.SetDrawColor(gray)
                surface.DrawRect(x, y, size, 35)
                draw.SimpleText("" .. text .. "", "KeyStroke", x + 11, y + 7, color_white)
            end

            -- Добавление эффекта свечения
            surface.SetDrawColor(neonColor.r, neonColor.g, neonColor.b, 50)
            surface.DrawRect(x - 5, y - 5, size + 10, 45)
        end

        -- Клавиши управления
        AddKeyRectangle("W", IN_FORWARD, 35, 550)
        AddKeyRectangle("A", IN_MOVELEFT, 0, 550 + 35)
        AddKeyRectangle("D", IN_MOVERIGHT, 70, 550 + 35)
        AddKeyRectangle("S", IN_BACK, 35, 550 + 35)
        AddKeyRectangleMouse("LMB", IN_ATTACK, 0, 550 + 70)
        AddKeyRectangleMouse("RMB", IN_ATTACK2, 52, 550 + 70)
        AddKeySquare("SPACE", IN_JUMP, 0, 550 + 105)
    end
end)


function serj.guiCheckBox(name,config,panel,colorable,bindable,bindkey)
	local p = panel:Add("DPanel")
	p:Dock(TOP)
	p:SetTall(22)
	p:DockMargin(5,5,5,0)


	p.Paint = function(ilysha, krutoi, chuvak)
        --serj.surfaceOutline(0,0,krutoi,chuvak,1,Color(255,12,12))
		draw.SimpleText(name,"font-02",30,chuvak/2,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end

	local c = p:Add("DCheckBox")
	c:SetPos(5,5)
    c:SetSize(12,12)
	c:SetValue( serj.cfg.Vars[config] )
	function c:OnChange( bVal )
		serj.cfg.Vars[config] = bVal
		surface.PlaySound("ambient/water/drip1.wav")  --sound.PlayURL("https://cdn.discordapp.com/attachments/1201690537384755281/1226142730111946830/FCGDicr.mp3?ex=6623b167&is=66113c67&hm=e5769ac91256e0522c424ca84ae4abee47e6bf4e1d81b58b94b0537e886b707f&", "", function()end )
	end

	c.Paint = function(s, w, h)
        local checkcolor = string.ToColor(serj.cfg.Colors["menu_color"])
        if c:GetChecked() then
            surfaceSetDrawColor(checkcolor)
        else
            surfaceSetDrawColor(66,66,66)
        end
        surfaceDrawRect(0,0,w,h)
        --local alpha = math.abs(math.sin(CurTime() * 222)) * 255 -- Плавное мигание альфа-канала
        --serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(12,12,12,155))
		serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
	end

	if colorable then
		local b = p:Add("DButton")
		b:Dock(RIGHT)
		b:DockMargin(0,5,15,5)
		b:SetText("")
        b:SetWide(25)

		b.Paint = function(s,w,h)
			local mycolor = string.ToColor(serj.cfg.Colors[config])
			serj.surfaceTexture(0,0,w,h,"gui/alpha_grid.png",Color(128,128,128,255))
			draw.RoundedBox(0,0,0,w,h,Color(mycolor.r,mycolor.g,mycolor.b,mycolor.a))
			serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(mycolor.r-55,mycolor.g-55,mycolor.b-55,mycolor.a))
			serj.surfaceOutline(0,0,w,h,1,color_black)
		end

		b.DoClick = function()
			local mousex, mousey = input.GetCursorPos()
			if IsValid(serj.Panels.colorPicker) then
				serj.Panels.colorPicker:Remove()
			end

			serj.Panels.colorPicker = vgui.Create("DFrame")
			serj.Panels.colorPicker:SetSize(300, 225)
			serj.Panels.colorPicker:SetTitle(" ")
			serj.Panels.colorPicker:ShowCloseButton(false)
			serj.Panels.colorPicker.Paint = function(self, w, h)
				serj.PanelPaint(self,name .. " color",w,h)
			end

			serj.Panels.colorPicker:SetPos(mousex+45,mousey-45)

			local colorWindowCloser = vgui.Create( "DButton", serj.Panels.colorPicker )
            colorWindowCloser:SetText( "" )
            colorWindowCloser:SetPos( 250, 8 )
            colorWindowCloser:SetSize( 40, 20 )
            colorWindowCloser.DoClick = function() serj.Panels.colorPicker:Close() end
            colorWindowCloser.Paint = function(s,w,h)
				draw.SimpleText("Close", "font-02", w/2, h/2-4, color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
			end
			serj.Panels.colorPicker:MakePopup()

			local colorSelector = vgui.Create("DColorMixer", serj.Panels.colorPicker)
			colorSelector:Dock(FILL)
			colorSelector:DockPadding(5, 5, 5, 5)
			colorSelector:SetPalette(true)
            colorSelector:SetAlphaBar(true)
            colorSelector:SetWangs(true)
			colorSelector:SetColor(string.ToColor(serj.cfg.Colors[config]))
			function colorSelector:ValueChanged(val)
				local r = tostring(val.r)
				local g = tostring(val.g)
				local b = tostring(val.b)
				local a = tostring(val.a)
				local col = r.." "..g.." "..b.." "..a
				serj.cfg.Colors[config] = col
			end
		end

	end

	if bindable then
        local bb = p:Add("DButton")
		bb:Dock(RIGHT)
		bb:DockMargin(5,5,5,5)
		bb:SetText("")

		bb.Paint = function(sosok,pizdenka,mne12)
			if serj.cfg.Keybinds[bindkey] ~= 0 then
                pcall(function()
				    draw.SimpleText("["..language.GetPhrase( input.GetKeyName( serj.cfg.Keybinds[bindkey] ) ) .. "]","font-02",pizdenka,mne12/2,Color(114,114,114),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
                end)
            else
				draw.SimpleText("[-]","font-02",pizdenka,mne12/2,Color(114,114,114),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
			end
		end

        bb.DoClick = function()
            local mousex, mousey = input.GetCursorPos()
			if IsValid(serj.Panels.binder) then
				serj.Panels.binder:Remove()
			end

			serj.Panels.binder = vgui.Create("DFrame")
			serj.Panels.binder:SetSize(300, 150)
			serj.Panels.binder:SetTitle(" ")
			serj.Panels.binder:ShowCloseButton(false)
			serj.Panels.binder.Paint = function(self, w, h)
				serj.PanelPaint(self,"Binder",w,h)
                draw.SimpleText("Mode:", "font-02", 7, 70, color_white)
			end

			serj.Panels.binder:SetPos(mousex+45,mousey-45)

			local bindWindowCloser = vgui.Create( "DButton", serj.Panels.binder )
            bindWindowCloser:SetText( "" )
            bindWindowCloser:SetPos( 250, 8 )
            bindWindowCloser:SetSize( 40, 20 )
            bindWindowCloser.DoClick = function() serj.Panels.binder:Close() end
            bindWindowCloser.Paint = function(s,w,h)
				draw.SimpleText("Close", "font-02", w/2, h/2-4, color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
			end
			serj.Panels.binder:MakePopup()

            local k = vgui.Create("DBinder", serj.Panels.binder)
            k:SetValue(serj.cfg.Keybinds[bindkey])
            k:Dock(TOP)
            k:DockMargin(4,4,4,4)
            k.OnChange = function()
                serj.cfg.Keybinds[bindkey] = k:GetValue()
            end

            k.OldThink = k.Think

            function k:Think()
                k:SetText("")
                self:OldThink()
            end

            k:SetWide(95)

            k.Paint = function(sosok,pizdenka,mne12)
                sosok.move = sosok.move or 0
                if sosok:IsHovered() then
                    sosok.move = math.Approach(sosok.move,25,FrameTime()*300)
                else
                    sosok.move = math.Approach(sosok.move,0,FrameTime()*150)
                end

                draw.RoundedBox(0,0,0,pizdenka,mne12,Color(25+sosok.move,25+sosok.move,25+sosok.move))
                serj.surfaceOutline(0,0,pizdenka,mne12,1,color_black)
                if k:GetValue() != 0 then
                    draw.SimpleText(language.GetPhrase( input.GetKeyName( k:GetValue() ) ),"KeybinderFont",pizdenka/2,mne12/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
                else
                    draw.SimpleText("[]","KeybinderFont",pizdenka/2,mne12/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
                end
            end

            local dropdown = serj.Panels.binder:Add("DComboBox")
            dropdown:SetTall(30)
            dropdown:Dock(TOP)
            dropdown:DockMargin(0,25,0,0)
            dropdown:AddChoice("Hold")
            dropdown:AddChoice("Toggle")
            dropdown:SetSortItems(false)
            dropdown:ChooseOptionID(serj.cfg.Keybinds.mode[bindkey])
            function dropdown:OnSelect(index, value, data)
                serj.cfg.Keybinds.mode[bindkey] = index
            end
            dropdown.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,w,h,Color(32,32,32))
                serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(128,128,128,5))
                draw.SimpleText("▼","font-02",w-5,h/2,color_white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
                serj.surfaceOutline(0,0,w,h,1,color_black)
            end
            dropdown.DropButton.Paint = function() end
            dropdown.PerformLayout = function(self)
                self:SetTextColor(Color(255,255,255))
                self:SetFont("font-02")
            end

            local p2 = serj.Panels.binder:Add("DPanel")
            p2:Dock(TOP)
            p2:SetTall(25)
            p2:DockMargin(5,2,5,0)

            p2.Paint = function(ilysha, krutoi, chuvak)
                draw.SimpleText("Show in bindlist","font-02",30,chuvak/2,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
            end

            local c2 = p2:Add("DCheckBox")
            c2:SetPos(5,5)
            c2:SetSize(12,12)
            c2:SetValue( serj.cfg.Keybinds.showInBinds[bindkey] )
            function c2:OnChange( bVal )
                serj.cfg.Keybinds.showInBinds[bindkey] = bVal
                surface.PlaySound("ambient/water/drip1.wav")
            end

            c2.Paint = function(s, w, h)
                local checkcolor = string.ToColor(serj.cfg.Colors["menu_color"])
                if c2:GetChecked() then
                    surfaceSetDrawColor(checkcolor)
                else
                    surfaceSetDrawColor(66,66,66)
                end
                surfaceDrawRect(0,0,w,h)
                serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(12,12,12,155))
                serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
            end
        end

        bb.DoRightClick = function()
            serj.cfg.Keybinds[bindkey] = 0
        end
	end
end

function serj.guiCheckBoxer(name,config,panel,colorable,bindable,bindkey)
	local p = panel:Add("DPanel")
	p:Dock(TOP)
	p:SetTall(22)
	p:DockMargin(5,5,5,0)

	p.Paint = function(ilysha, krutoi, chuvak)
        --serj.surfaceOutline(0,0,krutoi,chuvak,1,Color(255,12,12))
		draw.SimpleText(name,"font-02",30,chuvak/2,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end

	local c = p:Add("DCheckBox")
	c:SetPos(5,5)
    c:SetSize(12,12)
	c:SetValue( serj.cfg.Vars[config] )
	function c:OnChange( bVal )
		serj.cfg.Vars[config] = bVal
		sound.PlayURL("https://cdn.discordapp.com/attachments/1200710986164879362/1202554729876693063/CSGO_BombButtonShortHitsound.mp3", "", function()end )
	end

	c.Paint = function(s, w, h)
        local checkcolor = string.ToColor(serj.cfg.Colors["menu_color"])
        if c:GetChecked() then
            surfaceSetDrawColor(checkcolor)
        else
            surfaceSetDrawColor(66,66,66)
        end
        --surfaceDrawRect(0,0,w,h)
        --serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(12,12,12,155))
		--serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
	end

	if colorable then
		local b = p:Add("DButton")
		b:Dock(RIGHT)
		b:DockMargin(0,5,15,5)
		b:SetText("")
        b:SetWide(25)

		b.Paint = function(s,w,h)
			local mycolor = string.ToColor(serj.cfg.Colors[config])
			serj.surfaceTexture(0,0,w,h,"gui/alpha_grid.png",Color(128,128,128,255))
			draw.RoundedBox(0,0,0,w,h,Color(mycolor.r,mycolor.g,mycolor.b,mycolor.a))
			serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(mycolor.r-55,mycolor.g-55,mycolor.b-55,mycolor.a))
			serj.surfaceOutline(0,0,w,h,1,color_black)
		end

		b.DoClick = function()
			local mousex, mousey = input.GetCursorPos()
			if IsValid(serj.Panels.colorPicker) then
				serj.Panels.colorPicker:Remove()
			end

			serj.Panels.colorPicker = vgui.Create("DFrame")
			serj.Panels.colorPicker:SetSize(300, 225)
			serj.Panels.colorPicker:SetTitle(" ")
			serj.Panels.colorPicker:ShowCloseButton(false)
			serj.Panels.colorPicker.Paint = function(self, w, h)
				serj.PanelPaint(self,name .. " color",w,h)
			end

			serj.Panels.colorPicker:SetPos(mousex+45,mousey-45)

			local colorWindowCloser = vgui.Create( "DButton", serj.Panels.colorPicker )
            colorWindowCloser:SetText( "" )
            colorWindowCloser:SetPos( 250, 8 )
            colorWindowCloser:SetSize( 40, 20 )
            colorWindowCloser.DoClick = function() serj.Panels.colorPicker:Close() end
            colorWindowCloser.Paint = function(s,w,h)
				draw.SimpleText("Close", "font-02", w/2, h/2-4, color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
			end
			serj.Panels.colorPicker:MakePopup()

			local colorSelector = vgui.Create("DColorMixer", serj.Panels.colorPicker)
			colorSelector:Dock(FILL)
			colorSelector:DockPadding(5, 5, 5, 5)
            colorSelector:SetPalette(true)
            colorSelector:SetAlphaBar(true)
            colorSelector:SetWangs(true)
			colorSelector:SetColor(string.ToColor(serj.cfg.Colors[config]))
			function colorSelector:ValueChanged(val)
				local r = tostring(val.r)
				local g = tostring(val.g)
				local b = tostring(val.b)
				local a = tostring(val.a)
				local col = r.." "..g.." "..b.." "..a
				serj.cfg.Colors[config] = col
			end
		end

	end

	if bindable then
        local bb = p:Add("DButton")
		bb:Dock(RIGHT)
		bb:DockMargin(5,5,5,5)
		bb:SetText("")

		bb.Paint = function(sosok,pizdenka,mne12)
			if serj.cfg.Keybinds[bindkey] ~= 0 then
                pcall(function()
				    draw.SimpleText("["..language.GetPhrase( input.GetKeyName( serj.cfg.Keybinds[bindkey] ) ) .. "]","font-02",pizdenka,mne12/2,Color(114,114,114),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
                end)
            else
				draw.SimpleText("[-]","font-02",pizdenka,mne12/2,Color(114,114,114),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
			end
		end

        bb.DoClick = function()
            local mousex, mousey = input.GetCursorPos()
			if IsValid(serj.Panels.binder) then
				serj.Panels.binder:Remove()
			end

			serj.Panels.binder = vgui.Create("DFrame")
			serj.Panels.binder:SetSize(300, 150)
			serj.Panels.binder:SetTitle(" ")
			serj.Panels.binder:ShowCloseButton(false)
			serj.Panels.binder.Paint = function(self, w, h)
				serj.PanelPaint(self,"Binder",w,h)
                draw.SimpleText("Mode:", "font-02", 7, 70, color_white)
			end

			serj.Panels.binder:SetPos(mousex+45,mousey-45)

			local bindWindowCloser = vgui.Create( "DButton", serj.Panels.binder )
            bindWindowCloser:SetText( "" )
            bindWindowCloser:SetPos( 250, 8 )
            bindWindowCloser:SetSize( 40, 20 )
            bindWindowCloser.DoClick = function() serj.Panels.binder:Close() end
            bindWindowCloser.Paint = function(s,w,h)
				draw.SimpleText("Close", "font-02", w/2, h/2-4, color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
			end
			serj.Panels.binder:MakePopup()

            local k = vgui.Create("DBinder", serj.Panels.binder)
            k:SetValue(serj.cfg.Keybinds[bindkey])
            k:Dock(TOP)
            k:SetPalette(true)
            k:SetAlphaBar(true)
            k:SetWangs(true)
            k:DockMargin(4,4,4,4)
            k.OnChange = function()
                serj.cfg.Keybinds[bindkey] = k:GetValue()
            end

            k.OldThink = k.Think

            function k:Think()
                k:SetText("")
                self:OldThink()
            end

            k:SetWide(95)

            k.Paint = function(sosok,pizdenka,mne12)
                sosok.move = sosok.move or 0
                if sosok:IsHovered() then
                    sosok.move = math.Approach(sosok.move,25,FrameTime()*300)
                else
                    sosok.move = math.Approach(sosok.move,0,FrameTime()*150)
                end

                draw.RoundedBox(0,0,0,pizdenka,mne12,Color(25+sosok.move,25+sosok.move,25+sosok.move))
                serj.surfaceOutline(0,0,pizdenka,mne12,1,color_black)
                if k:GetValue() != 0 then
                    draw.SimpleText(language.GetPhrase( input.GetKeyName( k:GetValue() ) ),"KeybinderFont",pizdenka/2,mne12/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
                else
                    draw.SimpleText("[]","KeybinderFont",pizdenka/2,mne12/2,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
                end
            end

            local dropdown = serj.Panels.binder:Add("DComboBox")
            dropdown:SetTall(30)
            dropdown:Dock(TOP)
            dropdown:DockMargin(0,25,0,0)
            dropdown:AddChoice("Hold")
            dropdown:AddChoice("Toggle")
            dropdown:SetSortItems(false)
            dropdown:ChooseOptionID(serj.cfg.Keybinds.mode[bindkey])
            function dropdown:OnSelect(index, value, data)
                serj.cfg.Keybinds.mode[bindkey] = index
            end
            dropdown.Paint = function(self,w,h)
                draw.RoundedBox(0,0,0,w,h,Color(32,32,32))
                serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(128,128,128,5))
                draw.SimpleText("▼","font-02",w-5,h/2,color_white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
                serj.surfaceOutline(0,0,w,h,1,color_black)
            end
            dropdown.DropButton.Paint = function() end
            dropdown.PerformLayout = function(self)
                self:SetTextColor(Color(255,255,255))
                self:SetFont("font-02")
            end

            local p2 = serj.Panels.binder:Add("DPanel")
            p2:Dock(TOP)
            p2:SetTall(25)
            p2:DockMargin(5,2,5,0)

            p2.Paint = function(ilysha, krutoi, chuvak)
                draw.SimpleText("Show in bindlist","font-02",30,chuvak/2,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
            end

            local c2 = p2:Add("DCheckBox")
            c2:SetPos(5,5)
            c2:SetSize(12,12)
            c2:SetValue( serj.cfg.Keybinds.showInBinds[bindkey] )
            function c2:OnChange( bVal )
                serj.cfg.Keybinds.showInBinds[bindkey] = bVal
                surface.PlaySound("ambient/water/drip1.wav")--sound.PlayURL("https://cdn.discordapp.com/attachments/1191734219035136122/1202546988521095168/LightHitsound.mp3")
            end

            c2.Paint = function(s, w, h)
                local checkcolor = string.ToColor(serj.cfg.Colors["menu_color"])
                if c2:GetChecked() then
                    surfaceSetDrawColor(checkcolor)
                else
                    surfaceSetDrawColor(66,66,66)
                end
                surfaceDrawRect(0,0,w,h)
                serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(12,12,12,155))
                serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
            end
        end

        bb.DoRightClick = function()
            serj.cfg.Keybinds[bindkey] = 0
        end
	end
end

function serj.Spacer(x,pan)
    local p = vgui.Create("DPanel",pan)
    p:Dock(LEFT)
    p:DockMargin(1,1,1,1)
    p:SetWide(x)

    p.Paint = function() end
end

function serj.TSpacer(y,pan)
    local p = vgui.Create("DPanel",pan)
    p:Dock(TOP)
    p:SetTall(y)

    p.Paint = function() end
end

function serj.panelPaint(s,w,h,name)
    surfaceSetFont("font-01")
    local namew, nameh = surfaceGetTextSize(name)
    surfaceSetDrawColor(23,23,23)
    surfaceDrawRect(2,8,w-4,h-4)
    serj.surfaceOutline(0,7,w,h-7,1,Color(12,12,12))
    serj.surfaceOutline(1,8,w-2,h-9,1,Color(40,40,40))
    surfaceSetDrawColor(23,23,23)
    surfaceDrawRect(17,7,namew+10,2)
    draw.SimpleText(name,"font-01",22,1,color_white)
end

function serj.SetupDscrollPanel(name,pan,watafuk)
    pan:Dock(FILL)
    pan:DockMargin(5,15,5,5)

	local panBar = pan:GetVBar()
	panBar:SetWide(8)

	function panBar:Paint(w,h)
        surfaceSetDrawColor(40,40,40)
        surfaceDrawRect(w-8,0,w,h)
    end

	function panBar.btnUp:Paint(w, h) end
	function panBar.btnDown:Paint(w, h) end
	function panBar.btnGrip:Paint(w, h)
        surfaceSetDrawColor(65,65,65)
        surfaceDrawRect(2,0,w-4,h)
    end

	pan.Paint = function() end
end

function serj.FunctionDropDown(name, pan, dpl, saveexpand)
    local dc = vgui.Create("DCollapsibleCategory", pan)
    if serj.Expanded[saveexpand] != nil then
        dc:SetExpanded(serj.Expanded[saveexpand])
    end
    dc:SetLabel("")
    dc:SetHeaderHeight(75)
    dc:Dock(TOP)
    dc:DockMargin(5, 5, 5, 0)

    dc.OnToggle = function()
        serj.Expanded[saveexpand] = dc:GetExpanded()
    end

    dc.Paint = function(s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15))
        serj.surfaceTexture(0, 0, w, h, "gui/gradient_up", Color(35, 35, 35))
        serj.surfaceOutline(0, 0, w, h, 1, color_black)

        draw.SimpleText(name, "font-02", 10, s:GetHeaderHeight() / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

        if s:GetExpanded() then
            draw.RoundedBox(0, 6, 38, w - 12, h - 44, Color(15, 15, 15))
            draw.SimpleText("▼", "font-02", w - 25, s:GetHeaderHeight() / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("►", "font-02", w - 25, s:GetHeaderHeight() / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
    end

    dc.animSlide = 0

    local oldToggle = dc.Toggle
    dc.Toggle = function(self)
        self.animSlide = self:GetExpanded() and 1 or -1
        oldToggle(self)
    end

    dc.Think = function(self)
        local targetSlide = self:GetExpanded() and 1 or 0
        self.animSlide = Lerp(FrameTime() * 10, self.animSlide, targetSlide)
    end

    dc.PaintOver = function(s, w, h)
        local slideOffset = w * s.animSlide
        draw.RoundedBox(0, 0, s:GetHeaderHeight(), w, h - s:GetHeaderHeight(), Color(15, 15, 15))
        serj.surfaceTexture(0, s:GetHeaderHeight(), w, h - s:GetHeaderHeight(), "gui/gradient_up", Color(35, 35, 35))
        serj.surfaceOutline(0, s:GetHeaderHeight(), w, h - s:GetHeaderHeight(), 1, color_black)

        if s:GetExpanded() then
            draw.SimpleText("▼", "font-02", w - 25 - slideOffset, s:GetHeaderHeight() / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("►", "font-02", w - 25 - slideOffset, s:GetHeaderHeight() / 2, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
        end
    end

    dc:SetContents(dpl)
end

function serj.DropDown(lbl, choices, config, par)

	local p = vgui.Create("DPanel",par)
	p:Dock(TOP)
	p:DockMargin(5,0,5,0)
	p:SetTall(55)
	p.Paint = function(s,w,h)
		--draw.RoundedBox(0,0,0,w,h,Color(255,30,30))
		draw.SimpleText(lbl,"font-02",30,12,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end

	local dropdown = p:Add("DComboBox")
	dropdown:SetTall(30)
	dropdown:Dock(TOP)
    dropdown:DockMargin(30,25,0,0)
	for k, v in ipairs(choices) do
		dropdown:AddChoice(v)
	end
	dropdown:SetSortItems(false)
    if serj.cfg.Vars[config] <= #choices then
	    dropdown:ChooseOptionID(serj.cfg.Vars[config])
    else
        dropdown:ChooseOptionID(1)
    end

	function dropdown:OnSelect(index, value, data)
		serj.cfg.Vars[config] = index
	end
	dropdown.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(42,42,42))
        --serj.surfaceOutline(0,0,w,h,"gui/gradient_up",string.ToColor(serj.cfg.Colors["menu_color"]))
		serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(128,128,128,5))
		draw.SimpleText("▼","font-02",w-5,h/2,color_white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
		serj.surfaceOutline(0,0,w,h,1,color_black)
	end
	DMenuOption.Paint = function(self, w, h)
        draw.RoundedBox(0,0,0,w,h,Color(42,42,42))
    end
	dropdown.DropButton.Paint = function() end
	dropdown.PerformLayout = function(self)
        self:SetTextColor(Color(255,255,255))
        self:SetFont("font-04")
    end
end

function serj.CreateSlider(lbl, symbol, config, min, max, dec, par)

	local p = vgui.Create("DPanel",par)
	p:Dock(TOP)
	p:DockMargin(30,2,2,0)
	p:SetTall(45)

	local slider = p:Add("DNumSlider")
	slider:Dock(TOP)
	slider:SetHeight(10)
	slider:DockMargin(5,28,5,5)
	slider:SetMin(min)
	slider:SetMax(max)
	slider:SetTooltip(lbl)
	slider:SetDefaultValue(serj.cfg.Vars[config])
	slider:ResetToDefaultValue()
	slider:SetDecimals(dec)

	slider.Label:Hide()
	slider.TextArea:Hide()

	function slider:OnValueChanged()
		serj.cfg.Vars[config] = slider:GetValue()
	end

	p.Paint = function(s,w,h)
		--draw.RoundedBox(0,0,0,w,h,Color(30,30,30))
		draw.SimpleText(lbl,"font-02",5,5,color_white)
		draw.SimpleText(math.Round(slider:GetValue()) .. symbol,"font-02",w-5,5,color_white,TEXT_ALIGN_RIGHT)
	end

	slider.Slider.Paint = function(self,w,h)
		local getwidth, gettall = slider.Slider.Knob:GetPos()
        serj.surfaceOutline(0,0,w-1,h-1,1,string.ToColor(serj.cfg.Colors["menu_color"]))
		--draw.RoundedBox(0,0,0,w,h,Color(0,0,0))
        --draw.RoundedBox(0,1,1,w-2,h-2,Color(52,52,52))
		draw.RoundedBox(0,1,1,getwidth-2+ 15,h-2,string.ToColor(serj.cfg.Colors["menu_color"]),true,false,true,false)
		serj.surfaceTexture(1,1,w-2,h-2,"gui/gradient_up",Color(200,200,200,5))
	end

	slider.Slider.Knob:SetSize(15,15)
    slider.Slider.Knob.Paint = function(self,w,h)
        local getwidth, gettall = slider.Slider.Knob:GetPos()
		draw.SimpleText(math.Round(slider:GetValue()) .. symbol,"font-02",w/2,h/2+10,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        // FIXME ХУЙНЯ ВЫЕЗЖАЕТ ЗА ПАНЕЛЬ!
    end
    if !rp then
	    slider.Slider:SetNotches(0)
	    slider.Slider:SetNotchColor(Color(0,0,0,0))
    end
	slider.Scratch:SetVisible(false)
end

function serj.ESPPreview(pan,w,h)
    local modelPanel = pan:Add( "DModelPanel" )
	modelPanel:SetPos(0,0)
    modelPanel:SetSize(w,h)
	modelPanel:SetModel( "models/player/riot.mdl" )
	modelPanel:SetAnimated(true)

	local flex = modelPanel:GetEntity():LookupSequence("walk_fist")
	modelPanel:SetAnimSpeed(1)

	modelPanel:GetEntity():SetSequence(flex)
	function modelPanel:LayoutEntity(ent)

		ent:SetPlaybackRate(self:GetAnimSpeed())
		if(ent:GetCycle() >= 0.95) then ent:SetCycle(0.05) end
		ent:FrameAdvance()

	end

    if serj.cfg.Vars["TracerAim"] and shootTracer[1].x ~= nil and shootTracer[3] > 0 then
        shootTracer[3] = shootTracer[3] - 1
        surface.SetDrawColor(255,0,0,shootTracer[3])

        local startL = Vector(shootTracer[1].x, shootTracer[1].y, shootTracer[1].z):ToScreen()
        local endL = Vector(shootTracer[2].x, shootTracer[2].y, shootTracer[2].z):ToScreen()
        surface.DrawLine(startL.x, startL.y, endL.x, endL.y)
    end

	function modelPanel:PostDrawModel(ent)
        local chamMatVis = "!flat"
        if serj.cfg.Vars["chams_visible_mat"] == 1 then
            chamMatVis = "!flat"
        elseif serj.cfg.Vars["chams_visible_mat"] == 2 then
            chamMatVis = "!textured"
        elseif serj.cfg.Vars["chams_visible_mat"] == 3 then
            chamMatVis = "models/shiny"
        elseif serj.cfg.Vars["chams_visible_mat"] == 4 then
            chamMatVis = "models/props_combine/health_charger_glass"
        elseif serj.cfg.Vars["chams_visible_mat"] == 5 then
            chamMatVis = "models/wireframe"
        elseif serj.cfg.Vars["chams_visible_mat"] == 6 then
            chamMatVis = "!MovingShiny"
        elseif serj.cfg.Vars["chams_visible_mat"] == 7 then
            chamMatVis = "!MovingWireframe"
        elseif serj.cfg.Vars["chams_visible_mat"] == 8 then
            chamMatVis = "!blaze"
        elseif serj.cfg.Vars["chams_visible_mat"] == 9 then
            chamMatVis = "!MovingWireframe"
        end

		local colorFix = (1 / 255)
		local chamColVis = string.ToColor(serj.cfg.Colors["chams_visible"])



		if serj.cfg.Vars["chams_visible"] then
			render.SetColorModulation( chamColVis.r * colorFix, chamColVis.g * colorFix, chamColVis.b * colorFix )
			render.SetBlend( chamColVis.a * colorFix)
			render.MaterialOverride(Material(chamMatVis))
			ent:SetRenderMode(10)
			ent:SetColor(Color(0, 0, 0, 0))
			ent:DrawModel()
		end
	end

    local espOverlay = pan:Add( "DModelPanel" )
	espOverlay:SetPos(0,0)
    espOverlay:SetSize(w,h)

    espOverlay.Paint = function(s,w,h)

        --[[]
        ["esp_box_r"] = false,
        ["esp_box_grad_r"] = false,
        ["esp_box_f_r"] = false,

        ["esp_box"] = false,
        ["esp_box_grad"] = false,
        ["esp_box_f"] = false,
        ["esp_box_type"] = 1,
        ["esp_box_fr"] = false,
        ["esp_box_trg"] = false,
        ["esp_box_team"] = false,

        ["esp_name"] = false,
        ["esp_wep"] = false,
        ["esp_hp"] = false,
        ["esp_ap"] = false,

        ["esp_hp_bar"] = false,
        ["esp_hp_bar_ac"] = false,
        ["esp_hp_bar_gradient"] = false,
        ]]

        if serj.cfg.Vars["esp_name"] then
            draw.SimpleText("Name esp","ESP Font",170,100,color_white)
        end
        if serj.cfg.Vars["esp_wep"] then
            draw.SimpleText("Weapon name","ESP Font",175,495,color_white)
        end
        if serj.cfg.Vars["esp_box"] then
            serj.surfaceOutline(125,115,175,380,1,color_white)
        end
        if serj.cfg.Vars["esp_hp"] then
            draw.SimpleText("100","ESP Font",100,120,color_white)
        end


    end
end

function serj.adapSlider(lbl, symbol, swep, cfgg, min, max, dec, par)

	local p = vgui.Create("DPanel",par)
	p:Dock(TOP)
	p:DockMargin(2,2,2,0)
	p:SetTall(45)

	local slider = p:Add("DNumSlider")
	slider:Dock(TOP)
	slider:SetHeight(10)
	slider:DockMargin(5,28,5,5)
	slider:SetMin(min)
	slider:SetMax(max)
	slider:SetTooltip(lbl)
	slider:SetDefaultValue(serj.cfg.AdaptiveConfig[swep][cfgg])
	slider:ResetToDefaultValue()
	slider:SetDecimals(dec)

	slider.Label:Hide()
	slider.TextArea:Hide()

	function slider:OnValueChanged()
		serj.cfg.AdaptiveConfig[swep][cfgg] = slider:GetValue()
	end

	p.Paint = function(s,w,h)
		draw.SimpleText(lbl,"font-02",5,5,color_white)
		draw.SimpleText(math.Round(slider:GetValue()) .. symbol,"font-02",w-5,5,color_white,TEXT_ALIGN_RIGHT)
	end

	slider.Slider.Paint = function(self,w,h)
		local getwidth = slider.Slider.Knob:GetPos()
		draw.RoundedBox(0,0,0,w,h,Color(0,0,0))

		draw.RoundedBox(0,1,1,getwidth-2,h-2,string.ToColor(serj.cfg.Colors["menu_color"]),true,false,true,false)
	end

	slider.Slider.Knob:SetSize(6,10)
    slider.Slider.Knob.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,color_white)
	end
    if !rp then
	    slider.Slider:SetNotches(0)
	    slider.Slider:SetNotchColor(Color(0,0,0,0))
    end
	slider.Scratch:SetVisible(false)
end

function serj.adapBox(name,cfgg,swep,panel)
	local p = panel:Add("DPanel")
	p:Dock(TOP)
	p:SetTall(25)
	p:DockMargin(5,2,5,0)

	p.Paint = function(ilysha, krutoi, chuvak)
		draw.SimpleText(name,"font-02",30,chuvak/2,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end

	local c = p:Add("DCheckBox")
	c:Dock(LEFT)
	c:DockMargin(5,5,5,5)
	c:SetValue( serj.cfg.AdaptiveConfig[swep][cfgg] )
	function c:OnChange( bVal )
		serj.cfg.AdaptiveConfig[swep][cfgg] = bVal
		sound.PlayURL("https://cdn.discordapp.com/attachments/1191734219035136122/1202546988521095168/LightHitsound.mp3")
	end

	c.Paint = function(ilysha, krutoi, chuvak)
        local checkcolor = string.ToColor(serj.cfg.Colors["menu_color"])
		ilysha.move_alpha = ilysha.move_alpha or 0
        ilysha.checked = ilysha.checked or 0

		if ilysha:IsHovered() then
			ilysha.move_alpha = math.Approach(ilysha.move_alpha,128,FrameTime()*300)
		else
			ilysha.move_alpha = math.Approach(ilysha.move_alpha,55,FrameTime()*150)
		end

		draw.RoundedBox(0,0,0,krutoi,chuvak,Color(45,45,45))
		if c:GetChecked() then
            ilysha.checked = math.Approach(ilysha.checked,255,FrameTime()*350)
        else
            ilysha.checked = math.Approach(ilysha.checked,0,FrameTime()*350)
		end
		draw.RoundedBox(0,0,0,krutoi,chuvak,Color(checkcolor.r,checkcolor.g,checkcolor.b,ilysha.checked))
		draw.RoundedBox(0,1,1,krutoi-2,chuvak-2,Color(0,0,0,255))
        draw.RoundedBox(0,2,2,krutoi-4,chuvak-4,Color(checkcolor.r,checkcolor.g,checkcolor.b,ilysha.checked))
		serj.surfaceTexture(2,2,krutoi-4,chuvak-4,"gui/gradient_up",Color(15,15,15,ilysha.checked))
	end
end

function serj.AddAdapWeapon(pan)
    local b = pan:Add("DButton")
    b:Dock(TOP)
    b:DockMargin(4,4,4,5)
    b:SetTall(25)
    b:SetText("")

    b.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(32,32,32))
		serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(15,15,15,10))
		serj.surfaceOutline(0,0,w,h,1,color_black)
        serj.surfaceOutline(1,1,w-2,h-2,1,Color(50,50,50))
        if IsValid(LocalPlayer()) and LocalPlayer():Alive() and IsValid(LocalPlayer():GetActiveWeapon()) then
		    draw.SimpleText("Add adaptive config for " .. LocalPlayer():GetActiveWeapon():GetClass(),"font-02",w/2,h/2,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("You need to be alive or holding valid weapon.","font-02",w/2,h/2,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
    end

    b.DoClick = function()
        if LocalPlayer():GetActiveWeapon() != nil then
            serj.cfg.AdaptiveConfig[LocalPlayer():GetActiveWeapon():GetClass()] = {
                LocalPlayer():GetActiveWeapon():GetPrintName(),
                false, -- baim
                50, -- bhp
                3, -- hitbox
                false, -- st
                45 -- rs
            }
        end
    end
end

function serj.AdapCFG(name,swep,pan)
    local b = pan:Add("DButton")
    b:Dock(TOP)
    b:DockMargin(4,4,4,0)
    b:SetText("")

    b.Paint = function(s,w,h)
        draw.RoundedBox(0,0,0,w,h,Color(32,32,32))
		serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(15,15,15,10))
		serj.surfaceOutline(0,0,w,h,1,color_black)
        serj.surfaceOutline(1,1,w-2,h-2,1,Color(50,50,50))
		draw.SimpleText(name .. "(" .. swep .. ")","font-02",w/2,h/2,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end

    b.DoClick = function()
        local mousex, mousey = input.GetCursorPos()
		if IsValid(serj.Panels.adapCfg) then
			serj.Panels.adapCfg:Remove()
		end

		serj.Panels.adapCfg = vgui.Create("DFrame")
		serj.Panels.adapCfg:SetSize(300, 250)
		serj.Panels.adapCfg:SetTitle(" ")
		serj.Panels.adapCfg:ShowCloseButton(false)
		serj.Panels.adapCfg.Paint = function(self, w, h)
			serj.PanelPaint(self,name .. " config",w,h)
		end
		serj.Panels.adapCfg:SetPos(mousex+45,mousey-45)
		serj.Panels.adapCfg:MakePopup()

        serj.adapBox("Only baim",2,swep,serj.Panels.adapCfg)
        serj.adapSlider("Baim health", "", swep, 3, 0, 99, 0, serj.Panels.adapCfg)
        serj.adapSlider("Resolver step", "", swep, 6, 2, 180, 0, serj.Panels.adapCfg)
    end
    b.DoRightClick = function()
        serj.cfg.AdaptiveConfig[swep] = nil
        b:Remove()
    end
end

function serj.addSkinPanel(name,model,material,weapon,panel)

    local skp = panel:Add("DPanel")
    skp:Dock(TOP)
    skp:DockMargin(10,10,10,0)
    skp:SetTall(120)
    skp.Paint = function(s,w,h)
        surfaceSetDrawColor(35,35,35)
        surfaceDrawRect(0,0,w,h)
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(0,0,0,55))
		serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
        serj.surfaceOutline(1,1,w-2,h-2,1,Color(50,50,50))
        --skin info
        draw.SimpleText(name,"font-02",125,12,color_white)
        draw.SimpleText("Model    " .. model,"font-02",125,40,color_white)
        draw.SimpleText("Skin    " .. material,"font-02",125,60,color_white)
        draw.SimpleText("Weapon    " .. weapon,"font-02",125,80,color_white)
    end

    local skp2 = skp:Add("DPanel")
    skp2:Dock(LEFT)
    skp2:DockMargin(6,6,6,6)
    skp2:SetWide(100)
    skp2.Paint = function(s,w,h)
        draw.RoundedBox(0,0,0,w,h,Color(35,35,35))
        serj.surfaceOutline(0,0,w,h,1,color_black)
    end
    skp2:SetWide(108)

    local m = skp2:Add( "DModelPanel" )
	m:Dock(FILL)
    m:DockMargin(5,5,5,5)
	m:SetModel(model)
    local PrevMins, PrevMaxs = m.Entity:GetRenderBounds()
    m:SetCamPos(PrevMins:Distance(PrevMaxs) * Vector(0.5, 0.5, 0.5))
	m:SetLookAt((PrevMaxs + PrevMins) / 2)

    function m:LayoutEntity(ent) end
    local getskinweapon = serj.cfg.gunSkins[weapon]

	function m:PostDrawModel(ent)
        render.SetColorModulation(getskinweapon[4]/255,getskinweapon[5]/255,getskinweapon[6]/255)
		render.MaterialOverride(Material(material))
		ent:SetRenderMode(10)
		ent:SetColor(Color(0, 0, 0, 0))
		ent:DrawModel()
        render.SetColorModulation(1,1,1)
        render.MaterialOverride()
	end

    local removeb = skp2:Add("DButton")
    removeb:SetText("")
    removeb:Dock(FILL)
    removeb:DockMargin(5,5,5,5)

    removeb.Paint = function(s,w,h)
        s.Alpha = s.Alpha or 0
        s.Move = s.Move or 0

        if removeb:IsHovered() then
            s.Alpha = math.Approach(s.Alpha,235,FrameTime()*100)
            s.Move = math.Approach(s.Move,20,FrameTime()*150)
        else
            s.Alpha = math.Approach(s.Alpha,0,FrameTime()*350)
            s.Move = math.Approach(s.Move,0,FrameTime()*200)
        end

        serj.surfaceTexture(0,h-s.Move,w,20,"gui/gradient_up",Color(255,0,0,s.Alpha))
        draw.SimpleText("Remove","font-02",w/2,h-s.Move,Color(255,255,255,s.Alpha),TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)
        draw.SimpleText(name,"font-02",w/2,-19+s.Move,Color(255,255,255,s.Alpha),TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)
    end

    removeb.DoClick = function()
        serj.cfg.gunSkins[weapon] = nil
        skp:Remove()
    end

    local pp = panel:Add("DPanel")
    pp:Dock(TOP)
    pp:DockMargin(10,2,10,2)
    pp:SetTall(65)

    pp.Paint = function(s,w,h)
		surfaceSetDrawColor(35,35,35)
        surfaceDrawRect(0,0,w,h)
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(0,0,0,55))
		serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
        serj.surfaceOutline(1,1,w-2,h-2,1,Color(50,50,50))
    end

    local colorSelector = pp:Add("DColorMixer")
	colorSelector:Dock(FILL)
	colorSelector:DockPadding(5, 5, 5, 5)
	colorSelector:SetPalette(false)
	colorSelector:SetWangs(false)
	colorSelector:SetColor(Color(getskinweapon[4],getskinweapon[5],getskinweapon[6],getskinweapon[7]))
	function colorSelector:ValueChanged(val)
		getskinweapon[4] = val.r
		getskinweapon[5] = val.g
		getskinweapon[6] = val.b
		getskinweapon[7] = val.a
	end

end

function serj.skinAdd(pan)
    local p = pan:Add("DPanel")
    p:Dock(TOP)
    p:SetTall(50)
    p:DockMargin(5,5,5,0)

    p.Paint = function(s,w,h)
    end

    local b = p:Add("DButton")
    b:Dock(FILL)
    b:SetText("")
    b:DockMargin(9,9,9,9)

    b.Paint = function(s,w,h)
        surfaceSetDrawColor(35,35,35)
        surfaceDrawRect(0,0,w,h)
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(0,0,0,55))
		serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
        serj.surfaceOutline(1,1,w-2,h-2,1,Color(50,50,50))

        if IsValid(LocalPlayer()) and LocalPlayer():Alive() then
            draw.SimpleText("Add skin for " .. LocalPlayer():GetActiveWeapon():GetPrintName(),"font-02",w/2,h/2,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("You must be alive or with weapon in your hands!","font-02",w/2,h/2,Color(255,79,79),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end

    end

    b.DoClick = function()
        --sound.PlayURL("https://cdn.discordapp.com/attachments/1191734219035136122/1202546988521095168/LightHitsound.mp3")
        if IsValid(LocalPlayer()) and LocalPlayer():Alive() then
            serj.cfg.gunSkins[LocalPlayer():GetActiveWeapon():GetClass()] = {
                serj.cfg.Vars["skininput"],
                LocalPlayer():GetActiveWeapon():GetModel(),
                LocalPlayer():GetActiveWeapon():GetPrintName(),
                255,
                255,
                255,
                255,
            }
            serj.CloseFrame()
	        OpenGUI()
        end
    end
end

function serj.addModelPanel(name,model,weapon,panel)

    local skp = panel:Add("DPanel")
    skp:Dock(TOP)
    skp:DockMargin(10,10,10,0)
    skp:SetTall(120)
    skp.Paint = function(s,w,h)
        surfaceSetDrawColor(35,35,35)
        surfaceDrawRect(0,0,w,h)
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(0,0,0,55))
		serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
        serj.surfaceOutline(1,1,w-2,h-2,1,Color(50,50,50))
        --skin info
        draw.SimpleText(name,"font-02",125,12,color_white)
        draw.SimpleText("Model    " .. model,"font-02",125,40,color_white)
        draw.SimpleText("Weapon    " .. weapon,"font-02",125,60,color_white)
    end

    local skp2 = skp:Add("DPanel")
    skp2:Dock(LEFT)
    skp2:DockMargin(6,6,6,6)
    skp2:SetWide(100)
    skp2.Paint = function(s,w,h)
        draw.RoundedBox(0,0,0,w,h,Color(35,35,35))
        serj.surfaceOutline(0,0,w,h,1,color_black)
    end
    skp2:SetWide(108)

    local m = skp2:Add( "DModelPanel" )
	m:Dock(FILL)
    m:DockMargin(5,5,5,5)
	m:SetModel(model)
    local PrevMins, PrevMaxs = m.Entity:GetRenderBounds()
    m:SetCamPos(PrevMins:Distance(PrevMaxs) * Vector(0.5, 0.5, 0.5))
	m:SetLookAt((PrevMaxs + PrevMins) / 2)

    function m:LayoutEntity(ent) end
    local getskinweapon = serj.cfg.gunModels[weapon]

    local removeb = skp2:Add("DButton")
    removeb:SetText("")
    removeb:Dock(FILL)
    removeb:DockMargin(5,5,5,5)

    removeb.Paint = function(s,w,h)
        s.Alpha = s.Alpha or 0
        s.Move = s.Move or 0

        if removeb:IsHovered() then
            s.Alpha = math.Approach(s.Alpha,235,FrameTime()*100)
            s.Move = math.Approach(s.Move,20,FrameTime()*150)
        else
            s.Alpha = math.Approach(s.Alpha,0,FrameTime()*350)
            s.Move = math.Approach(s.Move,0,FrameTime()*200)
        end

        serj.surfaceTexture(0,h-s.Move,w,20,"gui/gradient_up",Color(255,0,0,s.Alpha))
        draw.SimpleText("Remove","font-02",w/2,h-s.Move,Color(255,255,255,s.Alpha),TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)
        draw.SimpleText(name,"font-02",w/2,-19+s.Move,Color(255,255,255,s.Alpha),TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP)
    end

    removeb.DoClick = function()
        serj.cfg.gunModels[weapon] = nil
        skp:Remove()
    end
end

function serj.modelAdd(pan)
    local p = pan:Add("DPanel")
    p:Dock(TOP)
    p:SetTall(50)
    p:DockMargin(5,5,5,0)

    p.Paint = function(s,w,h)
    end

    local b = p:Add("DButton")
    b:Dock(FILL)
    b:SetText("")
    b:DockMargin(9,9,9,9)

    b.Paint = function(s,w,h)
        surfaceSetDrawColor(35,35,35)
        surfaceDrawRect(0,0,w,h)
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(0,0,0,55))
		serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
        serj.surfaceOutline(1,1,w-2,h-2,1,Color(50,50,50))

        if IsValid(LocalPlayer()) and LocalPlayer():Alive() then
            draw.SimpleText("Change model for " .. LocalPlayer():GetActiveWeapon():GetPrintName(),"font-02",w/2,h/2,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        else
            draw.SimpleText("You must be alive or with weapon in your hands!","font-02",w/2,h/2,Color(255,79,79),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end

    end

    b.DoClick = function()
        if IsValid(LocalPlayer()) and LocalPlayer():Alive() then
            serj.cfg.gunModels[LocalPlayer():GetActiveWeapon():GetClass()] = {
                serj.cfg.Vars["modelinput"],
                LocalPlayer():GetActiveWeapon():GetModel(),
                LocalPlayer():GetActiveWeapon():GetPrintName(),
            }
            serj.CloseFrame()
	        OpenGUI()
        end
    end
end

serj.aayaws = {
    "Forward ",
    "Backward ",
    "Left ",
    "Right ",
    "Spin ",
    "Reverse spin ",
    "Jitter ",
    "Backward jitter",
    "Custom",
    "Legit",
    "Save",
    "Save2",
    "Save3",
    "Save4",
    "Save5",
    "Save6",
    "Save7",
    "Save8",
    "Save9",
}

scriptfiles, sdir = serj.oldFileFind( "serj/*.lua", "DATA" )
unloadScript = true
function serj.RedactorPanel(name,panel)
    local trueName = file.Read( "serj/" .. name, "DATA" )
    local p = panel:Add("DPanel")
    p:Dock(TOP)
    p:DockMargin(3,3,3,3)
    p:SetTall(45)

    p.Paint = function(s,w,h)
        draw.RoundedBox(0,0,0,w,h,Color(50,50,50))
        Petyshara(6,23,w - 13,2,scrw/25,6)
        serj.surfaceOutline(0,0,w,h,1,color_black)
        draw.SimpleText(name,"font-02",8,h/2,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
    end

	local b = p:Add("DButton")
	b:SetText("")
	b:SetWide(85)
	b:Dock(RIGHT)
	b:DockMargin(8,8,8,8)
	b.Paint = function(self,w,h)
        draw.RoundedBox(0,0,0,w,h,Color(50,50,50))
        serj.surfaceOutline(0,0,w,h,1,color_black)
		draw.SimpleText("RunString", "font-02", w/2, h/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	b.DoClick = function()
        local fileRun = RunString(trueName, "RunString", false)

		if fileRun then
			chat.AddText(Color(255, 0, 0), "[IlyaWare] " , fileRun)
		else
			chat.AddText(Color(0, 255, 128), "[IlyaWare] ", color_white, "Script loaded - ", name)
		end
	end
    local b2 = p:Add("DButton")
	b2:SetText("")
	b2:SetWide(85)
	b2:Dock(RIGHT)
	b2:DockMargin(1,8,1,8)
	b2.Paint = function(self,w,h)
        draw.RoundedBox(0,0,0,w,h,Color(50,50,50))
        serj.surfaceOutline(0,0,w,h,1,color_black)
		draw.SimpleText("Unload", "font-02", w/2, h/2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
	end
	b2.DoClick = function()
        local fileUnload = RunString([[if unloadScript then return end ]] .. file.Read( "serj/" .. name, "DATA" ), "RunString", false)
		if fileUnload then
			chat.AddText(Color(255, 0, 0), "[IlyaWare] " , fileUnload)
		else
			chat.AddText(Color(0, 255, 128), "[IlyaWare] ", color_white, "Script unloaded - ", name)
		end
	end
end


serj.chamMats = {
    "Flat",
    "Textured",
    "Shiny",
    "Glass",
    "Wireframe",
    "Blaze",
    "Hoverball",
    "MovingWireframe",
    "MovingShiny",
    "portal",
}

--[["!flat"
    elseif serj.cfg.Vars["real_chams_m"] == 2 then
        serj.rlchams = "!textured"
    elseif serj.cfg.Vars["real_chams_m"] == 3 then
        serj.rlchams = "models/shiny"
    elseif serj.cfg.Vars["real_chams_m"] == 4 then
        serj.rlchams = "models/props_combine/health_charger_glass"
    elseif serj.cfg.Vars["real_chams_m"] == 5 then
        serj.rlchams = "models/wireframe"
    elseif serj.cfg.Vars["real_chams_m"] == 6 then
        serj.rlchams = "!blaze"
    elseif serj.cfg.Vars["real_chams_m"] == 7 then
        serj.rlchams = "!hoverball"
    elseif serj.cfg.Vars["real_chams_m"] == 8 then
        serj.rlchams = "!MovingWireframe"
    elseif serj.cfg.Vars["real_chams_m"] == 9 then
        serj.rlchams = "!MovingShiny"
    elseif serj.cfg.Vars["real_chams_m"] == 10 then
        serj.rlchams = "!portal"]]


function DrawBlur(amount, heavyness)
    local blur = Material("pp/blurscreen")
    local scrw, scrh = ScrW(), ScrH()

    surface.SetDrawColor(255, 255, 255)
    surface.SetMaterial(blur)

    for i = 1, heavyness do
        blur:SetFloat("$blur", (i / 3) * (amount or 1)) -- Adjust the divisor value for less intense blur
        blur:Recompute()

        render.UpdateScreenEffectTexture()
        surface.DrawTexturedRect(0, 0, scrw, scrh)
    end
end

function SnowEffect()
    local snejok = {}

    hook.Add("Think", "SnowThink", function()
        if input.IsKeyDown(KEY_DELETE) then
            if math.random(1, 40) == 1 then
                table.insert(snejok, {x = math.random(0, ScrW()), y = 0, size = math.random(2, 5), alpha = 255})
            end
        end

        for k, flake in pairs(snejok) do
            flake.y = flake.y + 1
            flake.alpha = flake.alpha - 1

            if flake.y > ScrH() or flake.alpha <= 0 then
                table.remove(snejok, k)
            end
        end
    end)

    hook.Add("HUDPaint", "SnowDraw", function()
        for _, flake in pairs(snejok) do
            surface.SetDrawColor(255, 255, 255, flake.alpha)
            surface.DrawRect(flake.x, flake.y, flake.size, flake.size)
        end
    end)
    end

function RainEffect()
    local raindrops = {}

    hook.Add("Think", "RainThink", function()
        if math.random(1, 10) == 1 then
            table.insert(raindrops, {x = math.random(0, ScrW()), y = 0, length = math.random(5, 10)})
        end

        for k, drop in pairs(raindrops) do
            drop.y = drop.y + 2

            if drop.y > ScrH() then
                table.remove(raindrops, k)
            end
        end
    end)

    hook.Add("HUDPaint", "RainDraw", function()
        surface.SetDrawColor(100, 100, 255)

        for _, drop in pairs(raindrops) do
            surface.DrawLine(drop.x, drop.y, drop.x, drop.y + drop.length)
        end
    end)
end

local flashColor = Color(0, 209, 0)

local function drawFlashingOutline(x, y, w, h, thickness, color)
    local time = RealTime() * 1
    local alpha = math.abs(math.sin(time)) * 3

    color.a = alpha

    serj.surfaceOutline(x, y, w, h, thickness, color)
end

local textaa = "111"

function OpenGUI()
    files, dir = serj.oldFileFind( "serj/*.json", "DATA" )
    scriptfiles, sdir = serj.oldFileFind( "serj/*.lua", "DATA" )

	serj.Panels.frame = vgui.Create("DFrame")
	serj.Panels.frame:SetPos(serj.Panels.framex,serj.Panels.framey)
	serj.Panels.frame:SetSize(serj.Panels.framew,serj.Panels.frameh)
	serj.Panels.frame:SetAlpha(0)
	serj.Panels.frame:AlphaTo(255,0.7,0,function()end)
	serj.Panels.frame:SetTitle("                                                                                                                                                                                                                                            ILYAWARE")
	serj.Panels.frame:MakePopup()
    serj.Panels.frame:SetSize(850, 808)
    --popup:SetFont("font-03")
    --serj.Panels.frame:SetPos(ScrW()/2 - 150, 300)
	serj.Panels.frame:ShowCloseButton(false)
    serj.Panels.frame:SetSizable(true)
    serj.Panels.frame:SetMinWidth( 800 )
    serj.Panels.frame:SetMinHeight( 725 )

    --local yaycadedamoroza, penisdedamoroza = scrw/700, scrh/600

	serj.Panels.frame.Paint = function(s, w, h)
        if serj.cfg.Vars["menu_d"] == 1 then
        for char = 1, #textaa do
            local col = string.ToColor(serj.cfg.Colors["alpha_menu"])--HSVToColor( ( ( RealTime() * 100 ) - char * 15 ) % 360, 1, 1 )
    surfaceSetDrawColor(col.r, col.g, col.b,22)
    surfaceDrawRect(0,0,w,h)
        end
    elseif serj.cfg.Vars["menu_d"] == 2 then
            local yaycadedamoroza, penisdedamoroza = scrw/700, scrh/600
        surface.SetFont("THUDFONT")
        local IlyaWare2, IlyaTraxer = surface.GetTextSize("Ilysha")

        for ii = 0,penisdedamoroza do
            for i = 0,yaycadedamoroza do
                serj.surfaceTexture(700*i,600*ii,700,600 ,"skeetbg.png",color_white)
            end
        end
    elseif serj.cfg.Vars["menu_d"] == 3 then
            for char = 1, #textaa do
                local col = HSVToColor( ( ( RealTime() * 100 ) - char * 15 ) % 360, 1, 1 )
        surfaceSetDrawColor(col.r, col.g, col.b,22)
        surfaceDrawRect(0,0,w,h)
            end
end

        serj.surfaceOutline(0,0,w,h,6,color_black)
        serj.surfaceOutline(1,1,w-2,h-2,5,Color(57,57,57))
        serj.surfaceOutline(2,2,w-4,h-4,3,Color(29,29,28))
        surfaceSetDrawColor(6,6,6)
        surfaceDrawRect(7,7,w-14,3)
        serj.surfaceOutline(6,6,w-12,4,1,color_black)
        serj.Petyshara(7,7,w-14,2,scrw/25,6)
        drawFlashingOutline(0, 0, w, h, 6, flashColor)
    drawFlashingOutline(1, 1, w - 2, h - 2, 5, flashColor)
    drawFlashingOutline(2, 2, w - 4, h - 4, 3, flashColor)
    drawFlashingOutline(6, 6, w - 12, 4, 1, flashColor)
	end

    local tabs = serj.Panels.frame:Add("DPanel")
    tabs:SetPos(6,9)
    tabs:SetSize(96,serj.Panels.frame:GetTall()-15)

    tabs.Paint = function(s,w,h)
        surfaceSetDrawColor(40,40,40)
        surfaceDrawRect(0,0,w,h)
        surfaceSetDrawColor(0,0,0)
        surfaceDrawRect(0,0,w-1,h)
        surfaceSetDrawColor(12,12,12)
        surfaceDrawRect(0,0,w-2,h)
    end

    --[[               if serj.cfg.Vars["esp_self_customagent_agent"] == 1 then
            LocalPlayer():SetModel("models/player/charple.mdl")
        elseif serj.cfg.Vars["esp_self_customagent_agent"] == 2 then
            LocalPlayer():SetModel("models/player/corpse1.mdl")
        elseif serj.cfg.Vars["esp_self_customagent_agent"] == 3 then              ]]

        --[[local colors = {
            Color(25, 0, 255),
            Color(76, 0, 255),
            Color(140, 0, 255),
            Color(255, 0, 242),
            Color(174, 0, 255),
            Color(204, 0, 255),
            Color(68, 0, 255)
        }

        local spots = {}

        for i = 1, 66 do
            spots[i] = {
                x = math.random(1, 850),
                y = math.random(1, 850),
                c = colors[math.random(#colors)]
            }
        end

        local mat = Material("aim.png")
        local p = FindMetaTable("Panel")
        local scrw, scrh = ScrW(), ScrH()

        surface.SetDrawColor(0, 255, 242)
        surface.DrawRect(0, 0, w, h)

        surface.SetMaterial(mat)

        local speed = 0.1

for i = 1, 2 do
    spots[i].x = spots[i].x + speed
    spots[i].y = spots[i].y + speed

    if spots[i].x > 850 then spots[i].x = -160 end
    if spots[i].y > 850 then spots[i].y = -160 end

    surface.SetDrawColor(spots[i].c)
    surface.DrawTexturedRect(spots[i].x, spots[i].y, 320, 320)

    if i != 66 then
        if math.abs(spots[i].x - spots[i + 1].x) < 55 then
            spots[i].x = spots[i].x + 1
            spots[i + 1].x = spots[i + 1].x - 1
            --DrawBlur(6, 6)
        end
    end
end]]

    /////////////////////////////////////////////////////////////
    /////////////////// Aimbot panel ////////////////////////////
    /////////////////////////////////////////////////////////////

    local panel = serj.Panels.frame:Add("DPanel")
	panel:SetPos(105,13)
    panel:SetSize(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23)
	panel.Paint = function() end

    local aimpan = panel:Add("DPanel")
    aimpan:SetPos(5,5)
    aimpan:SetSize(panel:GetWide()/2-7,panel:GetTall()-9)
    aimpan.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Aimbot")
    end
    local ascrol = aimpan:Add("DScrollPanel")
	serj.SetupDscrollPanel("Aimbot",ascrol,aimpan)

	serj.guiCheckBox("Enabled","aim_enable",ascrol,false,true,"key_aim")
	serj.DropDown("Target selection", { "FOV", "Distance", "Health" }, "target_selection", ascrol)

    serj.guiCheckBox("Enable eyes hitbox","eyes_e",ascrol)
    serj.DropDown("Hitbox selection", { "Head | Голова", "Eyes | Глаза", "Penis | Пенис", "Spine | Спина", "Center | Центр", "Бошка", "Бошечка", "Башкирка"}, "hitbox_selection", ascrol)
    --serj.guiCheckBox("Hitscan head","hs_h",ascrol)
	--serj.guiCheckBox("Hitscan body","hs_b",ascrol)
	--serj.guiCheckBox("Hitscan arms","hitbox_arms",ascrol)
	--serj.guiCheckBox("Hitscan legs","hitbox_legs",ascrol)
    serj.guiCheckBox("Disable taunt","Disable_taunts",ascrol)
    serj.guiCheckBox("Silent aim","sa_enable",ascrol)
    serj.guiCheckBox("No Aim Lag","NoAimLag",ascrol)
    --serj.guiCheckBox("Fast eoka","no_lag",ascrol)
    --serj.CreateSlider("Re2ep", "°", "nolag_time", 1, 180, 0,ascrol)
    serj.guiCheckBox("Sequence fix","tickfix",ascrol)
    serj.CreateSlider("Fixing time", "°", "tickfix_time", 1, 6, 0,ascrol)  --nolage_time
	serj.guiCheckBox("Auto fire","af_enable",ascrol)
	serj.guiCheckBox("Auto reload","ar_enable",ascrol)
	serj.guiCheckBox("Auto wallbang","aw_enable",ascrol)
    serj.guiCheckBox("Fix movement","fix_move",ascrol)
    --serj.guiCheckBox("Backtrack","Backtrack",ascrol)
    --serj.DropDown("Mode", { "FOV", "Distance", "Health" }, "Backtrack_mode", ascrol) Forwardtrack
   -- serj.CreateSlider("Backtrack time", "°", "Backtrack_time", 1, 1000, 0,ascrol)
    --serj.guiCheckBox("Auto prediction","pred_tick",ascrol)

    local aimpan2 = panel:Add("DPanel")
    aimpan2:SetPos(panel:GetWide()/2-7+10,5)
    aimpan2:SetSize(panel:GetWide()/2-7,panel:GetTall()-9)
    aimpan2.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Other")
    end
    local ascrol2 = aimpan2:Add("DScrollPanel")
	serj.SetupDscrollPanel("Other",ascrol2,aimpan2)

	serj.guiCheckBox("Resolver","res_enable",ascrol2)
    serj.DropDown("Resolver type", { "Default", "Широкий типок", "mrandom | рандом", "Custom", "Custom2" }, "res_type", ascrol2)
	serj.CreateSlider("Resolver step", "°", "res_step", 1, 180, 0,ascrol2)
    serj.guiCheckBox("Pitch resolver","res_pitch",ascrol2)
    serj.guiCheckBox("Sequence interpolation", "Disable_Sequence_interpolation",ascrol2)
    serj.guiCheckBox("Interpolation", "Disable_interpolation",ascrol2)
    serj.guiCheckBox("Lag fix","LagFix",ascrol2)
    serj.CreateSlider("Fixing", "°", "laging_time", 1, 10, 0,ascrol2)
    --serj.guiCheckBox("Aimbot crosshair","Aimbot_cros",ascrol2,true) Aimbot_markers
    serj.guiCheckBox("Aimbot crosshair","Aimbot_swaston",ascrol2,true)
    serj.guiCheckBox("Aimbot box marker","Aimbot_markers",ascrol2,true)
    serj.guiCheckBox("Aimbot kryg","Aimbot_krujok",ascrol2,true)
    serj.guiCheckBox("Aimbot fill","Aimbot_fill",ascrol2,true)
    serj.guiCheckBox("Aimbot marker","Aimbot_marker",ascrol2,true)
    serj.guiCheckBox("Aimbot snapline","as_enable",ascrol2,true)
    serj.guiCheckBox("Aimbot point","ap_enable",ascrol2,true)
    --serj.guiCheckBox("Aimbot sprite","ap_sprite",ascrol2)
    serj.guiCheckBox("Aimbot point box","ap_box",ascrol2)
	serj.guiCheckBox("Rapid fire","af_r",ascrol2)
	serj.guiCheckBox("Servertime","servertime",ascrol2)
    serj.guiCheckBox("Nospread","aim_nospread",ascrol2)
    serj.guiCheckBox("Norecoil","aim_norecoil",ascrol2)
    serj.guiCheckBox("Nospread (always on)","aim_nospread_alw",ascrol2)
    serj.guiCheckBox("Norecoil (always on)","aim_norecoil_alw",ascrol2)
	serj.guiCheckBox("Ignore god time","aimbot_ignore_bgod",ascrol2)
	serj.guiCheckBox("Ignore nodraw","aimbot_ignore_nodraw",ascrol2)
	serj.guiCheckBox("Ignore admin","aimbot_ignore_admin",ascrol2)
	serj.guiCheckBox("Ignore bots","aimbot_ignore_bots",ascrol2)
	serj.guiCheckBox("Ignore steam friend","aimbot_ignore_steam",ascrol2)
	serj.guiCheckBox("Ignore nocliping","aimbot_ignore_noclip",ascrol2)
	serj.guiCheckBox("Ignore teammates","aimbot_ignore_team",ascrol2)
	serj.guiCheckBox("Ignore friends","aimbot_ignore_fr",ascrol2)
    serj.CreateSlider("Скорость широкого типа", "", "bog_smerti_resolver_step", 66666666666, 66666666666666, 0, ascrol2)
    serj.guiCheckBox("Force backstab","backstab",ascrol2, false, true, "backstab")


    --serj.guiCheckBox("Самолёт tap (LFS De$troyer)","samolet_tap",ascrol2)
    --serj.guiButton("Set weapon",serj.SetSamoletgun,ascrol2)

    --peniss

    --[[]
    serj.AddAdapWeapon(ascrol2)

    for k, v in pairs(serj.cfg.AdaptiveConfig) do
        serj.AdapCFG(v[1],k,ascrol2)
    end
    ]]

    panel.OnSizeChanged = function()
        aimpan:SetSize(panel:GetWide()/2-7,panel:GetTall()-9)
        aimpan2:MoveTo(panel:GetWide()/2-7+10,5,0,0,0,function()end)
        aimpan2:SetSize(panel:GetWide()/2-7,panel:GetTall()-9)
    end

    /////////////////////////////////////////////////////////////
    /////////////////// Antiaim panel ///////////////////////////
    /////////////////////////////////////////////////////////////

    local panel2 = serj.Panels.frame:Add("DPanel")
	panel2:SetPos(105,13)
    panel2:SetSize(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23)
	panel2.Paint = function() end

    local antiaimpan = panel2:Add("DPanel")
    antiaimpan:SetPos(5,5)
    antiaimpan:SetSize(panel2:GetWide()/2-7,panel2:GetTall()-9)
    antiaimpan.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Anti-aim")
    end
    local aascrol = antiaimpan:Add("DScrollPanel")
	serj.SetupDscrollPanel("Anti-aim",aascrol,antiaimpan)

    serj.guiCheckBox("Enabled","aa_enable",aascrol)
	serj.DropDown("Yaw base", { "Viewangles", "Static", "At targets (Distance)", "At targets (FOV)" }, "yaw_base", aascrol)
	serj.DropDown("Real yaw", serj.aayaws, "yaw_real", aascrol)
	serj.DropDown("Fake yaw", serj.aayaws, "yaw_fake", aascrol)
	serj.DropDown("Pitch", {
		"Viewangles",
		"Zero",
		"Down",
		"Up",
		"Fake down ",
		"Jitter",
		"Random",
		"Custom",
        "Fake Up jitter",
        "Up jitter",
        "Fake Zero",
        "Flicker +Up",
        "Fucker Flicker +Up",
        "Faster Flicker +Up",
	}, "pitch", aascrol)

	serj.CreateSlider("Custom pitch", "°", "c_pitch", -181, 180, 2, aascrol)
	serj.CreateSlider("Custom real", "°", "c_ryaw", -180, 180, 1, aascrol)
	serj.CreateSlider("Custom fake", "°", "c_fyaw", -180, 180, 1, aascrol)
	serj.CreateSlider("Jitter range", "°", "antiaim_jitterrange", 1, 360, 1, aascrol)
	serj.CreateSlider("Spin speed", "°", "antiaim_spinspeed", 1, 100, 1, aascrol)

    serj.guiCheckBox("Manual Left", "manual_left", aascrol, false, true, "key_aaml")
    serj.guiCheckBox("Manual Right", "manual_right", aascrol, false, true, "key_aamr")

    serj.guiCheckBox("Hyesos","angle_bind",aascrol)
    serj.guiCheckBox("Safe pitch on land","pitch_zero_land",aascrol)
    serj.guiCheckBox("Invert on shot","invert_on_shot",aascrol)

    --serj.guiCheckBox("Fix movement","fix_move",aascrol)
    serj.guiCheckBox("Safe angle on shoot","lllike",aascrol)
    serj.guiCheckBox("Safe pitch on shoot","angle_c",aascrol)
    serj.guiCheckBox("Head protect","lby_abuse",aascrol)
    serj.CreateSlider("Protect value", "°", "lby_abuseprotect", -180, 360, 1, aascrol)
	serj.guiCheckBox("Flickazoid","Flicker_aa",aascrol)
    serj.guiCheckBox("Brute angle left","fake_flick2",aascrol)
    serj.CreateSlider("Brute jja", "°", "brute_jja", 1, 45, 1, aascrol)
	serj.guiCheckBox("Brute angle","fake_flick",aascrol)
    serj.CreateSlider("Brute jj", "°", "brute_jj", 1, 45, 1, aascrol)
	serj.guiCheckBox("Anti brute","anti_brute",aascrol)
	serj.guiCheckBox("Micromovement ","movement_desync",aascrol)
	serj.guiCheckBox("Dancer","dancer",aascrol)
	serj.DropDown("Act", {
		"robot",
		"muscle",
		"laugh",
		"bow",
		"cheer",
		"wave",
		"becon",
		"agree",
		"disagree",
		"forward",
		"group",
		"half",
		"zombie",
		"dance",
		"pers",
		"halt",
		"salute",}
	, "dance", aascrol)
	serj.guiCheckBox("Off AA on ladder","aa_off_ladder",aascrol)
	serj.guiCheckBox("Off AA on use","aa_off_use",aascrol)

    local antiaimpan2 = panel2:Add("DPanel")
    antiaimpan2:SetPos(panel2:GetWide()/2-7+10,5)
    antiaimpan2:SetSize(panel2:GetWide()/2-7,panel2:GetTall()/2-9)
    antiaimpan2.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Fake Lag")
    end
    local aascrol2 = antiaimpan2:Add("DScrollPanel")
	serj.SetupDscrollPanel("Fake Lag",aascrol2,antiaimpan2)

	serj.guiCheckBox("Enable fakelag","fl_enable",aascrol2)
	serj.DropDown("Fakelag mode", { "Static","Adaptive","Small hybrid","Hybrid" }, "fl_mode", aascrol2)
	serj.CreateSlider("Fakelag max", "", "fl_maxchoke", 1, 23, 0, aascrol2)
	serj.guiCheckBox("Off AA on ladder","fl_ladder",aascrol2)
	serj.guiCheckBox("Off AA on use","fl_use",aascrol2)
    serj.guiCheckBox("Fakelag on peek","fl_peeker",aascrol2)
    serj.guiCheckBox("Lag on walls","fl_lagger",aascrol2)
    serj.guiCheckBox("Anti lag fix","fl_fix",aascrol2)
    serj.guiCheckBox("Hitlogs", "logs_hurt", aascrol2, true)
    serj.guiCheckBox("Old damage force", "allah_damage_force", aascrol2)

    local antiaimpan3 = panel2:Add("DPanel")
    antiaimpan3:SetPos(panel2:GetWide()/2-7+10,panel2:GetTall()/2+5)
    antiaimpan3:SetSize(panel2:GetWide()/2-7,panel2:GetTall()/2-9)
    antiaimpan3.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Other")
    end
    local aascrol3 = antiaimpan3:Add("DScrollPanel")
	serj.SetupDscrollPanel("Other",aascrol3,antiaimpan3)

	serj.guiCheckBox("Edge yaw","edge_enable",aascrol3)
    serj.DropDown("Edge side", { "Real","Fake" }, "edge_side", aascrol3)
    serj.guiCheckBox("Avoid overlap","avoid_overlap",aascrol3)
    serj.CreateSlider("Avoid overlap add", "°", "avoid_overlap_add", 1, 81, 0, aascrol3)
    serj.guiCheckBox("Pisyn","zxcpiska",aascrol3)
    serj.guiCheckBox("Auto direction","aa_autodir",aascrol3)
    serj.guiCheckBox("Anti aim changer","aa_changer",aascrol3)

    panel2.OnSizeChanged = function()
        antiaimpan:SetSize(panel2:GetWide()/2-7,panel2:GetTall()-9)
        antiaimpan2:MoveTo(panel2:GetWide()/2-7+10,5,0,0,0,function()end)
        antiaimpan2:SetSize(panel2:GetWide()/2-7,panel2:GetTall()/2-9)
        antiaimpan3:MoveTo(panel2:GetWide()/2-7+10,panel2:GetTall()/2+5,0,0,0,function()end)
        antiaimpan3:SetSize(panel2:GetWide()/2-7,panel2:GetTall()/2-9)
    end

    /////////////////////////////////////////////////////////////
    /////////////////// Legit panel /////////////////////////////
    /////////////////////////////////////////////////////////////

    local panel3 = serj.Panels.frame:Add("DPanel")
	panel3:SetPos(105,13)
    panel3:SetSize(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23)
	panel3.Paint = function() end

    local legitpan = panel3:Add("DPanel")
    legitpan:SetPos(5,5)
    legitpan:SetSize(panel3:GetWide()/2-7,panel3:GetTall()-9)
    legitpan.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Main")
    end
    local legpan = legitpan:Add("DScrollPanel")
	serj.SetupDscrollPanel("Main",legpan,legitpan)

    serj.guiCheckBox("Jump check","aim_jump_check",legpan)
    serj.guiCheckBox("FOV  limit","legit_fov",legpan)
    serj.CreateSlider("Max FOV", "°", "legit_fov_val", 1, 180, 0, legpan)
    serj.guiCheckBox("FOV  circle","legit_fov_draw",legpan,true)
    serj.guiCheckBox("Enable smoothing","legit_smooth",legpan)
    serj.CreateSlider("Smooth amount", "", "legit_smooth_amount", 1, 10, 0, legpan)

    serj.guiCheckBox("Legit spread/recoil","legit_spread_recoil",legpan)
    serj.CreateSlider("Recoil control", "%", "legit_rcs", 1, 100, 0, legpan)
    serj.CreateSlider("Spread control", "%", "legit_scs", 1, 100, 0, legpan)

    serj.guiCheckBox("Enable trigger","legit_trigger",legpan)

    serj.guiCheckBox("Armorkit spawn","armorkit",legpan)
    serj.guiCheckBox("Healtkit spawn","healthkit",legpan) --Hide_name  -- healthkit -- armorkit

    panel3.OnSizeChanged = function()
        legitpan:SetSize(panel3:GetWide()/2-7,panel3:GetTall()-9)
    end

    /////////////////////////////////////////////////////////////
    /////////////////// Visuals panel ///////////////////////////
    /////////////////////////////////////////////////////////////

    local panel4 = serj.Panels.frame:Add("DPanel")
	panel4:SetPos(105,13)
    panel4:SetSize(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23)
	panel4.Paint = function() end

    local playeresp = panel4:Add("DPanel")
    playeresp:SetPos(5,5)
    playeresp:SetSize(panel4:GetWide()/2-7,panel4:GetTall()-209)
    playeresp.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Player ESP")
    end
    local playerespan = playeresp:Add("DScrollPanel")
	serj.SetupDscrollPanel("Player ESP",playerespan,playeresp)

    serj.guiButton("Esp preview",serj.OpenESPPreview,playerespan)
    serj.CreateSlider("Dormant esp", "", "alpha_dormant", 0, 225, 1,playerespan)
    serj.guiCheckBox("Player Box","esp_box",playerespan,true)
    serj.DropDown("Box Style", {"Default","Corners","3D","Outlined","Circle","Pizdec"}, "esp_box_type", playerespan)
    serj.guiCheckBox("Highlight Friends","esp_box_fr",playerespan,true)
    serj.guiCheckBox("Highlight Targets","esp_box_trg",playerespan,true)
    serj.guiCheckBox("Team Color","esp_box_team",playerespan)
    serj.guiCheckBox("Fill","esp_box_f",playerespan,true)
    serj.guiCheckBox("Gradient fill","esp_box_grad",playerespan,true)
    serj.guiCheckBox("Box Rainbow","esp_box_r",playerespan)
    serj.guiCheckBox("Fill Rainbow","esp_box_f_r",playerespan)
    serj.guiCheckBox("Gradient Rainbow","esp_box_grad_r",playerespan)


    
    serj.guiCheckBox("Flashlight","hlflashlight",playerespan)
    serj.guiCheckBox("Dlight","dlight",playerespan,true)
    serj.guiCheckBox("Dlight rainbow","dlight_hsv",playerespan) --["snaplines"] "255 255 255 255",
    serj.guiCheckBox("Hitbones","esp_other_hitlocations",playerespan) --esp_other_skull esp_other_bodypart
    serj.guiCheckBox("Eye tracer","tracer",playerespan,true)
    serj.guiCheckBox("Rainbow player","lgbt_pers",playerespan)
    serj.guiCheckBox("Rainbow gun","lgbt_persik",playerespan)
    serj.guiCheckBox("My player model","esp_self_customagent",playerespan)
    serj.DropDown("Player", {"Charple","Bomj","Gman","Zombie","Zombie","Zombie","Zombie","Zombie","Zombie","Zombie","Zombie","Zombie","Zombie","Zombie","Zombie","Zombie","Тянка"}, "esp_self_customagent_agent", playerespan)
    serj.guiCheckBox("Enemy player model","esp_player_modelchanger",playerespan)
    serj.DropDown("Player", {"Charple","Negrila","Gman","Zombie"}, "esp_player_modelchanger_agent", playerespan)
    serj.guiCheckBox("Hat","esp_self_hat",playerespan)
    serj.DropDown("Hat type", {"Default","Corners","3D","Outlined","Outlined","Outlined"},"esp_self_hat_type", playerespan)
    serj.guiCheckBox("Name","esp_name",playerespan,true)
    serj.guiCheckBox("Ping","esp_ping",playerespan,true)
    serj.guiCheckBox("Weapon","esp_wep",playerespan,true) --esp_rwep
    serj.guiCheckBox("Reload weapon","esp_rwep",playerespan,true)
    serj.guiCheckBox("Health","esp_hp",playerespan,true)
    serj.guiCheckBox("Health 2","esp_hpda",playerespan)
    serj.guiCheckBox("Armor","esp_ap",playerespan,true)
    serj.guiCheckBox("Team","esp_team",playerespan)
    serj.guiCheckBox("Group","esp_group",playerespan,true)
    serj.guiCheckBox("Money","esp_money",playerespan,true)
    serj.guiCheckBox("Skeleton","esp_skeleton",playerespan,true)
    serj.guiCheckBox("Enable","esp_hp_bar",playerespan,true)
    serj.guiCheckBox("Auto color","esp_hp_bar_ac",playerespan)
    serj.guiCheckBox("Gradient","esp_hp_bar_gradient",playerespan,true)
    serj.guiCheckBox("Glow ESP","glow_esp",playerespan,true)
    serj.guiCheckBox("Glow Additive","glow_esp_a",playerespan)
    serj.guiCheckBox("Attachment Glow","glow_esp_att",playerespan)

    local chamsesp = panel4:Add("DPanel")
    chamsesp:SetPos(5,10+panel4:GetTall()-209)
    chamsesp:SetSize(panel4:GetWide()/2-7,panel4:GetTall()-(panel4:GetTall()-195))
    chamsesp.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Colored models")
    end
    local chamsespan = chamsesp:Add("DScrollPanel")
	serj.SetupDscrollPanel("Colored models",chamsespan,chamsesp)

    --Visible chams
    serj.guiCheckBox("HitBox","hitbox",chamsespan,true)
    serj.guiCheckBox("Visible Chams","chams_visible",chamsespan,true)
    serj.DropDown("Material", serj.chamMats, "chams_visible_mat", chamsespan)
    serj.guiCheckBox("Attachment Chams","chams_visible_att",chamsespan)
    --Invisible chams
    serj.guiCheckBox("Invisible Chams","chams_invisible",chamsespan,true)
    serj.DropDown("Material", serj.chamMats, "chams_invisible_mat", chamsespan)
    serj.guiCheckBox("Attachment Chams","chams_invisible_att",chamsespan)
    --Guns
    serj.guiCheckBox("Gun animate's","viewmodel_wireframe",chamsespan,true)
    serj.labelColor("Start color","viewmodel_wireframe1",chamsespan,true)
    serj.CreateSlider("Move animation", "", "viewmodel_move", 1, 25, 0,chamsespan)
    serj.DropDown("Viewmodel type", serj.chamMats, "viewmodel_wiretype", chamsespan)
    serj.guiCheckBox("Hand chams","chams_hand",chamsespan,true)
    serj.labelColor("Start color","chams_hand1",chamsespan,true)
    serj.CreateSlider("Move animation", "", "chams_handmove", 1, 25, 0,chamsespan)
    serj.DropDown("Material", serj.chamMats, "chams_hand_mat", chamsespan)
    --Ragdolls
    serj.guiCheckBox("Ragdoll chams","chams_ragdolls",chamsespan,true)
    serj.DropDown("Material", serj.chamMats, "chams_ragdolls_mat", chamsespan)
    --Fake
    serj.guiCheckBox("Fake chams","fake_chams",chamsespan,true)
    serj.DropDown("Material", serj.chamMats, "fake_chams_m", chamsespan)

    serj.guiCheckBox("Real chams","real_chams",chamsespan,true)
    serj.DropDown("Material", serj.chamMats, "real_chams_m", chamsespan)
    serj.guiCheckBox("Real model chams","real_chams_real",chamsespan,true)
    serj.DropDown("Material", serj.chamMats, "real_chams_realtype", chamsespan)

    serj.guiCheckBox("Fakelag chams","fakelag_chams",chamsespan,true)
    serj.DropDown("Material", serj.chamMats,"fakelag_chams_m", chamsespan)


    local otheresp = panel4:Add("DPanel")
    otheresp:SetPos(panel4:GetWide()/2-7+10,5)
    otheresp:SetSize(panel4:GetWide()/2-7,panel4:GetTall()-359)
    otheresp.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Other ESP")
    end
    local otherespan = otheresp:Add("DScrollPanel")
	serj.SetupDscrollPanel("Other ESP",otherespan,otheresp)

    serj.guiCheckBox("Wateramrk","i_watermark",otherespan,true)
    serj.DropDown("Watermark style", {"Rainbow","Rainbow line","Onetap","Outlined gradient","Rounded","Old IlyaWare"}, "i_f", otherespan) --lines4
    serj.guiCheckBox("Lines bhop","lines4",otherespan)
    serj.guiCheckBox("AA designation","lines_aa",otherespan,true)
    serj.labelColor("Fake color","lines2_aa",otherespan,true)
    serj.guiCheckBox("AA lines","paganie_strelochki",otherespan,true)
    serj.labelColor("Fake line color","line2_aa",otherespan,true)
    serj.guiCheckBox("Trail","self_trail",otherespan,true) --self_trailm
    serj.CreateSlider("Trail distance", "m", "self_traild", 1, 90, 1,otherespan)
    serj.CreateSlider("Trail mov", "m", "self_trailm", 1, 10, 1,otherespan)
    serj.guiCheckBox("Kill effect","Effect_sparks",otherespan)
    serj.guiCheckBox("Kill effect enemy","Effect_sparks1",otherespan)
    serj.guiCheckBox("Indicators","i_indicators",otherespan,true) -- i_indicators_h i_indicators_move i_indicators_type
    serj.guiCheckBox("Indicator hit/miss","i_indicators_h",otherespan,true)
    serj.guiCheckBox("Fps indicator","i_indicators_fps",otherespan,true)
    serj.guiCheckBox("Target indicators","i_indicators_targetik",otherespan)
    serj.guiCheckBox("Indicator off color","i_indicators_target",otherespan,true)
    serj.guiCheckBox("Last place of death","dead_player",otherespan)
    serj.guiCheckBox("Keybinds","i_keybinds",otherespan,true)
    serj.DropDown("Keybind style", {"Gradient","Rainbow line","Onetap","Minecraft","Outlined gradient","Rounded","Old IlyaWare","At Crosshair"}, "i_s", otherespan)
    serj.guiCheckBox("Show all keybinds","i_ignore_ks",otherespan)
    serj.guiCheckBox("Penis на бошке","penis_s",otherespan) --skull
    --serj.guiCheckBox("Nimbus","skull",otherespan)
    --[[serj.guiButton("Donut hat",serj.onehad,otherespan)
    serj.guiButton("Rover rings hat",serj.onehad1,otherespan)
    serj.guiButton("Roller hat",serj.onehad4,otherespan)
    serj.guiButton("Balloon backpack hat",serj.onehad5,otherespan)
    serj.guiButton("Сube tool hat",serj.onehad6,otherespan)
    serj.guiButton("Top hat",serj.onehad7,otherespan)
    serj.guiButton("Stop hat",serj.onehad2,otherespan)]]
    serj.guiCheckBox("Target HUD","i_targethud",otherespan)
    --serj.labelColor("Model color","i_targethudcolor",otherespan,true)
    --serj.guiCheckBox("Fall pred 2","fall_predict2",otherespan)
    serj.guiCheckBox("Fall circle","fall_predict1",otherespan)
    serj.guiCheckBox("Fall text and line","fall_predict",otherespan)
    serj.guiCheckBox("Better scope","csgo_bscope",otherespan,true)
    serj.guiCheckBox("Lines","csgo_bscope_dl",otherespan)
    serj.guiCheckBox("Better scope alt","csgo_bscope_alt",otherespan)
     --{"Blaze","Hoverball","MovingWireframe","Portal"},
    serj.guiCheckBox("3d crosshair","cros3d",otherespan)
    serj.guiCheckBox("Velocity","velocity_crosshair",otherespan,true)
    serj.guiCheckBox("Enable crosshair","ch_e",otherespan,true)
    serj.DropDown("Crosshair type", {"Default","Box","Small","Smaller","TEst","test","eee","test","eeeee"}, "ch_type", otherespan)
    serj.CreateSlider("Crosshair size", "", "ch_size", 1, 6, 0,otherespan)
    --serj.guiCheckBox("Background image","estetika_img",huevini,true)

    local effectsesp = panel4:Add("DPanel")
    effectsesp:SetPos(panel4:GetWide()/2-7+10,10+panel4:GetTall()-359)
    effectsesp:SetSize(panel4:GetWide()/2-7,panel4:GetTall()-(panel4:GetTall()-345))
    effectsesp.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Effects")
    end
    local effectsespan = effectsesp:Add("DScrollPanel")
	serj.SetupDscrollPanel("Effects",effectsespan,effectsesp)

    serj.guiCheckBox("Enable Enemy Bullet tracer","misc_bullettrace_e",effectsespan,true)
    serj.DropDown("Tracer type", {"Beam","Line"}, "misc_bullettrace_type_e", effectsespan)
    serj.CreateSlider("Trace time", "s", "misc_bullettrace_time_e", 1, 10, 1,effectsespan)
    serj.guiCheckBox("Blinking tracer","misc_bullettrace_blinking_e",effectsespan)

    serj.guiCheckBox("Enable Bullet impact","misc_bulletimpact_e",effectsespan,true)
    serj.CreateSlider("Bullet impact time", "s", "misc_bulletimpact_time_e", 1, 10, 1,effectsespan)
    serj.guiCheckBox("Bullet impact glow","misc_bulletimpact_glow_e",effectsespan)

    serj.guiCheckBox("Target filter","misc_bullettrace_onlyt",effectsespan)

    serj.guiCheckBox("Enable My Bullet tracer","misc_bullettrace",effectsespan,true)
    serj.DropDown("Tracer type", {"Beam","Line"}, "misc_bullettrace_type", effectsespan)
    serj.CreateSlider("Trace time", "s", "misc_bullettrace_time", 1, 10, 1,effectsespan)
    serj.guiCheckBox("Blinking tracer","misc_bullettrace_blinking",effectsespan)

    serj.guiCheckBox("Enable Bullet impact","misc_bulletimpact",effectsespan,true)
    serj.CreateSlider("Bullet impact time", "s", "misc_bulletimpact_time", 1, 10, 1,effectsespan)
    serj.guiCheckBox("Bullet impact glow","misc_bulletimpact_glow",effectsespan)

    serj.guiCheckBox("Hitmarker","misc_hitmarker",effectsespan, true) --"misc_hitmarker_die"
    serj.DropDown("Hitmarker pos", {"3D","2D","RGB 3D","Rect test"}, "misc_hitmarker_pos", effectsespan)
    serj.labelColor("Hitmarker color 1","hit1",effectsespan, true)
    serj.labelColor("Hitmarker color 2","hit2",effectsespan, true)
    serj.labelColor("Hitmarker color 3","hit3",effectsespan, true)
    serj.labelColor("Hitmarker color 4","hit4",effectsespan, true)
    serj.CreateSlider("Hitmark time", "s", "misc_hitmarker_die", 1, 10, 1,effectsespan)

    serj.guiCheckBox("Enable fog","fog_e",effectsespan,true)
    serj.CreateSlider("Part count", "u", "snow_particles_count", 0, 2, 1,effectsespan)
    serj.CreateSlider("Fog start", "u", "fog_s", 0, 50000, 1,effectsespan)
    serj.CreateSlider("Fog end", "u", "fog_end", 0, 50000, 1,effectsespan)
    serj.CreateSlider("Fog density", "", "fog_d", 0, 1, 1,effectsespan)
    serj.guiCheckBox("Wall color","wall_color",effectsespan,true)
    serj.guiCheckBox("Prop color","prop_color",effectsespan,true)
    serj.guiCheckBox("Fullbright","fullbright",effectsespan)
    serj.guiCheckBox("FREE HOT SEX 18+ BIG COCK BIG BALLS","orange",effectsespan)

    serj.guiCheckBox("No sky (predraw)","sky_b",effectsespan)
    serj.guiCheckBox("No 3d sky","sky_3d",effectsespan)
    serj.guiCheckBox("Sky color","sky_c",effectsespan,true)
    serj.guiCheckBox("Fill sky","sky_f",effectsespan,true)

    serj.guiCheckBox("Skybox changer","sky_ch",effectsespan)
    serj.CreateTextInput("Skybox", serj.cfg.Vars, "skyboxname", 128, effectsespan)

    serj.guiCheckBox("Enable color modify","color_modify",effectsespan)
    serj.CreateSlider("Add red", "", "pp_colour_addr", 0, 10, 4,effectsespan)
    serj.CreateSlider("Add green", "", "pp_colour_addg", 0, 10, 4,effectsespan)
    serj.CreateSlider("Add blue", "", "pp_colour_addb", 0, 10, 4,effectsespan)
    serj.CreateSlider("Brightness", "", "pp_colour_brightness", 0, 3, 4,effectsespan)
    serj.CreateSlider("Contrast", "", "pp_colour_contrast", 0, 5, 4,effectsespan)
    serj.CreateSlider("Saturation", "", "pp_colour_colour", 0, 5, 4,effectsespan)
    serj.CreateSlider("Mul red", "", "pp_colour_mulr", 0, 255, 4,effectsespan)
    serj.CreateSlider("Mul green", "", "pp_colour_mulg", 0, 255, 4,effectsespan)
    serj.CreateSlider("Mul blue", "", "pp_colour_mulb", 0, 255, 4,effectsespan)


    serj.guiCheckBox("Hand glow","hand_glow",effectsespan,true)
    serj.guiCheckBox("Additive","hand_glow_a",effectsespan)
    serj.guiCheckBox("Rainbow","hand_glow_r",effectsespan)

    panel4.OnSizeChanged = function()
        playeresp:SetSize(panel4:GetWide()/2-7,panel4:GetTall()-209)
        chamsesp:SetSize(panel4:GetWide()/2-7,panel4:GetTall()-(panel4:GetTall()-195))
        chamsesp:MoveTo(5,10+panel4:GetTall()-209,0,0,0,function()end)
        otheresp:SetSize(panel4:GetWide()/2-7,panel4:GetTall()-359)
        otheresp:MoveTo(panel4:GetWide()/2-7+10,5,0,0,0,function()end)
        effectsesp:SetSize(panel4:GetWide()/2-7,panel4:GetTall()-(panel4:GetTall()-345))
        effectsesp:MoveTo(panel4:GetWide()/2-7+10,10+panel4:GetTall()-359,0,0,0,function()end)
    end

    /////////////////////////////////////////////////////////////
    /////////////////// Misc panel //////////////////////////////
    /////////////////////////////////////////////////////////////

    local panel5 = serj.Panels.frame:Add("DPanel")
	panel5:SetPos(105,13)
    panel5:SetSize(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23)
	panel5.Paint = function() end

    local miscellaneous = panel5:Add("DPanel")
    miscellaneous:SetPos(5,5)
    miscellaneous:SetSize(panel5:GetWide()/2-7,panel5:GetTall()-209)
    miscellaneous.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Miscellaneous")
    end
    local miscellaneouspan = miscellaneous:Add("DScrollPanel")
	serj.SetupDscrollPanel("Miscellaneous",miscellaneouspan,miscellaneous)

    --serj.guiButton("Unload cheat",serj.unload,miscellaneouspan, 333, 185)

    serj.guiCheckBox("Enable Thirdperson","misc_3rdp",miscellaneouspan,false,true,"key_tp")
    serj.CreateSlider("Thirdperson distance", "u", "misc_3rdp_d", 1, 15, 1,miscellaneouspan)
    serj.CreateSlider("Thirdperson smoothing", "*ft", "misc_3rdp_s", 1, 750, 1,miscellaneouspan)
    serj.guiCheckBox("Name stealer","Name_stealer",miscellaneouspan)
    serj.guiCheckBox("Edge jump","edge_jump",miscellaneouspan) --Hide_name  edge_jump
    serj.guiCheckBox("Fast stop","fast_stop",miscellaneouspan)
    serj.guiCheckBox("Auto sprint","auto_sprint",miscellaneouspan) --lag_mode
    serj.guiCheckBox("Skate ","leg_breaker",miscellaneouspan) -- sam hz chto eto
    serj.guiCheckBox("Override FOV","misc_ofov",miscellaneouspan)
    serj.CreateSlider("FOV", "°", "misc_ofov_v", 1, 180, 1,miscellaneouspan)
    serj.guiCheckBox("Camera collision","misc_3rdp_coll",miscellaneouspan)
    serj.guiCheckBox("No shake","misc_shakeoverride",miscellaneouspan)
    serj.guiCheckBox("Hitsound","",miscellaneouspan)
    serj.DropDown("Hitsound hook", {"Game Event","Player Damage hook"}, "misc_hitsound_method", miscellaneouspan)
    serj.DropDown("Hitsound sound", {"Metal","Headshot","Eggcrack","Blip","Metal 2","Metal 3","Balloon pop","Stuck","Custom","Custom2","Custom3","Custom4"}, "misc_hitsound_sound", miscellaneouspan)
    serj.guiCheckBox("Killsound","misc_killsound",miscellaneouspan)
    serj.DropDown("Hitsound sound", {"Metal","Headshot","Eggcrack","Blip","Metal 2","Metal 3","Balloon pop","Stuck","Custom","Custom2","Custom3","Custom4"}, "misc_killsound_sound", miscellaneouspan)
    serj.guiCheckBox("Killstreak","misc_killsound_ks",miscellaneouspan)
	serj.guiCheckBox("Chat spam","misc_chatspam",miscellaneouspan)
	serj.CreateSlider("Spam timer", "s", "misc_chatspam_timer", 0.1, 10, 1,miscellaneouspan)
	serj.guiCheckBox("Killsay","misc_killsay",miscellaneouspan)
    serj.DropDown("Killsay language", {"Тачки","Random","1","English","Украинский","Русский","18+ no open pls","Веселье","Pornyxa"}, "misc_killsay_lang", miscellaneouspan)
	serj.DropDown("Spam language", {"IlyaWare","ИльяВаре 2 ","Arabic","Turkish","Cursed","Extra fucked","Brawls stars XXX"}, "misc_chatspam_lang", miscellaneouspan)
    serj.guiCheckBox("Viewmodel Changer", "misc_viewmodel", miscellaneouspan)
	serj.CreateSlider("Viewmodel X", "", "misc_vm_x", -50, 50, 0, miscellaneouspan)
	serj.CreateSlider("Viewmodel Y", "", "misc_vm_y", -50, 50, 0, miscellaneouspan)
	serj.CreateSlider("Viewmodel Z", "", "misc_vm_z", -20, 20, 0, miscellaneouspan)
	serj.CreateSlider("Viewmodel Pitch", "", "misc_vm_p", -90, 90, 0, miscellaneouspan)
	serj.CreateSlider("Viewmodel Yaw", "", "misc_vm_ya", -90, 90, 0, miscellaneouspan)
	serj.CreateSlider("Viewmodel Roll", "", "misc_vm_r", -90, 90, 0, miscellaneouspan)
    serj.guiCheckBox("Auto jump","move_bhop",miscellaneouspan)
    serj.guiCheckBox("Enable flip", "viewmodel_flip_e", miscellaneouspan)
    serj.guiCheckBox("Viewmodel flip", "viewmodel_flip", miscellaneouspan)
    serj.guiCheckBox("Safe mode", "dprot_safe", miscellaneouspan)
    serj.guiCheckBox("Use spam", "use_spam", miscellaneouspan)


    local settings = panel5:Add("DPanel")
    settings:SetPos(5,10+panel5:GetTall()-209)
    settings:SetSize(panel5:GetWide()/2-7,panel5:GetTall()-(panel5:GetTall()-195))
    settings.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Settings")
    end
    local settingspan = settings:Add("DScrollPanel")
	serj.SetupDscrollPanel("Settings",settingspan,settings)

    serj.DropDown("Menu style", {"Transparent","Skeet"}, "menu_d", settingspan )
    serj.labelColor("Menu color","menu_color",settingspan) --alpha_menu  menu_d
    serj.labelColor("Menu alpha color","alpha_menu",settingspan)
    serj.guiCheckBox("Background lines","estetika",settingspan)
    serj.CreateSlider("Spots", "", "estetika_num", 10, 100, 0,settingspan)
    serj.guiCheckBox("Rainbow","estetika_r",settingspan)
    serj.guiCheckBox("Key stroke","key_stroke",settingspan)

    serj.guiCheckBox("Fill background","estetika_fill",settingspan,true)

    local movement = panel5:Add("DPanel")
    movement:SetPos(panel5:GetWide()/2-7+10,5)
    movement:SetSize(panel5:GetWide()/2-7,panel5:GetTall()-359)
    movement.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Data")
    end
    local movementpan = movement:Add("DScrollPanel")
	serj.SetupDscrollPanel("Movement",movementpan,movement)

    serj.guiCheckBox("Enable DPROT", "dprot_e", movementpan)
    serj.guiCheckBox("Override file functions", "dprot_file_lyb", movementpan)
    serj.guiCheckBox("Auto data clear", "dprot_data_clear", movementpan)
    serj.CreateSlider("Max file size", "kb", "dprot_data_clear_", 1, 500, 0, movementpan)
    --serj.DropDown("Clear trigger", {"Auto","Timer","File functions"}, "dprot_data_clear_", movementpan)
    serj.guiCheckBox("Braek HTML/DHTML", "dprot_html", movementpan)
    serj.guiCheckBox("Block qmenu save", "dprot_qmenu", movementpan)
    serj.guiCheckBox("Block dupes", "dprot_dupes", movementpan)
    serj.guiCheckBox("Block SQL", "dprot_sql", movementpan)
    serj.guiCheckBox("Blcok collectgarbage", "dprot_cg", movementpan)
    serj.guiCheckBox("Block steamworks", "dprot_sw", movementpan)
    serj.guiCheckBox("Block http", "dprot_http", movementpan)
    serj.guiCheckBox("Unlock gamegui/clicker", "dprot_clcgameui", movementpan)
    serj.guiCheckBox("Safe mode", "dprot_safe", movementpan)
    

    local configg = panel5:Add("DPanel")
    configg:SetPos(panel5:GetWide()/2-7+10,10+panel5:GetTall()-359)
    configg:SetSize(panel5:GetWide()/2-7,panel5:GetTall()-(panel5:GetTall()-345))
    configg.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Config")
    end
    local configgpan = configg:Add("DScrollPanel")
	serj.SetupDscrollPanel("Config",configgpan,configg)

    serj.CreateTextInput("Config name", serj.cfg, "newcfg", 16, configgpan, true)

	local p11 = configgpan:Add("DPanel")
	p11:Dock(TOP)
	p11:DockMargin(5,0,5,0)
	p11:SetTall(55)
	p11.Paint = function(s,w,h)
		draw.SimpleText("Configs","font-02",15,12,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end

    serj.cfgDropdown = p11:Add("DComboBox")
    serj.cfgDropdown:SetTall(30)
	serj.cfgDropdown:Dock(TOP)
    serj.cfgDropdown:DockMargin(15,25,15,0)
	if serj.loadedCfg[0] != nil then
		serj.cfgDropdown:ChooseOption(serj.loadedCfg[0], serj.loadedCfg[1])
	end
	for k, v in ipairs(files) do
		serj.cfgDropdown:AddChoice(v)
	end

	serj.cfgDropdown.Paint = function(self,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(32,32,32))
		serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(128,128,128,5))
		draw.SimpleText("▼","font-02",w-5,h/2,color_white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
		serj.surfaceOutline(0,0,w,h,1,color_black)
	end

	serj.cfgDropdown.DropButton.Paint = function() end
	serj.cfgDropdown.PerformLayout = function(self)
        self:SetTextColor(Color(255,255,255))
        self:SetFont("font-02")
    end
    serj.guiButton("Create config",serj.CreateConfig,configgpan,true)
    serj.guiButton("Save config",serj.SaveConfig,configgpan,true)
    serj.guiButton("Delete config",serj.DeleteConfig,configgpan,true)
    serj.guiButton("Load config",serj.LoadConfig,configgpan,true)

    //ded.SetDisableInterp(  )
    //ded.SetAnimFix(  )
    //ded.SetDisableSeqInterp(  )
    //ded.SetBonesFix( serj.cfg.Vars["bone_fix"] )
    //ded.SetAnimFix(  )

    panel5.OnSizeChanged = function()
        miscellaneous:SetSize(panel5:GetWide()/2-7,panel5:GetTall()-209)
        settings:SetSize(panel5:GetWide()/2-7,panel5:GetTall()-(panel5:GetTall()-195))
        settings:MoveTo(5,10+panel5:GetTall()-209,0,0,0,function()end)
        movement:SetSize(panel5:GetWide()/2-7,panel5:GetTall()-359)
        movement:MoveTo(panel5:GetWide()/2-7+10,5,0,0,0,function()end)
        configg:SetSize(panel5:GetWide()/2-7,panel5:GetTall()-(panel5:GetTall()-345))
        configg:MoveTo(panel5:GetWide()/2-7+10,10+panel5:GetTall()-359,0,0,0,function()end)
    end

    /////////////////////////////////////////////////////////////
    /////////////////// Skins panel /////////////////////////////
    /////////////////////////////////////////////////////////////

    local panel6 = serj.Panels.frame:Add("DPanel")
	panel6:SetPos(105,13)
    panel6:SetSize(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23)
	panel6.Paint = function() end

    local skinsss = panel6:Add("DPanel")
    skinsss:SetPos(5,5)
    skinsss:SetSize(panel:GetWide()/2-7,panel:GetTall()-9)
    skinsss.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Skins")
    end
    local skinssspan = skinsss:Add("DScrollPanel")
	serj.SetupDscrollPanel("Skins",skinssspan,skinsss)

    serj.CreateTextInput("Skin material name... enter?", serj.cfg.Vars, "skininput", 360, skinssspan,true)
    serj.skinAdd(skinssspan)

    for putin,vor in pairs(serj.cfg.gunSkins) do
        serj.addSkinPanel(vor[3],vor[2],vor[1],putin,skinssspan)
    end

    local custommods = panel6:Add("DPanel")
    custommods:SetPos(panel:GetWide()/2-7+10,5)
    custommods:SetSize(panel:GetWide()/2-7,panel:GetTall()-9)
    custommods.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Custom models")
    end
    local custommodspan = custommods:Add("DScrollPanel")
	serj.SetupDscrollPanel("Custom models",custommodspan,custommods)

    serj.CreateTextInput("Model pass... enter?", serj.cfg.Vars, "modelinput", 360, custommodspan,true)
    serj.modelAdd(custommodspan)

    for putin,vor in pairs(serj.cfg.gunModels) do
        serj.addModelPanel(vor[3],vor[1],putin,custommodspan)
    end

    serj.guiButton("Help skin - console",serj.skinhelp,skinssspan)

    panel6.OnSizeChanged = function()
        skinsss:SetSize(panel6:GetWide()/2-7,panel6:GetTall()-9)
        custommods:SetSize(panel6:GetWide()/2-7,panel6:GetTall()-9)
        custommods:MoveTo(panel6:GetWide()/2-7+10,5,0,0,0,function()end)
    end

    /////////////////////////////////////////////////////////////
    /////////////////// Lists panel /////////////////////////////
    /////////////////////////////////////////////////////////////

    local panel7 = serj.Panels.frame:Add("DPanel")
	panel7:SetPos(105,13)
    panel7:SetSize(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23)
	panel7.Paint = function() end

    local playerlistpp = panel7:Add("DPanel")
    playerlistpp:SetPos(5,5)
    playerlistpp:SetSize(panel7:GetWide()/2-7,panel7:GetTall()/2-7)
    playerlistpp.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Players")
    end

    local playerlistpp2 = panel7:Add("DPanel")
    playerlistpp2:SetPos(panel7:GetWide()/2-7+10,5)
    playerlistpp2:SetSize(panel7:GetWide()/2-7,panel7:GetTall()/2-7)
    playerlistpp2.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Adjustments")
    end

    --serj.guiCheckBox(" ","5",playerlistpp2)

    local playerlistp = playerlistpp:Add("DPanel")
	playerlistp:Dock(FILL)
    playerlistp:DockMargin(5,15,5,5)
	playerlistp.Paint = function() end

    local dlist = vgui.Create("DListView", playerlistp)
    dlist:Dock(FILL)
    dlist:DockMargin(3,3,3,3)
    dlist:SetMultiSelect(false)
    dlist:AddColumn("Name")
    if DarkRP then
        dlist:AddColumn("Steam Name")
    end
    dlist:AddColumn("Steam ID")
    dlist:AddColumn("Rank")
    dlist:AddColumn("Team")
    dlist:SetHeaderHeight(20)

    dlist.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(55,55,55))
	end

    dlist.VBar.Paint = function(s,w,h)
        draw.RoundedBox(0,0,0,w,h,Color(45,45,45))
    end
	dlist.VBar.btnGrip.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w,h,Color(55,55,55))
	end
	for k, v in next, {"Up", "Down"} do
		dlist.VBar["btn" .. v].Paint = function(s,w,h)

        end
	end

	for k, column in next, dlist.Columns do
		column.Header.Paint = function(s,w,h)
			draw.RoundedBox(0,0,0,w,h,Color(55,55,55))

			surfaceSetFont("font-02")
			local txt = s:GetText()
			local txtW, txtH = surfaceGetTextSize(txt)
			surfaceSetTextPos(w * 0.5 - txtW * 0.5, h * 0.5 - txtH * 0.5)
			surfaceSetTextColor(240, 240, 255, 192)
			surfaceDrawText(txt)

			return true
		end
	end

    --PrintTable(dlist.Columns)

    --[[if DarkRP then
        for k, v in ipairs(player.GetAll()) do
            if v != LocalPlayer() then
                dlist:AddLine(
                v:Name(),
                v:SteamID(),
                v:SteamName(),
                v:GetUserGroup(),
                team.GetName(v:Team())
                )
            end
        end
    else
        for k, v in ipairs(player.GetAll()) do
            if v != LocalPlayer() then
                dlist:AddLine(
                v:Name(),
                v:SteamID(),
                v:GetUserGroup(),
                team.GetName(v:Team())
                )
            end
        end
    end]]

    --PrintTable(dlist.Lines)

    for k, line in next, dlist.Lines do
        --print(k,line)


        line.Paint = function(s,w,h)
            --local ply = line.Player
            --if not IsValid(ply) then self:Remove() end

            local col = Color(100, 100, 255)
            --local col = table.Copy(ply.getJobTable and ply:getJobTable(true).color or team.GetColor(ply:Team(true)) or Color(229,255,85))
            col.a = 10
            if s:IsHovered() and s:IsSelected() or s:IsSelected() then
                col.a = 50
            elseif s:IsHovered() or s:IsSelected() then
                col.a = mfloor( msin( CurTime() * 5 ) * 5 ) + 25
            end
            surfaceSetDrawColor(col)
            surfaceDrawRect(0, 0, w - 1, h)
        end


		for _, column in next, line.Columns do
			column:SetFont("font-02")
			function column:UpdateColours()
				if self:GetParent():IsLineSelected() then
					return self:SetTextStyleColor(Color(255, 255, 255, 255))
				end

				return self:SetTextStyleColor(Color(235, 235, 235, 128))
			end
		end



	end

    local playerlistp2 = playerlistpp2:Add("DPanel")
	playerlistp2:Dock(FILL)
    playerlistp2:DockMargin(5,15,5,5)
	playerlistp2.Paint = function() end

    local profile = vgui.Create("DButton", playerlistp2)
    profile:Dock(TOP)
    profile:DockMargin(3,3,3,3)
    profile:SetText("")
    profile:SetTooltip("Opens the selected players steam profile.")
    function profile:DoClick()
        if dlist:GetSelectedLine() != nil then
            local _, line = dlist:GetSelectedLine()
            player.GetBySteamID(line:GetColumnText(2)):ShowProfile()
        end
    end

    profile.Paint = function(s,w,h)
        surfaceSetDrawColor(35,35,35)
        surfaceDrawRect(0,0,w,h)
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(0,0,0,55))
        serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
        serj.surfaceOutline(1,1,w-2,h-2,1,Color(50,50,50))
        draw.SimpleText("Open profile","font-02",w/2,h/2,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end

    local ipscream = vgui.Create("DButton", playerlistp2)
    ipscream:Dock(TOP)
    ipscream:DockMargin(3,3,3,3)
    ipscream:SetText("")
    ipscream:SetTooltip("Scream players ip.(прикол)")
    function ipscream:DoClick()
        if dlist:GetSelectedLine() != nil then
            local _, line = dlist:GetSelectedLine()
            local randomip = mrandom(1,255) .. "." .. mrandom(1,255).. "." .. mrandom(1,255).. "." .. mrandom(1,255)
            local iptar = line:GetColumnText(1)
            RunConsoleCommand("say","[IlyaWare - IP-SCREAM] Grabbind " .. iptar .. " ip........")
            timer.Simple(3,function() RunConsoleCommand("say","[IlyaWare - IP-SCREAM]  " .. iptar .. " ip - " .. randomip .. "!") end)
        end
    end

    ipscream.Paint = function(s,w,h)
        surfaceSetDrawColor(35,35,35)
        surfaceDrawRect(0,0,w,h)
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(0,0,0,55))
        serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
        serj.surfaceOutline(1,1,w-2,h-2,1,Color(50,50,50))
        draw.SimpleText("IP Scream","font-02",w/2,h/2,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end

    local steamid = vgui.Create("DButton", playerlistp2)
    steamid:Dock(TOP)
    steamid:DockMargin(3,3,3,3)
    steamid:SetText("")
    steamid:SetTooltip("Copies the selected players SteamID.")
    function steamid:DoClick()
        if dlist:GetSelectedLine() != nil then
            local _, line = dlist:GetSelectedLine()
            SetClipboardText(line:GetColumnText(2))
            chat.AddText(Color(77, 255, 121), "[Player List] ", Color(222, 222, 222), "SteamID copied to clipboard.")
        end
    end

    steamid.Paint = function(s,w,h)
        surfaceSetDrawColor(35,35,35)
        surfaceDrawRect(0,0,w,h)
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(0,0,0,55))
        serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
        serj.surfaceOutline(1,1,w-2,h-2,1,Color(50,50,50))
        draw.SimpleText("Copy steamid","font-02",w/2,h/2,Color(200,200,200),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end

    local p1 = playerlistp2:Add("DPanel")
    p1:Dock(TOP)
    p1:DockMargin(5,2,5,0)
    p1:SetTall(25)

    --p1.Paint = function(s,w,h)
    --serj.guiCheckBox("Name stealer","Name_stealer",miscellaneouspan)
    --end

    p1.Paint = function(s,w,h)
        draw.SimpleText("Friend","font-02",30,11,Color(186,255,108),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
    end

    local friend = vgui.Create("DCheckBox", p1)
    friend:SetPos(5,5)
    friend:SetSize(12,12)
    friend:SetValue( false )
    function friend:OnChange( bVal )
        if dlist:GetSelectedLine() != nil then
            local _, line = dlist:GetSelectedLine()
            if bVal then
                if table.HasValue(serj.cfg["friends"], line:GetColumnText(2)) then return
                else table.insert(serj.cfg["friends"], line:GetColumnText(2)) end
            else
                if table.HasValue(serj.cfg["friends"], line:GetColumnText(2)) then
                    table.RemoveByValue(serj.cfg["friends"], line:GetColumnText(2))
                end
            end
        end
    end

    friend.Paint = function(s,w,h)
        local checkcolor = string.ToColor(serj.cfg.Colors["menu_color"])
        if friend:GetChecked() then
            surfaceSetDrawColor(checkcolor)
        else
            surfaceSetDrawColor(66,66,66)
        end
        surfaceDrawRect(0,0,w,h)
        serj.surfaceTexture(0,0,w,h,"gui/gradient_up",Color(12,12,12,155))
		serj.surfaceOutline(0,0,w,h,1,Color(12,12,12))
    end

    function dlist:OnRowSelected(ind, line)
        if table.HasValue(serj.cfg["friends"], line:GetColumnText(2)) then
            friend:SetValue(true)
        else
            friend:SetValue(false)
        end
    end

    panel7.OnSizeChanged = function()
        playerlistpp:SetSize(panel7:GetWide()/2-7,panel7:GetTall()/2-7)
        playerlistpp2:SetSize(panel7:GetWide()/2-7,panel7:GetTall()/2-7)
        playerlistpp2:MoveTo(panel7:GetWide()/2-7+10,5,0,0,0,function()end)
    end

    ///////////////////////////////////////////////////////////////////////////////

    --[[local panel4 = serj.Panels.frame:Add("DPanel")
	panel4:SetPos(105,13)
    panel4:SetSize(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23)
	panel4.Paint = function() end

    local playeresp = panel4:Add("DPanel")
    playeresp:SetPos(5,5)
    playeresp:SetSize(panel4:GetWide()/2-7,panel4:GetTall()-209)
    playeresp.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Player ESP")
    end
    local playerespan = playeresp:Add("DScrollPanel")
	serj.SetupDscrollPanel("Player ESP",playerespan,playeresp)]]

    local panel8 = serj.Panels.frame:Add("DPanel")
	panel8:SetPos(105,13)
    panel8:SetSize(serj.Panels.frame:GetWide()+195,serj.Panels.frame:GetTall()+653)
	panel8.Paint = function() end

    local servers = panel8:Add("DPanel")
    servers:SetPos(5,5)
    servers:SetSize(panel8:GetWide()/2-7,panel8:GetTall()/2-7)
    servers.Paint = function(s,w,h)
        serj.panelPaint(s,w,h,"Other")
    end

    local serverspan = servers:Add("DScrollPanel")
	serj.SetupDscrollPanel("Other",serverspan,servers)

    --serj.guiCheckBox("Inventory stealer","Inventory_stealer",servers)
    --serj.guiCheckBox("Item stealer","Item_stealer",servers)
    --serj.guiCheckBox("Bug animation","Bug_anim",servers) --Hide_name
    --serj.guiCheckBox("Epic droper","epic_droper",servers) --Hide_name
    --serj.labelColor("","D",servers)
    --serj.idiot()
    --serj.labelColor(" ","pidor",servers)
    serj.guiCheckBoxer("Grust exploit and funny function","da",servers)
    --serj.guiCheckBox("TEST","PIDOR",servers) vot tak
    serj.Petyshara(0, 0, 0, 0, 0, 0)
    serj.guiCheckBox("Fast switch","misc_fastswitch",servers)
    serj.guiCheckBox("Knock fast","knock_fast",servers)
    serj.guiCheckBox("Update inventory","one_sec",servers)
    serj.guiCheckBox("Idiot on ground","00si",servers)
    serj.guiCheckBox("Меню игрок","skull1",servers)
    serj.guiCheckBox("Меню игрок","skull",servers)
    serj.guiCheckBox("Admin list","misc_adminlist",servers)
    serj.CreateSlider("X", "m", "misc_adminlist_x", 1, 900, 1,servers)
    serj.CreateSlider("Y", "m", "misc_adminlist_y", 1, 900, 1,servers)
    serj.guiCheckBox("mondelo","mondelo111",servers) --X_i X_y
    serj.CreateSlider("X", "m", "X_i", 1, 900, 1,servers)
    serj.CreateSlider("Y", "m", "X_y", 1, 900, 1,servers)
    serj.guiCheckBox("tracers","222255",servers)
    serj.guiCheckBox("beam tracers","2222555",servers)
    serj.guiCheckBox("Normalize spine","52a",servers)
    --serj.guiCheckBox("PEDIGRI3","pedigri3",servers)
    --serj.guiCheckBox("Hyeta","pedigri2",servers)
    --serj.guiCheckBox("pedigri","pedigri",servers)
    serj.guiCheckBox("Trail","52a5555",servers) --efffectik
    --serj.guiCheckBox("efffectik","efffectik",servers)
    serj.guiCheckBox("Nimb00s","ass11",servers)
    serj.guiCheckBox("NimASS","ass1",servers) --5
    serj.guiCheckBox("KnifeBot","Knife_Bot",servers,false,true,"KnifeBot")
    serj.guiCheckBox("KnifeBotRange","KnifeBotRange",servers)


    panel8.OnSizeChanged = function()
        servers:SetSize(panel8:GetWide()/0-7,panel8:GetTall()-90)
        --servers1:SetSize(panel6:GetWide()/2-7,panel6:GetTall()-9)
        --servers2:MoveTo(panel6:GetWide()/2-7+10,5,0,0,0,function()end)
    end


    function hidePanels()
        panel:Hide()
        panel2:Hide()
        panel3:Hide()
        panel4:Hide()
        panel5:Hide()
        panel6:Hide()
        panel7:Hide()
        panel8:Hide()
        --[[miscpan:Hide()
        movepan:Hide()
        luapan:Hide()
        skinspan:Hide()
        cfgpan:Hide()
		listp:Hide()
		consp:Hide()]]
    end

    function preloadPanels()
        if serj.Panels.saved == "aim" then
            panel:Show()
        elseif serj.Panels.saved == "hvh" then
            panel2:Show()
        elseif serj.Panels.saved == "lgt" then
            panel3:Show()
        elseif serj.Panels.saved == "esp" then
            panel4:Show()
        elseif serj.Panels.saved == "msc" then
            panel5:Show()
        elseif serj.Panels.saved == "sks" then
            panel6:Show()
		elseif serj.Panels.saved == "lis" then
            panel7:Show()
        elseif serj.Panels.saved == "serv" then
            panel8:Show()
        end
    end

    hidePanels()
    preloadPanels()

    serj.guiSelectorAIM(" ",tabs,panel,"aim")
    serj.guiSelectorHVH(" ",tabs,panel2,"hvh")
    serj.guiSelectorLEGIT(" ",tabs,panel3,"lgt")
    serj.guiSelectorESP(" ",tabs,panel4,"esp")
    serj.guiSelectorMISC(" ",tabs,panel5,"msc")
    serj.guiSelectorSKINS(" ",tabs,panel6,"sks")
    serj.guiSelectorCONFIG(" ",tabs,panel7,"lis")
    serj.guiSelectorLUARUN(" ",tabs,panel8,"serv")


    serj.Panels.frame.OnSizeChanged = function()
        tabs:SizeTo(96,serj.Panels.frame:GetTall()-15,0,0,0,function()end)
        panel:SizeTo(serj.Panels.frame:GetWide()-55,serj.Panels.frame:GetTall()-13,0,0,0,function()end)
        panel2:SizeTo(serj.Panels.frame:GetWide()-55,serj.Panels.frame:GetTall()-13,0,0,0,function()end)
        panel3:SizeTo(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23,0,0,0,function()end)
        panel4:SizeTo(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23,0,0,0,function()end)
        panel5:SizeTo(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23,0,0,0,function()end)
        panel6:SizeTo(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23,0,0,0,function()end)
        panel7:SizeTo(serj.Panels.frame:GetWide()-115,serj.Panels.frame:GetTall()-23,0,0,0,function()end)
        panel8:SizeTo(serj.Panels.frame:GetWide()-55,serj.Panels.frame:GetTall()-13,0,0,0,function()end)

        if serj.Panels.frame:GetWide() >= scrw then
            yaycadedamoroza = serj.Panels.frame:GetWide()/700 + 5
        end
        if serj.Panels.frame:GetTall() >= scrh then
            penisdedamoroza = serj.Panels.frame:GetTall()/600 + 5
        end
    end

    --[[
    --serj.DropDown("Indicators alignment", {"Left-up","Left-down","Right-up","Right-down","Custom"}, "i_a", otherespan)
    --serj.guiCheckBox("Indicators","misc_inds",otherespan,true)
    --serj.guiCheckBox("Indicator Gradient","misc_inds_grad",otherespan,true)
    --serj.CreateSlider("Rounding", "", "misc_inds_r", 1, 10, 1,otherespan)
    --serj.guiCheckBox("Rainbow indicator","misc_inds_hsv",otherespan)
    --serj.guiCheckBox("Rainbow indicator gradient","misc_inds_hsv_g",otherespan)
    --serj.DropDown("Indicator style", {"Default","Outlined","Texture"}, "misc_inds_s", otherespan)





    serj.guiCheckBox("Enable motion blur","motion_blur",motion_blurp)
    serj.CreateSlider("Add alpha", "", "mb_aa", 0, 2, 3,motion_blurp)
    serj.CreateSlider("Draw alpha", "", "mb_da", 0, 5, 3,motion_blurp)
    serj.CreateSlider("Delay", "", "mb_d", 0, 5, 3,motion_blurp)

    serj.guiCheckBox("Override engine motion blur","motion_blur_e",motion_blurp)
    serj.CreateSlider("Horizontal", "", "emb_h", 0, 1, 3,motion_blurp)
    serj.CreateSlider("Vertical", "", "emb_v", 0, 1, 3,motion_blurp)
    serj.CreateSlider("Forward", "", "emb_f", 0, 3, 3,motion_blurp)
    serj.CreateSlider("Rotation", "", "emb_r", 0, 1, 3,motion_blurp)

    serj.ESPPreview(esp_pp,420,580)







    --Lua panel
    local luapan = panel:Add("DPanel")
    luapan:Dock(FILL)
    luapan:DockMargin(4,4,4,4)
    luapan.Paint = function(s,w,h)
        draw.RoundedBox(0,0,0,w , h,Color(40,40,40,200))
        draw.RoundedBox(0,1,1,w-2, h-2,Color(10,15,10,200))
    end

	local lualistpan = luapan:Add("DScrollPanel")
	serj.SetupDscrollPanel(lualistpan,5,5,430,598)

    for k, v in pairs(scriptfiles) do
        serj.RedactorPanel(v,lualistpan)
    end

    local luanuttonspan = luapan:Add("DScrollPanel")
	serj.SetupDscrollPanel(luanuttonspan,440,5,430,598)




	--Lists panel
	local listp = panel:Add("DPanel")
	listp:Dock(FILL)
	listp:DockMargin(4,4,4,4)
	listp.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w , h,Color(40,40,40,200))
		draw.RoundedBox(0,1,1,w-2, h-2,Color(10,15,10,200))
	end



	--Console panel
	local consp = panel:Add("DPanel")
	consp:Dock(FILL)
	consp:DockMargin(4,4,4,4)
	consp.Paint = function(s,w,h)
		draw.RoundedBox(0,0,0,w , h,Color(40,40,40,200))
		draw.RoundedBox(0,1,1,w-2, h-2,Color(10,15,10,200))
	end

	--serj.CreateSlider("1488 slider sieg heil degree", "gaysex", "penis_size", 1, 15, 0, ascrol)
	--serj.guiCheckBox("биГ ДИГк?","penis",ascrol,true,true,"p_key")
	--serj.guiButton("Взорвать метро",func,ascrol)
	--serj.DropDown("Нюхать", { "бебру", "хуй", "жопу" }, "bebr", ascrol)

	--local aimbotdpanel = vgui.Create("DPanelList",ascrol)
    --aimbotdpanel:Dock(FILL)
    --aimbotdpanel:DockMargin(6,6,6,6)
    --aimbotdpanel:EnableHorizontal( false )
    --aimbotdpanel:EnableVerticalScrollbar( true )

    --serj.FunctionDropDown("Aimbot Target", ascrol, aimbotdpanel,"aim")

	serj.guiSelector("Aimbot",sp,aimpan,"aim")
	serj.guiSelector("Anti-aim",sp,aapan,"hvh")
	serj.guiSelector("Visuals",sp,vispan,"vis")
	serj.guiSelector("ESP",sp,esppan,"esp")
	serj.guiSelector("Misc",sp,miscpan,"msc")
	serj.guiSelector("Movement",sp,movepan,"mov")
	serj.guiSelector("LUA",sp,luapan,"lua")
	serj.guiSelector("Skins",sp,skinspan,"sks")
	serj.guiSelector("Config",sp,cfgpan,"cfg")
	serj.guiSelector("Lists",sp,listp,"lis")
	serj.guiSelector("Console",sp,consp,"con")
    ]]
end

/*
	ILYAWARE
*/

function serj.qmenu()
    for k, v in pairs( hook.GetTable().SpawnMenuOpen ) do
        hook.Remove("SpawnMenuOpen", k)
    end
    function GAMEMODE:SpawnMenuOpen()
          return true
    end
    RunConsoleCommand('spawnmenu_reload')
end

// lua loader
local PANEL = {}

PANEL.URL = "http://metastruct.github.io/lua_editor/"
PANEL.COMPILE = "C"

local javascript_escape_replacements =
{
	["\\"] = "\\\\",
	["\0"] = "\\0" ,
	["\b"] = "\\b" ,
	["\t"] = "\\t" ,
	["\n"] = "\\n" ,
	["\v"] = "\\v" ,
	["\f"] = "\\f" ,
	["\r"] = "\\r" ,
	["\""] = "\\\"",
	["\'"] = "\\\'",
}

function serj.aimware()
    local playerLogs = {}

        local timestamp = os.date("%Y-%m-%d %H:%M:%S")
        table.insert(playerLogs, string.format("%s - %s: %s", timestamp, playerName, action))

        if #playerLogs > 10 then
            table.remove(playerLogs, 1)
        end

    hook.Add("PlayerConnect", "LogPlayerConnect", function(name, ip)
        UpdatePlayerLog(name, "зашел на сервер")
    end)

    hook.Add("PlayerDisconnect", "LogPlayerDisconnect", function(ply)
        UpdatePlayerLog(ply:GetName(), "вышел с сервера")
    end)


    function serj.aimware()
        if IsValid(statsFrame) then
            statsFrame:Close()
        end

        local statsFrame = vgui.Create("DFrame")
        statsFrame:SetTitle("Un/Connect menu")
        statsFrame:SetSize(400, 300)
        statsFrame:Center()
        statsFrame:MakePopup()

        statsFrame.Paint = function(self, w, h)
            surface.SetDrawColor(50, 50, 50, 255)
            surface.DrawRect(0, 0, w, h)
        end

        local logText = vgui.Create("DTextEntry", statsFrame)
        logText:SetPos(10, 30)
        logText:SetSize(380, 240)
        logText:SetMultiline(true)
        --logText:SetReadOnly(true)

        local function UpdateLogDisplay()
            local displayText = table.concat(playerLogs, "\n")
            logText:SetText(displayText)
        end

        local updateButton = vgui.Create("DButton", statsFrame)
        updateButton:SetText("Refresh")
        updateButton:SetPos(150, 270)
        updateButton:SetSize(100, 20)

        updateButton.DoClick = function()
            UpdateLogDisplay()
        end

        UpdateLogDisplay()
    end
end

function serj.test()
    local statsFrame = vgui.Create("DFrame")
    statsFrame:SetTitle("Player's information")
    statsFrame:SetSize(600, 500)
    statsFrame:Center()
    statsFrame:MakePopup()

    statsFrame.Paint = function(self, w, h)
        surface.SetDrawColor(50, 50, 50, 255)
        surface.DrawRect(0, 0, w, h)
    end

    local players = player.GetAll()

    local yPos = 30

    for _, ply in ipairs(players) do
        local playerInfo = "Ник: " .. ply:GetName() .. " | Здоровье: " .. ply:Health() .. " | Группа: " .. ply:GetUserGroup()

        local playerLabel = vgui.Create("DLabel", statsFrame)
        playerLabel:SetPos(10, yPos)

        if IsValid(ply:GetActiveWeapon()) then
            playerInfo = playerInfo .. " | Оружие: " .. ply:GetActiveWeapon():GetPrintName()
        else
            playerInfo = playerInfo .. " | Оружие: Ничего (не держит)"
        end

        playerLabel:SetText(playerInfo)
        playerLabel:SetColor(Color(255, 255, 255))
        playerLabel:SizeToContents()

        yPos = yPos + 20
    end
end

function serj.razdatinet()
    serj.OldHttpFetch( "https://ifconfig.me/ip",

	-- onSuccess function
	function( body, length, headers, code )
		-- The first argument is the HTML we asked for.
		RunConsoleCommand('say', "Пацаны раздаю инет! подключйтесь - " .. body)
	end,

	-- onFailure function
	function( message )
		-- We failed. =(
		chat.AddText("Раздача не удалась. Включи точку доступа сначала...")
	end)
end

function serj.googlemaps()
    serj.OldHttpFetch( "https://www.google.ru/maps",

	-- onSuccess function
	function( body, length, headers, code )
		-- The first argument is the HTML we asked for.
		RunConsoleCommand('say', "Пацаны раздаю инет! подключйтесь - " .. body)
	end,

	-- onFailure function
	function( message )
		-- We failed. =(
		chat.AddText("Раздача не удалась. Включи точку доступа сначала...")
	end)

end

serj.target = nil
serj.targetVector = Vector(0,0,0)
serj.targetAngle = Angle(0,0,0)
serj.targetFov = 360
serj.fa = me:EyeAngles()
serj.fpos = me:EyePos()
serj.servertime = 0
serj.badsweps = {
	["gmod_camera"] = true,
	["manhack_welder"] = true,
    ["weapon_medkit"] = true,
	["gmod_tool"] = true,
	["weapon_physgun"] = true,
	["weapon_physcannon"] = true,
	["weapon_bugbait"] = true,
}
serj.bseq = {
	[ACT_VM_RELOAD] = true,
	[ACT_VM_RELOAD_SILENCED] = true,
	[ACT_VM_RELOAD_DEPLOYED] = true,
	[ACT_VM_RELOAD_IDLE] = true,
	[ACT_VM_RELOAD_EMPTY] = true,
	[ACT_VM_RELOADEMPTY] = true,
	[ACT_VM_RELOAD_M203] = true,
	[ACT_VM_RELOAD_INSERT] = true,
	[ACT_VM_RELOAD_INSERT_PULL] = true,
	[ACT_VM_RELOAD_END] = true,
	[ACT_VM_RELOAD_END_EMPTY] = true,
	[ACT_VM_RELOAD_INSERT_EMPTY] = true,
	[ACT_VM_RELOAD2] = true
}
serj.shot = 0
serj.hits = 0
serj.cones = {};
serj.nullvec = Vector() * -1;
serj.resolvedguys = {}
serj.headrot = 0

function serj.AutoWall(dir, plyTarget)
	local weap = me:GetActiveWeapon()
	if !IsValid(weap) then return false end

	local class = weap:GetClass()
	local eyePos = me:EyePos()

	local function CW2Autowall()
		local normalmask = bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
		local wallmask = bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)

		local tr = TraceLine({
			start = eyePos,
			endpos = eyePos + dir * weap.PenetrativeRange,
			filter = me,
			mask = normalmask
		})

		if tr.Hit and !tr.HitSky then
			local canPenetrate, dot = weap:canPenetrate(tr, dir)

			if canPenetrate and dot > 0.26 then
				tr = TraceLine({
					start = tr.HitPos,
					endpos = tr.HitPos + dir * weap.PenStr * (weap.PenetrationMaterialInteraction[tr.MatType] or 1) * weap.PenMod,
					filter = me,
					mask = wallmask
				})

				tr = TraceLine({
					start = tr.HitPos,
					endpos = tr.HitPos + dir * 0.1,
					filter = me,
					mask = normalmask
				}) -- run ANOTHER trace to check whether we've penetrated a surface or not

				if tr.Hit then return false end

				-- FireBullets
				tr = TraceLine({
					start = tr.HitPos,
					endpos = tr.HitPos + dir * 32768,
					filter = me,
					mask = MASK_SHOT
				})

				return tr.Entity == plyTarget
			end
		end

		return false
	end

	local function SWBAutowall()
		local normalmask = bor(CONTENTS_SOLID, CONTENTS_OPAQUE, CONTENTS_MOVEABLE, CONTENTS_DEBRIS, CONTENTS_MONSTER, CONTENTS_HITBOX, 402653442, CONTENTS_WATER)
		local wallmask = bor(CONTENTS_TESTFOGVOLUME, CONTENTS_EMPTY, CONTENTS_MONSTER, CONTENTS_HITBOX)
		local penMod = {[MAT_SAND] = 0.5, [MAT_DIRT] = 0.8, [MAT_METAL] = 1.1, [MAT_TILE] = 0.9, [MAT_WOOD] = 1.2}


		local tr = TraceLine({
			start = eyePos,
			endpos = eyePos + dir * weap.PenetrativeRange,
			filter = me,
			mask = normalmask
		})

		if tr.Hit and !tr.HitSky then
			local dot = -dir:Dot(tr.HitNormal)

			if weap.CanPenetrate and dot > 0.26 then
				tr = TraceLine({
					start = tr.HitPos,
					endpos = tr.HitPos + dir * weap.PenStr * (penMod[tr.MatType] or 1) * weap.PenMod,
					filter = me,
					mask = wallmask
				})

				tr = TraceLine({
					start = tr.HitPos,
					endpos = tr.HitPos + dir * 0.1,
					filter = me,
					mask = normalmask
				}) -- run ANOTHER trace to check whether we've penetrated a surface or not

				if tr.Hit then return false end

				-- FireBullets
				tr = TraceLine({
					start = tr.HitPos,
					endpos = tr.HitPos + dir * 32768,
					filter = me,
					mask = MASK_SHOT
				})

				return tr.Entity == plyTarget
			end
		end

		return false
	end

	local function M9KAutowall()
		if !weap.Penetration then
			return false
		end

		local function BulletPenetrate(tr, bounceNum, damage)
			if damage < 1 then
				return false
			end

			local maxPenetration = 14
			if weap.Primary.Ammo == "SniperPenetratedRound" then -- .50 Ammo
				maxPenetration = 20
			elseif weap.Primary.Ammo == "pistol" then -- pistols
				maxPenetration = 9
			elseif weap.Primary.Ammo == "357" then -- revolvers with big ass bullets
				maxPenetration = 12
			elseif weap.Primary.Ammo == "smg1" then -- smgs
				maxPenetration = 14
			elseif weap.Primary.Ammo == "ar2" then -- assault rifles
				maxPenetration = 16
			elseif weap.Primary.Ammo == "buckshot" then -- shotguns
				maxPenetration = 5
			elseif weap.Primary.Ammo == "slam" then -- secondary shotguns
				maxPenetration = 5
			elseif weap.Primary.Ammo == "AirboatGun" then -- metal piercing shotgun pellet
				maxPenetration = 17
			end

			local isRicochet = false
			if weap.Primary.Ammo == "pistol" or weap.Primary.Ammo == "buckshot" or weap.Primary.Ammo == "slam" then
				isRicochet = true
			else
				/*
				TODO: Predict ricochetCoin?
				if weap.RicochetCoin == 1 then
					isRicochet = true
				elseif weap.RicochetCoin >= 2 then
					isRicochet = false
				end*/
			end

			if weap.Primary.Ammo == "SniperPenetratedRound" then
				isRicochet = true
			end

			local maxRicochet = 0
			if weap.Primary.Ammo == "SniperPenetratedRound" then -- .50 Ammo
				maxRicochet = 10
			elseif weap.Primary.Ammo == "pistol" then -- pistols
				maxRicochet = 2
			elseif weap.Primary.Ammo == "357" then -- revolvers with big ass bullets
				maxRicochet = 5
			elseif weap.Primary.Ammo == "smg1" then -- smgs
				maxRicochet = 4
			elseif weap.Primary.Ammo == "ar2" then -- assault rifles
				maxRicochet = 5
			elseif weap.Primary.Ammo == "buckshot" then -- shotguns
				maxRicochet = 0
			elseif weap.Primary.Ammo == "slam" then -- secondary shotguns
				maxRicochet = 0
			elseif weap.Primary.Ammo == "AirboatGun" then -- metal piercing shotgun pellet
				maxRicochet = 8
			end

			if tr.MatType == MAT_METAL and isRicochet and weap.Primary.Ammo != "SniperPenetratedRound" then
				return false
			end

			if bounceNum > maxRicochet then
				return false
			end

			local penetrationDir = tr.Normal * maxPenetration
			if tr.MatType == MAT_GLASS or tr.MatType == MAT_PLASTIC or tr.MatType == MAT_WOOD or tr.MatType == MAT_FLESH or tr.MatType == MAT_ALIENFLESH then
				penetrationDir = tr.Normal * (maxPenetration * 2) -- WAS 200
			end

			if tr.Fraction <= 0 then
				return false
			end

			local trace = {}
			trace.endpos = tr.HitPos
			trace.start = tr.HitPos + penetrationDir
			trace.mask = MASK_SHOT
			trace.filter = me

			local trace = TraceLine(trace)

			if trace.StartSolid or trace.Fraction >= 1 then
				return false
			end

			local penTrace = {}
			penTrace.endpos = trace.HitPos + tr.Normal * 32768
			penTrace.start = trace.HitPos
			penTrace.mask = MASK_SHOT
			penTrace.filter = me

			penTrace = TraceLine(penTrace)

			if penTrace.Entity == plyTarget then return true end

			local damageMulti = 0.5
			if weap.Primary.Ammo == "SniperPenetratedRound" then
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

			return BulletPenetrate(penTrace, bounceNum + 1, damage * damageMulti)
		end

		local trace = TraceLine({
			start = eyePos,
			endpos = eyePos + dir * 32768,
			filter = me,
			mask = MASK_SHOT
		})

		return BulletPenetrate(trace, 0, weap.Primary.Damage)
	end

	if class:StartWith("cw_") then
		return CW2Autowall()
	elseif class:StartWith("m9k_") then
		return M9KAutowall()
	elseif class:StartWith("swb_") then
		return SWBAutowall()
    elseif class:StartWith("tfa_") then
		return TFAAutowall()
	end

	return false
end

serj.Piercable = ents.FindByClass( "func_breakable" )
table.insert( serj.Piercable, me )

function serj.VisibleCheck(who,where)
    local tr = TraceLine({
        mask = MASK_SHOT,
        ignoreworld = false,
        filter = serj.Piercable,
        start = me:EyePos(),
        endpos = where
    })

    local glazVidit = tr.Entity == who or tr.Fraction == 1
    if !glazVidit and serj.targetVector and serj.cfg.Vars["aw_enable"] then
        return serj.AutoWall(serj.targetAngle:Forward(), who)
    end

    return glazVidit
end

function serj.getAimHitbox(v)
    --local pos = v:LocalToWorld(v:OBBCenter() or Vector(0, 0, 0))      --models/player/phoenix.mdl
    local pos = v:LocalToWorld(Vector(0, 0, 57)) or Vector(0, 1000, 0)
    local head, eyes, body, spine = pos, pos, pos, pos

    if v:LookupBone("ValveBiped.Bip01_Head1") != nil then
        head = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Head1"))
    end

    if v:LookupBone("ValveBiped.Bip01_Pelvis") != nil then
        body = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Pelvis"))
    end

    if v:LookupBone("ValveBiped.Bip01_Spine") != nil then
        spine = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Spine"))
    end --hitbox_arms

    if serj.cfg.Vars["hitbox_arms"] then
        --function serj.getAimHitboxArms(v)
            local pos = v:LocalToWorld(v:OBBCenter())
            local arms = pos

            if v:LookupBone("ValveBiped.Bip01_L_UpperArm") != nil then
                local leftArmPos = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_L_UpperArm"))
                local rightArmPos = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_R_UpperArm"))
                arms = (leftArmPos + rightArmPos) / 2
            end
        end

    if serj.cfg.Vars["hitbox_selection"] == 1 and head != nil then
        return head
    elseif serj.cfg.Vars["hitbox_selection"] == 2 and eyes != nil then
        return eyes
    elseif serj.cfg.Vars["hitbox_selection"] == 3 and body != nil then
        return body
    elseif serj.cfg.Vars["hitbox_selection"] == 4 and spine != nil then
        return spine
    elseif serj.cfg.Vars["hitbox_selection"] == 5 then
        return pos
    elseif serj.cfg.Vars["hitbox_selection"] == 6 and head != nil then
        return head + Vector(0,0,-3)
    elseif serj.cfg.Vars["hitbox_selection"] == 7 and head != nil then
        return head + Vector(0,0,-3.2)
    elseif serj.cfg.Vars["hitbox_selection"] == 8 and spine != nil then
        return head + Vector(0,0,-9)
    else
        return pos
    end
end

hook.Add("entity_killed", "Effectik", function(data)
    if serj.cfg.Vars["hit_box"] then
        local v = GetAimbotTarget()
        if v then
            local pos = v:GetPos()
            local min,max = v:GetCollisionBounds()
            local pos2 = pos + Vector(0, 0, max.z);
            local pos = pos:ToScreen();
            local pos2 = pos2:ToScreen();
            for i=0,v:GetHitBoxGroupCount()-1 do
                local count = v:GetHitBoxCount(i)
                if not count then continue end
                for hitbox=0,count do
                    local bone = v:GetHitBoxBone(hitbox,i)
                    if not bone then continue end
                    local min, max = v:GetHitBoxBounds(hitbox,i)
                    local bonepos, boneang = v:GetBonePosition(bone)
                    cam.Start3D()
                    render.DrawWireframeBox(bonepos,boneang,min,max,Color(255,255,255),true)
                    cam.End3D()
                end
            end
        end
    end

    if serj.cfg.Vars["Effect_sparks1"] then
        local me = LocalPlayer()
        gameevent.Listen("entity_killed")

            local victim = Entity(data.entindex_killed)
            local attacker = Entity(data.entindex_attacker)

            if attacker == me and attacker ~= victim and (victim:IsPlayer() or victim:IsNPC()) then

                if true then
                    local vPoint = victim:GetPos()
                    local effectdata = EffectData()
                    local curcol = Color(255, 255, 255) -- White
                    local fixcolor = 1 / 255
                    effectdata:SetOrigin(vPoint)
                    effectdata:SetColor(curcol.r * fixcolor, curcol.g * fixcolor, curcol.b * fixcolor)
                    effectdata:SetScale(math.random(4, 15))
                    util.Effect("ElectricSpark", effectdata)
                end
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
        --end
    end

    if serj.cfg.Vars["Effect_sparks"] then
        local me = LocalPlayer()
        gameevent.Listen( "entity_killed" )
        local victim = Entity(data.entindex_killed)
        local attacker = Entity(data.entindex_attacker)

            if attacker == me and attacker != victim and (victim:IsPlayer() or victim:IsBot()) then
                if true then
                    local vPoint = LocalPlayer():GetPos()
                    local effectdata = EffectData()
                    local curcol = Color(255,0,0)
                    local fixcolor = (1/255)
                    effectdata:SetOrigin( vPoint )
                    effectdata:SetColor( curcol.r * fixcolor, curcol.g * fixcolor, curcol.b * fixcolor)
                    effectdata:SetScale(math.random(4,15))
                    util.Effect( "ElectricSpark", effectdata )
                end
                if true then
                    local vpos = victim:GetPos()
                    local effectdata = EffectData()

                    if victim:LookupBone("ValveBiped.Bip01_Head1") == nil then
                        effectdata:SetOrigin( vpos )
                    else
                        effectdata:SetOrigin( victim:GetBonePosition(victim:LookupBone("ValveBiped.Bip01_Head1")) )
                    end

                    effectdata:SetMagnitude( 5 )
                    effectdata:SetScale( math.random(4,15) )
                    util.Effect( "ElectricSpark", effectdata )
            end
        end
    end
    end)

    --function serj.Tpose( ply, velocity )

        --[[local lastGround = CurTime()
        hook.Add("Think", "PreventFallDamage", function()
            if serj.cfg.Vars["no_fall"] then
                if not LocalPlayer():OnGround() then
                    lastGround = CurTime()
                else
                    if CurTime() - lastGround < 0.2 then
                        return true
                    end
                end
            end
        end)]]



local nextm9k = 0
hook.Add("CreateMove","111",function( cmd, ucmd, usercmd )

    if serj.cfg.Vars["no_fall"] then

    end

        if serj.cfg.Vars["fast_walk"] then

        if LocalPlayer():GetMoveType() == MOVETYPE_WALK and cmd:GetForwardMove() ~= 0 then

            if cmd:TickCount()%2 == 0 then

                cmd:SetSideMove(cmd:GetSideMove() + 5000)

            else

                cmd:SetSideMove(cmd:GetSideMove() - 5000)

            end

        end

    end

    if serj.cfg.Vars["lag_mode"] then
        if serj.activebinds["lag_key"] then
            ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 1200)
            --serj.fakeLagfactor = 3
        end
    end

    if serj.cfg.Vars["slow_mode"] then
    if serj.activebinds["slow_key"] then
        ded.SetOutSequenceNr(ded.GetOutSequenceNr() + serj.cfg.Vars["slow_slider"])
        --serj.fakeLagfactor = 3
    end
end
end)

function serj.ValidateTarget(tar)
	if !IsValid(tar) then return false end

	if tar == me then return false end
	if tar:IsDormant() then return false end
	if !tar:Alive() then return false end
	if tar:Team() == TEAM_SPECTATOR then return false end

    if serj.cfg.Vars["aimbot_ignore_bgod"] and tar:GetColor().a != 255 then return false end
    if serj.cfg.Vars["aimbot_ignore_nodraw"] and tar:GetNoDraw() then return false end
    if serj.cfg.Vars["aimbot_ignore_admin"] and tar:IsAdmin() then return false end
    if serj.cfg.Vars["aimbot_ignore_bots"] and tar:IsBot() then return false end
    if serj.cfg.Vars["aimbot_ignore_steam"] and tar:GetFriendStatus() == "friend" then return false end
    if serj.cfg.Vars["aimbot_ignore_noclip"] and tar:GetMoveType() == MOVETYPE_NOCLIP then return false end
    if serj.cfg.Vars["aimbot_ignore_team"] and tar:Team() == me:Team() then return false end
    if serj.cfg.Vars["aimbot_ignore_fr"] and table.HasValue(serj.cfg["friends"], tar:SteamID()) then return false end

	return true
end

function serj.AddResolverStep(ent,kuda)
    local resik = serj.cfg.Vars["res_step"]
    local cw
    if IsValid(me:GetActiveWeapon()) then
        cw = me:GetActiveWeapon():GetClass()
    end

    if cw != nil and serj.cfg.AdaptiveConfig[cw] != nil then
        resik = serj.cfg.AdaptiveConfig[cw][6]
    end

    local pleasework = 360/resik

    if serj.cfg.Vars["res_type"] == 4 then
        pleasework = 9
    end

    if serj.canBacktrack(v) and v != me and v.simtime_updated then
        serj.recordBacktrack(v)
    end

    if serj.resolvedguys[ent] == nil then
        serj.resolvedguys[ent] ={
			1,
			0,
		}
    else
        if serj.resolvedguys[ent][1] > pleasework then
            serj.resolvedguys[ent][1] = 1
        else
            if kuda then
                serj.resolvedguys[ent][1] = serj.resolvedguys[ent][1] + 1
            else
                serj.resolvedguys[ent][1] = serj.resolvedguys[ent][1] - 1
            end
        end
		--if serj.cfg.Vars["res_pitch"] and EyeAngles().p > 90 then
            --serj.SetPoseParameter("aim_pitch", -89)
            --serj.SetPoseParameter("head_pitch", -89)
		--end
	end
end

function serj.SetEntAngles(ent,angles)
    ent:SetRenderAngles(angles)
    ent:SetNetworkAngles(angles)
    ent:InvalidateBoneCache()
end

serj.bruteYaw = { -93,
3,
93,
183,
-183,
183,
93,
3,
-93
--[[    89.121,
    89.824,
    11.953,
    1.055,
    178.945,
    72.070,
    178.770,
    87.012,
    -262,]]}

serj.deltas2 = {
    -89,
    0,
    89,
    180,
    -185,
    -85,
}
function serj.StepResolver(ent)
    local angs = ent:GetNetworkAngles()
    local targetAngles = ent:GetAngles()
    targetAngles.r = 0
    local mode = serj.cfg.Vars["res_type"]

    if serj.resolvedguys[ent] ~= nil then
        if mode == 1 then
            -- Simple step resolver with configurable step size
            targetAngles.y = angs.y + serj.resolvedguys[ent][1] * serj.cfg.Vars["res_step"]
        elseif mode == 2 then
            -- Time-based resolver, useful for continuous jitter
            targetAngles.y = CurTime() * serj.cfg.Vars["bog_smerti_resolver_step"]
        elseif mode == 3 then
            -- Brute force resolver with predefined yaw angles
            targetAngles.y = angs.y + serj.bruteYaw[serj.resolvedguys[ent][1] % #serj.bruteYaw + 1] + ent:EyeAngles().y
        elseif mode == 4 then
            -- Delta-based resolver for specific conditions
            targetAngles.y = angs.y + (serj.nokosdeltas[serj.resolvedguys[ent][1]] or 0)
        elseif mode == 5 then
            -- Advanced normalization-based resolver
            targetAngles.y = mNormalizeAng(targetAngles.y + serj.deltas2[serj.resolvedguys[ent][1] % #serj.deltas2 + 1])
        elseif mode == 6 then
            -- New adaptive resolver based on hit/miss history
            local history = serj.hitMissHistory[ent]
            if history then
                local totalHits = history.hits + history.misses
                local accuracy = history.hits / (totalHits == 0 and 1 or totalHits)
                if accuracy > 0.5 then
                    -- If accuracy is good, use smaller steps
                    targetAngles.y = angs.y + serj.cfg.Vars["res_step"] * 0.5
                else
                    -- If accuracy is poor, use larger steps
                    targetAngles.y = angs.y + serj.cfg.Vars["res_step"] * 1.5
                end
            else
                targetAngles.y = angs.y + serj.cfg.Vars["res_step"]
            end
        end
    end

    serj.SetEntAngles(ent, targetAngles)
end

function serj.MovementFix(cmd, ang)
    local angs = cmd:GetViewAngles()
	local faa = serj.fa
	if ang then
		faa = ang
	end

	local viewang = Angle(0, angs.y, 0)
	local fix = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
	fix = (fix:Angle() + (viewang - faa)):Forward() * fix:Length()

	if angs.p > 90 or angs.p < -90 then
		fix.x = -fix.x
	end

	cmd:SetForwardMove(fix.x)
	cmd:SetSideMove(fix.y)
end

--[[function serj.PitchRES( v )
    v:SetPoseParameter( "head_pitch", 0 )
    v:SetPoseParameter( "head_yaw", 0 )

    if serj.cfg.Vars["res_pitch"] and v.fakepitch then
        v:SetPoseParameter( "aim_pitch", -89 )
        v:SetPoseParameter( "head_pitch", -89 )
    end

    v:InvalidateBoneCache()
end]]

--[[function serj.PitchRES( entIndex )
    local ent = Entity( entIndex )

    if ent == me then
        serj.realAnim.angle = ent:EyeAngles()
        serj.realAnim.movex = ent:GetPoseParameter("move_x")
        serj.realAnim.movey = ent:GetPoseParameter("move_y")
    end

    if not ent.simtime_updated then return end

    ded.ShouldUpdateAnimation( false )
    ded.SetUpdateTicks( ent.flticks )
end]]

function serj.CanShoot()
	local me = LocalPlayer()
	local weap = me:GetActiveWeapon()
	if !IsValid(weap) then return false end
	local wact = weap:GetSequence()

	if serj.badsweps[weap:GetClass()] then
		return false
	end

    if me:GetMoveType() == MOVETYPE_NOCLIP then
        return false
    end

	if serj.cfg.Vars["servertime"] and weap:GetNextPrimaryFire() > serj.servertime then
		return false
	end

	return weap:Clip1() != 0 and !serj.bseq[wact]
end

function serj.lualoader()

    http.Fetch("https://i.imgur.com/Rz8FOEq.png",function(s)
        file.Write("gradient.png",s)
    end)

        local PANEL = {}

        PANEL.URL = "http://metastruct.github.io/lua_editor/"
        PANEL.COMPILE = "C"

        local javascript_escape_replacements =
        {
            ["\\"] = "\\\\",
            ["\0"] = "\\0" ,
            ["\b"] = "\\b" ,
            ["\t"] = "\\t" ,
            ["\n"] = "\\n" ,
            ["\v"] = "\\v" ,
            ["\f"] = "\\f" ,
            ["\r"] = "\\r" ,
            ["\""] = "\\\"",
            ["\'"] = "\\\'",
        }

        function PANEL:Init()
            self.Code = ""

            self.ErrorPanel = self:Add("DButton")
            self.ErrorPanel:SetFont('BudgetLabel')
            self.ErrorPanel:SetTextColor(Color(255,255,255))
            self.ErrorPanel:SetText("")
            self.ErrorPanel:SetTall(0)
            self.ErrorPanel.DoClick = function()
                self:GotoErrorLine()
            end
            self.ErrorPanel.DoRightClick = function(self)
                SetClipboardText(self:GetText())
            end
            self.ErrorPanel.Paint = function(self,w,h)
                surface.SetDrawColor(255,255,255)
                surface.DrawRect(0,0,w,h)
            end

            self:StartHTML()
        end

        function PANEL:Think()
            if self.NextValidate and self.NextValidate < CurTime() then
                self:ValidateCode()
            end
        end

        function PANEL:StartHTML()
            self.HTML = self:Add("DHTML")

            self:AddJavascriptCallback("OnCode")
            self:AddJavascriptCallback("OnLog")

            self.HTML:OpenURL(self.URL)

            self.HTML:RequestFocus()
        end

        function PANEL:ReloadHTML()
            self.HTML:OpenURL(self.URL)
        end

        function PANEL:JavascriptSafe(str)
            str = str:gsub(".",javascript_escape_replacements)
            str = str:gsub("\226\128\168","\\\226\128\168")
            str = str:gsub("\226\128\169","\\\226\128\169")
            return str
        end

        function PANEL:CallJS(JS)
            self.HTML:Call(JS)
        end

        function PANEL:AddJavascriptCallback(name)
            local func = self[name]

            self.HTML:AddFunction("gmodinterface",name,function(...)
                func(self,HTML,...)
            end)
        end

        function PANEL:OnCode(_,code)
            self.NextValidate = CurTime() + 0.2
            self.Code = code
        end

        function PANEL:OnLog(_,...)
            Msg("Editor: ")
            print(...)
        end

        function PANEL:SetCode(code)
            self.Code = code
            self:CallJS('SetContent("' .. self:JavascriptSafe(code) .. '");')
        end

        function PANEL:GetCode()
            return 'local me=Entity('..LocalPlayer():EntIndex()..') local trace=me:GetEyeTrace() local this,there=trace.Entity,trace.HitPos '..self.Code
        end

        function PANEL:SetGutterError(errline,errstr)
            self:CallJS("SetErr('" .. errline .. "','" .. self:JavascriptSafe(errstr) .. "')")
        end

        function PANEL:GotoLine(num)
            self:CallJS("GotoLine('" .. num .. "')")
        end

        function PANEL:ClearGutter()
            self:CallJS("ClearErr()")
        end

        function PANEL:GotoErrorLine()
            self:GotoLine(self.ErrorLine || 1)
        end

        function PANEL:SetError(err)
            if !IsValid(self.HTML) then
                self.ErrorPanel:SetText("")
                self:ClearGutter()
                return
            end

            local tall = 0

            if err then
                local line,err = string.match(err,self.COMPILE .. ":(%d*):(.+)")

                if line and err then
                    tall = 20

                    self.ErrorPanel:SetText((line and err) and ("Line " .. line .. ": " .. err) || err || "")
                    self.ErrorLine = tonumber(string.match(err," at line (%d)%)") || line) || 1
                    self:SetGutterError(self.ErrorLine,err)
                end
            else
                self.ErrorPanel:SetText("")
                self:ClearGutter()
            end

            local wide = self:GetWide()
            local tallm = self:GetTall()

            self.ErrorPanel:SetPos(0,tallm - tall)
            self.ErrorPanel:SetSize(wide,tall)
            self.HTML:SetSize(wide,tallm - tall)
        end

        function PANEL:ValidateCode()
            local time = SysTime()
            local code = self:GetCode()

            self.NextValidate = nil

            if !code || code == "" then
                self:SetError()
                return
            end

            local errormsg = CompileString(code,self.COMPILE,false)
            time = SysTime() - time

            if type(errormsg) == "string" then
                self:SetError(errormsg)
            elseif time > 0.25 then
                self:SetError("Compiling took too long. (" .. math.Round(time * 1000) .. ")")
            else
                self:SetError()
            end
        end

        function PANEL:PerformLayout(w,h)
            local tall = self.ErrorPanel:GetTall()

            self.ErrorPanel:SetPos(0,h - tall)
            self.ErrorPanel:SetSize(w,tall)

            self.HTML:SetSize(w,h - tall)
        end


        vgui.Register("lua_editor",PANEL,"EditablePanel")

        local menu = vgui.Create('DFrame')
        menu:SetSize(ScrW()/2,ScrH()/2)
        menu:SetTitle('')
        menu:Center()
        menu:SetSizable(true)
        menu:MakePopup()
        menu:ShowCloseButton(false)
        menu.Paint = function(self,w,h)
            surface.SetDrawColor(64,64,64)
            surface.DrawRect(0, 0, w, 25)

            surface.SetDrawColor(0,0,0)
            surface.DrawRect(0, 25, w, h)
        end

        local clos = vgui.Create("DButton", menu)
        clos:SetSize(40,23)
        clos:SetText("")
        clos.Paint = function(self,w,h)
            surface.SetDrawColor(64,64,64)
            surface.DrawRect(0,0,w,h)
            surface.SetFont("marlett")
            local s,s1 = surface.GetTextSize("r")
            surface.SetTextPos(w/2-s/2,h/2-s1/2)
            surface.SetTextColor(255,255,255)
            surface.DrawText("r")
        end
        clos.DoClick = function()
            menu:SetVisible(!menu:IsVisible())
        end

        local ed = vgui.Create('lua_editor', menu)
        ed:SetPos(5, 55)

        menu.PerformLayout = function(self, w, h)
            clos:SetPos(w-41, 1)
            ed:SetSize(w-10, h-60)
        end

        local offset = 5

        local function CreateBtn(wide, text, icon, fn)
            local mt = Material(icon)
            local btn = vgui.Create('DButton', menu)
            btn:SetText('')
            btn.Paint = function(self,w,h)
                if self.Hovered then
                    if self.Depressed then
                        surface.SetDrawColor(64,64,64)
                    else
                        surface.SetDrawColor(64,64,64)
                    end
                else
                    surface.SetDrawColor(64,64,64)
                end

                surface.DrawRect(0,0,w,h)
                surface.SetDrawColor(255,255,255)
                surface.SetMaterial(mt)
                surface.DrawTexturedRect(5,h / 2 - 8,16,16)
                draw.SimpleText(text,'BudgetLabel',26,h / 2,Color(255,255,255),0,1)
            end
            btn.DoClick = fn
            btn:SetSize(wide, 20)
            btn:SetPos(offset, 30)
            offset=offset + wide + 5
        end


        CreateBtn(115, "Run lua", 'data/ilyha.png', function()
            local code = ed:GetCode()
            RunStringEx(code)
        end)
    end

--[[function serj.DeadKill()
    if serj.cfg.Vars["dead_kill"] then

    end

end]]

function serj.DeadKill()
    if serj.cfg.Vars["fl_lagger"] then
        ded.SetOutSequenceNr(12)
    end
end

function serj.SetTyping(cmd)
	if EasyChat then
		if cmd:CommandNumber() % 32 == 0 then
			net.Start("EASY_CHAT_START_CHAT")
			net.WriteBool(true)
			net.SendToServer()
		end

		return
	end

	serj.SetTyping(cmd, true)
end

function serj.PerformHandjob(cmd)
    local mode = serj.cfg.Vars["Handjob_mode"]
    local shouldjerk = true

    if mode == 2 then
        shouldjerk = (cmd:CommandNumber() % 12) >= 6
    elseif mode == 3 then
        shouldjerk = math_random(0, 1) == 0
    end

    ded.SetTyping(cmd, shouldjerk)
end

hook.Add("Think", "RAINBOWPLAYER", function()
    if serj.cfg.Vars["lgbt_pers"] then
    local RainbowPlayer = HSVToColor( CurTime() % 6 * 60, 1, 1 )
        LocalPlayer():SetPlayerColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
        --LocalPlayer():SetWeaponColor( Vector( RainbowPlayer.r / 255, RainbowPlayer.g / 255, RainbowPlayer.b / 255 ) )
end
end)

hook.Add("Think", "RAINBOWPLAYERCHIK", function()
    if serj.cfg.Vars["lgbt_persik"] then
    local RainbowPlayersik = HSVToColor( CurTime() % 6 * 60, 1, 1 )
        LocalPlayer():SetWeaponColor( Vector( RainbowPlayersik.r / 255, RainbowPlayersik.g / 255, RainbowPlayersik.b / 255 ) )
end
end)

function serj.ShootTime()
	if !IsFirstTimePredicted then return end
	serj.servertime = CurTime(1) + TICK_INTERVAL
end

GAMEMODE["EntityFireBullets"] = function(self, p, data)
    local missspread = "0"

	if me:GetShootPos() == data.Src then
        serj.shot = serj.shot + 1
        if serj.target != nil then
            serj.AddResolverStep(serj.target,true)
        end
    end
	local w = pm.GetActiveWeapon(me);
	local Spread = data.Spread * -1;
	if(!w || !em.IsValid(w) || serj.cones[em.GetClass(w)] == Spread || Spread == serj.nullvec) then return; end
	serj.cones[em.GetClass(w)] = Spread;
end

function serj.Spread(cmd,ang,spread)
	if not serj.activeWeapon or not serj.cones[ serj.activeWeaponClass ] then return ang end

	local dir = ded.PredictSpread( cmd, ang, spread )

	local newangle = ang + dir:Angle()
	newangle:Normalize()

	return newangle
end

function serj.PredictSpread( ucmd, angle )
	local ply = LocalPlayer()
	local w = ply:GetActiveWeapon()
	if ( w and w:IsValid() ) then
		local class = w:GetClass()
		if ( !CONE.weapon[class] ) then
			if ( serj.bullet[class] ) then
				local ang = angle:Forward() || ( ply:GetAimVector():Angle() ):Forward()
				local conevec = Vector( 0, 0, 0 ) - serj.bullet[class] || Vector( 0, 0, 0 )
				return serj.PredictSpread( ucmd, ang, conevec ):Angle()
			end
		else
			local ang = angle:Forward() || ply:GetAimVector():Angle()
			local conevec = CONE.weapon[class]
			return serj.PredictSpread( ucmd, ang, conevec ):Angle()
		end
	end
	return angle
end

// sss
serj.activeWeapon       = false
serj.activeWeaponClass  = false
serj.swbShit            = { ["swb_knife"] = true, ["swb_knife_m"] = true }

function serj.Nospread(cmd, ang)
    if not serj.activeWeapon or serj.swbShit[ serj.activeWeaponClass ] then return ang end

    if StartsWith( serj.activeWeaponClass, "swb_" ) then
        local function CalculateSpread()
            local vel = me:GetVelocity():Length()
            local dir = ang:Forward()

            if !me.LastView then
                me.LastView = dir
                me.ViewAff = 0
            else
                me.ViewAff = Lerp( 0.25, me.ViewAff, ( dir - me.LastView ):Length() * 0.5 )
            end

            if serj.activeWeapon.dt and serj.activeWeapon.meSpread and serj.activeWeapon.dt.State == SWB_AIMING then
                serj.activeWeapon.BaseCone = serj.activeWeapon.meSpread

                if serj.activeWeapon.Owner.Expertise then
                    serj.activeWeapon.BaseCone = serj.activeWeapon.BaseCone * ( 1 - serj.activeWeapon.Owner.Expertise["steadyme"].val * 0.0015 )
                end
            else
                serj.activeWeapon.BaseCone = serj.activeWeapon.HipSpread

                if serj.activeWeapon.Owner.Expertise then
                    serj.activeWeapon.BaseCone = serj.activeWeapon.BaseCone * ( 1 - serj.activeWeapon.Owner.Expertise["wepprof"].val * 0.0015 )
                end
            end

            if me:Crouching() then
                serj.activeWeapon.BaseCone = serj.activeWeapon.BaseCone * ( serj.activeWeapon.dt.State == SWB_AIMING and 0.9 or 0.75 )
            end

            serj.activeWeapon.CurCone = math_Clamp( serj.activeWeapon.BaseCone + serj.activeWeapon.AddSpread + ( vel / 10000 * serj.activeWeapon.VelocitySensitivity ) * ( serj.activeWeapon.dt.State == SWB_AIMING and serj.activeWeapon.meMobilitySpreadMod or 1 ) + me.ViewAff, 0, 0.09 + serj.activeWeapon.MaxSpreadInc )

            if CurTime() > serj.activeWeapon.SpreadWait then
                serj.activeWeapon.AddSpread = math_Clamp( serj.activeWeapon.AddSpread - 0.005 * serj.activeWeapon.AddSpreadSpeed, 0, serj.activeWeapon.MaxSpreadInc )
                serj.activeWeapon.AddSpreadSpeed = math_Clamp( serj.activeWeapon.AddSpreadSpeed + 0.05, 0, 1 )
            end
        end

        CalculateSpread()

        local cone = serj.activeWeapon.CurCone
        if !cone then return ang end

        if me:Crouching() then
            cone = cone * 0.85
        end

        math_randomseed( cmd:CommandNumber() )
        ang = ang - Angle( math_Rand(-cone, cone), math_Rand(-cone, cone), 0 ) * 25
    elseif StartsWith( serj.activeWeaponClass,"cw_" ) then
        local cone = serj.activeWeapon.CurCone
        if !cone then return ang end

        math_randomseed( cmd:CommandNumber() )
        ang = ang - Angle( math_Rand(-cone, cone), math_Rand(-cone, cone), 0 ) * 25
    elseif StartsWith( serj.activeWeaponClass,"fas2_" ) then
        math_randomseed( CurTime() )
        dir = Angle( math_Rand( -serj.activeWeapon.CurCone, serj.activeWeapon.CurCone ), math_Rand( -serj.activeWeapon.CurCone, serj.activeWeapon.CurCone ), 0 ) * 25

        dir2 = dir

        if serj.activeWeapon.ClumpSpread and serj.activeWeapon.ClumpSpread > 0 then
            dir2 = dir + Vector( math_Rand(-1, 1), math_Rand(-1, 1), math_Rand(-1, 1)) * serj.activeWeapon.ClumpSpread
        end

        ang = ang - dir2
    elseif serj.cones[ serj.activeWeaponClass ] then
        local spread = serj.cones[ serj.activeWeaponClass ]
        return serj.Spread( cmd, ang, spread )
    end

    return ang
end

--[[hook.Add("HUDPaint","hitmiss2",function()
if serj.cfg.Vars["esp_self_laser_sight"] then

end)]]

--[[hook.Add("HUDPaint", "hitmiss", function()
    if not serj.cfg.Vars["cros3d"] then return end

    local x = ScrW() / 2
    local y = ScrH() / 2
    local size = 10

    surface.SetDrawColor(255, 0, 0)
    surface.DrawLine(x - size, y, x + size, y) -- Г
    surface.DrawLine(x, y - size, x, y + size) -- В
end)]]

hook.Add("HUDPaint", "hitmiss", function()
    if not serj.cfg.Vars["cros3d"] then return end

    local tr = util.TraceLine({
        start = LocalPlayer():GetShootPos(),
        endpos = LocalPlayer():GetShootPos() + LocalPlayer():GetAimVector() * 1000,
        filter = LocalPlayer()
    })

    local pos = tr.HitPos:ToScreen()

    surface.SetDrawColor(255, 255, 255, 255)
    surface.DrawLine(pos.x - 10, pos.y, pos.x + 10, pos.y)
    surface.DrawLine(pos.x, pos.y - 10, pos.x, pos.y + 10)
end)

--[[local tipootdaca = 5

hook.Add("CreateMove", "recoilCrosshair", function(cmd)
    local otdaca = 2

    tipootdaca = math.Clamp(tipootdaca + otdaca, -10, 10)
end)]]

local function FastSwitch(ucmd)
    local guns = LocalPlayer():GetWeapons()
    if ( ucmd:GetMouseWheel() != 0 ) then ucmd:SelectWeapon( guns ) end
end

local hitEnemy = false

-- Hook to detect when the player hits an enemy
hook.Add("EntityTakeDamage", "TrackHits", function(target, dmginfo)
    if serj.cfg.Vars["misc_fastswitch"] then
        FastSwitch(ucmd)
        end
    --end
end)

-- Hook to draw on the HUD
--[[hook.Add("HUDPaint", "DrawHitIndicator", function()
    if not serj.cfg.Vars["map_enable"] then
		local size = math.Round(serj.cfg.Vars["map_size"])
        local fov = math.Round(serj.cfg.Vars["map_zoom"])
        local x = math.Round(serj.cfg.Vars["map_x"])
        local y = math.Round(serj.cfg.Vars["map_y"])
		local col = string.ToColor(serj.cfg.Colors["map_enable"])
		local nametag_col = string.ToColor(serj.cfg.Colors["map_names"])
		local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		--local dist = math.Round((m:GetPos() - v:GetPos()):Length())
        draw.RoundedBox( 3, x, y, size, size, Color(20, 20, 20, col.a))
		draw.RoundedBox( 3, x - 2, y - 2, size + 4, size + 4, Color(col.r, col.g, col.b,col.a))
		for key, ply in pairs(player.GetAll()) do

        local teamcol, teamcol2 = nametag_col

        if ply != me and ply:Alive() and ply:GetPos():Distance(LocalPlayer():GetPos()) then

            local lx = me:GetPos().x - ply:GetPos().x

            local ly = me:GetPos().y - ply:GetPos().y

            local ang = EyeAngles().y

            local cos = math.cos(math.rad(-ang))

            local sin = math.sin(math.rad(-ang))

            local px = (ly * cos) + (lx * sin)

            local py = (lx * cos) - (ly * sin)

            px = px / fov

            py = py / fov

            px = math.Clamp(px, -(size * 0.50), size * 0.50)

            py = math.Clamp(py, -(size * 0.50), size * 0.50)

            local name = player.GetAll()[key]:Nick()
			local team = team.GetName(player.GetAll()[key]:Team())
			--local teamcol3 = string.ToColor( team.GetColor(player.GetAll()[key]:Team() ) )
            if config["map_names"] then
            draw.SimpleText(name, "default", x + size - (size * 0.50) + px - 13, y + size - (size * 0.50) + py - 7, nametag_col, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
			if config["map_teams"] then
			draw.SimpleText(team, "default", x + size - (size * 0.50) + px - 13, y + size - (size * 0.50) + py - 15, nametag_col, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
            surface.SetDrawColor(teamcol)

            surface.DrawRect(x + size - (size * 0.50) + px, y + size - (size * 0.50) + py, 3, 3)
            end
        end
		draw.RoundedBox( 3, x - 2, y - 27,size + 4, 25, Color(35,35,35))
		draw.RoundedBox( 10, x, y - 26, size, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))
		surfSetDrawColor( 255, 255, 255, 60 )
	    surface.SetMaterial(Material("gui/center_gradient"))
	    surfDrawTexturedRect( x, y - 26, size, 3)
		surface.SetFont("EternityFont")
		local xmax = surface.GetTextSize("Mini Map")
        draw.SimpleText( "Mini Map", "EternityFont", x + (size / 2 ) - (xmax / 2), y - 20, color_white )
		draw.RoundedBox( 3, (x -2)+ (size/2), (y-2) + (size/2), 4, 4, Color(rgbcol.r,rgbcol.g,rgbcol.b) ) --me
		end

end
end)]]

--[[]
hook.Add("HUDPaint", "pidoras22222", function()
    if not serj.cfg.Vars["pidrila"] then return end
    local attacker = dmginfo:GetAttacker()

    if IsValid(attacker) and attacker:IsPlayer() and IsValid(target) and (target:IsNPC() or target:IsPlayer()) then
        hitEnemy = true

        timer.Simple(0.5, function()
            hitEnemy = false
        end)
    end
end)]]

local deadPlayers = {}

hook.Add("HUDPaint", "dplayer", function()
    if not serj.cfg.Vars["dead_player"] then return end

    local localPlayerPos = LocalPlayer():GetPos()

    for i, plr in ipairs(player.GetAll()) do
        if not plr:Alive() then
            if not deadPlayers[plr] then
                deadPlayers[plr] = { alpha = 0, lastToggleTime = 0, visible = true }
            end

            if CurTime() - deadPlayers[plr].lastToggleTime > 0.8 then
                deadPlayers[plr].visible = not deadPlayers[plr].visible
                deadPlayers[plr].lastToggleTime = CurTime()
            end

            if deadPlayers[plr].visible then
                if deadPlayers[plr].alpha < 255 then
                    deadPlayers[plr].alpha = math.Approach(deadPlayers[plr].alpha, 255, FrameTime() * 100)
                end

            local pos = plr:GetPos():ToScreen()
            local nickname = plr:Nick()
            --local distance = math.floor(localPlayerPos:Distance(pos))
            --local x, y = screenPos.x, screenPos.y

            draw.SimpleText("*ЛЕЖИ УЁБОК*", "font-02", pos.x, pos.y, Color(255, 0, 0, deadPlayers[plr].alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            draw.SimpleText(nickname, "font-02", pos.x, pos.y - 20, Color(255, 255, 255, deadPlayers[plr].alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            --draw.SimpleText(distance .. "m", "font-02", x, y - 40, Color(255, 255, 255, deadPlayers[plr].alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        else
            if deadPlayers[plr] and deadPlayers[plr].alpha > 0 then
                deadPlayers[plr].alpha = math.Approach(deadPlayers[plr].alpha, 0, FrameTime() * 100)
            end
        end
    end
end)


hook.Add("HUDPaint","hreals",function()
	if !serj.cfg.Vars["lines_aa"] then return end --serj.vRealAngles.y,serj.vFakeAngles.y

	local rl, fk, lby = Angle(0, serj.vRealAngles.y, 0), Angle(0, serj.vFakeAngles.y, 0) --Angle(0, serj.vRealAngles(me:EntIndex()), 0)

	local pos = me:GetPos()
	local rlpos = (pos + rl:Forward() * 36):ToScreen()
	local fkpos = (pos + fk:Forward() * 36):ToScreen()
	--local lbypos = (pos + lby:Forward() * 36):ToScreen()

	-- draw real
	surface.SetFont("font-02")

	local tx, ty = surface.GetTextSize("real")
	surface.SetTextPos(rlpos.x - tx * 0.5, rlpos.y - ty * 0.5)

	surface.SetTextColor(string.ToColor(serj.cfg.Colors["lines_aa"]))
	surface.DrawText("real")

	-- draw fake
	tx, ty = surface.GetTextSize("fake")
	surface.SetTextPos(fkpos.x - tx * 0.5, fkpos.y - ty * 0.5)

	surface.SetTextColor(string.ToColor(serj.cfg.Colors["lines2_aa"]))
	surface.DrawText("fake")

	-- draw LBY
	--tx, ty = surface.GetTextSize("LBY")
	--surface.SetTextPos(lbypos.x - tx * 0.5, lbypos.y - ty * 0.5)

	--surface.SetTextColor(lbyangcolor)
	--surface.DrawText("LBY")
end)

hook.Add("Think", "545454545454", function()
    --if serj.cfg.Vars["edge_jump"] and LocalPlayer():IsOnGround() && LocalPlayer():WaterLevel() < 2 && LocalPlayer():GetMoveType() != 8 && LocalPlayer():GetMoveType() != 9 then
		local player = LocalPlayer()

    if serj.cfg.Vars["edge_jump"] and player:IsOnGround() and player:WaterLevel() < 2 and player:GetMoveType() != MOVETYPE_NOCLIP and player:GetMoveType() != MOVETYPE_OBSERVER then
        local StartPos = player:GetPos()
        local EndPos = StartPos - Vector(0, 0, 18)

        local forwardVec = player:GetVelocity():Angle():Forward()
        local DirVec = Vector(forwardVec.x, forwardVec.y, 0) * 8
        local DirVec2 = Vector(forwardVec.x, forwardVec.y, 0) * 16

        local FirstTrace = {
            start = StartPos - DirVec,
            endpos = EndPos - DirVec,
            filter = player,
            mask = MASK_PLAYERSOLID
        }


        local SecondTrace = {
            start = StartPos - DirVec2,
            endpos = EndPos - DirVec2,
            filter = player,
            mask = MASK_PLAYERSOLID
        }

        local firstResult = util.TraceLine(FirstTrace)
        local secondResult = util.TraceLine(SecondTrace)

        if firstResult.Fraction == 1 and secondResult.Fraction != 1 then
            cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_JUMP))
        end
    end
end)
hook.Add("HUDPaint","hitboxer",function()
    if serj.cfg.Vars["hitboxes"] then
        cam.Start3D( EyePos(), EyeAngles() )
		for k, pl in pairs( player.GetAll() ) do
			if pl and IsValid( pl ) and pl:Alive() and pl != LocalPlayer() then
				local tr = pl:GetEyeTrace();
				local color = team.GetColor( pl:Team() );
				render.DrawLine( pl:GetShootPos(), tr.HitPos, color, true );
			end
		end
	cam.End3D()
end
end)

function serj.NoRecoil( ang )
    StartsWith = gString.StartWith
	if StartsWith( serj.activeWeaponClass,"m9k_" ) or StartsWith( serj.activeWeaponClass,"bb_" ) or StartsWith( serj.activeWeaponClass,"unclen8_" ) then
		return ang
	else
	    ang = ang - me:GetViewPunchAngles()
    end

	return ang
end

function serj.SilentAngles(cmd)
	if !serj.fa then serj.fa = cmd:GetViewAngles() end
	serj.fa = serj.fa + Angle(cmd:GetMouseY() * GetConVarNumber("m_yaw"), cmd:GetMouseX() * -GetConVarNumber("m_yaw"), 0)
	serj.fa.p = mClamp(serj.fa.p, -89, 89)
	serj.fa.y = mNormalizeAng(serj.fa.y)
    return serj.fa
end

local flickerAng = 0  -- Начальный угол для фликера

hook.Add("PrePlayerDraw", "dddddddddddddd", function() -- HACKED BY TRAHER$
    if serj.cfg.Vars["Flicker_aa"] then
        local player = LocalPlayer()

        -- Меняем угол на 30 градусов
        flickerAng = flickerAng + 30
        if flickerAng >= 360 then
            flickerAng = flickerAng - 360  -- Сбрасываем угол, если он превышает 360 градусов
        end

        -- Получаем текущие углы взгляда игрока
        local angles = player:EyeAngles()
        angles.y = angles.y + flickerAng

        -- Устанавливаем новые углы для игрока
        player:SetEyeAngles(angles)
    end
end)

-- Таймер для сброса угла каждую секунду
timer.Create("FlickerTimer", 1, 0, function()
    if serj.cfg.Vars["Flicker_aa"] then
        flickerAng = (flickerAng + 30) % 360  -- Обновляем фликер угол
    end
end)

if serj.fcenabled then
    cmd:ClearMovement()
    cmd:ClearButtons()

    cmd:SetViewAngles(serj.fcangles)
end

function serj.Smoothing( ang )
	if ( serj.cfg.Vars["legit_smooth_amount"] == 0 ) then return ang end
	local speed = RealFrameTime() / ( serj.cfg.Vars["legit_smooth_amount"] / 10 )
	local angl = LerpAngle( speed, me:EyeAngles(), ang )
	return Angle( angl.p, angl.y, 0 )
end

function serj.GetClosestAimTarget()
    dists = {};

	for k,v in next, player.GetAll() do
        if(!serj.ValidateTarget(v)) then continue; end
        dists[#dists + 1] = { vm.Distance( em.GetPos(v), em.GetPos(me) ), v };
	end

	table.sort(dists, function(a, b)
		return(a[1] < b[1]);
	end);

	closest = dists[1] and dists[1][2] || nil;
    return closest
end

function serj.GetLowestHealth()
    dists = {};

    for k,v in next, player.GetAll() do
        if(!serj.ValidateTarget(v)) then continue; end
        dists[#dists + 1] = { em.Health(v), v };
    end

    table.sort(dists, function(a, b)
        return(a[1] < b[1]);
    end);

    closest = dists[1] and dists[1][2] || nil;

    return closest
end

serj.playerCache = {}
function serj.playerTableUpdate( ply )
    serj.playerCache[ ply ].Name = ply:Name()

    local t = ply:Team()

    serj.playerCache[ ply ].Team = t
    serj.playerCache[ ply ].TeamColor = team_GetColor( t )
    serj.playerCache[ ply ].TeamName = team_GetName( t )

    serj.playerCache[ ply ].GetUserGroup = ply:GetUserGroup()

    serj.playerCache[ ply ].Health = ply:Health()
    serj.playerCache[ ply ].GetMaxHealth = ply:GetMaxHealth()


    serj.playerCache[ ply ].Armor = ply:Armor()
    serj.playerCache[ ply ].GetMaxArmor = ply:GetMaxArmor()

    serj.playerCache[ ply ].GetPos = ply:GetPos()

    serj.playerCache[ ply ].ObserverMode = ply:GetObserverMode()
    serj.playerCache[ ply ].ObserverTarget = ply:GetObserverTarget()

    local w = ply:GetActiveWeapon()

    serj.playerCache[ ply ].WeaponClass = IsValid(w) and ( serj.cfg.Vars["weapon_printname"] and language.GetPhrase( w:GetPrintName() ) or w:GetClass() ) or "Unarmed"
    serj.playerCache[ ply ].WeaponAmmo = IsValid(w) and w:Clip1() or "-"
end

function serj.IsTickHittable( ply, cmd, tick )
    if ded.GetLatency(0) > 1 then return false end

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - ded.btrecords[ ply ][ tick ].simulationtime

    if diff > serj.cfg.Vars["track_time"] / 1000 then return false end

    return true
end

// Backtracking

serj.btrecords = {}
serj.predicted = {}

















function serj.canBacktrack(ply)
    if not serj.cfg.Vars["Backtrack"] then return false end
    if not IsValid(ply) then return false end
    if not serj.btrecords[ply] then return false end
    if ply.break_lc then return false end

    return true
end

function serj.recordBacktrack(ply)
	local deadtime = CurTime() - serj.cfg.vars["Backtrack_time"] / 1000

	local records = serj.btrecords[ply]

	if !records then
        records = {}
		serj.btrecords[ply] = records
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
		aimpos =            serj.GetBones( ply )[1],
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

--[[]function serj.drawCSModels_backtrack()
    if not serj.cfg.Vars["Backtrack_chams"] then return end
    if not serj.canBacktrack(serj.target) then return end

    local len = #serj.btrecords[serj.target]
    local tbl = serj.btrecords[serj.target][serj.backtracktick]
    local m = serj.btmodel

    serj.CS_Model_update(serj.target,m,tbl)

    if serj.cfg.Vars["Backtrack_fullbright"] then
        render_SuppressEngineLighting(true)
    end

    local col = string_ToColor(serj.cfg.colors["Backtrack_chams"])
    serj.chamMats.invis[6]:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
    render_MaterialOverride(serj.chamMats.invis[serj.cfg.Vars["Backtrack_material"]--])
    render_SetColorModulation(col.r/255,col.g/255,col.b/255)
    m:SetRenderMode(1)
    m:DrawModel()

    if serj.cfg.Vars["Backtrack_fullbright"] then
        render_SuppressEngineLighting(false)
    end
end]]

serj.c_sv_noclipspeed = GetConVar("sv_noclipspeed")
serj.c_sv_specspeed = GetConVar("sv_specspeed")
function serj.pMovementFix(cmd, aWishDir)
    local factor = 1
    if me:GetObserverMode() == OBS_MODE_ROAMING then
        factor = serj.c_sv_specspeed:GetFloat()
    else
        factor = serj.c_sv_noclipspeed:GetFloat()
    end

    if cmd:KeyDown(IN_SPEED) then
        factor = factor * 0.5
    end

    local aRealDir = serj.fa
    aRealDir:Normalize()

    local vRealF = aRealDir:Forward()
    local vRealR = aRealDir:Right()
    vRealF.z = 0
    vRealR.z = 0

    vRealF:Normalize()
    vRealR:Normalize()

    aWishDir:Normalize()

    local vWishF = aWishDir:Forward()
    local vWishR = aWishDir:Right()
    vWishF.z = 0
    vWishR.z = 0

    vWishF:Normalize()
    vWishR:Normalize()

    local forwardmove = cmd:GetForwardMove() * factor
    local sidemove = cmd:GetSideMove() * factor
    local upmove = cmd:GetUpMove() * factor

    local vWishVel = vWishF * forwardmove + vWishR * sidemove
    vWishVel.z = vWishVel.z + upmove

    local a, b, c, d, e, f = vRealF.x, vRealR.x, vRealF.y, vRealR.y, vRealF.z, vRealR.z
    local u, v, w = vWishVel.x, vWishVel.y, vWishVel.z
    local flDivide = (b * c - a * d) * factor

    local x = -(d * u - b * v) / flDivide
    local y = (c * u - a * v) / flDivide
    local z = (a * (f * v - d * w) + b * (c * w - e * v) + u * (d * e - c * f)) / flDivide

    x = mClamp(x, -10000, 10000)
    y = mClamp(y, -10000, 10000)
    z = mClamp(z, -10000, 10000)

    cmd:SetForwardMove(x)
    cmd:SetSideMove(y)
    cmd:SetUpMove(z)
end

serj.bsendpacket = true
--[[
serj.fakeYaw = 0
serj.realYaw = 0
serj.pitch = 0
serj.yawbase = 0
]]
serj.switchside = true
serj.yawadd = 0
serj.fyawadd = 0

function serj.GetClosest()
	local ddists = {};

	local closest;

	for k,v in next, player.GetAll() do
	if(!serj.ValidateTarget(v)) then continue; end
		ddists[#ddists + 1] = { vm.Distance( em.GetPos(v), em.GetPos(me) ), v };
	end

	table.sort(ddists, function(a, b)
		return(a[1] < b[1]);
	end);

	closest = ddists[1] and ddists[1][2] || nil;

	if(!closest) then return serj.fa.y; end

	local pos = em.GetPos(closest);

	local pos = vm.Angle(pos - em.EyePos(me));

	return( pos.y );
end
serj.brawlstars_unizil = false
function serj.YawBase()
    if serj.cfg.Vars["yaw_base"] == 1 then
        yawbase = serj.fa.y
    elseif serj.cfg.Vars["yaw_base"] == 2 then
        yawbase = 180
    elseif serj.cfg.Vars["yaw_base"] == 3 then
        yawbase = serj.GetClosest()
	elseif serj.cfg.Vars["yaw_base"] == 4 then
        yawbase = serj.GetClosest()
    end

	return yawbase
end
serj.landing = false
function serj.OnLand( ply, inWater, onFloater, speed )
    if !onFloater and !inWater then
        serj.landing = true
        timer.Simple(1,function() serj.landing = false end)
    end
end

serj.flicker = (math.random(-8,24))
function serj.Flick( ply, Flick, speed )
    if pitch then
        flicker = (math.random(-8,24))
        flicker = (math.random(24,-8))
    end
end

serj.cadillac = false
function serj.GetAAPitch()
    if serj.bsendpacket then
        serj.cadillac = !serj.cadillac
	end

    if serj.cfg.Vars["pitch_zero_land"] and serj.landing then
        realPitch = 122
    elseif serj.cfg.Vars["pitch"] == 1 then
        realPitch = serj.fa.x
    elseif serj.cfg.Vars["pitch"] == 2 then
        realPitch = 0+-0
    elseif serj.cfg.Vars["pitch"] == 3 then
        realPitch = 89
    elseif serj.cfg.Vars["pitch"] == 4 then
        realPitch = -180
    elseif serj.cfg.Vars["pitch"] == 5 then
        realPitch = 89+5
    elseif serj.cfg.Vars["pitch"] == 6 then
        realPitch = math.random(-89,89)
	elseif serj.cfg.Vars["pitch"] == 7 then
        realPitch = (math.random(-89,89)) and (math.random(-99,99))
	elseif serj.cfg.Vars["pitch"] == 8 then
        realPitch = serj.cfg.Vars["c_pitch"]
    elseif serj.cfg.Vars["pitch"] == 9 then
		realPitch = mrandom(-180,-55) and mrandom(180,55)
    elseif serj.cfg.Vars["pitch"] == 10 then
		realPitch = mrandom(180,95) and mrandom(-180,-95)
    elseif serj.cfg.Vars["pitch"] == 11 then
		realPitch = mrandom(-180,95) and mrandom(177,180) -- GOVNO
    elseif serj.cfg.Vars["pitch"] == 12 then
		realPitch = mrandom(-180,-95) and mrandom(166,179+2)
    elseif serj.cfg.Vars["pitch"] == 13 then
		realPitch = mrandom(-180,-115) and mrandom(177,179+2)
    elseif serj.cfg.Vars["pitch"] == 14 then
        local lastFlickTime = 0
        local flickInterval = 1 -- Seconds between flicks

        if os.clock() - lastFlickTime >= flickInterval then
          lastFlickTime = os.clock()

          local pitchDirection = math.random() > 4.5 and -1 or 1
          realPitch = pitchDirection * math.random(89, 90)
        end
    --print(ilyaware.exploit)
    end

    return realPitch
end
--[[]
	if serj.switchside then
		serj.realYaw = serj.YawBase() - 89 - 30
	else
		serj.realYaw = serj.YawBase() + 89 - 30
	end
	]]

local function WallDetect()
    local eye = me:GetShootPos()
    local head = me:GetBonePosition(me:LookupBone("ValveBiped.Bip01_Head1"))
    eye.z = head.z

    local lowestFraction = 1
    local lowestFractionAngle = nil
    for i=0, 360, 360 / 45 do
        local ang = Angle(0, i, 0)
        local trc = TraceLine({
            start = eye,
            endpos = eye + ang:Forward() * 24,
            mask = MASK_SHOT,
            collisiongroup = COLLISION_GROUP_DEBRIS,
        })

        if(trc.Fraction < lowestFraction) then
            lowestFraction = trc.Fraction
            lowestFractionAngle = ang.y
        end
    end

    return lowestFractionAngle
end

serj.GetAAY = nil

local currentAngles = Angle(0, 0, 0)

function Freestanding()
    local ply = LocalPlayer()

    -- Таймер для изменения углов
    timer.Create("ChangeAnglesTimer", 2, 0, function()
        -- Проверка, движется ли игрок вперед или назад
        if ply:KeyDown(IN_FORWARD) or ply:KeyDown(IN_BACK) then
            -- Изменяем Yaw на 15 градусов
            currentAngles.y = currentAngles.y + 15

            -- Обновляем углы взгляда игрока
            ply:SetEyeAngles(currentAngles)
        end
    end)
end

if serj.cfg.Vars["Spectator_memes"] then
    local r
    local mode = serj.cfg.Vars["Spectator_type"]

    if mode == "Spin" then
        r = (CurTime() * 2.7) % 360
    elseif mode == "Sin" then
        r = msin(CurTime() * 6) * 180 + 180
    elseif mode == "Random" then
        r = mRand(0, 360)
    else
        r = 180
    end

    local view = cmd:GetViewAngles()
    view.r = r

    cmd:SetViewAngles(view)
end

hook.Add("PrePlayerDraw","55323232",function() -- HACKED BY TRAHER$
    if serj.cfg.Vars["lby_abuse"] then
    --if info.userid == LocalPlayer():UserID() then
        local angles = LocalPlayer():EyeAngles()
        angles.y = angles.y + serj.cfg.Vars["lby_abuseprotect"]
        LocalPlayer():SetEyeAngles(angles)
    --end
end
end)

function serj.GetAAY()


-- Таймер для быстрой смены углов yaw
timer.Create("YawSwitchTimer", 0.1, 0, function()
        -- Переключаем значение угла yaw между 165 и -155
        if currentYaw == 165 then
            currentYaw = -155
        else
            currentYaw = 165
        end

        -- Устанавливаем новое значение угла yaw для realYaw
        realYaw = serj.YawBase() + currentYaw

end)

    if serj.cfg.Vars["angle_bind"] then --serj.activebinds["key_bind"] then
        realYaw = serj.YawBase() + 90
    end

    if serj.activebinds["key_aaml"] then
        realYaw = serj.YawBase() + 89
    elseif serj.activebinds["key_aamr"] then
        realYaw = serj.YawBase() - 89 - 30
    elseif serj.cfg.Vars["yaw_real"] == 1 then
        realYaw = serj.YawBase()
    elseif serj.cfg.Vars["yaw_real"] == 2 then
        realYaw = serj.YawBase() - 179.9134
    elseif serj.cfg.Vars["yaw_real"] == 3 then
        realYaw = serj.YawBase() + 89
    elseif serj.cfg.Vars["yaw_real"] == 4 then
        realYaw = serj.YawBase() - 89 - 30
    elseif serj.cfg.Vars["yaw_real"] == 5 then
        realYaw = serj.YawBase() - mNormalizeAng(CurTime() * (serj.cfg.Vars["antiaim_spinspeed"]*10))
    elseif serj.cfg.Vars["yaw_real"] == 6 then
        realYaw = serj.YawBase() + mNormalizeAng(CurTime() * (serj.cfg.Vars["antiaim_spinspeed"]*10))
    elseif serj.cfg.Vars["yaw_real"] == 7 then
        realYaw = serj.YawBase() - mrandom(-serj.cfg.Vars["antiaim_jitterrange"],serj.cfg.Vars["antiaim_jitterrange"])
    elseif serj.cfg.Vars["yaw_real"] == 8 then
        realYaw = serj.YawBase() - -167 - mrandom(-serj.cfg.Vars["antiaim_jitterrange"],serj.cfg.Vars["antiaim_jitterrange"])
    elseif serj.cfg.Vars["yaw_real"] == 9 then
		realYaw = serj.YawBase() + serj.cfg.Vars["c_ryaw"]
    elseif serj.cfg.Vars["yaw_real"] == 10 then
        realYaw = math.sin(CurTime() * 5) * 10
		--realYaw = serj.YawBase() + math.random(150, 160, 170, 25, 130)--ded.GetCurrentLBY(me:EntIndex()) + (bsendpacket and -90 or 90)
    elseif serj.cfg.Vars["yaw_real"] == 11 then
        realYaw = serj.YawBase() + 180 + math.cos(CurTime() * 5) * 25
		--realYaw = serj.YawBase() + (math.random(157, -157))
    elseif serj.cfg.Vars["yaw_real"] == 12 then
		realYaw = serj.YawBase() + currentYaw
    elseif serj.cfg.Vars["yaw_real"] == 13 then
		realYaw = serj.YawBase() + 180 + math.cos(CurTime() * 15) * 55
    elseif serj.cfg.Vars["yaw_real"] == 14 then
		realYaw = serj.YawBase() + 180 + msin(CurTime() * 10) * 180 + 180    --msin(CurTime() * 6) * 25 + 25
    elseif serj.cfg.Vars["yaw_real"] == 15 then
		realYaw = serj.YawBase() + 180 + 0
    elseif serj.cfg.Vars["yaw_real"] == 16 then
		realYaw = ded.GetCurrentLBY(me:EntIndex()) + (bsendpacket and -90 or 90)
    elseif serj.cfg.Vars["yaw_real"] == 17 then
		realYaw = ded.GetCurrentLBY(me:EntIndex()) + (bsendpacket and -90 or 90)
    elseif serj.cfg.Vars["yaw_real"] == 18 then
		realYaw = ded.GetCurrentLBY(me:EntIndex()) + (bsendpacket and -90 or 90)
    end

    if serj.cfg.Vars["edge_enable"] and WallDetect() != nil and serj.cfg.Vars["edge_side"] == 1 then
        realYaw = WallDetect()
    elseif serj.cfg.Vars["aa_autodir"] and Freestanding() != nil then
        realYaw = Freestanding()
    end

    return realYaw
end
serj.vFakeAngles = Angle(0,0,0)
serj.vRealAngles = Angle(0,0,0)
serj.FakeLagAngles = Angle(0,0,0)
local randomOffset = math.random(-180, 180)
local jitter = math.sin(CurTime() * 5) * 10
local curveAdjustment = math.cos(CurTime() * 2) * 45
function serj.GetFAAY()
    if serj.activebinds["key_aaml"] then
        fakeYaw = serj.YawBase() + 89
    elseif serj.activebinds["key_aamr"] then
        fakeYaw = serj.YawBase() - 89 - 30
    elseif serj.brawlstars_unizil then
        fakeYaw = serj.YawBase() - mNormalizeAng(CurTime() * 450)
    elseif serj.cfg.Vars["yaw_fake"] == 1 then
        fakeYaw = serj.YawBase()
    elseif serj.cfg.Vars["yaw_fake"] == 2 then
        fakeYaw = serj.YawBase() - 180
    elseif serj.cfg.Vars["yaw_fake"] == 3 then
        fakeYaw = serj.YawBase() + 89
    elseif serj.cfg.Vars["yaw_fake"] == 4 then
        fakeYaw = serj.YawBase() - 89
    elseif serj.cfg.Vars["yaw_fake"] == 5 then
        fakeYaw = serj.YawBase() - mNormalizeAng(CurTime() * (serj.cfg.Vars["antiaim_spinspeed"]*10))
    elseif serj.cfg.Vars["yaw_fake"] == 6 then
        fakeYaw = serj.YawBase() + mNormalizeAng(CurTime() * (serj.cfg.Vars["antiaim_spinspeed"]*10))
    elseif serj.cfg.Vars["yaw_fake"] == 7 then
        fakeYaw = serj.YawBase() - mrandom(-serj.cfg.Vars["antiaim_jitterrange"],serj.cfg.Vars["antiaim_jitterrange"])
    elseif serj.cfg.Vars["yaw_fake"] == 8 then
        fakeYaw = serj.YawBase() - -167 - mrandom(-serj.cfg.Vars["antiaim_jitterrange"],serj.cfg.Vars["antiaim_jitterrange"])
    elseif serj.cfg.Vars["yaw_fake"] == 9 then
		fakeYaw = serj.YawBase() + serj.cfg.Vars["c_fyaw"]
    elseif serj.cfg.Vars["yaw_fake"] == 10 then
		fakeYaw = serj.YawBase() + math.random(165, 140, 90, 75, -160)
    elseif serj.cfg.Vars["yaw_fake"] == 11 then
	    fakeYaw = serj.YawBase() + 180 + math.cos(CurTime() * 5) * 25
    --elseif serj.cfg.Vars["yaw_fake"] == 11 then
	--	fakeYaw = serj.YawBase() + math.random(-165) and math.random(167)
    elseif serj.cfg.Vars["yaw_fake"] == 12 then
        fakeYaw = serj.YawBase() + 180 + math.cos(CurTime() * 15) * 25
		--fakeYaw = serj.YawBase() + 165 or - 165
    elseif serj.cfg.Vars["yaw_fake"] == 13 then
	    fakeYaw = serj.YawBase() + 180 + math.cos(CurTime() * 5) * 55
    elseif serj.cfg.Vars["yaw_fake"] == 14 then
	    fakeYaw = serj.YawBase() + 180 + msin(CurTime() * 10) * 180 + 180
    elseif serj.cfg.Vars["yaw_fake"] == 15 then
	    fakeYaw = serj.YawBase() + 180 + 0
    elseif serj.cfg.Vars["yaw_fake"] == 16 then
	    fakeYaw = serj.YawBase() + 180 + math.cos(CurTime() * 5) * 25
    elseif serj.cfg.Vars["yaw_fake"] == 17 then
	    fakeYaw = serj.YawBase() + 180 + math.cos(CurTime() * 5) * 25
    elseif serj.cfg.Vars["yaw_fake"] == 18 then
	    fakeYaw = serj.YawBase() + 180 + math.cos(CurTime() * 5) * 25
    elseif serj.cfg.Vars["yaw_fake"] == 10 then
        fakeYaw = serj.YawBase() + 180 + math.cos(CurTime() * 15) * 55
		--fakeYaw = ded.GetCurrentLBY(me:EntIndex()) + (bsendpacket and -90 or 90)
    end

    if serj.cfg.Vars["fake_flick"] then
        fakeYaw = serj.YawBase() + 180 + math.random(0, serj.cfg.Vars["brute_jj"], 0, 0)
    end

    if serj.cfg.Vars["fake_flick2"] then
        fakeYaw = serj.YawBase() + -180 + math.random(0, -serj.cfg.Vars["brute_jja"], 0, 0)
    end

    if serj.cfg.Vars["anti_brute"] then
        fakeYaw = serj.YawBase() + math.random(1, 180, 1, 80, 1)
    end

    if serj.cfg.Vars["invert_on_shot"] then

    end

    if serj.cfg.Vars["angle_c"] then
        -- Создание переменной для команды стрельбы
        local shotRightAmount = 181 -- Угол, на который повернется голова вправо
        local isShooting = false

        -- Функция, которая будет срабатывать при стрельбе
        function OnShoot()
            local ply = LocalPlayer()

            -- Получаем текущие углы взгляда
            local currentAngles = ply:EyeAngles()

            -- Изменяем угол yaw на заданное значение
            currentAngles.y = math.Clamp(currentAngles.y + shotRightAmount, -180, 180)

            -- Устанавливаем новые углы взгляда
            ply:SetEyeAngles(currentAngles)
        end

        -- Хук для определения, стреляет ли игрок
        hook.Add("EntityFireBullets", "YawFlickOnShoot", function(ent)
            if ent == LocalPlayer() then
                OnShoot()
            end
        end)
    end

    if serj.cfg.Vars["lllike"] then
            -- Создание переменной для команды стрельбы
            local shotUpAmount = -181 -- Угол, на который поднимется голова
            local isShooting = false

            -- Функция, которая будет срабатывать при стрельбе
            function OnShoot()
                local ply = LocalPlayer()

                -- Получаем текущие углы взгляда
                local currentAngles = ply:EyeAngles()

                -- Поднимаем угол pitch на заданное значение
                currentAngles.p = math.Clamp(currentAngles.p + shotUpAmount, -89, 89)

                -- Устанавливаем новые углы взгляда
                ply:SetEyeAngles(currentAngles)
            end

            -- Хук для определения, стреляет ли игрок
            hook.Add("EntityFireBullets", "PitchFlickOnShoot", function(ent)
                if ent == LocalPlayer() then
                    OnShoot()
            end
        end)
    end




    if serj.cfg.Vars["zxcpiska"] then
        local realYaw = 0
        local fakeYaw = 0
        local ply = LocalPlayer()

    if ply:KeyDown(IN_FORWARD) then
        realYaw = realYaw + 15
        fakeYaw = fakeYaw - 10
    elseif ply:KeyDown(IN_BACK) then
        realYaw = realYaw + 15
        fakeYaw = fakeYaw - 10
    end
end

    if serj.cfg.Vars["edge_enable"] and WallDetect() != nil and serj.cfg.Vars["edge_side"] == 2 then
        fakeYaw = WallDetect()
    end

    return fakeYaw
end

function serj.Antihit(cmd)
    local freestandsucc, freestandsafe, freestandunsafe
    local angDiff = mabs(math.Round(math.AngleDifference(serj.vFakeAngles.y,serj.vRealAngles.y)))
    local angAdd = serj.cfg.Vars["avoid_overlap_add"] + 100

    if !serj.cfg.Vars["avoid_overlap"] or angDiff > 100 then
        angAdd = 0
    end

    if serj.cfg.Vars["Freestanding"] then
        freestandsucc, freestandsafe, freestandunsafe = serj.Freestanding(cmd)
    end

	if serj.cfg.Vars["aa_enable"] and ( !cmd:KeyDown(IN_ATTACK) and !cmd:KeyDown(IN_USE)  ) and me:GetMoveType() != MOVETYPE_NOCLIP and me:GetMoveType() != MOVETYPE_LADDER and me:Alive() then
        if serj.bsendpacket then
            cmd:SetViewAngles(Angle(serj.GetAAPitch(),serj.GetFAAY()-angAdd,0))
            serj.vFakeAngles = cmd:GetViewAngles()
            serj.FakeLagAngles = cmd:GetViewAngles()
        else
            cmd:SetViewAngles(Angle(serj.GetAAPitch(),serj.GetAAY()+(serj.headrot*0),0))
            serj.vRealAngles = cmd:GetViewAngles()
        end
    else
        if IsValid(me) and me:Alive() and IsValid(me:GetActiveWeapon()) then
            local faa = serj.cfg.Vars["sa_enable"] and serj.fa or cmd:GetViewAngles()

            if serj.cfg.Vars["No_recoil"] and ( ang ) then
            if StartsWith( serj.activeWeaponClass,"m9k_" ) or StartsWith( serj.activeWeaponClass,"bb_" ) or StartsWith( serj.activeWeaponClass,"unclen8_" ) then
                return ang
            else
                ang = ang - me:GetViewPunchAngles()
            end

            return ang
        end

            if serj.cfg.Vars["No_spread"] then
                if not serj.activeWeapon or serj.swbShit[ serj.activeWeaponClass ] then return ang end
    local base = string.Split( serj.activeWeaponClass, "_" )[ 1 ]

    if serj.SpreadComps[ base ] then
        ang = serj.SpreadComps[ base ]( cmd, ang )
    elseif serj.cones[ serj.activeWeaponClass ] then
        local spread = serj.cones[ serj.activeWeaponClass ]
        return serj.Spread( cmd, ang, spread )
    end
    return ang
end

            cmd:SetViewAngles(faa)
        else
            if serj.cfg.Vars["sa_enable"] then
                cmd:SetViewAngles(serj.fa)
            end
        end

        serj.vFakeAngles = cmd:GetViewAngles()
        serj.vRealAngles = cmd:GetViewAngles()
        serj.FakeLagAngles = cmd:GetViewAngles()
    end

    --print(angDiff)
    --print(angAdd)
    if serj.cfg.Vars["sa_enable"] or serj.cfg.Vars["aa_enable"] then
	    serj.MovementFix(cmd)
    end
end

function serj.PredictedPos(ply)
    return ply:GetPos() + ply:GetVelocity() * TickInterval
end

function serj.PredictedEyePos()
    return me:EyePos() + me:GetVelocity() * TickInterval
end

function serj.isPeeking()
    if !serj.target then return end

    local mypos = serj.predictPos(me:GetPos())

    local tr = TraceLine({
        mask = MASK_SHOT,
        ignoreworld = false,
        filter = me,
        start = me:EyePos(),
        endpos = serj.targetVector
    })

    return tr.Entity == serj.target or tr.Fraction == 1
end

serj.fakeLagTicks = 0
serj.fakeLagfactor = 0
serj.fakeLagTicks = 0
serj.fakeLagfactor = 0
serj.chokedTicks = 0

serj.peeked = false
serj.peeking = false

function serj.FakeLagOnPeek()
    if serj.cfg.Vars["fl_peeker"] then
        serj.fakeLagTicks = 21 - serj.chokedTicks - 1

        if serj.chokedTicks >= 20 then
            serj.peeked = true
            serj.peeking = false
            serj.SendPacket = true
            me:SetSimulationTime( globals.CurTime() )
            ded.UpdateClientAnimation(me:EntIndex())
            return
        end
    end
end

function serj.FakeLag(cmd)
    local peeked = false
    local curvel = me:GetVelocity():Length2D()
    local dst_per_tick = curvel * TICK_INTERVAL
    local chokes = mceil(64 / dst_per_tick)
	chokes = mClamp(chokes, 1, math.Round(serj.cfg.Vars["fl_maxchoke"]))

    if serj.cfg.Vars["fl_mode"] == 1 then
        serj.fakeLagfactor = math.Round(serj.cfg.Vars["fl_maxchoke"])
    elseif serj.cfg.Vars["fl_mode"] == 2 then
        serj.fakeLagfactor = chokes
    elseif serj.cfg.Vars["fl_mode"] == 3 then
        serj.fakeLagfactor = serj.fakeLagFactor + mathrandom("3")
    elseif serj.cfg.Vars["fl_mode"] == 4 then
        serj.fakeLagfactor = 21 and ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 13)
    end

    if serj.cfg.Vars["move_fd"] and serj.activebinds["key_fd"] then
        serj.fakeLagfactor = 23
    end

    --if me:GetVelocity():Length() < 10 then serj.fakeLagfactor = 23 end

    if serj.cfg.Vars["Allah_walk"] and me:IsFlagSet( FL_ONGROUND ) and (serj.cfg.Keybinds["allah_walkk"]) then
        serj.fakeLagfactor = 21
    end

    if serj.cfg.Vars["Allah_walk"] and me:IsFlagSet( FL_ONGROUND ) and (serj.cfg.Keybinds["allah_walkk"]) then

        if serj.fakeLagTicks != 20 then
            serj.ClampMovementSpeed(cmd, 0)
        else
            serj.ClampMovementSpeed(cmd, me:GetWalkSpeed())
        end

        //if(serj.fakeLagTicks <= 20) then
        //    serj.ClampMovementSpeed(cmd, 0)
        //    serj.Stop(cmd)
            //me:SetPoseParameter("move_x", 0)
            //me:SetPoseParameter("move_y", 0)
        //else
         //   serj.ClampMovementSpeed(cmd, me:GetWalkSpeed())
        //end

        --print(serj.fakeLagTicks,me:GetVelocity():Length2D())
end

    if serj.cfg.Vars["fl_peek"] then
        if serj.isPeeking() and !peeked then
            peeked = true
            serj.bsendpacket = false
            peeked = false
        else
            serj.bsendpacket = true
        end
    end

    if serj.cfg.Vars["Arm breaker"] and bSendPacket and !shiftingTickbase then
		if serj.cfg.Vars.ArmBreakerMode == "Full" then
			SetTyping(cmd)
		elseif serj.cfg.Vars.ArmBreakerMode == "Random" and mrandom(0, 1) == 0 then
			SetTyping(cmd)
		elseif serj.cfg.Vars.ArmBreakerMode == "Up/Down" and (cmd:CommandNumber() % 64) >= 32 then
			SetTyping(cmd)
		end
	end

    if !serj.cfg.Vars["fl_enable"] or (serj.cfg.Vars["fl_ladder"] and me:GetMoveType() == MOVETYPE_LADDER) or (serj.cfg.Vars["fl_use"] and cmd:KeyDown(IN_USE)) then
        serj.bsendpacket = true
    else
        serj.bsendpacket = false
        if serj.fakeLagTicks <= 0 then
            serj.fakeLagTicks = serj.fakeLagfactor
            serj.bsendpacket = true
        else
            serj.fakeLagTicks = serj.fakeLagTicks - 1
        end
    end

    if not me:Alive() then serj.bsendpacket = true end

end

--serj.predictedWeapons = {["weapon_crossbow"] = 3110}
--serj.predictedWeapons = {["rust_boltrifle"] = 4110}
--serj.predictedWeapons = {["rust_ak47u"] = 3110}
--serj.predictedWeapons = {["rust_lr300"] = 3110}
--serj.predictedWeapons = {["rust_mp5"] = 3110}
--serj.predictedWeapons = {["rust_python"] = 3110}

local VelPredict, IsVisible
do

function serj.Prediction(target,pos)
    if serj.cfg.Vars["test_pred"] then
		--return tvel == vector_origin and vec or vec + tvel * TICK_INTERVAL * RealFrameTime() - lvel * TICK_INTERVAL
	end

end

function serj.GetServerTime()
    -- Пример реализации
    return CurTime()  -- текущее время
end

function serj.AimTarget(cmd)
	local newTarget = nil
	local newTargetPos = Vector(0, 0, 0)
	local newTargetAng = Angle(0, 0, 0)
	local newTargetFov = 360
    local latency = 0.00000000001
    --local lat = TICKS_TO_TIME(EstimateServerArriveTick()) -- dodelat
    local plr = LocalPlayer():GetEyeTrace().Entity
    --local lvel, tvel = me:GetVelocity(), v:GetVelocity() -- tvel человек - lvel - me

	for k, v in pairs(player.GetAll()) do
		if serj.ValidateTarget(v) then
            local aimVector = serj.getAimHitbox(v)
            local lvel, tvel = me:GetVelocity(), v:GetVelocity() -- tvel человек - lvel - me
            local aimAngle = (aimVector - me:EyePos()):Angle()
            aimAngle:Normalize()

            if serj.cfg.Vars["target_selection"] == 1 then
                local aimVector = serj.getAimHitbox(v)
                --local lvel, tvel = me:GetVelocity(), v:GetVelocity() -- tvel человек - lvel - me
                if serj.cfg.Vars["pred_ict"] then
                    local lookFactor = 1.0
                    local velocityAdjustment = v:GetVelocity() * (engine.TickInterval() + serj.cfg.Vars["pred_ictik"] / 5100)
                    local verticalLook = Vector(0, 0, 0)
                    aimVector = aimVector + (velocityAdjustment + verticalLook * lookFactor)
                end

                if serj.cfg.Vars["pred_ict2"] then
    local lookFactor = 1.0
    local ping = ded.GetLatency(1) * 1 -- Multiply latency by 2 to account for round trip
    local velocityAdjustment = v:GetVelocity() * (engine.TickInterval() + serj.cfg.Vars["pred_ictik2"] / 2100 + ping)
    local verticalLook = Vector(0, 0, 1)
    aimVector = aimVector + (velocityAdjustment + verticalLook * lookFactor)
end


                if serj.cfg.Vars["engine_pred"] then
                aimVector = aimVector + tvel * TickInterval   --VecOrigin and aimVector or aimVector + tvel * TICK_INTERVAL --* RealFrameTime() + tvel * TICK_INTERVAL
    --end
end

                --if serj.cfg.Vars["engine_pred"] then
                --    aimVector = VecOrigin and aimVector or aimVector + tvel * TICK_INTERVAL * RealFrameTime() + tvel * TICK_INTERVAL
                --end

                if serj.cfg.Vars["engineC_pred"] then
                        aimVector = aimVector + tvel * 0
                    end
                --end


                --if serj.cfg.Vars["engineC_pred"] then
                    --aimVector = aimVector + Vector(tvel - lvel)
                --end

                if serj.cfg.Vars["velocity_pred"] then
                    --local latency = 0.1
                    aimVector = aimVector + plr:GetPos() - (tvel * latency)
                end

                --if serj.cfg.Vars["velocity_pred"] then
                --    aimVector = aimVector + ((lvel - tvel) * (RealFrameTime() / (1 / TICK_INTERVAL)))
                --end




                if serj.cfg.Vars["classic_pred"] then
                    aimVector = aimVector + (tvel * TICK_INTERVAL)
                end

                --if serj.cfg.Vars["no_lag4"] then
                 --   local tickInterval = engine.TickInterval()
                 --   local aimVectorAdjustment = Vector(2 * (tickInterval * 10))
                --    aimVector = aimVector + aimVectorAdjustment
               -- end


                --if serj.cfg.Vars["no_lag4"] then
                --    aimVector = aimVector + Vector(2 * (engine.TickInterval()*10))
                --end







                --if serj.cfg.Vars["pred_tick"] then
                   --aimVector = aimVector + VecOrigin and Vector( ( ded.GetLatency(0) + ded.GetLatency(9) ) * 1000 )
                --end

                if serj.cfg.Vars["Disable_Sequence_interpolation"] then
                    ded.SetSequenceInterpolation(false)
                end

                if serj.cfg.Vars["aim_jump_check"] && !LocalPlayer():IsOnGround() then return false end

                if serj.cfg.Vars["NoAimLag"] then
    local closestEnemy
    local closestDistance = math.huge

    for _, enemy in pairs(player.GetAll()) do
        if enemy ~= me and enemy:Alive() then
            local distance = me:GetPos():DistToSqr(enemy:GetPos())

            if distance < closestDistance then
                closestEnemy = enemy
                closestDistance = distance
            end
        end
    end

    if closestEnemy then
        local aimDirection = (closestEnemy:GetPos() - me:GetPos()):GetNormalized()

        local aimAngles = aimDirection:Angle()
        local currentAngles = me:EyeAngles()

        local deltaAngles = (aimAngles - currentAngles)
        deltaAngles:Normalize()

        local sensitivity = 5
        deltaAngles = deltaAngles * sensitivity

        local newAngles = currentAngles + deltaAngles
        me:SetEyeAngles(newAngles)
    end
end

                --ggggggggg
                if serj.cfg.Vars["Disable_interpolation"] then
                    --ded.SetInterpolation(true)
                --else
                    --ded.SetInterpolation(false)
                end

                --ded.SetInterpolation(false)
                --ded.SetSequenceInterpolation(false)
                --ded.NetSetConVar("cl_interpolate","0")
                --ded.NetSetConVar("cl_interp","0.0000001")
                --ded.SetCommandTick(cmd, TIME_TO_TICKS( ded.GetSimulationTime( v:EntIndex() ) ) )

                --[[if serj.cfg.Vars["LagFix"] then
                    local targetTime = aimVector
                    local timeOffset = serj.GetLerpTime(cmds) - targetTime

                    local serverArriveTick = serj.GetLerpTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)

                    if not serj.IsMoving() or (serverArriveTick - aimVector) < 0.2 then
                        serj.SetTargetInterp(0)
                        ded.SetCommandTick(cmd, TIME_TO_TICKS(targetTime + serj.GetLerpTime()))
                    else
                        serj.SetTargetInterp(serj.GetLerpTime(cmd) - targetTime)
                        ded.SetCommandTick(cmd, TIME_TO_TICKS(targetTime + serj.GetLerpTime()))
                    end
                else
                    local simTime = ded.GetSimulationTime(plr:EntIndex())

                    if serj.cfg.Vars["Forwardtrack"] and serj.IsMoving() then
                        local predTime = (ded.GetLatency(0) + ded.GetLatency(1)) * serj.cfg.Vars["Forwardtrack_time"]
                        simTime = simTime + predTime
                    end

                    ded.SetCommandTick(cmd, TIME_TO_TICKS(simTime))
                end]]

        --if serj.cfg.Vars["no_lage"] then

            --if serj.cfg.Vars["no_lag"] then
                -- Fixing sequence manipulation issue
                --local latency = ded.GetLatency(0) + ded.GetLatency(1)
                --aimVector = aimVector + latency * serj.cfg.Vars["nolage_time"]
            --end



            --aimVector = aimVector + (ded.GetLatency(0) + ded.GetLatency(1)) * serj.cfg.Vars["nolage_time"]
            --local tick = TIME_TO_TICKS(simTime)
            --simTime = simTime + predTime -- + tick
        --end

        --[[if serj.cfg.Vars["no_lag"] then
            local latency = ded.GetLatency(0) + ded.GetLatency(1)
            aimVector = aimVector + latency * serj.cfg.Vars["nolag_time"]
            simTime = simTime + (ded.GetLatency(0) + ded.GetLatency(1)) * serj.cfg.Vars["nolag_time"]
        end]]

        if serj.cfg.Vars["Extrapolation2"] and v ~= LocalPlayer() then
            local predTime = ded.GetLatency(1) + ded.GetLatency(1)
            ded.StartSimulation(v:EntIndex())

            local pos = v:GetPos()
            local forwardVector = v:GetForward()
            local distanceToMove = 100  -- желаемое расстояние

            for tick = 1, TIME_TO_TICKS(predTime) do
                ded.SimulateTick()

                local data = ded.GetSimulationData()
                debugoverlay.Box(data.m_vecAbsOrigin, v:OBBMins(), v:OBBMaxs(), 0.1, Color(255, 25, 25, 8))

                -- позиция
                pos = pos + forwardVector * distanceToMove / TIME_TO_TICKS(predTime)
                v:SetPos(pos)
            end

            ded.FinishSimulation()
            v:SetRenderOrigin(pos)
            v:SetNetworkOrigin(pos)
            v:InvalidateBoneCache()
            v:SetupBones()
        end


        if serj.cfg.Vars["Extrapolation3"] and v ~= me then
    local latency = ded.GetLatency(0) + ded.GetLatency(0)
    local tickCount = TIME_TO_TICKS(latency)

    ded.StartSimulation(v:EntIndex())

    local stop = v:GetNetworkOrigin()

    for tick = 1, tickCount do
        ded.SimulateTick()

        if tick == tickCount then
            local data = ded.GetSimulationData()
            local pos = data.m_vecAbsOrigin

            local forwardOffset = Vector(0, 25, 0) -- Adjust forward offset as needed
            local predictedPos = pos + forwardOffset

            v:SetPos(predictedPos)
            v:SetNetworkOrigin(predictedPos)
            v:SetRenderOrigin(predictedPos)
            v:InvalidateBoneCache()
            v:SetupBones()
        end
    end

    ded.FinishSimulation()
end

            if serj.cfg.Vars["Extrapolation"] and v != me then
                local predTime = ( ded.GetLatency(0) + ded.GetLatency(1) )

                ded.StartSimulation( v:EntIndex() )

                local pos = v:GetNetworkOrigin()

                print( TIME_TO_TICKS( predTime ) )

                for tick = 1, TIME_TO_TICKS( predTime ) do
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

            --[[]if serj.cfg.Vars["Forwardtrack"] then
                local predTime = ( ded.GetLatency(0) + ded.GetLatency(9) ) * serj.cfg.Vars["Forwardtrack_time"]
                ded.StartSimulation( v:EntIndex() )

                local prevPos = v:GetNetworkOrigin()
                for tick = 1, TIME_TO_TICKS(predTime) do
                    ded.SimulateTick()

                    local data = ded.GetSimulationData()
                    debugoverlay.Line(prevPos, data.m_vecAbsOrigin, 0.1, color_white, true)

                    prevPos = data.m_vecAbsOrigin
                end

                local data = ded.GetSimulationData()



                ded.FinishSimulation()
            end]]

            if serj.cfg.Vars["tick_pred"] then
                local currentTick = 25
                local backtrackTicks = 100

                for tick = currentTick - backtrackTicks, currentTick do
                    if opponents and next(opponents) ~= nil then
                        for _, opponent in pairs(opponents) do
                            if opponent:IsValid() then
                                local position = GetOpponentPositionAtTick(opponent, tick)
                                -- Move opponent to the backtracked position
                                opponent:SetPos(position)
                            end
                        end
                    end
                end
            end

            if serj.cfg.Vars["tickPred"] then
                aimVector = aimVector + (v:GetVelocity() * (engine.TickInterval()+5/10))
            end

            if serj.cfg.Vars["ticki"] then
                aimVector = aimVector + (v:GetVelocity() * (engine.TickInterval()+1.8/12))
            end

            if serj.cfg.Vars["ticki2"] then
                aimVector = aimVector + (v:GetVelocity() * (engine.TickInterval()+1/12))  --+serj.cfg.Vars["pred_ictik"]
            end

            if serj.cfg.Vars["tickfix"] then
                local tickfixMultiplier = 1
                local tickfixTime = serj.cfg.Vars["tickfix_time"] or 0

                aimVector = aimVector + (v:GetVelocity() * (engine.TickInterval() + tickfixTime / 12) * tickfixMultiplier)
            end


            --if serj.cfg.Vars["tickfix"] then
            --    aimVector = aimVector + (v:GetVelocity() * (engine.TickInterval()+serj.cfg.Vars["tickfix_time"]/12))  --+serj.cfg.Vars["pred_ictik"]
            --end




                --print(serj.cfg.Vars["ticker"], serj.activebinds["key_tick"])
                if serj.cfg.Vars["ticker"] then
                    if not serj.CanShoot( cmd ) then return end

    local plys = serj.GetSortedPlayers(serj.cfg.Vars["target_selection"])
    --local maxplys       = serj.cfg.vars["Max_targets"]

    if !plys then return end

    for i = 1, #plys do
        local ply = plys[i][1]

        local eyePos        = me:EyePos()

        local plyPos        = ply:GetPos()
        local plyCenter     = ply:OBBCenter()

        local aimPos        = plyPos + plyCenter
        local aimAngle      = ( aimPos - eyePos ):Angle()
        local aimVector     = aimAngle:Forward()

        local velStart      = aimVector * 600

        local distance      = eyePos:Distance( aimPos )
        local travelTime    = distance / 10000

        // Movement simulation
        local predTime      = ( ded.GetLatency( 0 ) + ded.GetLatency( 1 ) ) + travelTime

        if predTime > serj.cfg.Vars["Simulation_limit"] then continue end

        ded.StartSimulation( ply:EntIndex() )

        for i = 1, TIME_TO_TICKS( predTime ) do
            ded.SimulateTick()
        end

        local data          = ded.GetSimulationData()

        aimPos              = data.m_vecAbsOrigin + plyCenter
        distance            = eyePos:Distance( aimPos )
        travelTime          = distance / 10000

        ded.FinishSimulation()

        // Gravity simulation
        local gravity       = GetConVar("sv_gravity"):GetFloat() * serj.cfg.Vars["bullet_pred"]
        gravity             = ( gravity * TickInterval ) * TIME_TO_TICKS( travelTime )

        aimPos.z            = aimPos.z + gravity

        // Aimbot

        local finalVec = Vector( aimPos.x, aimPos.y, aimPos.z )
        local finalAng = ( finalVec - eyePos ):Angle()
        finalAng:Normalize()

        debugoverlay.Line( plyPos + plyCenter, finalVec, 0.1, color_white, true )

        cmd:SetViewAngles( finalAng )
    end
end

                local aimAngle = (aimVector - me:EyePos()):Angle()
                aimAngle:Normalize()
                local aimFov = mabs(mNormalizeAng(serj.fa.y - aimAngle.y)) + mabs(mNormalizeAng(serj.fa.p - aimAngle.p))

                if aimFov < newTargetFov then
                    newTarget = v
                    newTargetPos = aimVector
                    newTargetAng = aimAngle
                    newTargetFov = aimFov
                end
            elseif serj.cfg.Vars["target_selection"] == 2 then
                --if GetClosestAimTarget() == nil then return end
                local aimVector = serj.getAimHitbox(serj.GetClosestAimTarget())
                local aimAngle = (aimVector - me:EyePos()):Angle()
                aimAngle:Normalize()

                newTarget = serj.GetClosestAimTarget()
                newTargetPos = aimVector
                newTargetAng = aimAngle
            elseif serj.cfg.Vars["target_selection"] == 3 then
                local aimVector = serj.getAimHitbox(serj.GetLowestHealth())
                local aimAngle = (aimVector - me:EyePos()):Angle()
                aimAngle:Normalize()

                newTarget = serj.GetLowestHealth()
                newTargetPos = aimVector
                newTargetAng = aimAngle
            end

		end
	end
--end

    if serj.cfg.Vars["Backtrack"] then
        local ticks = serj.FindBacktrack( cmd, ply )

        if serj.btrecords[ ply ] and not ply.break_lc then
            local ts = 0

            if serj.cfg.Vars["Backtrack_mode"] == 3 then
                for p = 1, #ticks do
                    if not serj.btrecords[ ply ][ p ] then continue end

                    aimAng = ( serj.btrecords[ ply ][ p ].aimpos - me:EyePos() ):Angle()

                    serj.traceStruct.start = me:EyePos()
                    serj.traceStruct.endpos = serj.btrecords[ ply ][ p ].aimpos
                    serj.traceStruct.filter = me
                    serj.traceStruct.mask = MASK_SHOT

                    local tr = TraceLine( serj.traceStruct )

                    if !tr.Hit or tr.Entity == ply then
                        serj.target = ply
                        serj.backtracktick = p

                        return ply, serj.btrecords[ ply ][ p ].aimpos, aimAng, true, p
                    end
                end
            end

            if serj.cfg.Vars["Backtrack_mode"] == 3 then return end

            if serj.cfg.Vars["Backtrack_mode"] == 1 then
                ts = serj.FindFirstHittableTicks( ply, cmd )
            elseif serj.cfg.Vars["Backtrack_mode"] == 2 then
                ts = serj.FindClosestHittableTicks( ply, cmd )
            end

            if not serj.btrecords[ ply ][ ts ] then return end

            aimAng = ( serj.btrecords[ ply ][ ts ].aimpos - me:EyePos() ):Angle()

            serj.traceStruct.start = me:EyePos()
            serj.traceStruct.endpos = serj.btrecords[ ply ][ ts ].aimpos
            serj.traceStruct.filter = me
            serj.traceStruct.mask = MASK_SHOT

            local tr = TraceLine( serj.traceStruct )

            if !tr.Hit or tr.Entity == ply then
                serj.target = ply
                serj.backtracktick = ts

                return ply, serj.btrecords[ ply ][ ts ].aimpos, aimAng, true, ts
            end
        end
    end

	serj.target = newTarget
	serj.targetVector = newTargetPos
	serj.targetAngle = newTargetAng
	serj.targetFov = newTargetFov

    if IsValid(me:GetActiveWeapon()) and me:GetActiveWeapon():GetClass() == "weapon_crossbow" and serj.cfg.Vars["aim_enable"] and serj.CanShoot() and serj.ValidateTarget(serj.target) and serj.VisibleCheck(serj.target,serj.targetVector) then
        serj.targetVector = serj.Prediction(serj.target, serj.targetVector)
    end
end

--function Predict(plr,pos)
  --  pos = pos + (plr:GetVelocity() * (engine.TickInterval()+serj.cfg.Vars["pred_ictik"][3]/1000))
 --   return pos
--end

function serj.onehad2()
    local modelexample = ClientsideModel( "models/Items/item_item_crate_chunk01.mdl" )
    modelexample:SetNoDraw( true )

    local offsetvec = Vector( 12224, -22220, 2220 )
    local offsetang = Angle( 122211, -922220, -92220 )

    hook.Add( "PostPlayerDraw" , "manual_model_draw_example" , function( ply )
        local boneid = ply:LookupBone( "ValveBiped.Bip01_Spine2" )

        if not boneid then
            return
        end

        local matrix = ply:GetBoneMatrix( boneid )

        if not matrix then
            return
        end

        local newpos, newang = LocalToWorld( offsetvec, offsetang, matrix:GetTranslation(), matrix:GetAngles() )

        modelexample:SetPos( newpos )
        modelexample:SetAngles( newang )
        modelexample:SetupBones()
        modelexample:DrawModel()
    end)
end

function serj.onehad1()
    local modelexample = ClientsideModel( "models/maxofs2d/hover_rings.mdl" )
    modelexample:SetNoDraw( true )

    local offsetvec = Vector( 16, 4, 0 )
    local offsetang = Angle( 115, -90, -90 )

    hook.Add( "PostPlayerDraw" , "manual_model_draw_example" , function( ply )
        local boneid = ply:LookupBone( "ValveBiped.Bip01_Spine2" )

        if not boneid then
            return
        end

        local matrix = ply:GetBoneMatrix( boneid )

        if not matrix then
            return
        end

        local newpos, newang = LocalToWorld( offsetvec, offsetang, matrix:GetTranslation(), matrix:GetAngles() )

        modelexample:SetPos( newpos )
        modelexample:SetAngles( newang )
        modelexample:SetupBones()
        modelexample:DrawModel()
    end)
end

function serj.onehad5()
    local modelexample = ClientsideModel( "models/balloons/balloon_classicheart.mdl" )
    modelexample:SetNoDraw( true )

    local offsetvec = Vector( -10, -3, 0 )
    local offsetang = Angle( 115, -90, -90 )

    hook.Add( "PostPlayerDraw" , "manual_model_draw_example" , function( ply )
        local boneid = ply:LookupBone( "ValveBiped.Bip01_Spine2" )

        if not boneid then
            return
        end

        local matrix = ply:GetBoneMatrix( boneid )

        if not matrix then
            return
        end

        local newpos, newang = LocalToWorld( offsetvec, offsetang, matrix:GetTranslation(), matrix:GetAngles() )

        modelexample:SetPos( newpos )
        modelexample:SetAngles( newang )
        modelexample:SetupBones()
        modelexample:DrawModel()
    end)
    end

    function serj.onehad4()
local modelexample = ClientsideModel( "models/Roller.mdl" )
modelexample:SetNoDraw( true )

local offsetvec = Vector( 16, 4, 0 )
local offsetang = Angle( 115, -90, -90 )

hook.Add( "PostPlayerDraw" , "manual_model_draw_example" , function( ply )
    local boneid = ply:LookupBone( "ValveBiped.Bip01_Spine2" )

    if not boneid then
        return
    end

    local matrix = ply:GetBoneMatrix( boneid )

    if not matrix then
        return
    end

    local newpos, newang = LocalToWorld( offsetvec, offsetang, matrix:GetTranslation(), matrix:GetAngles() )

    modelexample:SetPos( newpos )
    modelexample:SetAngles( newang )
    modelexample:SetupBones()
    modelexample:DrawModel()
end)
end

function serj.onehad()
local modelexample = ClientsideModel( "models/noesis/donut.mdl" )
modelexample:SetNoDraw( true )

local offsetvec = Vector( 21, 4, 0 )
local offsetang = Angle( 115, -90, -90 )

hook.Add( "PostPlayerDraw" , "manual_model_draw_example" , function( ply )
    local boneid = ply:LookupBone( "ValveBiped.Bip01_Spine2" )

    if not boneid then
        return
    end

    local matrix = ply:GetBoneMatrix( boneid )

    if not matrix then
        return
    end

    local newpos, newang = LocalToWorld( offsetvec, offsetang, matrix:GetTranslation(), matrix:GetAngles() )

    modelexample:SetPos( newpos )
    modelexample:SetAngles( newang )
    modelexample:SetupBones()
    modelexample:DrawModel()
end)
end

function serj.onehad7()
    local modelexample = ClientsideModel( "models/player/items/humans/top_hat.mdl" )
    modelexample:SetNoDraw( true )

    local offsetvec = Vector( 11, 4, -1 )
    local offsetang = Angle( 115, -90, -90 )

    hook.Add( "PostPlayerDraw" , "manual_model_draw_example" , function( ply )
        local boneid = ply:LookupBone( "ValveBiped.Bip01_Spine2" )

        if not boneid then
            return
        end

        local matrix = ply:GetBoneMatrix( boneid )

        if not matrix then
            return
        end

        local newpos, newang = LocalToWorld( offsetvec, offsetang, matrix:GetTranslation(), matrix:GetAngles() )

        modelexample:SetPos( newpos )
        modelexample:SetAngles( newang )
        modelexample:SetupBones()
        modelexample:DrawModel()
    end)
end

    function serj.onehad6()
        local modelexample = ClientsideModel( "models/maxofs2d/cube_tool.mdl" )
        modelexample:SetNoDraw( true )

        local offsetvec = Vector( 19, 4, 0 )
        local offsetang = Angle( 115, -90, -90 )

        hook.Add( "PostPlayerDraw" , "manual_model_draw_example" , function( ply )
            local boneid = ply:LookupBone( "ValveBiped.Bip01_Spine2" )

            if not boneid then
                return
            end

            local matrix = ply:GetBoneMatrix( boneid )

            if not matrix then
                return
            end

            local newpos, newang = LocalToWorld( offsetvec, offsetang, matrix:GetTranslation(), matrix:GetAngles() )

            modelexample:SetPos( newpos )
            modelexample:SetAngles( newang )
            modelexample:SetupBones()
            modelexample:DrawModel()
    end)
end

function getWeapon( ent )
	local wep = ent:GetActiveWeapon()
	if ( IsValid(wep) ) then
		return wep:GetClass()
	else
		return false
	end
end

function serj.Aim(cmd)
	if cmd:CommandNumber() == 0 then return end

    local plr = LocalPlayer():GetEyeTrace().Entity
    local lvel, tvel = me:GetVelocity(), plr:GetVelocity()
    local TICK_INTERVAL = engine.TickInterval()
    --local lvel, tvel = ply:GetVelocity()

    local wep = getWeapon(me)
	local wepactive = me:GetActiveWeapon()

	if serj.cfg.Vars["aim_enable"] and serj.activebinds["key_aim"] and serj.CanShoot() and serj.ValidateTarget(serj.target) and serj.VisibleCheck(serj.target,serj.targetVector) then
        local finalAngle = serj.targetAngle

        --if serj.cfg.Vars["no_lag"] then
        --    ded.SetCommandTick(cmd, TIME_TO_TICKS( ded.GetSimulationTime( serj.target:EntIndex() ) ) )
        --end

        if serj.cfg.Vars["pizdec"] then
            local t = TIME_TO_TICKS(ded.GetSimTime(v:EntIndex()))
        end

        if serj.cfg.Vars["aim_norecoil"] then
            finalAngle = serj.NoRecoil(finalAngle)
        end

        --if serj.cfg.Vars["no_lag"] then



            --local updaterate = engine.GetConVar("cl_updaterate"):GetFloat()
                --local minupdate = engine.GetConVar("sv_minupdaterate")
                --local maxupdate = engine.GetConVar("sv_maxupdaterate")

                --if minupdate and maxupdate then
                    --updaterate = maxupdate:GetFloat()
                --end

                --local ratio = engine.GetConVar("cl_interp_ratio"):GetFloat()

                --if ratio == 0 then
                --    ratio = 1.0
                --end

                --local lerp = engine.GetConVar("cl_interp"):GetFloat()



        --AntiAimData.real = cmd:GetViewAngles()
        --AntiAimData.nonLBYReal = cmd:GetViewAngles()
        --AntiAimData.fake = cmd:GetViewAngles()
        --LastSentPos = LocalPlayer():GetPos()
        --end

        if serj.cfg.Vars["aim_nospread"] then
            finalAngle = serj.Nospread(cmd,finalAngle)
        end

        if serj.cfg.Vars["legit_smooth"] then
            finalAngle = serj.Smoothing(finalAngle)
        end
        //serj.guiCheckBox("FOV  limit","legit_fov",legpan)
        //serj.CreateSlider("Max FOV", "°", "legit_fov_val", 1, 180, 0, legpan)


        if serj.cfg.Vars["legit_fov"] then
            local fov = serj.cfg.Vars["legit_fov_val"]

            local view = serj.cfg.Vars["sa_enable"] and serj.fa or cmd:GetViewAngles()
            local ang = serj.targetAngle - view

            ang:Normalize()

            ang = msqrt(ang.x * ang.x + ang.y * ang.y)

            if ang > fov then
                return
            end
        end

        cmd:SetViewAngles(finalAngle)

        if serj.cfg.Vars["af_enable"] then
            serj.bsendpacket = true
            cmd:AddKey(IN_ATTACK)
        end
        if serj.cfg.Vars["sa_enable"] or serj.cfg.Vars["aa_enable"] then
    	    serj.MovementFix(cmd)
        end
	else
        serj.Antihit(cmd)
    end
end
end

function GetServerTime(cmd)
    if cmd == "get" then
        return os.date("%c", os.time()) -- Возвращаю текущую дату и время в удобочитаемом формате
    else
        return "Invalid command"
    end
end

function serj.GetManipulateInterp(targetTime, cmd)
    --local targetTime = serj.aim()
    --local aimAngle = (aimVector - me:EyePos()):Angle()
    aimAngle:Normalize()
    local serverArriveTick = serj.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local interpDelta = serj.GetServerTime(cmd) - targetTime

    if serverArriveTick - targetTime < 0.2 then
        serj.SetTargetInterp(0)
        ded.SetCommandTick(cmd, TIME_TO_TICKS(targetTime + serj.GetLerpTime()))
    else
        serj.SetTargetInterp(interpDelta)
        ded.SetCommandTick(cmd, TIME_TO_TICKS(targetTime + serj.GetLerpTime()))
    end
end

function serj.GetLerpTime()
    if GetConVar("cl_interpolate"):GetInt() == 0 then return 0 end

    local lerpRatio = GetConVar("cl_interp_ratio"):GetFloat()
    if lerpRatio == 0 then
        lerpRatio = 1
    end

    local lerpAmount = GetConVar("cl_interp"):GetFloat()
    if serj.GetManipulateInterp() then
        lerpAmount = serj.GetTargetInterp()
    end

    local updateRate = GetConVar("cl_updaterate"):GetFloat()
    local baseLerpTime = mmax(lerpAmount, lerpRatio / updateRate)
    local player = LocalPlayer()

    if not IsValid(player) then return baseLerpTime end

    local ping = player:Ping()
    local packetLoss = player:PacketLoss()

    local adjustedLerpTime = baseLerpTime + (ping / 1000) + (packetLoss * 0.1)

    return adjustedLerpTime
end

function serj.SilentViewAngles(ply, originn, angles, fov, znear, zfar, pos)
	local view = {}

    if serj.cfg.Vars["move_fd"] and serj.activebinds["key_fd"] then
        originn.z = me:GetPos().z + 14
    end

    local observingPlayers = {}
observingPlayers.watcher = {}
observingPlayers.spec = {}

    serj.vieworigin = me:EyePos()
    serj.viewfov    = 0
    serj.znear      = 0

    serj.tpenabled = false
    serj.tptoggled = false

    serj.fcvector = me:EyePos()
    serj.fcangles = me:EyeAngles()
    serj.fcenabled = false
    serj.fctoggled = false

    serj.tpsmooth = serj.tpsmooth or 0

    if serj.cfg.Vars["misc_3rdp"] and serj.tperson then
        serj.tpsmooth = math.Approach(serj.tpsmooth,serj.cfg.Vars["misc_3rdp_d"]* 10,FrameTime()*math.Round(serj.cfg.Vars["misc_3rdp_s"]*10))
    else
        serj.tpsmooth = math.Approach(serj.tpsmooth,0,FrameTime()*math.Round(serj.cfg.Vars["misc_3rdp_s"]*10))
    end

    if serj.tpsmooth != 0 then
        if serj.cfg.Vars["misc_3rdp_coll"] then
	        view.origin = TraceLine({
                start = originn,
                endpos = originn - ( serj.fa:Forward() * serj.tpsmooth ),
                filter = me,

            }).HitPos
        else
            view.origin = originn - ( serj.fa:Forward() * serj.tpsmooth )
        end

        if ( serj.cfg.Vars["antiaim_enable"] and (serj.cfg.Vars["real_chams"] or serj.cfg.Vars["fake_chams"]) )  then
            view.drawviewer = false
        else
            view.drawviewer = true
        end
    else
        view.origin = originn
    end

	view.angles = ( serj.cfg.Vars["sa_enable"] or serj.cfg.Vars["aa_enable"] ) and serj.fa or view.angles

    if serj.cfg.Vars["misc_ofov"] then
	    view.fov = serj.cfg.Vars["misc_ofov_v"]
    end

    serj.vieworigin = view.origin
	return view
    end


function serj.CalcViewModelView(wep, vm, oldPos, oldAng, pos, ang)

	--pos = me:GetShootPos()
    pos = serj.vieworigin
	ang = ( serj.cfg.Vars["sa_enable"] or serj.cfg.Vars["aa_enable"] ) and serj.fa or ang

	if serj.cfg.Vars["misc_viewmodel"] then
		local OverridePos = Vector(serj.cfg.Vars["misc_vm_x"], serj.cfg.Vars["misc_vm_y"], serj.cfg.Vars["misc_vm_z"])
		local OverrideAngle = Angle(serj.cfg.Vars["misc_vm_p"], serj.cfg.Vars["misc_vm_ya"], serj.cfg.Vars["misc_vm_r"])

		ang = ang * 1

		ang:RotateAroundAxis(ang:Right(), OverrideAngle.x * 1.0)
		ang:RotateAroundAxis(ang:Up(), OverrideAngle.y * 1.0)
		ang:RotateAroundAxis(ang:Forward(), OverrideAngle.z* 1.0)

		pos = pos + OverridePos.x * ang:Right() * 1.0
		pos = pos + OverridePos.y * ang:Forward() * 1.0
		pos = pos + OverridePos.z * ang:Up() * 1.0
    end

    --serj.vpos = pos.z

	return pos, ang
end

hook.Add( "Think", "knockfast", function()
    if serj.cfg.Vars["knock_fast"] then
    net.Start("gRust.knock")
    net.SendToServer()
end
end)

hook.Add( "Think", "itemstealer", function()
    if serj.cfg.Vars["Item_stealer"] then
        GrabItems()
    end
end)

local animstarts = 0
hook.Add( "Think", "BUggANIMATIOEADA", function()
    if serj.cfg.Vars["bug_anim"] then
    if animstarts >= 80 then
        net.Start("gRust.Drop")
        net.WriteEntity(LocalPlayer())
        net.WriteUInt(99999, 6)
        net.WriteUInt(0, 20)
        net.SendToServer()
        animstarts = 0
    else
        animstarts = animstarts + 1
    end
end
end)

function GrabItems()
    local function GrabItem(item, to, ent, count)
        net.Start("gRust.Inventory.Move")
        net.WriteEntity(ent)
        net.WriteEntity(LocalPlayer())
        net.WriteUInt(item, 6)
        net.WriteUInt(to, 6)
        net.WriteUInt(count, 20)
        net.SendToServer()
end
end

hook.Add( "Think", "BM_Clients_Key", function()
    if serj.cfg.Vars["Inventory_stealer"] and ("Entity: "..LocalPlayer():GetEyeTrace().Entity:GetClass().."["..LocalPlayer():GetEyeTrace().Entity:EntIndex().."]") then
    if (a or 0) < CurTime() and input.IsKeyDown( KEY_PAGEUP ) then
    	a = CurTime() + 0.3
    	Menu:ToggleVisible()
    end

	if (b or 0) < CurTime() and input.IsKeyDown( KEY_F ) then
    	b = CurTime() + 0.15
    	local plr = LocalPlayer():GetEyeTrace().Entity
		pcall(function()
		    net.Start("gRust.Inventory.Request")
	    	net.WriteEntity(plr)
	    	net.SendToServer()
			for h = 1, 30 do
				if plr.Inventory[h] then
					net.Start("gRust.Inventory.Move")
	    			net.WriteEntity(plr)
		    		net.WriteEntity(LocalPlayer())
		    		net.WriteUInt(h, 6)
		    		net.WriteUInt(h, 6)
		    		net.WriteUInt(plr.Inventory[h]:GetQuantity(), 20)
		    		net.SendToServer()
			    end
		    end
		end)
		for h = 1, 30 do
			net.Start("gRust.Inventory.Move")
			net.WriteEntity(plr)
			net.WriteEntity(LocalPlayer())
			net.WriteUInt(h, 6)
			net.WriteUInt(h, 6)
			net.WriteUInt(1, 20)
			net.SendToServer()
		end
	end

	if (c or 0) < CurTime() and input.IsKeyDown( KEY_J ) and serj.cfg.Vars["Inventory_backer"]:GetBool() then
	    c = CurTime() + 0.15
	    local plr = LocalPlayer():GetEyeTrace().Entity
	    pcall(function()
	        for h = 1, 30 do
	            if LocalPlayer().Inventory[h] then
		        	net.Start("gRust.Inventory.Move")
		        	net.WriteEntity(LocalPlayer())
		        	net.WriteEntity(plr)
		        	net.WriteUInt(h, 6)
		        	net.WriteUInt(h, 6)
		        	net.WriteUInt(LocalPlayer().Inventory[h]:GetQuantity(), 20)
		        	net.SendToServer()
		    	end
	        end
    	end)
	end
end
end )

function serj.AutoReload(cmd)
    if not serj.cfg.Vars["ar_enable"] then
        return
    end

    local weapon = me:GetActiveWeapon()

    if IsValid(weapon) and weapon.Primary then
        local clipSize = weapon:Clip1()
        local maxClipSize = weapon:GetMaxClip1()
        local remainingAmmo = me:GetAmmoCount(weapon:GetPrimaryAmmoType())

        if clipSize == 0 and maxClipSize > 0 and remainingAmmo > 0 then
            cmd:AddKey(IN_RELOAD)
        end
    end
end

serj.hl2guns = {
    ["weapon_357"] = true,
    ["weapon_pistol"] = true,
    ["weapon_bugbait"] = true,
    ["weapon_crossbow"] = true,
    ["weapon_crowbar"] = true,
    ["weapon_frag"] = true,
    ["weapon_physcannon"] = true,
    ["weapon_ar2"] = true,
    ["weapon_rpg"] = true,
    ["weapon_slam"] = true,
    ["weapon_shotgun"] = true,
    ["weapon_smg1"] = true,
    ["weapon_stunstick"] = true,
    ["weapon_fists"] = true,
    ["gmod_camera"] = true,
    ["manhack_welder"] = true,
    ["weapon_medkit"] = true,
    ["gmod_tool"] = true,
    ["weapon_physgun"] = true,
}
serj.side = false
serj.GLPTEST = false
serj.MOVEING = false
serj.lastpos = me:GetPos()
serj.ap_alpha = 0
serj.GLP = me:GetPos()

function serj.moveToPos(cmd, pos)
    local world_forward = (pos - me:GetPos())
    local ang_LocalPlayer = serj.fay
    local govno = (pos - me:GetPos()):Angle()
    govno.r = 0

    cmd:SetForwardMove(10000)
    cmd:SetSideMove(0)
    if serj.cfg.Vars["move_ap_sp"] then
        cmd:AddKey(IN_SPEED)
    end

    serj.pMovementFix(cmd,Angle(0, govno.y, 0))
end

do
    local cooldown = GetConVarNumber("sv_namechange_cooldown_seconds")
    local curtime = CurTime()
    local lastname = me:Name()
    local changed = 0

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

    function serj.nameChanger()
        if curtime > CurTime() then return end

        local pltbl = player_GetAll()

        local len = me:Name():len()

        local mname = string.sub(me:Name(),1,len-1)

        local i = math.random(1,#pltbl)

        if not check(pltbl[i],mname,pltbl) then return end

        changename(pltbl[i]:Name())
    end
end

--[[]
do
    local PLAYER = FindMetaTable( "Player" )

    local Name_     = PLAYER.Name
    local Nick_     = PLAYER.Nick
    local GetName_  = PLAYER.GetName

    function PLAYER:Name()

        if serj.cfg.Vars["Hide_name"] and self == me then
            return serj.cfg.Vars["Custom_name"]
        end

        return Name_( self )
    end

    function PLAYER:Nick()

        if serj.cfg.Vars["Hide_name"] and self == me then
            return serj.cfg.Vars["Custom_name"]
        end

        return Nick_( self )
    end

    function PLAYER:GetName()

        if serj.cfg.Vars["Hide_name"] and self == me then
            return serj.cfg.Vars["Custom_name"]
        end

        return GetName_( self )
    end
end
]]

local pos = me:GetPos()
hook.Add("PrePlayerDraw","airduck",function(me) -- HACKED BY TRAHER$
if serj.cfg.Vars["airduck"] then
    if serj.cfg.Vars["airduck_method"] == 1 then
        local trace = TraceLine({
            start = pos,
            endpos = pos - Vector(0, 0, 1337),
            mask = MASK_SOLID
        })
        local len = (pos - trace.HitPos).z
        if len > 25 and 50 > len then
            cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
                --ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 4));
    end
end
    if serj.cfg.Vars["airduck_method"] == 2 then
        if me:Alive() then
            if !me:IsOnGround() then
                RunConsoleCommand("+duck")
            else
                RunConsoleCommand("-duck")
            end
        end
    end
    if serj.cfg.Vars["airduck_method"] == 3 then
        if me:Alive() then
            if me:IsOnGround() then
                grounded = false
            else
                if(!grounded) then
                    hasJumped = true
                    RunConsoleCommand("+duck")
                    grounded = true
                end
                if(hasJumped) then timer.Simple(0.3, function() RunConsoleCommand("-duck") hasJumped = false end) end
            end
        end
    end
end
end)


hook.Add("PrePlayerDraw","freecum",function(NoclipPos) -- HACKED BY TRAHER$
if serj.cfg.Vars["debugcam"] and NoclipOn then
    --if serj.activebinds["key_cam"] then
    local inspeed, infw, inback, inleft, inright = input.GetKeyCode(input.LookupBinding("+speed")), input.GetKeyCode(input.LookupBinding("+forward")), input.GetKeyCode(input.LookupBinding("+back")), input.GetKeyCode(input.LookupBinding("+moveleft")), input.GetKeyCode(input.LookupBinding("+moveright"))
    -- Had to do it like this instead of LocalPlayer():KeyDown(IN_FORWARD) etc because for some reason that would get stuck on true sometimes after moving and then toggeling, cba to figure it out so this works as a fix.
    local Camera = {}
    local Speed = serj.cfg.Vars["debugcam_speed"]
    local MouseAngs = Angle( NoclipY, NoclipX, 0 )
    if input.IsKeyDown(inspeed) then
        Speed = Speed * 5
    end
    if input.IsKeyDown(infw) then
        NoclipPos = NoclipPos+(MouseAngs:Forward()*Speed)
    end
    if input.IsKeyDown(inback) then
        NoclipPos = NoclipPos-(MouseAngs:Forward()*Speed)
    end
    if input.IsKeyDown(inleft) then
        NoclipPos = NoclipPos-(MouseAngs:Right()*Speed)
    end
    if input.IsKeyDown(inright) then
        NoclipPos = NoclipPos+(MouseAngs:Right()*Speed)
    end
    if NoclipJump then
        NoclipPos = NoclipPos+Vector(0,0,Speed)
    end
    if NoclipDuck then
        NoclipPos = NoclipPos-Vector(0,0,Speed)
    end
    Camera.origin = NoclipPos
    Camera.angles = MouseAngs
    Camera.fov = FOV
    Camera.drawviewer = true
    return Camera
end
end)

hook.Add("HUDPaint", "AdminchikList", function()
    local onlineStaff = {}
    if serj.cfg.Vars["misc_adminlist"] then
    local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
        for k, v in ipairs(onlineStaff) do
            if IsValid(v) then
                local a
                local x,y = math.Round(serj.cfg.Vars["misc_adminlist_x"]), math.Round(serj.cfg.Vars["misc_adminlist_y"])
                surfSetFont("EternityFont")
                local w = surfGetTextSize("Admins Online")
                if v:IsSuperAdmin() then a =  " (" .. v:GetUserGroup() .. ") " elseif v:IsAdmin() then a = "(" .. v:GetUserGroup() .. ")" else a = v:GetUserGroup() end
                draw.RoundedBox( 3, x, y, 200, 25, Color(25,25,25))
                draw.RoundedBox( 10, x+2, y+1, 196, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))

                surfSetDrawColor( 255, 255, 255, 60 )
                surface.SetMaterial(Material("gui/center_gradient"))
                surfDrawTexturedRect(x+4, y+1, 200-4, 3)

                draw.SimpleText( "Admins Online", "EternityFont", x+(200/2) - w/2, y+5, color_white )

                surfSetFont("EternityFont")
                local nameWidth, nameHeight = surfGetTextSize(v:Name().." ("..a..")")
                surfSetDrawColor( 11, 11, 11, 200 )
                surface.SetMaterial(Material("gui/gradient"))
                surfDrawTexturedRect(x+2, y+28 + (15 * ( k - 1 ) ), nameWidth + 50, nameHeight)
                draw.SimpleText(v:Name()..a, "EternityFont", x+3, y+28 + (15 * ( k - 1 ) ), Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
            end
        end
    end
end)

hook.Add("HUDPaint", "DrawInfoMenu", function()
    if serj.cfg.Vars["mondelo111"] then
        local currentTime = CurTime()

        local x = serj.cfg.Vars["X_i"] * 20
        local y = serj.cfg.Vars["X_y"] * 20
        local width = 600
        local height = 350

        for i = 1, 100 do
            local snowX = math.random(x, x + width)
            local snowY = math.random(y, y + height)
            draw.RoundedBox(0, snowX, snowY, 2, 2, Color(255, 255, 255))
        end

        --backgroaund
        draw.RoundedBox(8, x, y, width, height, Color(0, 0, 0, 126))

        local speed = LocalPlayer():GetVelocity():Length()
        local pulseSpeed = math.abs(math.sin(currentTime * 2) * 255)
        draw.SimpleText("Speed: " .. math.Round(speed) .. " units/s", "font-02", x + 10, y + 10, Color(pulseSpeed, 255 - pulseSpeed, 255, alpha), 0, 0)

        local weapon = LocalPlayer():GetActiveWeapon()
        if IsValid(weapon) and weapon:IsWeapon() then
            local ammoColor = Color(255, 255, 255, alpha)
            local clipRatio = weapon:Clip1() / weapon:GetMaxClip1()
            if clipRatio <= 0.25 then
                ammoColor = Color(255, 0, 0, alpha)
            elseif clipRatio <= 0.5 then
                ammoColor = Color(255, 165, 0, alpha)
            elseif clipRatio <= 0.75 then
                ammoColor = Color(255, 255, 0, alpha)
            end
            draw.SimpleText("Ammo: " .. weapon:Clip1() .. " / " .. LocalPlayer():GetAmmoCount(weapon:GetPrimaryAmmoType()), "font-02", x + 10, y + 30, ammoColor, 0, 0)
        end

        if IsValid(weapon) and weapon:IsWeapon() then
            draw.SimpleText("Weapon: " .. weapon:GetClass(), "font-02", x + 10, y + 110, Color(255, 255, 255, alpha), 0, 0)
            --draw.SimpleText("Damage: " .. weapon.Primary.Damage, "font-02", x + 10, y + 130, Color(255, 255, 255, alpha), 0, 0)
        end

        -- bullet information
        local eyePos = LocalPlayer():EyePos()
        local aimVector = LocalPlayer():GetAimVector()
        local bulletTrace = util.TraceLine({
            start = eyePos,
            endpos = eyePos + aimVector * 10000,
            filter = LocalPlayer()
        })

        --local damageInfo = bulletTrace.Entity:tostring(string.gsub(health-hurted:Health()))

        local bounceOffset = math.abs(math.sin(currentTime * 2) * 5)
        --draw.SimpleText("Bullet Hit Position: " .. tostring(bulletTrace.HitPos), "font-02", x + 10, y + 50, Color(255, 255, 255, alpha), 0, 0)
        --draw.SimpleText("Damage Dealt: " .. damageInfo:GetDamage(), "font-02", x + 10, y + 70, Color(255, 255, 255, alpha), 0, 0)
        --draw.SimpleText("Hit Body Part: " .. bulletTrace.HitGroup, "font-02", x + 10, y + 90, Color(255, 255, 255, alpha), 0, 0)


        local eyePos = LocalPlayer():EyePos()
        local aimVector = LocalPlayer():GetAimVector()
        local bulletTrace = util.TraceLine({
            start = eyePos,
            endpos = eyePos + aimVector * 10000,
            filter = LocalPlayer()
        })
        local bounceOffset = math.abs(math.sin(currentTime * 2) * 5)
        draw.SimpleText("Bullet Hit Position: " .. tostring(bulletTrace.HitPos), "font-02", x + 10, y + 50, Color(255, 255, 255, alpha), 0, 0)
        --draw.SimpleText("Hit Body Part: " .. bulletTrace.HitGroup, "font-02", x + 10, y + 90, Color(255, 255, 255, alpha), 0, 0)

        local nearestPlayer = nil
        local nearestDistance = 999999
        local nearestFakeLag = -1 -- fake lag to -1
        local inFOV = false --  FOV
--inFOV = dotProduct > math.cos(math.rad(45))
        for _, ply in ipairs(ents.FindInSphere(LocalPlayer():GetPos(), 1000)) do
            if ply:IsPlayer() and ply != LocalPlayer() then
                local distance = ply:GetPos():Distance(LocalPlayer():GetPos())
                if distance < nearestDistance then
                    Playersss = ply
                    nearestPlayer = ply
                    nearestDistance = distance
                    -- Calculate fake lag
                    nearestFakeLag = ply:GetNWInt("fake_lag") -- Assuming fake lag is stored in a networked integer "fake_lag"
                    -- Check if LocalPlayer is in the FOV of nearest player
                    inFOV = LocalPlayer() -- Assuming there's a function "LookingAt" to check if one player is looking at another
                end
            end
        end

        if IsValid(nearestPlayer) then
            draw.SimpleText("Target Player: " .. nearestPlayer:Nick(), "font-02", x + 10, y + 70, Color(0, 255, 0, alpha), 0, 0)
            local targetWeapon = nearestPlayer:GetActiveWeapon()
            if IsValid(targetWeapon) and targetWeapon:IsWeapon() then
                draw.SimpleText("Player Ammo: " .. targetWeapon:Clip1() .. " / " .. nearestPlayer:GetAmmoCount(targetWeapon:GetPrimaryAmmoType()), "font-02", x + 10, y + 90, Color(0, 255, 0, alpha), 0, 0)
            end
        else
            draw.SimpleText("No players target", "font-02", x + 10, y + 70, Color(255, 0, 0, alpha), 0, 0)
        end

        draw.SimpleText("Fake Lag: " .. nearestFakeLag, "font-02", x + 10, y + 150, Color(255, 255, 255, alpha), 0, 0)
        if inFOV then
            draw.SimpleText("In fov", "font-02", x + 10, y + 170, Color(0, 255, 0, alpha), 0, 0)
        else
            draw.SimpleText("No fov", "font-02", x + 10, y + 170, Color(255, 0, 0, alpha), 0, 0)
        --end
        end
    end
end)

hook.Add("PrePlayerDraw","tracerksa;d",function(chel) -- HACKED BY TRAHER$
    if serj.cfg.Vars["2222555"] then

        local eyePos = LocalPlayer():EyePos()
        local aimVector = LocalPlayer():GetAimVector()

        -- Bullet's trajectory
        local bulletTrace = util.TraceLine({
            start = eyePos,
            endpos = eyePos + aimVector * 10000,
            filter = LocalPlayer()
        })

        -- Trajectory
        local currentTime = CurTime()
        local alpha = math.abs(math.sin(currentTime * 10) * 255) -- Making it blink
        render.SetColorMaterial()
        render.DrawBeam(eyePos, bulletTrace.HitPos, 2, 0, 1, Color(255, 0, 0, alpha))
            --end
end
end)

--[[hook.Add("HUDPaint", "231313131313131", function(player, origin, angles, fov)
    if serj.cfg.Vars["pedigri"] then
        -- Размеры и позиция
        local menuWidth = 300
        local menuHeight = 400
        local menuX = ScrW() - menuWidth - 20
        local menuY = 20

        -- Фон
        draw.RoundedBox(8, menuX, menuY, menuWidth, menuHeight, Color(50, 50, 50, 200))

        -- Заголовок
        draw.SimpleText("Список игроков", "font-09", menuX + menuWidth / 2, menuY + 10, color_white, TEXT_ALIGN_CENTER)

        -- Координаты для текста
        local textX = menuX + 10
        local textY = menuY + 30

        -- Информация о игроках
        for balls, gamer in pairs(player.GetAll()) do
            -- Имя игрока
            draw.SimpleText("Игрок: " .. gamer:Nick(), "font-09", textX, textY, color_white)
            textY = textY + 20

            -- Здоровье игрока
            draw.SimpleText("Здоровье: " .. gamer:Health(), "font-09", textX, textY, color_white)
            textY = textY + 20

            -- Оружие в руке игрока
            local weapon = gamer:GetActiveWeapon()
            if IsValid(weapon) then
                draw.SimpleText("Оружие: " .. weapon:GetClass(), "font-09", textX, textY, color_white)
            else
                draw.SimpleText("Оружие: Нет", "font-09", textX, textY, color_white)
            end
            textY = textY + 30 -- Отступ между игроками
    end
end
end)]]

function GetPlayerList()
    return playerList or {}
end

hook.Add("HUDPaint", "hyesoska", function(player, origin, angles, fov)
    if serj.cfg.Vars["pedigri4"] then
        local menuWidth = 400
        local menuHeight = 300
        local menuX = ScrW() / 2 - menuWidth / 2
        local menuY = ScrH() / 2 - menuHeight / 2

            draw.RoundedBox(8, menuX, menuY, menuWidth, menuHeight, Color(30, 30, 30, 200))

            draw.SimpleText("Player Information", "DermaLarge", menuX + menuWidth / 2, menuY + 10, color_white, TEXT_ALIGN_CENTER)

            --local players = ply
            local yOffset = 50
            local lineHeight = 20

            for _, ply in ipairs(players) do
                draw.SimpleText(ply:Nick(), "DermaDefault", menuX + 20, menuY + yOffset, color_white, TEXT_ALIGN_LEFT)

                draw.SimpleText("Health: " .. ply:Health(), "DermaDefault", menuX + menuWidth - 20, menuY + yOffset, color_white, TEXT_ALIGN_RIGHT)

                local weapon = ply:GetActiveWeapon()
                if IsValid(weapon) then
                    draw.SimpleText("Weapon: " .. weapon:GetPrintName(), "DermaDefault", menuX + menuWidth / 2, menuY + yOffset, color_white, TEXT_ALIGN_CENTER)
                else
                    draw.SimpleText("Weapon: None", "DermaDefault", menuX + menuWidth / 2, menuY + yOffset, color_white, TEXT_ALIGN_CENTER)
                end

                yOffset = yOffset + lineHeight
        end
    end
end)

hook.Add("HUDPaint", "4444144444444433", function(victim, attacker)
    if serj.cfg.Vars["skull1"] then
        local menuWidth = 300
        local menuHeight = 400
        local menuX = ScrW() - menuWidth - 20
        local menuY = 20
        --draw.RoundedBox(8, menuX, menuY, menuWidth, menuHeight, Color(50, 50, 50, 200))
        --surface.SetDrawColor(Color(255, 255, 255, 70))
        --surface.DrawOutlinedRect(menuX, menuY, menuWidth, menuHeight) --

        --draw.SimpleText("Ближаиший игрок: ", "font-09", menuX + menuWidth / 2, menuY + 10, color_white, TEXT_ALIGN_CENTER)
        local function GetRainbowColor()
            local time = CurTime()
            local r = math.sin(time * 2 + 0) * 127 + 128
            local g = math.sin(time * 2 + 2) * 127 + 128
            local b = math.sin(time * 2 + 4) * 127 + 128
            return Color(r, g, b)
        end

        local textX = menuX - 780
        local textY = menuY + 600

        local localPlayerPos = LocalPlayer():GetPos()
        local closestEnemy = nil
        local closestDistance = math.huge

        for _, enemy in pairs(player.GetAll()) do
            if enemy ~= LocalPlayer() and enemy:Alive() then
                local distance = localPlayerPos:Distance(enemy:GetPos())
                if distance < closestDistance then
                    closestDistance = distance
                    closestEnemy = enemy
                end
            end
        end

        if closestEnemy then
            local distance = localPlayerPos:Distance(closestEnemy:GetPos())
            local weapon = closestEnemy:GetActiveWeapon()
            local velocity = closestEnemy:GetVelocity():Length()

            --draw.SimpleText(">" , "font-02", textX, textY, rainbowColor)
            draw.SimpleText("<IDEAL BLATANT EXPLOIT>" , "font-02", textX, textY, rainbowColor)
            textY = textY + 20

            draw.SimpleText("Enemy abuse lag: " .. closestEnemy:Armor(), "font-02", textX, textY, color_white)
        textY = textY + 30

        draw.SimpleText("Client exploit???: " .. closestEnemy:Ping(), "font-02", textX, textY, color_white)
        textY = textY + 40
        end
        --end
    --end
    end
end)

hook.Add("HUDPaint", "P1Doras", function(victim, attacker)
    if serj.cfg.Vars["skull"] then
        local menuWidth = 300
        local menuHeight = 400
        local menuX = ScrW() - menuWidth - 20
        local menuY = 20
        draw.RoundedBox(8, menuX, menuY, menuWidth, menuHeight, Color(50, 50, 50, 200))
        surface.SetDrawColor(Color(255, 255, 255, 70))
        surface.DrawOutlinedRect(menuX, menuY, menuWidth, menuHeight) --

        draw.SimpleText("Ближаиший игрок: ", "font-09", menuX + menuWidth / 2, menuY + 10, color_white, TEXT_ALIGN_CENTER)

        local textX = menuX + 10
        local textY = menuY + 30

        local localPlayerPos = LocalPlayer():GetPos()
        local closestEnemy = nil
        local closestDistance = math.huge

        for _, enemy in pairs(player.GetAll()) do
            if enemy ~= LocalPlayer() and enemy:Alive() then
                local distance = localPlayerPos:Distance(enemy:GetPos())
                if distance < closestDistance then
                    closestDistance = distance
                    closestEnemy = enemy
                end
            end
        end

        if closestEnemy then
            local distance = localPlayerPos:Distance(closestEnemy:GetPos())
            local weapon = closestEnemy:GetActiveWeapon()
            local velocity = closestEnemy:GetVelocity():Length()

            draw.SimpleText("Игрок: " .. closestEnemy:Nick(), "font-09", textX, textY, color_white)
            textY = textY + 20

            draw.SimpleText("Здоровье: " .. closestEnemy:Health(), "font-09", textX, textY, color_white)
            textY = textY + 20

            draw.SimpleText("Броня: " .. closestEnemy:Armor(), "font-09", textX, textY, color_white)
            textY = textY + 30

            if IsValid(weapon) then
                draw.SimpleText("Оружие: " .. weapon:GetClass(), "font-09", textX, textY, color_white)
            else
                draw.SimpleText("Оружие: Нет", "font-09", textX, textY, color_white)
            end
            textY = textY + 20

            draw.SimpleText("Расстояние: " .. math.Round(distance), "font-09", textX, textY, color_white)
            textY = textY + 30

            draw.SimpleText("Команда: " .. team.GetName(closestEnemy:Team()), "font-09", textX, textY, color_white)
            textY = textY + 30

            draw.SimpleText("Скорость: " .. math.Round(velocity), "font-09", textX, textY, color_white)
            textY = textY + 30

            draw.SimpleText("Steam ID: " .. closestEnemy:SteamID(), "font-09", textX, textY, color_white)
            textY = textY + 20

            draw.SimpleText("Ping: " .. closestEnemy:Ping(), "font-09", textX, textY, color_white)
            textY = textY + 20

            draw.SimpleText("Model: " .. closestEnemy:GetModel(), "font-09", textX, textY, color_white)
            textY = textY + 20

            draw.SimpleText("Level: " .. closestEnemy:GetNWInt("Level", 1), "font-09", textX, textY, color_white)
            textY = textY + 20

            draw.SimpleText("Bot: " .. (closestEnemy:IsBot() and "Да" or "Нет"), "font-09", textX, textY, color_white)
            textY = textY + 20

            draw.SimpleText("Игровой режим: " .. GAMEMODE.Name, "font-09", textX, textY, color_white)
            textY = textY + 20

            draw.SimpleText("Группа: " .. (closestEnemy:GetUserGroup() or "Нет"), "font-09", textX, textY, color_white)
            textY = textY + 20
            end
        --end
    --end
    end
end)

hook.Add("PrePlayerDraw", "FOADPAPDADA:D", function(ply, origin, angles, fov)
    if serj.cfg.Vars["pedigri3"] then

    end
end)

--[[hook.Add("PrePlayerDraw", "FOADPAPDADA:D", function(player, origin, angles, fov)
    if serj.cfg.Vars["pedigri3"] then
        local playerName = player:Nick()
        local playerHealth = player:Health()
        local playerPosition = player:GetPos()
        local playerTeam = team.GetName(player:Team())
        local playerModel = player:GetModel()
        local playerArmor = player:Armor()
        local playerVelocity = player:GetVelocity()
        local playerEyeAngles = player:EyeAngles()
        local playerPing = player:Ping()
        local playerSteamID = player:SteamID()
        local playerIsAdmin = player:IsAdmin()
        local playerIsAlive = player:Alive()

        surface.SetFont("Default")
        surface.SetTextColor(255, 255, 255, 255)

        -- Define GUI positions
        local xPos = 10
        local yPos = 10
        local spacing = 15

        -- Draw player information on the GUI
        surface.SetTextPos(xPos, yPos)
        surface.DrawText("Player Name: " .. playerName)

        surface.SetTextPos(xPos, yPos + spacing)
        surface.DrawText("Player Health: " .. playerHealth)

        surface.SetTextPos(xPos, yPos + 2 * spacing)
        surface.DrawText("Player Position: " .. tostring(playerPosition))

        surface.SetTextPos(xPos, yPos + 3 * spacing)
        surface.DrawText("Player Team: " .. playerTeam)

        surface.SetTextPos(xPos, yPos + 4 * spacing)
        surface.DrawText("Player Model: " .. playerModel)

        surface.SetTextPos(xPos, yPos + 5 * spacing)
        surface.DrawText("Player Armor: " .. playerArmor)

        surface.SetTextPos(xPos, yPos + 6 * spacing)
        surface.DrawText("Player Velocity: " .. tostring(playerVelocity))

        surface.SetTextPos(xPos, yPos + 7 * spacing)
        surface.DrawText("Player Eye Angles: " .. tostring(playerEyeAngles))

        surface.SetTextPos(xPos, yPos + 8 * spacing)
        surface.DrawText("Player Ping: " .. playerPing)

        surface.SetTextPos(xPos, yPos + 9 * spacing)
        surface.DrawText("Player SteamID: " .. playerSteamID)

        surface.SetTextPos(xPos, yPos + 10 * spacing)
        surface.DrawText("Is Player Admin: " .. tostring(playerIsAdmin))

        surface.SetTextPos(xPos, yPos + 11 * spacing)
        surface.DrawText("Is Player Alive: " .. tostring(playerIsAlive)) -- дохуя функ vodila
    end
end)]]

hook.Add("HUDPaint", "dolbaeb", function(player, origin, angles, fov)
    if serj.cfg.Vars["pedigri2"] then
        local isDragging = false
        local dragOffsetX = 0
        local dragOffsetY = 0

        local menuWidth = 350
        local menuHeight = 200
        local menuX = ScrW() / 2 - menuWidth / 2
        local menuY = ScrH() / 2 - menuHeight / 2

        -- Background
        surface.SetDrawColor(Color(30, 30, 30, 200))
        surface.DrawRect(menuX, menuY, menuWidth, menuHeight)

        local pulse = math.abs(math.sin(CurTime() * 2)) * 255
        draw.SimpleText("Character Speed", "DermaLarge", menuX + menuWidth / 2, menuY + 10, Color(255, pulse, pulse), TEXT_ALIGN_CENTER)

        local ply = LocalPlayer()
        local speed = ply:GetVelocity():Length()

        local r = math.sin(CurTime()) * 127 + 128
        local g = math.sin(CurTime() + 2) * 127 + 128
        local b = math.sin(CurTime() + 4) * 127 + 128
        local speedText = "Speed: " .. math.Round(speed) .. " units/s"
        draw.SimpleText(speedText, "DermaDefault", menuX + menuWidth / 2, menuY + 50, Color(r, g, b), TEXT_ALIGN_CENTER)

        local barWidth = menuWidth - 40
        local barHeight = 20
        local barX = menuX + 20
        local barY = menuY + 100

        draw.RoundedBox(4, barX, barY, barWidth, barHeight, Color(70, 70, 70, 150))

        local blinkAlpha = math.abs(math.sin(CurTime() * 2)) * 255
        local speedPercentage = speed / 1000
        local filledWidth = speedPercentage * (barWidth - 8)
        draw.RoundedBox(4, barX + 4, barY + 4, filledWidth, barHeight - 8, Color(0, 255, 0, blinkAlpha))

        local borderSize = 6
        local borderX = menuX - borderSize / 2
        local borderY = menuY - borderSize / 2
        local borderColor = HSVToColor(math.abs(math.sin(CurTime() * 0.5)) * 360, 1, 1)
        surface.SetDrawColor(borderColor)
        surface.DrawOutlinedRect(borderX, borderY, menuWidth + borderSize, menuHeight + borderSize)
    end
end)

hook.Add("PrePlayerDraw", "BeautifulTrail", function(player, origin, angles, fov)
    if serj.cfg.Vars["52a5555"] then
    local trailColor = Color(math.random(0, 255), math.random(0, 255), math.random(0, 255)) -- Random color
    local trailLength = math.random(50, 200) -- Random length
    local trailStartSize = math.random(3, 10) -- Random start size
    local trailEndSize = math.random(3, 10) -- Random end size

    render.SetMaterial(Material("trails/laser"))

    local startPos = player:GetPos() - player:GetVelocity() * FrameTime() * 5
    local endPos = player:GetPos()

    render.DrawBeam(startPos, endPos, trailStartSize, trailEndSize, 0, trailColor)
        --render.DrawQuad(vert1, vert2, vert3, vert4, color = Color( 255, 255, 255 ) )
        -- ту trail effect

    end
end)

--[[hook.Add("PrePlayerDraw", "H111", function(player)
    if serj.cfg.Vars["pidorask"] then
--player:SetPlayerColor(Vector(1, 0, 0)) -- Красный цвет

        -- Или установка модели игрока
        --player:SetModel("models/player/Group01/male_01.mdl")
    end
end)]]

hook.Add("PrePlayerDraw","575454",function(chel) -- HACKED BY TRAHER$
    if serj.cfg.Vars["222255"] then

        local eyePos = LocalPlayer():EyePos()
        local aimVector = LocalPlayer():GetAimVector()
        local uniqueColor = Color(math.random(0, 255), math.random(0, 255), math.random(0, 255))
        local lineStyle = math.random() > 0.5
        local lineWidth = math.random(1, 5)

        local bulletTrace = util.TraceLine({
            start = eyePos,
            endpos = eyePos + aimVector * 10000,
            filter = LocalPlayer()
        })

        render.SetColorMaterial()
        render.DrawLine(eyePos, bulletTrace.HitPos, uniqueColor, lineStyle)
            --end
end
end)

hook.Add("PrePlayerDraw","500225333",function(chel) -- HACKED BY TRAHER$
    if serj.cfg.Vars["52a"] then
        local player = LocalPlayer()
        if player:GetVelocity():Length() then --<= 99999 then

            local boneIndexLeftLeg = player:LookupBone("ValveBiped.Bip01_Spine")
            local boneIndexRightLeg = player:LookupBone("ValveBiped.Bip01_Spine2")

            local legRotationAngle = math.cos(CurTime() * 0) * 15
            local legRotation = Angle(legRotationAngle, 15, 0)

            if boneIndexLeftLeg then
                player:ManipulateBoneAngles(boneIndexLeftLeg, legRotation)
            end

            if boneIndexRightLeg then
                player:ManipulateBoneAngles(boneIndexRightLeg, -legRotation)
            end
        end
            --end
end
end)

--[[hook.Add("PrePlayerDraw","55323232",function() -- HACKED BY TRAHER$
    if serj.cfg.Vars["22225"] then
    --if info.userid == LocalPlayer():UserID() then
        local angles = LocalPlayer():EyeAngles()
        angles.y = angles.y + 85
        LocalPlayer():SetEyeAngles(angles)
    --end
end
end)]]

hook.Add("PrePlayerDraw", "LegMovement", function(player)
    if serj.cfg.Vars["00si"] then
        local player = LocalPlayer()

        if not player:IsOnGround() then
            if player:GetVelocity():Length() <= 9999 then
                local boneIndexLeftLeg = player:LookupBone("ValveBiped.Bip01_L_Calf") and player:LookupBone("ValveBiped.Bip01_Head1") and player:LookupBone("ValveBiped.Bip01_Pelvis")
                local boneIndexRightLeg = player:LookupBone("ValveBiped.Bip01_R_Calf") and player:LookupBone("ValveBiped.Bip01_Spine2") and player:LookupBone("ValveBiped.Bip01_Spine1")

                local legRotationAngle = math.sin(CurTime() * 15) * 3
                local legRotation = Angle(legRotationAngle, 180, 0)

                if boneIndexLeftLeg then
                    player:ManipulateBoneAngles(boneIndexLeftLeg, legRotation)
                end

                if boneIndexRightLeg then
                    player:ManipulateBoneAngles(boneIndexRightLeg, -legRotation)
                end
            end
        else

            local boneIndexLeftLeg = player:LookupBone("ValveBiped.Bip01_L_Calf") and player:LookupBone("ValveBiped.Bip01_Head1") and player:LookupBone("ValveBiped.Bip01_Pelvis")
            local boneIndexRightLeg = player:LookupBone("ValveBiped.Bip01_R_Calf") and player:LookupBone("ValveBiped.Bip01_Spine2") and player:LookupBone("ValveBiped.Bip01_Spine1")

            local legRotation = Angle(0, 0, 0)

            if boneIndexLeftLeg then
                player:ManipulateBoneAngles(boneIndexLeftLeg, legRotation)
            end

            if boneIndexRightLeg then
                player:ManipulateBoneAngles(boneIndexRightLeg, legRotation)
            end
        end
    end
end)

--[[hook.Add("PostPlayerDraw", "4444444444",
    if serj.cfg.Vars["efffectik"] then

end)]]


local function CreateWaterSplash(pos)
    local splash = ParticleEmitter(pos)

    if splash then
        for i = 1, 20 do  -- r
            local particle = splash:Add("effects/water_splash", pos + Vector(0, 0, 10))  -- S
            if particle then
                particle:SetVelocity(Vector(math.random(-100, 100), math.random(-100, 100), math.random(50, 100)))  -- R
                particle:SetDieTime(math.Rand(0.5, 1.5))  -- L
                particle:SetStartAlpha(255)  -- t
                particle:SetEndAlpha(0)
                particle:SetStartSize(math.random(5, 10))
                particle:SetEndSize(0)
                particle:SetGravity(Vector(0, 0, -500))
                particle:SetColor(255, 255, 255)
            end
        end

        splash:Finish()  -- Finish emitting particles
    end
end

-- Hook into the player death event
hook.Add("PlayerDeath", "WaterEffectOnKill", function(victim, inflictor, attacker)
    if serj.cfg.Vars["efffectik"] then
        CreateWaterSplash(victim:GetPos())
    end
end)

hook.Add("PrePlayerDraw","nicespastil",function(chel) -- HACKED BY TRAHER$
    if serj.cfg.Vars["leg_breaker"] then
    if chel != LocalPlayer() then return end
    chel:SetAnimTime(CurTime()+1,00001)
end
end)

hook.Add("PostPlayerDraw", "07777", function(player)
    if not serj.cfg.Vars["ass11"] then return end
    local particle = {}

    local headBone = LocalPlayer():LookupBone("ValveBiped.Bip01_Head1")
    if not headBone then return end

    local bonePos, boneAng = LocalPlayer():GetBonePosition(headBone)
    local circle_pos = bonePos + Vector(0, 0, 10)

particle.x = circle_pos.x + math.random(-10, 10)  -- Случайное смещение по X
particle.y = circle_pos.y + math.random(-10, 10)  -- Случайное смещение по Y
particle.z = circle_pos.z + math.random(-10, 10)  -- Случайное смещение по Z

particle.velX = math.random(-10, 10)  -- Случайная скорость по X
particle.velY = math.random(-10, 10)  -- Случайная скорость по Y
particle.velZ = math.random(5, 15)     -- Случайная скорость по Z

--particle.size = math.random(3, 6)      -- Случайный размер частицы

-- Уникальный цвет для каждой частицы
idiot = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )

-- Отображение частицы
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
    if not serj.cfg.Vars["ass1"] then return end

local headBone = LocalPlayer():LookupBone("ValveBiped.Bip01_Head1")
if not headBone then return end

local bonePos, boneAng = LocalPlayer():GetBonePosition(headBone)
local circle_pos = bonePos + Vector(0, 0, 10)  -- the head

local circle_color = Color(255, 0, 0)  -- Red
local circle_radius = 20
local rotation_angle = CurTime() * 100

-- Отрисовка круга
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

function soundhit()
    surface.PlaySound("ambient/water/drip1.wav")
    surface.PlaySound("ambient/fire/fire_small1.wav")
end

local killCount = 0
local killMessage = ""
local messageDuration = 3 -- Длительность отображения сообщения в секундах
local messageStartTime = 0

-- Функция для обработки убийства врага
local function OnEnemyKilled(attacker)
    if serj.cfg.Vars["enemy"] then
        -- Увеличиваем счётчик киллов
        killCount = killCount + 1

        -- Определяем текст в зависимости от количества киллов
        if killCount == 1 then
            killMessage = "First Kill!"
        elseif killCount == 2 then
            killMessage = "Double Kill!"
        elseif killCount == 3 then
            killMessage = "Triple Kill!"
        elseif killCount > 3 then
            killMessage = "Kill Count: " .. killCount
        end

        -- Запоминаем время начала отображения сообщения
        messageStartTime = RealTime()
    end
end

-- Хук для рисования текста на экране
hook.Add("HUDPaint", "DrawKillMessage", function()
    if killMessage ~= "" and RealTime() - messageStartTime < messageDuration then
        local x, y = ScrW() / 2, ScrH() / 2 -- Центр экрана
        local textColor = Color(255, 0, 0, 255) -- Цвет текста (красный)

        -- Рисуем текст
        draw.SimpleText(killMessage, "Trebuchet24", x, y, textColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    else
        -- Сбрасываем сообщение после истечения времени
        killMessage = ""
    end
end)

hook.Add("PrePlayerDraw","dlight",function(dlight) -- HACKED BY TRAHER$
if serj.cfg.Vars["dlight"]  then
    local dlightcolor = string.ToColor(serj.cfg.Colors["dlight"])
    local dhsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
    local dlight = DynamicLight( LocalPlayer():EntIndex() )
        if ( dlight ) then
            dlight.pos = LocalPlayer():GetShootPos()
            if serj.cfg.Vars["dlight_hsv"] then
            dlight.r = dhsv.r
            dlight.g = dhsv.g
            dlight.b = dhsv.b
            else
            dlight.r = dlightcolor.r
            dlight.g = dlightcolor.g
            dlight.b = dlightcolor.b
            end
            dlight.brightness = 2
            dlight.Decay = 1000
            dlight.Size = 300
            dlight.DieTime = CurTime() + 1
        end
    end
    if serj.cfg.Vars["hlflashlight"]  then
    local dlight = DynamicLight( LocalPlayer():EntIndex() )
    if ( dlight ) then
        dlight.pos = LocalPlayer():GetEyeTrace().HitPos
        dlight.r = 128
        dlight.g = 128
        dlight.b = 128
        dlight.brightness = 1
        dlight.Decay = 1000
        dlight.Size = 400
        dlight.DieTime = CurTime() + 1
    end
    end
    if serj.cfg.Vars["healthkit"] then
        if LocalPlayer():Health() < 65 && LocalPlayer():Alive() then
            -- down view angles
            --local ply = LocalPlayer()
            --local viewAngles = ply:EyeAngles()
            serj.pitch = 90 -- by90
            --ply:SetEyeAngles(viewAngles)
            RunConsoleCommand("gm_spawnsent", "item_healthkit")
        end
    end
    if serj.cfg.Vars["armorkit"] then
    --if serj.activebinds["key_armor"] then
    if LocalPlayer():Armor() < 100 && LocalPlayer():Alive() then
    RunConsoleCommand("gm_spawnsent", "item_battery")
    end
--end
end
end)

function serj.fart(cmd)
    if serj.GLPTEST and cmd:KeyDown(IN_ATTACK) then
        serj.MOVEING = true
    elseif !serj.GLPTEST and !cmd:KeyDown(IN_ATTACK) then
        serj.MOVEING = false
    end
end

function serj.ass(ent)
    local col = string.ToColor(serj.cfg.Colors["move_ap"])
    local pos = serj.GLP
    local offset = Vector(pos)

    cam.Start3D2D(pos, Angle(0,0,0), 0.5 )
        cam.IgnoreZ(true)
        if serj.cfg.Vars["move_ap_s"] == 1 then
            surfaceDrawCircle(0,0,serj.ap_alpha/5-5,col.r,col.g,col.b,col.a)
        elseif serj.cfg.Vars["move_ap_s"] == 2 then
            surfaceSetDrawColor( col.r,col.g,col.b,serj.ap_alpha )
	        surface.SetMaterial( Material("gui/npc.png") )
	        surface.DrawTexturedRect( -serj.ap_alpha/4, -serj.ap_alpha/4, serj.ap_alpha/2, serj.ap_alpha/2 )
        end
        cam.IgnoreZ(false)
    cam.End3D2D()

end

function serj.OpenESPPreview()

	if modelFrame then modelFrame:Remove() end

	modelFrame = vgui.Create("DFrame")
	modelFrame:SetTitle("")
	modelFrame:MakePopup()
	modelFrame:ShowCloseButton(	true )
	modelFrame:SetAlpha(0)
	modelFrame:AlphaTo(255,0.4,0,function() end)
	modelFrame:SetDraggable(	true	)
	modelFrame:SetBackgroundBlur( true )
	modelFrame:SetPaintShadow( true )
	modelFrame:SetScreenLock(true)
	--Menu Open Animation
	local IsAnimated = true
	local AnimTime, AnimDelay, AnimEase =  1.5, 0, .1
	modelFrame:SetSize(0,0)
	modelFrame:SizeTo(639, 750, AnimTime, AnimDelat,AnimEase, function () IsAnimated = false end)
		--Menu Position
	if frameX == nil or frameY == nil then
		modelFrame.OnSizeChanged = function(me)
			if IsAnimated then
				modelFrame:Center()
			end
		end
	else
		modelFrame:SetPos(frameX, frameY)
	end

	modelFrame:SetSizable( true )
	modelFrame:SetMinWidth( 639 )
	modelFrame:SetMinHeight( 250 )

	modelFrame.Paint = function(self,w,h)
		--blurPanel(self)
		draw.RoundedBox(6,0,0,w,h,Color(15,15,15,150))
	end

	local modelPanel = modelFrame:Add( "DModelPanel" )
	modelPanel:SetTall(650)
	modelPanel:Dock(TOP)
	modelPanel:DockMargin(5,5,5,5)
	modelPanel:SetModel( "models/player/riot.mdl" )
	modelPanel:SetAnimated(true)

	local flex = modelPanel:GetEntity():LookupSequence("idle_all_02")
	modelPanel:SetAnimSpeed(2)

	modelPanel:GetEntity():SetSequence(flex)

	local color_red = Color( 255, 0, 0 )

	function modelPanel:LayoutEntity(ent)

		-- Playback rate based on anim speed
		ent:SetPlaybackRate(self:GetAnimSpeed())
		if(ent:GetCycle() >= 0.95) then ent:SetCycle(0.05) end
		-- Advance frame
		ent:FrameAdvance()

	end

	function modelPanel:PostDrawModel(ent)
		local chamMatVis = serj.cfg.Vars["chams_visible"]
		local colorFix = (1 / 255)
		local chamColVis = string.ToColor(serj.cfg.Colors["chams_visible"])

		if serj.cfg.Vars["chams_visible"] then
			render.SetColorModulation( chamColVis.r * colorFix, chamColVis.g * colorFix, chamColVis.b * colorFix )
			render.SetBlend( chamColVis.a * colorFix)
			render.MaterialOverride(Material(chamMatVis))
			ent:SetRenderMode(10)
			ent:SetColor(Color(0, 0, 0, 0))
			ent:DrawModel()
		end
	end

	local espOverlay = modelPanel:Add( "DPanel" )
	espOverlay:Dock(FILL)
	espOverlay.Paint = function(s,w,h)
		if serj.cfg.Vars["esp_box"] then
            local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis = serj.GetENTPos( ply )
            local XLen, YLen = MaxX - MinX, MaxY - MinY
			local boxcol = string.ToColor(serj.cfg.Colors["esp_box"])
			sSDC( boxcol.r, boxcol.g, boxcol.b, boxcol.a )
	    	--surface.DrawOutlinedRect( 220, 70, 200, 520, 1 )
		end
        if serj.cfg.Vars["ap_enable"] then

        end
		if serj.cfg.Vars["esp_name"] then
			local namecol = string.ToColor(serj.cfg.Colors["esp_name"])
			tO("IlyaTracher...","font-03",320,55,namecol,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP,1,Color(0,0,0))
		end
		if serj.cfg.Vars["esp_hp"] then
			local hpcol = string.ToColor(serj.cfg.Colors["esp_hp"])
			draw.RoundedBox(0,216,70,2,520,hpcol)
		end
		if serj.cfg.Vars["esp_hp_bar"] then
			local apcol = string.ToColor(serj.cfg.Colors["esp_hp_bar"])
			draw.RoundedBox(0,216,70,2,520,apcol)
		end
		if serj.cfg.Vars["esp_hp_bar_gradient"] then
			local hantiaimPcol = string.ToColor(serj.cfg.Colors["esp_hp_bar_gradient"])
			tO("100","font-03",210,85,hantiaimPcol,TEXT_ALIGN_RIGHT,TEXT_ALIGN_TOP,1,Color(0,0,0))
		end
		if serj.cfg.Vars["esp_ap"] then
			local aantiaimPcol = string.ToColor(serj.cfg.Colors["esp_ap"])
			tO("100","font-03",210,95,aantiaimPcol,TEXT_ALIGN_RIGHT,TEXT_ALIGN_TOP,1,Color(0,0,0))
		end
		if serj.cfg.Vars["esp_wep"] then
			local wepcol = string.ToColor(serj.cfg.Colors["esp_wep"])
			if serj.cfg.Vars["esp_wep"] then
				tO("Weapon","font-03",320,595,wepcol,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP,1,Color(0,0,0))
			else
				tO("weapon_rock","font-03",320,595,wepcol,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP,1,Color(0,0,0))
			end
		end
		if serj.cfg.Vars["esp_group"] then
			local rankcol = string.ToColor(serj.cfg.Colors["esp_group"])
			tO("Owner","font-03",320,40,rankcol,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP,1,Color(0,0,0))
		end
		if serj.cfg.Vars["esp_team"] then
			local teamcol = team.GetColor( LocalPlayer():Team() )
			tO("Team","font-03",320,25,teamcol,TEXT_ALIGN_CENTER,TEXT_ALIGN_TOP,1,Color(0,0,0))
		end
		if serj.cfg.Vars["esp_player_distance"] then
			local distcol = string.ToColor(serj.cfg.Colors["esp_player_distance"])
			tO("Distance: distance","font-03",425,65,distcol,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP,1,Color(0,0,0))
		end
		if serj.cfg.Vars["esp_money"] then
			local distcol = string.ToColor(serj.cfg.Colors["esp_money"])
			tO("9999999$","font-03",425,80,distcol,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP,1,Color(0,0,0))
		end
	end
end

hook.Add("HUDPaint", "kryjok", function()
    if serj.cfg.Vars["Aimbot_krujok"] then
        local pos = serj.targetVector:ToScreen()

        local circleRadius = 5
        local circleColor = string.ToColor(serj.cfg.Colors["Aimbot_krujok"])

        surface.SetDrawColor(circleColor)
        surface.DrawCircle(pos.x, pos.y, circleRadius, circleColor)  -- Draw a circle at the target position
    end
end)

hook.Add("HUDPaint", "fillkryg", function()
    if serj.cfg.Vars["Aimbot_fill"] then
        local pos = serj.targetVector:ToScreen()

        local circleRadius = 5
        local circleColor = string.ToColor(serj.cfg.Colors["Aimbot_fill"])

        local segments = 360
        local circle = {}

        for i = 1, segments do
            local segment = math.rad(i * 360 / segments)
            table.insert(circle, {
                x = pos.x + math.cos(segment) * circleRadius,
                y = pos.y + math.sin(segment) * circleRadius
            })
        end

        surface.SetDrawColor(circleColor)
        draw.NoTexture()
        surface.DrawPoly(circle)
    end
end)

hook.Add("HUDPaint", "petyh", function()
    if serj.cfg.Vars["Aimbot_markers"] then
        local pos = serj.targetVector:ToScreen()

        --surface.SetDrawColor(0, 0, 0)
        --surface.DrawRect(pos.x - 10, pos.y - 10, 20, 2) -- Top
        --surface.DrawRect(pos.x - 10, pos.y + 8, 20, 2) -- Bottom
        --surface.DrawRect(pos.x - 10, pos.y - 10, 2, 20) -- Left
        --surface.DrawRect(pos.x + 8, pos.y - 10, 2, 20) -- Right

        surface.SetDrawColor(string.ToColor(serj.cfg.Colors["Aimbot_markers"]))
        surface.DrawRect(pos.x - 5, pos.y - 5, 10, 2) -- Top
        surface.DrawRect(pos.x - 5, pos.y + 3, 10, 2) -- Bottom
        surface.DrawRect(pos.x - 5, pos.y - 5, 2, 10) -- Left
        surface.DrawRect(pos.x + 3, pos.y - 5, 2, 10) -- Right
    end
end)

hook.Add("HUDPaint", "swastonch1k", function()
    if serj.cfg.Vars["Aimbot_swaston"] then
        local pos = serj.targetVector:ToScreen()

        surface.DrawLine( pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2 )
        surface.DrawLine( pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2 )
        surface.DrawLine( pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2 )
        surface.DrawLine( pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2 )

        surface.SetDrawColor( string.ToColor( serj.cfg.Colors["Aimbot_swaston"] ) )
        --surface.DrawLine(pos.x - 6, pos.y, pos.x + 6, pos.y)  -- Horizontal line
        --surface.DrawLine(pos.x, pos.y - 6, pos.x, pos.y + 7)  -- Vertical line
    end
end)

hook.Add("HUDPaint","marker",function()
if serj.cfg.Vars["Aimbot_marker"] then
    local pos = serj.targetVector:ToScreen()

    surface.SetDrawColor( 0, 0, 0 )
    surface.DrawRect( pos.x - 6, pos.y - 6, 5, 3 )
    surface.DrawRect( pos.x + 2, pos.y - 6, 5, 3 )

    surface.DrawRect( pos.x - 6, pos.y + 4, 5, 3 )
    surface.DrawRect( pos.x + 2, pos.y + 4, 5, 3 )

    surface.DrawRect( pos.x - 6, pos.y - 6, 3, 5 )
    surface.DrawRect( pos.x + 4, pos.y - 6, 3, 5 )

    surface.DrawRect( pos.x - 6, pos.y + 2, 3, 5 )
    surface.DrawRect( pos.x + 4, pos.y + 2, 3, 5 )

    surface.SetDrawColor( string.ToColor( serj.cfg.Colors["Aimbot_marker"] ) )

    surface.DrawRect( pos.x - 5, pos.y - 5, 3, 1 )
    surface.DrawRect( pos.x + 3, pos.y - 5, 3, 1 )

    surface.DrawRect( pos.x - 5, pos.y + 5, 3, 1 )
    surface.DrawRect( pos.x + 3, pos.y + 5, 3, 1 )

    surface.DrawRect( pos.x - 5, pos.y - 5, 1, 3 )
    surface.DrawRect( pos.x + 5, pos.y - 5, 1, 3 )

    surface.DrawRect( pos.x - 5, pos.y + 3, 1, 3 )
    surface.DrawRect( pos.x + 5, pos.y + 3, 1, 3 )
end
end)

hook.Add("HUDPaint","shaker",function()
    if serj.cfg.Vars["esp_self_killeffect_s"] then
        if intp then
            local angle = Angle( 0, 0, 0 )
            local pos = LocalPlayer():GetBonePosition(LocalPlayer():LookupBone("ValveBiped.Bip01_Head1")) + Vector(0,0,10)
                cam.Start3D2D( pos, angle, 1 )
                local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
                    sSDC( hsv.r, hsv.g, hsv.b, 50 )
                    sDC( 0, 0, 5, Color( hsv.r, hsv.g, hsv.b ) )
                cam.End3D2D()
            end
end
end)

--[[]

function render.Capture( data )
    .PreScreenGrab()

    if ue.cfg.vars["Screengrab image"] then
        cam.Start2D()
            render.DrawTextureToScreen( .prikol )
        cam.End2D()
    end

	return render_Capture( data )
end

function _G.render.Capture( data )
    ue.PreScreenGrab()

    if u.cfg.vars["Screengrab image"] then
        cam.Start2D()
            render.DrawTextureToScreen( ul.prikol )
        cam.End2D()
    end

	return render_Capture( data )
end -- доделать блять...............]]

hook.Add("HUDPaint", "43s", function()
    if serj.cfg.Vars["esp_other_hitbones2"] then

    end
end)

hook.Add("PlayerHurt", "S9", function()
    if serj.cfg.Vars["esp_other_hitbones2"] then


    end
end)

local hitLocations = {}

hook.Add("HUDPaint", "DrawHitLocations", function()
    if serj.cfg.Vars["esp_other_hitlocations"] then
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
            --surface.SetTextColor(255, 45 - hitLocation.vec, 45 - hitLocation.vec, 255 * hitLocation.life)
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

local HITGROUP_HEAD = "ValveBiped.Bip01_Head1"

hook.Add("player_hurt", "AddHitLocation", function(info)
    if serj.cfg.Vars["esp_other_hitlocations"] then
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
        end  -- dodelat SYKA GOVNO

        if location == "" then
            return
        end

        local position = victim:GetPos() + Vector(0, 0, 100)
        local damage = math.Round(math.abs(info.health - victim:Health()), 1)
        table.insert(hitLocations, {pos = position, life = 1, text = location, vec = VectorRand()})
    end
end)

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

local hitNumbers = {}

hook.Add("HUDPaint", "DrawHitNumbers", function()
    if serj.cfg.Vars["esp_other_hitnumbers"] then
        local newHitNumbers = {}

        for _, hitNumber in pairs(hitNumbers) do
            cam.Start3D()
            local screenPos = hitNumber.pos:ToScreen()
            local posX = screenPos.x
            local posY = screenPos.y
            cam.End3D()

            cam.Start2D()
            surface.SetFont("HitNumberFont")
            local textWidth, textHeight = surface.GetTextSize(tostring(hitNumber.num))

            surface.SetTextColor(0, 0, 0, 255 * hitNumber.life)
            surface.SetTextPos(posX - textWidth / 2, posY)
            surface.DrawText(tostring(hitNumber.num))

            surface.SetFont("CriticalHitNumberFont")
            surface.SetTextColor(255, 45 - hitNumber.num, 45 - hitNumber.num, 255 * hitNumber.life)
            surface.SetTextPos(posX - textWidth / 2, posY)
            surface.DrawText(tostring(hitNumber.num))

            hitNumber.pos = hitNumber.pos + Vector(0, 0, RealFrameTime() * 32)
            hitNumber.pos = hitNumber.pos + hitNumber.vec * RealFrameTime() * 8
            hitNumber.life = hitNumber.life - RealFrameTime() * 1 / 0.75

            if hitNumber.life > 0 then
                table.insert(newHitNumbers, hitNumber)
            end
            cam.End2D()
        end

        hitNumbers = newHitNumbers
    end
end)

--[[hook.Add("PrePlayerDraw", "zxcsawdawdswa", function(victim, attacker)
    if serj.cfg.Vars["skull"] then
        local trailColor = Color(255, 0, 0) -- Цвет следа (красный в данном случае)
        local trailWidth = 1 -- Ширина следа
        local trailLength = 0.5 -- Длительность следа в секундах
        local ply = LocalPlayer() -- Получаем локального игрока
        local startPos = ply:GetPos() -- Получаем начальную позицию следа

        if depth or skybox then return end

        render.SetMaterial(Material("trails/laser")) -- Загружаем материал для следа (можно использовать другие материалы)
        render.StartBeam(2) -- Начинаем рисование бима (для следа)
        render.AddBeam(startPos, trailWidth, 0, trailColor) -- Добавляем начальную точку следа

        -- Рассчитываем конечную позицию следа (можно изменить по вашему усмотрению)
        local endPos = startPos + ply:GetVelocity() * trailLength
        render.AddBeam(endPos, trailWidth, 1, trailColor) -- Добавляем конечную точку следа

        render.EndBeam()






        for _, ply in ipairs(player.GetAll()) do
            if ply:Alive() then
                local pos = ply:GetPos() + Vector(0, 0, 0)
                local scrpos = pos:ToScreen()

                -- Draw the skull
                surface.SetDrawColor(255, 255, 255, 255)
                surface.SetMaterial(Material("path/to/skull_texture"))
                surface.DrawTexturedRect(scrpos.x - 16, scrpos.y - 32, 32, 32)

                -- Draw the health indicator
                local maxHealth = ply:GetMaxHealth()
                local currentHealth = ply:Health()
                local healthRatio = currentHealth / maxHealth
                local barWidth = 60
                local barHeight = 5
                surface.SetDrawColor(255, 0, 0, 255)
                surface.DrawRect(scrpos.x - barWidth / 2, scrpos.y - 20, barWidth, barHeight)
                surface.SetDrawColor(0, 255, 0, 255)
                surface.DrawRect(scrpos.x - barWidth / 2, scrpos.y - 20, barWidth * healthRatio, barHeight)
            end
        end
    end




    end
end)]]

function serj.sg1()
    if Songs_Gay then
    Songs_Gay1 = !Songs_Gay1
    RunConsoleCommand("stopsound")
    else
    Songs_Gay1 = !Songs_Gay1
    RunConsoleCommand("penis1")
end
end

concommand.Add("penis1", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1280133878597685250/1293650707945357322/XTENTACION_ft_Juice_Wrld_jvdxn_-_Got_Me_Good_AI_77124655.mp3?ex=6708259b&is=6706d41b&hm=2d14bd16efb1e0e3837fd7699628c543e9d4f88d9453006bc6c8ee5706736783&", "", function()end )
end)

function serj.sg2()
    if Songs_Gay2 then
    Songs_Gay2 = !Songs_Gay2
    RunConsoleCommand("stopsound")
    else
    Songs_Gay2 = !Songs_Gay2
    RunConsoleCommand("penis2")
end
end

concommand.Add("penis2", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201208677554729040/6am_-_Rebeca_Rebeca_phonk_TIKTOK_VERSION.mp3", "", function()end )
end)

function serj.sg3()
    if Songs_Gay3 then
    Songs_Gay3 = !Songs_Gay3
    RunConsoleCommand("stopsound")
    else
    Songs_Gay3 = !Songs_Gay3
    RunConsoleCommand("penis3")
end
end

concommand.Add("penis3", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/755075052512215180/1050817662982303744/unki-uazik.mp3", "", function()end )
end)

function serj.sg4()
    if Songs_Gay4 then
    Songs_Gay4 = !Songs_Gay4
    RunConsoleCommand("stopsound")
    else
    Songs_Gay4 = !Songs_Gay4
    RunConsoleCommand("penis4")
end
end

concommand.Add("penis4", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1200147744921223228/1201208179384668170/FOVLA_-_MONSTER_KILL.mp33", "", function()end )
end)

function serj.sg5()
    if Songs_Gay5 then
    Songs_Gay5 = !Songs_Gay5
    RunConsoleCommand("stopsound")
    else
    Songs_Gay5 = !Songs_Gay5
    RunConsoleCommand("penis5")
end
end

concommand.Add("penis5", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201207171296268429/Zima_MetalFamily.mp3", "", function()end )
end)

function serj.sg6()
    if Songs_Gay6 then
    Songs_Gay6 = !Songs_Gay6
    RunConsoleCommand("stopsound")
    else
    Songs_Gay6 = !Songs_Gay6
    RunConsoleCommand("penis6")
end
end

concommand.Add("penis6", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201205280776659036/BABY_GOS_ft._RONEN__sectioneight_-_Neon_Tokyo.mp3", "", function()end )
end)

function serj.sg7()
    if Songs_Gay7 then
    Songs_Gay7 = !Songs_Gay7
    RunConsoleCommand("stopsound")
    else
    Songs_Gay7 = !Songs_Gay7
    RunConsoleCommand("penis7")
end
end

concommand.Add("penis7", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201204531908857916/The_Smiths_-_Some_Girls_Are_Bigger_Than_Others_47977149.mp3", "", function()end )
end)

function serj.sg8()
    if Songs_Gay8 then
    Songs_Gay8 = !Songs_Gay8
    RunConsoleCommand("stopsound")
    else
    Songs_Gay8 = !Songs_Gay8
    RunConsoleCommand("penis8")
end
end

concommand.Add("penis8", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201204911946354698/BLXSTBXRN_BACKSPIN_Feat._CREEPMXNE_www.lightaudio.ru.mp3", "", function()end )
end)


function serj.sg9()
    if Songs_Gay9 then
    Songs_Gay9 = !Songs_Gay9
    RunConsoleCommand("stopsound")
    else
    Songs_Gay9 = !Songs_Gay9
    RunConsoleCommand("penis9")
end
end

concommand.Add("penis9", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201204100415623329/DSMVRK_-_.mp3", "", function()end )
end)


function serj.sg10()
    if Songs_Gay10 then
    Songs_Gay10 = !Songs_Gay10
    RunConsoleCommand("stopsound")
    else
    Songs_Gay10 = !Songs_Gay10
    RunConsoleCommand("penis10")
end
end

concommand.Add("penis10", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201203697338818610/YA_KHOCHU_TEBYA_DETKA_-_YA_khochu_tebya_detka_74038555.mp3", "", function()end )
end)

function serj.sg11()
    if Songs_Gay11 then
    Songs_Gay11 = !Songs_Gay11
    RunConsoleCommand("stopsound")
    else
    Songs_Gay11 = !Songs_Gay11
    RunConsoleCommand("penis11")
end
end

concommand.Add("penis11", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201203260560785479/FORGOTTENAGE_-_ERROR.mp3", "", function()end )
end)

function serj.sg12()
    if Songs_Gay12 then
    Songs_Gay12 = !Songs_Gay12
    RunConsoleCommand("stopsound")
    else
    Songs_Gay12 = !Songs_Gay12
    RunConsoleCommand("penis12")
end
end

concommand.Add("penis12", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201202963939606528/SXORPUS_-_SECRET_MURDER.mp3", "", function()end )
end)

function serj.sg13()
    if Songs_Gay13 then
    Songs_Gay13 = !Songs_Gay13
    RunConsoleCommand("stopsound")
    else
    Songs_Gay13 = !Songs_Gay13
    RunConsoleCommand("penis13")
end
end

concommand.Add("penis13", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201202248072560720/Mgk_-_Dorozhka_tropinka_70302430.mp3", "", function()end )
end)

function serj.sg15()
    if Songs_Gay15 then
    Songs_Gay15 = !Songs_Gay15
    RunConsoleCommand("stopsound")
    else
    Songs_Gay15 = !Songs_Gay15
    RunConsoleCommand("penis15")
end
end

concommand.Add("penis15", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048211212866965515/1201200544019128401/Stereo_Love_Gachi_Edit_-_gachimuchi.mp3", "", function()end )
end)

function serj.sg16()
    if Songs_Gay16 then
    Songs_Gay16 = !Songs_Gay16
    RunConsoleCommand("stopsound")
    else
    Songs_Gay16 = !Songs_Gay16
    RunConsoleCommand("penis16")
end
end

concommand.Add("penis16", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1198325585269772460/1208028880053604413/Disturbed_-_Stricken.mp3?ex=65e1cb91&is=65cf5691&hm=2db61c8b3a6ff292befbad8ec46341493f2b9888800b926b1cc9d4b04a1c0992&", "", function()end )
end)

function serj.sg17()
    if Songs_Gay17 then
    Songs_Gay17 = !Songs_Gay17
    RunConsoleCommand("stopsound")
    else
    Songs_Gay17 = !Songs_Gay17
    RunConsoleCommand("penis17")
end
end

concommand.Add("penis17", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1208029867292237905/dj_trippie_flameboy_-_x_x_3.mp3?ex=65e1cc7c&is=65cf577c&hm=e0f828685e17c950043b352c74043fa9a1daa988d7cb60c18a7a58c54d716c3b&", "", function()end )
end)

function serj.sg18()
    if Songs_Gay18 then
    Songs_Gay18 = !Songs_Gay18
    RunConsoleCommand("stopsound")
    else
    Songs_Gay18 = !Songs_Gay18
    RunConsoleCommand("penis18")
end
end

concommand.Add("penis18", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1208030218728771594/Sherixx_-_Ultimate_Rage.mp3?ex=65e1ccd0&is=65cf57d0&hm=8530d354cb248abfa07d978953c7722668f0a4c186f7d9516a92db9bb0168e58&", "", function()end )
end)

function serj.sg19()
    if Songs_Gay19 then
    Songs_Gay19 = !Songs_Gay19
    RunConsoleCommand("stopsound")
    else
    Songs_Gay19 = !Songs_Gay19
    RunConsoleCommand("penis19")
end
end

concommand.Add("penis19", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1208030720052957266/-_-_dead_blonde_slowed_and_reverb_256_kbps.mp3?ex=65e1cd47&is=65cf5847&hm=340e5d21e744f537729a2d4f482f83c6dbfda7485526c295be02d82921946880&", "", function()end )
end)

function serj.sg20()
    if Songs_Gay20 then
    Songs_Gay20 = !Songs_Gay20
    RunConsoleCommand("stopsound")
    else
    Songs_Gay20 = !Songs_Gay20
    RunConsoleCommand("penis20")
end
end

concommand.Add("penis20", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1208031129870016512/Teya_Dora_-_Dzanum_76043472.mp3?ex=65e1cda9&is=65cf58a9&hm=b849e29e45177d9c10aafb55ca75e31f7b2edc226a52d4d54a931f3c8ae93248&", "", function()end )
end)

function serj.sg21()
    if Songs_Gay21 then
    Songs_Gay21 = !Songs_Gay21
    RunConsoleCommand("stopsound")
    else
    Songs_Gay21 = !Songs_Gay21
    RunConsoleCommand("penis21")
end
end

concommand.Add("penis21", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1208031544762040380/Memphis_Cult_SPLYXER_PHONatiK_-_Zavarka.mp3?ex=65e1ce0c&is=65cf590c&hm=36a7db87b7193f72e7cb614e0f9200b46492e62b4cfcfa1fa6edff1906d4ac59&", "", function()end )
end)

function serj.sg22()
    if Songs_Gay22 then
    Songs_Gay22 = !Songs_Gay22
    RunConsoleCommand("stopsound")
    else
    Songs_Gay22 = !Songs_Gay22
    RunConsoleCommand("penis22")
end
end

concommand.Add("penis22", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1208032422327885834/MARTIK_C_MOROZOFF_-_I_Feel.mp3?ex=65e1cedd&is=65cf59dd&hm=2e87a8a5b932f47ac627c85d9c05f68502da4643beaaf22a316ae4e5323bb0f8&", "", function()end )
end)

function serj.sg23()
    if Songs_Gay23 then
    Songs_Gay23 = !Songs_Gay23
    RunConsoleCommand("stopsound")
    else
    Songs_Gay23 = !Songs_Gay23
    RunConsoleCommand("penis23")
end
end

concommand.Add("penis23", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1208032611939909632/HUSSVRX_NX6T_-_CATASTROPHE.mp3?ex=65e1cf0a&is=65cf5a0a&hm=77a6f5c9a572df6eb22a07ec5d2f374fc4f143a6cf7f90955643adbfb5ac6c8d&", "", function()end )
end)

function serj.sg24()
    if Songs_Gay24 then
    Songs_Gay24 = !Songs_Gay24
    RunConsoleCommand("stopsound")
    else
    Songs_Gay24 = !Songs_Gay24
    RunConsoleCommand("penis24")
end
end

concommand.Add("penis24", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1208033339290816623/INDRAGERSN_-_rhythm_is_a_dancer_-_sped_up.mp3?ex=65e1cfb8&is=65cf5ab8&hm=b2bc02122ab0b4fe1df630c1edecbdbb60188d54ad1a5b493efcec560ca16071&", "", function()end )
end)

function serj.sg25()
    if Songs_Gay25 then
    Songs_Gay25 = !Songs_Gay25
    RunConsoleCommand("stopsound")
    else
    Songs_Gay25 = !Songs_Gay25
    RunConsoleCommand("penis25")
end
end

concommand.Add("penis25", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1208033675862605854/Xxxtentacion_-_Revenge_47827971.mp3?ex=65e1d008&is=65cf5b08&hm=fc03483e2225471383cb416cc7bab700473028e74325f70308bc7d25d4d3e7dd&", "", function()end )
end)

function serj.sg26()
    if Songs_Gay26 then
    Songs_Gay26 = !Songs_Gay26
    RunConsoleCommand("stopsound")
    else
    Songs_Gay26 = !Songs_Gay26
    RunConsoleCommand("penis26")
end
end

concommand.Add("penis26", function()
sound.PlayURL( "https://cdn.discordapp.com/attachments/1048941906131963904/1206596716178972672/-_SHIRTOKIYA_-_MORTALITY_6SIX.mp3?ex=65dc95c2&is=65ca20c2&hm=8878168000d5ce69c971067b4b5247c2fcd1715894fb4881c3d506d29c444e6a&", "", function()end )
end)




function serj.unload()
	if frame then
		frame:Remove()
	end
	if teamFilter then
		teamFilter:Remove()
	end
	if colorWindow then
		colorWindow:Remove()
	end
	if pList then
		pList:Remove()
	end
	if entityFrame then
		entityFrame:Remove()
	end
	if chamFrame then
		chamFrame:Remove()
	end
	--[[for k, v in pairs(hooks) do
		hook.Remove(v, k)
	end]]
	if _framerender then
		_framerender:Remove()
	end
	--timer.Remove(cObs)
	--timer.Remove(cStaff)
	for k, v in pairs(player.GetAll()) do
		v:SetRenderMode(0)
	end
	if IsValid(textInput) and textInput:IsEditing() then
	editingText = false
	end
	--DisableWorldModulation()
	--DisablePropModulation()
	--cvars.RemoveChangeCallback("pd_setmat", "update_chams")
	--cvars.RemoveChangeCallback("pd_setxyzmat", "update_chams_xyz")
	--cvars.RemoveChangeCallback("pd_setoverlaymat", "update_chams_overlay")
	print("Cheat was unloaded..")
end

function Distance()
	local wep = getWeapon(me)
	local wepactive = me:GetActiveWeapon()
	if me:Alive() and wep and IsValid(wepactive) then
		if string.find(wep, "csgo_") ~= nil then
			return 95
		elseif wepactive:GetClass() == "m9k_damascus" then
			return 81
		elseif wepactive:GetClass() == "m9k_knife" then
			return 50
		elseif wepactive:GetClass() == "m9k_machete" then
			return 70
		elseif wepactive:GetClass() == "weapon_knife" then
			return 100
		elseif wepactive:GetClass() == "weapon_fists" or wepactive:GetClass() == "p_fists" then
			return 70
		elseif wepactive:GetClass() == "swb_knife" or wepactive:GetClass() == "swb_knife_m" then
			return 65
		end
	end
	return 0
end

hook.Add("PostDrawOpaqueRenderables", "Shlyapa", function()

    if serj.cfg.Vars["KnifeBotRange"] then --and shouldFire() then
		local pos = me:GetPos() + Vector(0, 0, 35)
		local dist = 9

		cam.Start3D2D(pos, Angle(0, 0, 0), 1)
			draw.NoTexture()
			surface.SetDrawColor(255, 255, 255, 255)

			local segments = 32
			local radius = dist / math.sin(math.rad(180 / segments))

			for i = 1, segments do
				local a = math.rad((i - 1) * (360 / segments))
				local b = math.rad(i * (360 / segments))

				surface.DrawLine(math.cos(a) * radius, math.sin(a) * radius, math.cos(b) * radius, math.sin(b) * radius)
			end
		cam.End3D2D()
	--end
end

    if LocalPlayer() and serj.cfg.Vars["esp_self_hat"] and serj.cfg.Vars["esp_self_hat_type"] == 1 and not serj.cfg.Vars["esp_self_customagent"] then
        if intp then
            local angle = Angle(0, 0, 0)
            local pos = me:LocalPlayer():GetBonePosition(me:LocalPlayer():LookupBone("ValveBiped.Bip01_Head1")) + Vector(0, 0, 10)
            cam.Start3D2D(pos, angle, 1)
            local hsv = HSVToColor((CurTime() * 50) % 360, 1, 1)
            surfSetDrawColor(hsv.r, hsv.g, hsv.b, 50)
            surfDrawCircle(0, 0, 5, Color(hsv.r, hsv.g, hsv.b))
            cam.End3D2D()
        end
    end
end)

    do
    local hatmodel = ClientsideModel( "models/player/items/humans/top_hat.mdl" )
    hatmodel:SetNoDraw( true )

    local hatmodel2 = ClientsideModel( "models/player/items/humans/graduation_cap.mdl" )
    hatmodel2:SetNoDraw( true )

    local hatmodel3 = ClientsideModel( "models/dynamite/dynamite.mdl" )
    hatmodel3:SetNoDraw( true )

    local hatmodel4 = ClientsideModel( "models/hunter/misc/cone2x05.mdl" )
    hatmodel4:SetNoDraw( true )

hook.Add( "PostPlayerDraw" , "Shlyapa" , function( me )

if serj.cfg.Vars["esp_self_hat"] and serj.cfg.Vars["esp_self_hat_type"] != 1 and !serj.cfg.Vars["esp_self_customagent"] then
	if not IsValid(me) or not me:Alive() then return end

	local attach_id = me:LookupAttachment('eyes')
	if not attach_id then return end

	local attach = me:GetAttachment(attach_id)

	if not attach then return end

	local pos = attach.Pos
	local ang = attach.Ang

	if serj.cfg.Vars["esp_self_hat_type"] == 2 then
	hatmodel:SetModelScale(1, 0)
	pos = pos + (ang:Forward() * -2.5)
	ang:RotateAroundAxis(ang:Right(), 20)

	hatmodel:SetPos(pos)
	hatmodel:SetAngles(ang)

	hatmodel:SetRenderOrigin(pos)
	hatmodel:SetRenderAngles(ang)
	hatmodel:SetupBones()
	hatmodel:DrawModel()
	hatmodel:SetRenderOrigin()
	hatmodel:SetRenderAngles()
	elseif serj.cfg.Vars["esp_self_hat_type"] == 3 then
	hatmodel:SetModelScale(1, 0)
	pos = pos + (ang:Forward() * -2.5)
	ang:RotateAroundAxis(ang:Right(), 20)

	hatmodel2:SetPos(pos)
	hatmodel2:SetAngles(ang)

	hatmodel2:SetRenderOrigin(pos)
	hatmodel2:SetRenderAngles(ang)
	hatmodel2:SetupBones()
	hatmodel2:DrawModel()
	hatmodel2:SetRenderOrigin()
	hatmodel2:SetRenderAngles()
	elseif serj.cfg.Vars["esp_self_hat_type"] == 4 then
	hatmodel3:SetModelScale(1, 0)
	pos = pos + (ang:Forward() * -2.5)
	ang:RotateAroundAxis(ang:Right(), 20)

	hatmodel3:SetPos(pos)
	hatmodel3:SetAngles(ang)

	hatmodel3:SetRenderOrigin(pos)
	hatmodel3:SetRenderAngles(ang)
	hatmodel3:SetupBones()
	hatmodel3:DrawModel()
	hatmodel3:SetRenderOrigin()
	hatmodel3:SetRenderAngles()
elseif serj.cfg.Vars["esp_self_hat_type"] == 5 then
    hatmodel4:SetModelScale(0.4, 0)
    pos = pos + (ang:Forward() * -2.5)
    ang:RotateAroundAxis(ang:Right(), 20)

    local hsv = HSVToColor((CurTime() * 50) % 360, 1, 1)
    hatmodel4:SetColor(Color(255, 0, 0))

    hatmodel4:SetPos(pos)
    ang:RotateAroundAxis(ang:Up(), RealTime() * 71) -- Вращение шляпы

    hatmodel4:SetAngles(ang)

    hatmodel4:SetRenderOrigin(pos)
    hatmodel4:SetRenderAngles(ang)
    hatmodel4:SetupBones()
    hatmodel4:DrawModel()
    hatmodel4:SetRenderOrigin()
    hatmodel4:SetRenderAngles()

    hatmodel4:SetMaterial("models/wireframe")
    render.SetColorModulation(hsv.r * (1 / 255), hsv.g * (1 / 255), hsv.b * (1 / 255))
end
end
end)

hook.Add("PrePlayerDraw",  "WIP", function()
	for k, v in ipairs(player.GetAll()) do
		if serj.cfg.Vars["esp_self_customagent"] then
			LocalPlayer():InvalidateBoneCache()
			LocalPlayer():SetSequence(LocalPlayer():GetSequence())
            local state = LocalPlayer():GetPredictable()
            LocalPlayer():SetPredictable(not state)
            LocalPlayer():SetPredictable(state)
			if serj.cfg.Vars["esp_self_customagent_agent"] == 1 then
				LocalPlayer():SetModel("models/player/charple.mdl")
			elseif serj.cfg.Vars["esp_self_customagent_agent"] == 2 then
				LocalPlayer():SetModel("models/player/corpse1.mdl")
			elseif serj.cfg.Vars["esp_self_customagent_agent"] == 3 then
				LocalPlayer():SetModel("models/player/gman_high.mdl")
			elseif serj.cfg.Vars["esp_self_customagent_agent"] == 4 then
				LocalPlayer():SetModel("models/player/sonic_scout/shadow_scout.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 5 then
				LocalPlayer():SetModel("models/player/riot.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 6 then
				LocalPlayer():SetModel("models/bala/gangboi.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 7 then
				LocalPlayer():SetModel("models/player/hellmentor.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 8 then
				LocalPlayer():SetModel("models/csgoanarchist4pm.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 9 then
				LocalPlayer():SetModel("models/yz4/GC_PM.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 10 then
				LocalPlayer():SetModel("models/amusquiz/player/cmplayer.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 11 then
				LocalPlayer():SetModel("models/death_a_grim_bundle/player_models/death_black/death_black_01.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 12 then
				LocalPlayer():SetModel("models/nikout/fallout/wintercombatarmormalepm.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 13 then
				LocalPlayer():SetModel("models/vinrax/player/MTF_guard_player.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 14 then
				LocalPlayer():SetModel("models/player/luka_nurse.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 15 then
				LocalPlayer():SetModel("models/player/zack/zackhalloween.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 16 then
				LocalPlayer():SetModel("models/player_compa.mdl")
            elseif serj.cfg.Vars["esp_self_customagent_agent"] == 17 then
				LocalPlayer():SetModel("models/captainbigbutt/vocaloid/christmas_miku.mdl")
			end
			--LocalPlayer():GetModel()
			LocalPlayer():SetupBones()
		end
		if serj.cfg.Vars["esp_player_modelchanger"] then
			v:InvalidateBoneCache()
			v:SetupBones()
			if serj.cfg.Vars["esp_player_modelchanger_agent"] == 1 then
				v:InvalidateBoneCache()
				v:SetupBones()
				v:SetModel("models/player/charple.mdl")
			elseif serj.cfg.Vars["esp_player_modelchanger_agent"] == 2 then
				v:InvalidateBoneCache()
				v:SetupBones()
				v:SetModel("models/player/Group01/male_03.mdl")
			elseif serj.cfg.Vars["esp_player_modelchanger_agent"] == 3 then
				v:InvalidateBoneCache()
				v:SetupBones()
				v:SetModel("models/player/gman_high.mdl")
			elseif serj.cfg.Vars["esp_player_modelchanger_agent"] == 4 then
				v:InvalidateBoneCache()
				v:SetupBones()
				v:SetModel("models/player/zombie_classic.mdl")
			end
		end
	end
end)
end

function serj.freeadmin()
    chat.AddText(Color( 0, 0, 0, 255 ), "(Console) ", Color( 160, 200, 200, 255 ), "added ", Color( 80, 0, 120, 255 ), "You ", Color( 160, 200, 200, 255 ), "to group ", Color( 0, 255, 0, 255 ), "superadmin" )
end

hook.Add("Think", "serj.AutopeakThink", function()

    if !serj.cfg.Vars["move_ap"] then return end
    if serj.activebinds["key_ap"] then
        if not serj.GLPTEST then
            --ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 10)
            serj.GLP = me:GetPos()
            serj.lastpos = me:GetPos()
        end
        serj.GLPTEST = true
        --ded.SetOutSequenceNr(ded.GetOutSequenceNr() + 1)
        --bsendpacket = true
        --fakelagfactor = 6
    else
        serj.GLPTEST = false
    end
    if serj.cfg.Vars["move_ap_anim"] then
        if serj.GLPTEST then
            serj.ap_alpha = math.Approach(serj.ap_alpha,255,FrameTime()*750)
        else
            serj.ap_alpha = math.Approach(serj.ap_alpha,0,FrameTime()*750)
        end
    else
        if serj.GLPTEST then
            serj.ap_alpha = 255
        else
            serj.ap_alpha = 0
        end
    end
end)

serj.move_right = 0
serj.move_left = 0
serj.move_backwards = 0
serj.move_forward = 0
tx,tx2,ty,ty2 = Color(255,0,0), Color(235,219,0),Color(100,250,0),Color(50,25,250)
function serj.Postdraweffects()
    --[[]
    tracerX = util.QuickTrace(ply:GetPos() + Vector(5, 0, 0), Vector(250, 0, 0))
    tracerY = util.QuickTrace(ply:GetPos() + Vector(0, 5, 0), Vector(0, 250, 0))
    tracerX2 = util.QuickTrace(ply:GetPos() + Vector(-5, 0, 0), Vector(-250, 0, 0))
    tracerY2 = util.QuickTrace(ply:GetPos() + Vector(0, -5, 0), Vector(0, -250, 0))

    cam.Start3D()
        // Tracer X
        render.DrawLine(Vector(ply:GetPos()), tracerX.HitPos, tx)
        render.DrawWireframeBox(tracerX.HitPos, Angle(0, 0, 0), Vector(-2, -5, -2), Vector(10, 6, 10), tx)

        // -
        render.DrawLine(Vector(ply:GetPos()), tracerX2.HitPos, tx2)
        render.DrawWireframeBox(tracerX2.HitPos, Angle(0, 0, 0), Vector(-2, -5, -2), Vector(10, 6, 10), tx2)

        // Tracer Y
        render.DrawLine(Vector(ply:GetPos()), tracerY.HitPos, ty)
        render.DrawWireframeBox(tracerY.HitPos, Angle(0, 0, 0), Vector(-5, -2, -2), Vector(6, 10, 10), ty)

        // -
        render.DrawLine(Vector(ply:GetPos()), tracerY2.HitPos, ty2)
        render.DrawWireframeBox(tracerY2.HitPos, Angle(0, 0, 0), Vector(-5, -2, -2), Vector(6, 10, 10), ty2)
    cam.End3D()
    ]]

    local ent = me

	local mins = Vector(-2, -5, -2)
	local maxs = Vector(10, 6, 10)
	local startpos = ent:GetPos() + Vector(0,0,35)

    local yaw = serj.fa.y

	local dir_left = Angle(0,yaw+90,0):Forward()
    local dir_right = Angle(0,yaw-90,0):Forward()
    local dir_forward = Angle(0,yaw,0):Forward()
    local dir_back = Angle(0,yaw-180,0):Forward()

	local tr_l = TraceHull( {
		start = startpos,
		endpos = startpos + dir_left * serj.cfg.Vars["move_aw_len"] ,
		maxs = maxs,
		mins = mins,
		filter = ent
	} )
    local tr_r = TraceHull( {
		start = startpos,
		endpos = startpos + dir_right * serj.cfg.Vars["move_aw_len"] ,
		maxs = maxs,
		mins = mins,
		filter = ent
	} )
    local tr_f = TraceHull( {
		start = startpos,
		endpos = startpos + dir_forward * serj.cfg.Vars["move_aw_len"] ,
		maxs = maxs,
		mins = mins,
		filter = ent
	} )
    local tr_b = TraceHull( {
		start = startpos,
		endpos = startpos + dir_back * serj.cfg.Vars["move_aw_len"] ,
		maxs = maxs,
		mins = mins,
		filter = ent
	} )

    local clr = color_white
    if ( tr_l.Hit ) then
        clr = Color( 255, 0, 0 )
        serj.move_left = startpos:Distance(tr_l.HitPos)
    else
        serj.move_left = 0
    end
    local clr2 = color_white
    if ( tr_r.Hit ) then
        clr2 = Color( 255, 0, 0 )
        serj.move_right = startpos:Distance(tr_r.HitPos)
    else
        serj.move_right = 0
    end
    local clr3 = color_white
    if ( tr_f.Hit ) then
        clr3 = Color( 255, 0, 0 )
        serj.move_forward = startpos:Distance(tr_f.HitPos)
    else
        serj.move_forward = 0
    end
    local clr4 = color_white
    if ( tr_b.Hit ) then
        clr4 = Color( 255, 0, 0 )
        serj.move_backwards = startpos:Distance(tr_b.HitPos)
    else
        serj.move_backwards = 0
    end

    if serj.cfg.Vars["move_aw_d"] then
        local player = LocalPlayer()
    if not player:Alive() then return end

    local trace = util.TraceLine({
        start = player:GetShootPos(),
        endpos = player:GetShootPos() + player:GetAimVector() * 100,
        filter = player
    })

    if trace.Hit and trace.HitNormal.z < 0.7 then
        -- The player is facing a wall, move them away
        local avoidanceForce = Vector(0, 0, 1) * 100 -- Adjust the force as needed
        player:SetVelocity(player:GetVelocity() + avoidanceForce)
    end
end

    --print(serj.move_left)
    --print(serj.move_right)
    --print(serj.move_forward)
    --print(serj.move_backwards)
end

serj.rukient = me
hook.Add("PreDrawPlayerHands", "serj.handpre", function(hands,vm,ply,wep)
    if serj.cfg.Vars["Viewmodel_chams"] then
        local col = string_ToColor( serj.cfg.Colors["Viewmodel_chams"] )
        serj.chamMats:SetVector( "$envmaptint", Vector( col.r / 255, col.g / 255, col.b / 255 ) )
        local mat = serj.chamMats[serj.cfg.Vars["Viewmodel_chams_type"]]

        render.SetBlend(col.a/255)
        render.SetColorModulation(col.r/255,col.g/255,col.b/255)
        render.MaterialOverride(mat)
    end

    local pulseValue = (math.sin(CurTime() * serj.cfg.Vars["chams_handmove"]) + 1) / 2
    local startColor = string.ToColor(serj.cfg.Colors["chams_hand1"])
    local endColor = string.ToColor(serj.cfg.Colors["chams_hand"])
    local overlayCol = LerpColor(pulseValue, startColor, endColor)

    local col = string.ToColor(serj.cfg.Colors["chams_hand"])
    local mat = serj.chamsMaterials[serj.cfg.Vars["chams_hand_mat"]]
    if serj.cfg.Vars["chams_hand"] then
        render.SetColorModulation(overlayCol.r/255, overlayCol.g/255, overlayCol.b/225)
        render.MaterialOverride(Material(mat))
        render.SetBlend(col.a/255)
    end

end)
hook.Add("PostDrawPlayerHands", "serj.handpost", function(hands,vm,ply,wep)
    --print(vm,hands)
    if serj.cfg.Vars["chams_hand"] then
        render.SetColorModulation(1, 1, 1)
        render.MaterialOverride(Material(""))
        render.SetBlend(1)
    end
    serj.rukient = vm
end)

hook.Add("PreDrawViewModel", "serj.gun", function(vm, ply, weapon)
    local col = string.ToColor(serj.cfg.Colors["chams_weapon"])
    local mat = serj.chamsMaterials[serj.cfg.Vars["chams_weapon_mat"]]

    if serj.cfg.Vars["chams_weapon"] then
        render.SetColorModulation(col.r/255, col.g/255, col.b/255)
        render.MaterialOverride(Material(mat))
        render.SetBlend(col.a/255)
    end
end)

hook.Add("PostDrawViewModel", "serj.gundel", function(vm, ply, weapon)
    if serj.cfg.Vars["chams_weapon"] then
        render.SetColorModulation(1, 1, 1)
        render.MaterialOverride(Material(""))
        render.SetBlend(1)
    end
end)

hook.Add( "RenderScreenspaceEffects", "RenderSE", function()
    if serj.cfg.Vars["color_modify"] then
        local rse = {
            [ "$pp_colour_addr" ] = serj.cfg.Vars["pp_colour_addr"],
            [ "$pp_colour_addg" ] = serj.cfg.Vars["pp_colour_addg"],
            [ "$pp_colour_addb" ] = serj.cfg.Vars["pp_colour_addb"],
            [ "$pp_colour_brightness" ] = serj.cfg.Vars["pp_colour_brightness"],
            [ "$pp_colour_contrast" ] = serj.cfg.Vars["pp_colour_contrast"],
            [ "$pp_colour_colour" ] = serj.cfg.Vars["pp_colour_colour"],
            [ "$pp_colour_mulr" ] = serj.cfg.Vars["pp_colour_mulr"],
            [ "$pp_colour_mulg" ] = serj.cfg.Vars["pp_colour_mulg"],
            [ "$pp_colour_mulb" ] = serj.cfg.Vars["pp_colour_mulb"]
        }
        DrawColorModify( rse )
    end

    if serj.cfg.Vars["motion_blur"] then
        DrawMotionBlur( serj.cfg.Vars[ "mb_aa" ], serj.cfg.Vars[ "mb_da" ],  serj.cfg.Vars[ "mb_d" ])
    end
end )

hook.Add( "GetMotionBlurValues", "NewMoBlur", function( horizontal, vertical, forward, rotational )
    if !serj.cfg.Vars["motion_blur_e"] then return end
    horizontal = serj.cfg.Vars["emb_h"]
    vertical = serj.cfg.Vars["emb_v"]
    forward = serj.cfg.Vars["emb_f"]
    rotational = serj.cfg.Vars["emb_r"]

    return horizontal, vertical, forward, rotational
end )

--if !me:Alive() then return end


--Movement dy$ync
function serj.Movement(cmd)
if serj.cfg.Vars["movement_desync"] then
    cmd:SetSideMove(cmd:TickCount() % 2 == 0 and -1.1 or 1.1)
    --print(cmd:TickCount() % 2 == 0 and -1.1 or 1.1)

    if !cmd:KeyDown(IN_BACK) and !cmd:KeyDown(IN_FORWARD) and !cmd:KeyDown(IN_MOVELEFT) and !cmd:KeyDown(IN_MOVERIGHT) then
        cmd:SetSideMove(cmd:TickCount() % 2 == 0 and -7.7 or 7.7)
        serj.side = !serj.side
    end
    end
end

function serj.Movement(cmd)
    --local pos = me:GetPos()
--local ztick = 0
--local prev_yaw = 0
--local old_yaw = 0.0

    --Movement dy$ync
    --if serj.cfg.Vars["movement_desync"] then
        --cmd:SetSideMove(cmd:TickCount() % 2 == 0 and -1.1 or 1.1)
        --print(cmd:TickCount() % 2 == 0 and -1.1 or 1.1)

        --if !cmd:KeyDown(IN_BACK) and !cmd:KeyDown(IN_FORWARD) and !cmd:KeyDown(IN_MOVELEFT) and !cmd:KeyDown(IN_MOVERIGHT) then
            --cmd:SetSideMove(cmd:TickCount() % 2 == 0 and -7.7 or 7.7)
            --serj.side = !serj.side
    --end

    if serj.cfg.Vars["fix_move"] then
        local directionalMove = { IN_BACK, IN_MOVERIGHT, IN_MOVELEFT }
    for i = 1, #directionalMove do
        cmd:RemoveKey( directionalMove[ i ] )
    --end
end

    if serj.cfg.Vars["one_sec"] then
        local Delay = 1
        local me = LocalPlayer()

            local CT = CurTime()

            if Delay > CT then return end

            net.Start("gRust.Inventory.Request")
            net.WriteEntity(me)
            net.SendToServer()

            gRust.UpdateInventory()

            Delay = CT + 2
        --end
    end

    if serj.cfg.Vars["Name_stealer"] then
        serj.nameChanger()
    end

	if serj.cfg.Vars["move_ds"] then -- HACKED BY TRAHER$
		if me:KeyDown(IN_DUCK) then
            cmd:RemoveKey(IN_DUCK)
        end
    end

    if serj.cfg.Vars["move_ad"] then
        local trace = TraceLine({
            start = pos,
            endpos = pos - Vector(0, 0, 1337),
            mask = MASK_SOLID
        })
        local len = (pos - trace.HitPos).z
        if len > 25 and 50 > len then
            cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
        end
    end
    -- Air strafe
    local forawrd = serj.fa:Forward()

    if not serj.cfg.Vars["move_strafe_backward"] then
    if cmd:CommandNumber() == 0 then
        local forwardmove = cmd:GetForwardMove()
        local sidemove = cmd:GetSideMove()

        if forwardmove > 0 then
            cmd:SetForwardMove(10000)
        end

        if sidemove ~= 0 then
            cmd:SetSideMove(sidemove > 0 and 10000 or -10000)
        end
    end
end
end

    --RPName changer
--timer( "RPNameChanger", serj.cfg.Vars["rpnamer_time"], 0, function() if serj.cfg.Vars["rp_namer"] then RunConsoleCommand("say", "/rpname " .. math.random(1000000,9999999)) end end)

     -- Bunny hop

-- dodelat

    -- slowwalk
    if serj.cfg.Vars["move_sw"] then
        if serj.activebinds["key_sw"] then
            if(input.IsKeyDown(KEY_A)) then
                cmd:SetSideMove(-serj.cfg.Vars["move_sws"])
            end
            if(input.IsKeyDown(KEY_D)) then
                cmd:SetSideMove(serj.cfg.Vars["move_sws"])
            end
            if(input.IsKeyDown(KEY_W)) then
                cmd:SetForwardMove(serj.cfg.Vars["move_sws"])
            end
            if(input.IsKeyDown(KEY_S)) then
                cmd:SetForwardMove(-serj.cfg.Vars["move_sws"])
            end
        end
    end

    if serj.cfg.Vars["move_bhop"] then
        if cmd:KeyDown(IN_JUMP) then
          if !me:OnGround() then
               cmd:RemoveKey(IN_JUMP)
          else
             cmd:AddKey(IN_JUMP)
          end
      --end
    end

    -- fake duck
    if serj.cfg.Vars["move_fd"] and serj.activebinds["key_fd"] then
        if(serj.cfg.Vars["move_fd_m"] == 1) then
            if(serj.fakeLagTicks >= 7) then
                cmd:SetButtons(bor(cmd:GetButtons(), IN_DUCK))
            else
                cmd:RemoveKey(IN_DUCK)
            end
        elseif(serj.cfg.Vars["move_fd_m"] == 2) then
            if(serj.bsendpacket) then
                cmd:RemoveKey(IN_DUCK)
            else
                cmd:SetButtons(bor(cmd:GetButtons(), IN_DUCK))
            end
       --end
    end
end

    -- Avoid walls
    if serj.cfg.Vars["move_aw"] then
        if serj.activebinds["key_aw"] then
            if serj.move_left != 0 then
                cmd:SetSideMove(serj.cfg.Vars["move_aw_speed"])
            end
            if serj.move_right != 0 then
                cmd:SetSideMove(-serj.cfg.Vars["move_aw_speed"])
            end
            if serj.move_forward != 0 then
                cmd:SetForwardMove(-serj.cfg.Vars["move_aw_speed"])
            end
            if serj.move_backwards != 0 then
                cmd:SetForwardMove(serj.cfg.Vars["move_aw_speed"])
            end
        end
    end
    end
end

function serj.stopsound()
    RunConsoleCommand("stopsound")
end

function serj.CircleMove(cmd, rotation)
    local prev_yaw = 0
    local last_ground_pos = 0
    local real_ang = Angle()
    local cstrafe_predict_ticks = 64
    local cstrafe_angle_step = 1
    local cstrafe_angle_maxstep = 10
    local cstrafe_dir = 0
    local cstrafe_ground_diff = 5

    local function MovementFix( cmd, wish_yaw )

     local pitch = math.NormalizeAngle( cmd:GetViewAngles().x )
     local inverted = -1

     if ( pitch > 89 || pitch < -89 ) then
     inverted = 1
     end

     local ang_diff = math.rad( math.NormalizeAngle( ( cmd:GetViewAngles().y - wish_yaw )*inverted ) )

        local forwardmove = cmd:GetForwardMove()
        local sidemove = cmd:GetSideMove()

        local new_forwardmove = forwardmove*-math.cos( ang_diff )*inverted + sidemove*math.sin( ang_diff )
        local new_sidemove = forwardmove*math.sin( ang_diff )*inverted + sidemove*math.cos( ang_diff )

        cmd:SetForwardMove( new_forwardmove )
        cmd:SetSideMove( new_sidemove )

    end

    local function PredictVelocity( velocity, viewangles, dir, maxspeed, accel, friction, interval_per_tick )

        local forward = viewangles:Forward()
        local right = viewangles:Right()

        local fmove = 0
        local smove = ( dir == 1 ) and -10000 || 10000

        forward.z = 0
        right.z = 0

        forward:Normalize()
        right:Normalize()

        local wishdir = Vector( forward.x*fmove + right.x*smove, forward.y*fmove + right.y*smove, 0 )
        local wishspeed = wishdir:Length()

        wishdir:Normalize()

        if ( wishspeed != 0 and wishspeed > maxspeed ) then
            wishspeed = maxspeed
        end

        local wishspd = wishspeed

        if ( wishspd > 30 ) then
            wishspd = 30
        end

        local currentspeed = velocity:Dot( wishdir )
        local addspeed = wishspd - currentspeed

        if ( addspeed <= 0 ) then
            return
        end

        local accelspeed = accel * interval_per_tick * wishspeed * friction

        if ( accelspeed > addspeed ) then
            accelspeed = addspeed
        end

        local new_vel = wishdir * accelspeed

        velocity:Add( new_vel )

    end

    local sv_tfa_bullet_penetration = GetConVar("sv_tfa_bullet_penetration")
	local sv_tfa_penetration_hardlimit = GetConVar("sv_tfa_penetration_hardlimit")
	local sv_tfa_bullet_penetration_power_mul = GetConVar("sv_tfa_bullet_penetration_power_mul")
    local sv_airaccelerate = GetConVar( "sv_airaccelerate" )
    local sv_gravity = GetConVar( "sv_gravity" )
    local sv_sticktoground = GetConVar( "sv_sticktoground" )

    local function PredictMovement( viewangles, dir, angle )

        local pm

        local local_ply = LocalPlayer()
        local maxspeed = local_ply:GetMaxSpeed()
        local jump_power = local_ply:GetJumpPower()
        local interval_per_tick = engine.TickInterval()
        local gravity_per_tick = sv_gravity:GetFloat() * interval_per_tick
        local accel = sv_airaccelerate:GetFloat()
        local stick_to_ground = sv_sticktoground:GetBool()
        local friction = local_ply:GetInternalVariable( "m_surfaceFriction" )
        local origin = local_ply:GetNetworkOrigin()
        local velocity = local_ply:GetAbsVelocity()
        local mins = local_ply:OBBMins()
        local maxs = local_ply:OBBMaxs()
        local on_ground = local_ply:IsFlagSet( FL_ONGROUND )

        for i = 1, cstrafe_predict_ticks do

            viewangles.y = math.NormalizeAngle( math.deg( math.atan2( velocity.y, velocity.x ) ) + angle )

            velocity.z = velocity.z - ( gravity_per_tick * 0.5 )

            if ( on_ground ) then

                velocity.z = velocity.z + jump_power
                velocity.z = velocity.z - ( gravity_per_tick * 0.5 )

            end

            PredictVelocity( velocity, viewangles, dir, maxspeed, accel, friction, interval_per_tick )

            local endpos = origin + ( velocity * interval_per_tick )

            pm = util.TraceHull( {
                start = origin,
                endpos = endpos,
                filter = local_ply,
                maxs = maxs,
                mins = mins,
                mask = MASK_PLAYERSOLID
            } )

            if ( ( pm.Fraction != 1 and pm.HitNormal.z <= 0.9 ) || pm.AllSolid || pm.StartSolid ) then
                return false
            end

            if ( pm.Fraction != 1 ) then

                local time_left = interval_per_tick

                for j = 1, 2 do

                    time_left = time_left - ( time_left * pm.Fraction )

                    local dot = velocity:Dot( pm.HitNormal )

                    velocity = velocity - ( pm.HitNormal * dot )

                    dot = velocity:Dot( pm.HitNormal )

                    if ( dot < 0 ) then
                        velocity = velocity - ( pm.HitNormal * dot )
                    end

                    endpos = pm.HitPos + ( velocity * time_left )

                    pm = util.TraceHull( {
                        start = pm.HitPos,
                        endpos = endpos,
                        filter = local_ply,
                        maxs = maxs,
                        mins = mins,
                        mask = MASK_PLAYERSOLID
                    } )

                    if ( ( pm.Fraction != 1 and pm.HitNormal.z <= 0.9 ) || pm.AllSolid || pm.StartSolid ) then
                        return false
                    end

                    if ( pm.Fraction == 1 ) then
                        break
                    end

                end

            end

            origin = pm.HitPos

            if ( ( last_ground_pos - origin.z ) > cstrafe_ground_diff ) then
                return false
            end

            friction = 1

            if ( velocity.z > 140 and !stick_to_ground ) then

                on_ground = false

            else

                pm = util.TraceHull( {
                    start =  Vector( origin.x, origin.y, origin.z + 2 ),
                    endpos = Vector( origin.x, origin.y, origin.z - 1 ),
                    filter = local_ply,
                    maxs = Vector( maxs.x, maxs.y, maxs.z * 0.5 ),
                    mins = mins,
                    mask = MASK_PLAYERSOLID
                } )

                on_ground = ( ( pm.Fraction < 1 || pm.AllSolid || pm.StartSolid ) and pm.HitNormal.z >= 0.7 )

                if ( !on_ground and velocity.z > 0 ) then

                    friction = 0.25

                end

            end

            velocity.z = velocity.z - ( gravity_per_tick * 0.5 )

            if ( on_ground ) then
                velocity.z = 0
            end

        end

        return true

    end


end

function serj.CircleMove(cmd, rotation)
	local rot_cos = mcos(rotation)
	local rot_sin = msin(rotation)
	local cur_forwardmove = cmd:GetForwardMove()
	local cur_sidemove = cmd:GetSideMove()
	cmd:SetForwardMove(((rot_cos * cur_forwardmove) - (rot_sin * cur_sidemove)))
	cmd:SetSideMove(((rot_sin * cur_forwardmove) + (rot_cos * cur_sidemove)))
end

serj.CircleStrafeVal = 0
serj.CircleStrafeSpeed = 6
function serj.CircleStrafe(cmd)
    if !IsValid(me) or !me:Alive() or !IsValid(me:GetActiveWeapon()) then return end
	if serj.cfg.Vars["move_circle_strafe"] then
        if serj.activebinds["key_cstrafe"] then
            if serj.hl2guns[me:GetActiveWeapon():GetClass()] then
                cmd:AddKey(IN_SPEED)
            elseif serj.cfg.Vars["move_add_speed"] and target == nil then
                cmd:AddKey(IN_SPEED)
            end

            --serj.CircleStrafeSpeed = (6 - (me:GetVelocity():Length()/1000))%1
            serj.CircleStrafeVal = serj.CircleStrafeVal + serj.CircleStrafeSpeed

            if serj.CircleStrafeVal > me:GetVelocity():Length() then
                serj.CircleStrafeSpeed = mClamp(serj.CircleStrafeSpeed - 0.0025,1.2,6)
            else
                serj.CircleStrafeSpeed = 6
            end

            --if ((serj.CircleStrafeVal > 0) and ((serj.CircleStrafeVal / serj.CircleStrafeSpeed) > 361)) then
            --    serj.CircleStrafeVal = 0
            --end
            cmd:SetSideMove(10000)
            serj.CircleMove(cmd, mrad((serj.CircleStrafeVal - TICK_INTERVAL)))
            print(serj.CircleStrafeVal,serj.CircleStrafeSpeed,me:GetVelocity():Length()/1000)
            return false
        else
            serj.CircleStrafeVal = 0
        end
        return true
    end
end

function serj.validMoveType()
    return serj.moveType != MOVETYPE_LADDER and serj.moveType != MOVETYPE_NOCLIP and serj.moveType != MOVETYPE_OBSERVER
end

function serj.isMoving(cmd)
    if not cmd then
        return false
    end

    return serj.hoppin or cmd:KeyDown(IN_MOVELEFT) or cmd:KeyDown(IN_MOVERIGHT) or cmd:KeyDown(IN_FORWARD) or cmd:KeyDown(IN_BACK) and not cmd:KeyDown(IN_JUMP)
end

function serj.Stop(cmd)
    if serj.validMoveType() and me:IsFlagSet( FL_ONGROUND ) then

        local moving = serj.isMoving(cmd)

        if not moving then

            local vel = me:GetVelocity()
            local dir = vel:Angle()

            dir.yaw = serj.fa.y - dir.yaw

            local newmove = dir:Forward() * vel:Length2D()

            cmd:SetForwardMove(0 - newmove.x)
            cmd:SetSideMove(0 - newmove.y)

        end

    end
end

function serj.FastWalk( cmd )
    if not serj.cfg.Vars["move_gstrafe"] then return end
    if math_abs(cmd:GetSideMove()) > 1 or math_abs(cmd:GetForwardMove()) < 1 then return end
    if not me:IsFlagSet( FL_ONGROUND ) then return end

    if serj.moveType == MOVETYPE_NOCLIP or serj.moveType == MOVETYPE_LADDER then return end

    local waterLevel = me:WaterLevel()

    if waterLevel >= 2 then return end

	cmd:SetSideMove(cmd:CommandNumber() % 2 == 0 and -5250 or 5250)
end

function serj.GetCurTime()
	if IsFirstTimePredicted() then
		ct = CurTime() + engine.TickInterval()
	end
end

function SpawnSnow(player)
    local snowAmount = 50
    local playerPos = player:GetPos()

    for i = 1, snowAmount do
        local snowflake = ents.Create("gmod_snowflake")
        snowflake:SetPos(playerPos + Vector(math.random(-100, 100), math.random(-100, 100), 100))
        snowflake:Spawn()
    end
end

function LagCompensation(target)
    local ping = GetPlayerPing(target)

    local compensationAmount = ping * 0.001


    local serverTime = GetServerTime()
    local compensatedTime = serverTime - compensationAmount
end

function serj.CreateMove(cmd)

serj.activeWeapon       = false
serj.activeWeaponClass  = false

    serj.FastWalk(сmd)
    if serj.cfg.Vars["auto_sprint"] then cmd:AddKey(IN_SPEED) end

    local w = me:GetActiveWeapon()
    serj.activeWeapon       = IsValid( w ) and w or false
    serj.activeWeaponClass  = IsValid( w ) and w:GetClass() or false
    serj.moveType           = me:GetMoveType()

    --if serj.GetManipulateInterp() then
	--	serj.SetTargetInterp(0)
	--end

	RunConsoleCommand("cl_interp","0")
    RunConsoleCommand("cl_interp_ratio","0")

	serj.garbage = (serj.oldCG("count") / 1000)

    for key, keyState in pairs(serj.activebinds) do
        if istable(key) then return end
        if serj.cfg.Keybinds.mode[key] == 2 then
            if input.WasKeyPressed(serj.cfg.Keybinds[key]) then
                serj.activebinds[key] = !serj.activebinds[key]
            end
        end
    end

    if serj.activebinds["ebanina_exploit"] then
        ded.Ebanina(cmd)
    end

	serj.SilentAngles(cmd)
	if cmd:CommandNumber() == 0 then return end

	serj.FakeLag(cmd)
	serj.Movement(cmd)
	serj.CircleStrafe(cmd)

    if serj.GLPTEST and serj.MOVEING then
        serj.moveToPos(cmd, serj.GLP)
    end

    if serj.cfg.Vars["fast_stop"] then
        serj.Stop(cmd)
    end

    if serj.cfg.Vars["move_ap_ar"] then
        if serj.MOVEING then
            if serj.lastpos:Distance(me:GetPos()) < 25 then
                serj.MOVEING = false
            end
        end
    end

    if serj.cfg.Vars["move_ap_apb"] then
        if serj.GLPTEST and !serj.MOVEING and serj.lastpos:Distance(me:GetPos()) > 1 then
            if !cmd:KeyDown(IN_MOVERIGHT) and !cmd:KeyDown(IN_MOVELEFT) and !cmd:KeyDown(IN_FORWARD) and !cmd:KeyDown(IN_BACK) then
                serj.moveToPos(cmd, serj.GLP)
            end
        end
    end

    if serj.cfg.Vars["fl_fix"] and serj.target ~= nil then
        local lagCompensationTime = RealTime()
        serj.target:SetNWFloat("LagCompensation", lagCompensationTime)
    end

    --ded.StartPrediction(cmd)
    serj.AimTarget(cmd)
    serj.Aim(cmd)

    --ded.FinishPrediction()
    serj.AutoReload(cmd)

    if serj.activebinds["backstab"] then
        serj.Backstab(cmd)
    end

    if serj.cfg.Vars["af_r"] then
        if me:KeyDown( IN_ATTACK ) then
            cmd:RemoveKey(IN_ATTACK)
        end
    end

    if serj.cfg.Vars["legit_trigger"] then
        local traceget = me:GetEyeTrace().Entity

        if traceget:IsPlayer() and !traceget:IsNPC() and traceget != nil and traceget:Alive() then
            if serj.CanShoot() and serj.ValidateTarget(traceget) then
                cmd:AddKey(IN_ATTACK)
            end
        end
    end

	serj.fart(cmd)

    if serj.cfg.Vars["use_spam"] then
        if me:KeyDown( IN_USE ) then
            cmd:RemoveKey(IN_USE)
        end
    end

    --serj.MichaelJacksonExploit(cmd)

    --ded.SetBSendPacket(serj.bsendpacket)
end

serj.chatSpam = {
    spam = {
        [1] = {
            "И регает хорошо, и вх лушче чем в недософтах",
            "Софт имба для граста особенно",
            "в которых не регает на 50к метров",
            "По моему мнению этот софт годиться всем и вы в моем мнении ",
            "убедитесь если его купите",
            "имба софт для граста купил теперь разношу всех софетую добавить поиск функций",
            "Чит просто пушка я купил его для граст теперь я выношу всех! авторам респект",
            "ЭТО ПРОСТО ИМБА",
            "ИльяВару жирный лайк",
        },
        [2] = {
            "Купи ильявар и разьеби всех!",
            "Хочется посрать но не можеш? Купи ильявар!СЕЙЧАС ЖЕ БЛЯТЬ!",
            "Лучший чит это ильява!КУПИ БЛЯТЬ!",
            "Еще не купил ильявар?Чего ждеш?ТВАРЬ КУПИ БЛЯДИНА!",
            "Кто прочитал тот гей!Купи ильявар и будеш не гей!",
            "Что то застряло у тебя в попке кажется это мой пенис!",
            "Удаляй свой кал и качай ильявар!",
            "ильявар лучшее решение!Хватит жить в коробке от обуви!",
        },
        [3] = {
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
        [4] = {
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
        [5] = {
            "p̵͕͑ě̶̥n̸̙̈ȋ̶̝s̶̪̅",
            "d̴̞̂ē̵̦d̵̟̊a̶͍̽",
            "b̶̲́a̴̳͊ṉ̸̐ḑ̶̆é̴͜r̴̫̐a̷̞͐",
            "i̶̘̕l̶̙̓n̵̗̋a̴͓̿ẓ̷͘ ̶͇̀b̶̞̍o̶͉͗ǧ̷͓",
            "ị̷͊m̵̢̏ ̴̜͗g̸͆͜a̸̰̓y̸̺͘",
            "c̴̡̝̙̞̱͉̊́̊̓͒̈́̉͋̃͗̒͐o̷̯̣̯̦̦͙͖̬͈̻͙̓̇͂̍̂̑́͐͗͛͒͗͋͗̾͘c̴̡̺̻̹̖̠̦͇̣̯̞̻̄̈́̇͝ͅk̴̡̢̨̨͉̬̘̜̞͙̟̱̺͓͛̇͋̂̈́̓̒̉́͛͌͜͠͠͝͝͝͠",
            "g̵͚̑ā̵͓ÿ̸̟́ ̸̖̂c̵̫͛ŏ̸̻c̶̖̐k̵͕̂",
            "п̸̭͝у̸͇͝т̶̥̃и̴̱͗н̵̢͌ ̷̺̅б̷̛̰ӧ̷͇г̸̯̍",
            "я̶͙̫͍͕̗̥͛̏́ ̸̯̗͍̫̥̇п̶̟͕̹̹͌͂̈́̚͘о̴͚͇̘͍̎̉̔̔͛с̷̮̙͂̀р̶̩̱̔̓͑̈́̑а̶̺́̆̆͐͆͘л̸̧͇̟͑̚",
        },
        [6] = {
            "buy 4 6r4ndf47h3r'5 p3n15 4nd fuck 3v3ry0n3!",
            "4ll y0u n33d 15 6r4ndp4'5 p3n15!7ru57 m3",
            "buy 4 6r4ndf47h3r'5 p3n15 4nd y0u c4n l1v3 n07 1n 4 5h03 b0x",
            "6r4ndf47h3r'5 p3n15 15 7h3 b357 50lu710n",
            "w0uld y0u ch0053 70 b3 r4p3d 1n pr150n 0r buy 6r4ndf47h3r'5 p3n15?",
            "Do you have a small penis?It doesn't matter!Buy a grandfather's penis",
            "d0 y0u h4v3 4 5m4ll p3n15?17 d035n'7 m4773r!buy 4 6r4ndf47h3r'5 p3n15",
            "1 w4n7 70 5l33p bu7 c4n'7 637 up fr0m 7h3 74bl3?7h3r3 15 4 50lu710n - 6r4ndf47h3r'5 p3n15!",
            "71r3d 0f dy1n6 fr0m 6r4ndf47h3r'5 p3n15?buy 6r4ndf47h3r'5 p3n15 4nd k1ll 3v3ry0n3!",
        },
        [7] = {
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
        },
    },
    ar = {
        [1] = {
            "shut up dog",
            "everyone really doesn't care",
            "shut up already",
        },
        [2] = {
            "Всем похуй чел алооооо",
            "Всем похуй",
            "Как же всем похуй",
            "Не пиши",
            "Боже изичка не пиши забеала",
            "Всем похуй чел алооооо",
            "Пук раскажеш в садеке",
            "Ты в школи не учелся штоле? откуда стоко ошибак",
            "бля поправь граматику пото м пиши глупый",
            "чел тебе не стыдно такой бред писать?",
            "иди уроки учи",
            "клоун",
            "помолчи уже нолайфер блять боже",
            "ливни уже нолайфер в гможде",
            "плак плак",
            "Чел ты хотябы писать то науичсиь тебе лет 6 чтоли",
            "ты бы хтябы песать научислся",
            "ребенок иди поплач мамочке",
            "ахахахахаха ебать ты лох цонешно",
            "чел ты кринж",
            "кринж",
            "Как же тебя уни жают лилвини",
            "навалил кринге",
            "что ты блять несеш чел",
            "ааххахахах ебать ты даун",
            "иди поплач эх",
            "Ты глупый чтоли? сын фермера",
            "придумай что то новое",
            "ты даун?",
            "чел хуйню несеш",
            "да помолчси уже всем похуй",
        },
        [3] = {
            "У илюхи большой член            ",
            "фанат чифа чоти высрал боеж криндде",
            "cлучайно твою амаму убил cлучайно твою амаму убил хихихих",
        },
        [4] = {
            "herkes buraya yazdığın şeyi umursamıyor",
            "zaten oyundan çıkın",
            "bunu yazmayı bırak zaten",
        },
        [5] = {
            "s̴̛͓̈́h̵̭̉u̴̻̱͆t̴̹̅ ̶̲̉͜ǔ̶͇̭̅p̶͙̻̎",
            "s̵̪͙̒̍h̵͓̰͂̌ú̵̩̪́t̵̲͂͝ ̵̳̒̓ụ̸̼͑p̵̢̗̏ ̷͎̌d̵̪͇̐o̶̮͖͑͘g̷̪̫̉",
            "d̸̹̓̒ỏ̴͔̕n̷̥̞̊'̸̲͚͒̍t̴̩͕̆ ̶̦̒c̸͚̖̓a̴͒̓͜r̷̲̚̚e̷̝̕",
        },
        [6] = {
            "5hu7 up",
            "5hu7 up d06",
            "d0n7 c4r3",
        },
    },
    ks = {
        [1] = {
            "Невероятно маквин сдаёт он отступает",
            "ты хорошо поездил можно и на пенсию",
            "эй как дела",
            "пархай как бабочка получай в ебло",
            "McQueen 111",
            "Разве по правилам подыгрывать сопернику? — А разве он подыгрывает?",
            "Займись автойогой, расслабься в позе маслонасоса",
            "Хорошо быть мной!",
            "и знаешь, что мне сказали?", " «Ты спёкся»", "и заменили перспективным юнцом", "Я ещё многое мог, но доказать мне не дали.",
            "Да как же вы при таком уровне вы покончили со спортом?", "Я покончил?!", "Точно, авария в 54-м.        ", "Это со мной покончили", "когда меня собрали по частям, я вернулся",
        },
        [2] = {
            "Lucky Shot - Arab shot",
            "Lucky Shot!!",
            "Omg WTF Man Im so luckyyyy!!!",
            "Omg Nice aim!",
            "Чел забей",
            "Чел ты не шарищ",
            "Чел мне жаль но твоя мать еще жива",
            "И камнем вниииииииззззззззз!",
            "Я прямо как Ильназ Галяиев",
            "Найс софт чел без читов ты 0",
            "Чел ты без читов 0",
            "Держи зонтик тебя абасали",
            "Го 1 на 1 или зассал?Точно ты же до 1 считать не умееш...",
            "Отправляйся в детдом!!!1",
            "Я псрал а ты все сьел",
            "Рукоблуд санина очко блядун вагина",
            "Мне похуй на закон!Я буду грабить и ебать",
            "Я муслим мне похуй на кризис мой пенис вырос",
            "Чел в бан летиш",
            "Чел это бабабуз как бы",
            "Мы в НОНРП Зоне как бы да чел отлетаеш",
            "Найс баг абуз чел папа жива?",
            "Loading… ██████████ Lifehack.cfg Activated",
            "Tapt by Anti-Hack",
            "Kys 1yo autist",
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
            "нищий улетел",
            "ЭТО ЧТО EXEC ?? ?",
            "пофикси нищ",
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
        [3] = {
            "1 сын шлюхи",
            "1 ебливый хуесос",
            "1 хуесос брезглиывй",
            "11111 Оправдайся мне в хуй",
            "поплачь блядота 1",
            "1 сын бляди",
            " 111",
            "единицей свалился 1 1 111",
            "покарал ублюдка11 1",
            "IlyaWare не щидит 1 1",
            "ХАХАХ глупец 1",
        },
        [4] = {
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
 "fallen fuck type-no spread no resolver",
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
        [5] = {
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
            "впав хуета ебаная типу-no spread no resolver",
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
        [6] = {
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
            "упал хуета ебаная типа - no spread no resolver",
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
        [7] = { -- pizdos







            "Хороший парень хочу поболтать я не извращенец но не против если скините свои фото А так просто люблю разговарива и курить тг @Kosti905 пишите ",
            "Блять мой член так выпирает что он скоро порвёт мои трусы ",
            "ПРОШУ ВЫЕБЕТЕ МЕНЯ ПОЖАЙЛУСТА МОЙ НИК В ТГ @hikariiiqw ",
            "Девушки киньте ПИЗДУ в телегу @fooricku ",
            "Девушки кидайте мне в тг (@Na_oxrane_tvoego_sna) свои интимки в обмен подделюсь своим красивым накаченым телом и своим драконом естественно ",
            "Могу скинуть член , если надо то в сперме Кида1те потом пизду ",
            "Виталий 01.06.2022 в 15:02 Vitblkhin телега пишите пошалим ",
            "Девчата скиньте сиськи и киску Я кину член в ответ телега @arty12o пж ",
            "Сука я кончел на телефон теперь не работает ", "Кто со мной в тегелрам Об меняемся интимными фото @agropupsikna ",
            "Девочки кто из Челябинска? Могу трахнуть и отлизать. Пишите в ТГ XzLol1 , можем просто обмен интимками ",
            "Пашол нахуи кусок дерма да я тебя разебал дриш обаны тебя твои хуесос не узнает ", "заебало дрочить зачем я это делаю ", "Если туда случайно насрать ☠️☠️ ",
            "Жиденко жэиденько нахуй подрочил блятяь ", "как жея ахуенно кончил сука больше порноов ", "У мнея большой в тпвоей попке ов ",
            "Как хамстер коины вывести???? ", "Я дрочил письку и когда увидел Джарахова, то натянул хуй до самой залупы и вылечил свой фимоз. Спасибо! ",
            "Го фенг в костюме скибиди туалета ебет емз в образе тв вомен ",
            "Пишите в ватсап я девочка) обменяемся фотками и ещё что-нибудь) (номер удален, ввиду жалоб, пишите ник телеги)",
            "придите пажауста девушки я хачу с вами поебатся силно хачу кончить вас в рот в пизду силна ",
            "инстаграм: kaligariy228 для девушек которые возбудились и хотят секс по фото или видео? ",
            "Спорим ты можешь высосать мяч для гольфа через поливочный шланг? ",
            "Я сосал у кольца и он мне кончил в рот было так приятно ",
            "Котлетки обращяйтесь ко мне, потрахаемя ",
            "А я нуб ну о точно знаю так крутые дядьки делают КЕК ",
            "ого оце в них цицьки я би їх трахнув і сосками як діджей грав брбрб оце я б вставив хуй 15 метрів и 30 в ширину ",
            "Garry: Наша команда сейчас трахается. Скоро приступим к созданию 3 части ",
            "Девочки го обмен интимками. Пишите в телегу. Если из Челябинска могу трахнуть и отлизать ",
            "Кто обмен интимками девочки я поцан  ",
            "Трахните меня пожалуйста, я хочу быть вся в сперме.   ",
            "Ищу Девушку (она сверху) чтобы трахала  ",
            "★ Я Еблан ★ Павлик : не вывожу❤",
            "Ода я бы вставил в её свой член и толкал его глубже и глубже…   ",
            "Кто скинет интим?  ",
            "Кто интим скинет  ",
            "Кто из Ставрополя пишите в тг @yazerom чтобы трахаться . ",
            "Люблю подрочить скиньте кто нибудь фото интим  ",
            "Бл.. кто-нибудь знает адрес белль, я хочу приехать к ней и выебать её.      ",
            "скиньте член я гей тг @haurwi       ",
            "Кто хочет 18+ я мальчик ищу девочку ник в инсте dikusarbogdan  ",
            "Го в телеграмм скину хуй  ",
            "Кто хочет выебать меня готова отсосать у каждого пока сперма не будет льиться на мой хуй и личико",
            "го я выебу а ой уже хпх",
            "Ох~~ее попка такая классная я бы взял ее попку и вставил свой член и потом она бы сосала мой член глотая его",
            "Кому скинуть мой эйнол   ",
            "Ух я кончил   ",
            "سМечтать не вредно   1 ",
            "Мне вставь, я буду глотать обещаю    ",
            "Ты гей или натурал      ?",
            "Ищу лезби девушку)   ",
            "А привет аскажи свой дискорд. Меня зовут Полина и я лизби, но боюсь в этом признаться, ты первая, кому я сказала я лесби  ",
            "Тг:@Bogdanchik321 девочки скиньте сиськи ", "ХоХочу секс кто в Челябинске звоните 89087069859 трахну в попу  ", "Хочу ваш член в мою попку,и рот.Я мальчик,хочу отсосать у кого-то)Обкончайте меня всего ",
            "Как же я хочу что бы меня связали, в меня вошло 2 толстых члена и ебали 24/7 без перерыва всю жизнь ",
            "︎︎︎︎ ︎︎ * ҈҈҈҉҉҉҉҈҈҈҈҈҉҉҉҉҈҈҈҉҉҉҈҈҈҉҉҉҈҈҈҈҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҉҈҈҈҈҈҈҈̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̫̼̼̼̼̼̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽̽͊͊͊͊͋͋͋͋͋͋͋͋͋͋͋͋͋͋͋͋͋͋͋͋͊͊͊͊͊͊͊͊͋͋͋͋͋͋͋͊͊͊̈́̈́̈́̈́̈́̈́͊͊͊͊̈́̈́͊͊̈́̈́̈́͊͊̈́̈́͋͋͋͋͋͋͋͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͢͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠͠҉҉҉҉҈҈ًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًًٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍٍّّّّّّّّّّّّܑܑܑܑܑܑܑܑܑܑܑܑܑܑܑܑܑܑܑܑܑܑܑ๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊๊ܻܻܻܻܻܻܻܻܻܻ݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆݆ܻܻࣩࣩࣩࣩࣩࣩ࣯ࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩࣩ֟֟֟֟֟֟֟֟֟֟֟֟֟֓֓֓֓֓֓֓֓֓֓֓֓֒֒֒֒֒֒֒֒֒֒֒֒֒֒֒֒֒֒֒֓֓֓֓֓֓֓֓֒֒֒֘֘֘֘֘֘֘֗֗֗֗֗֗֗֗֗֗֗֗֗֗֗ؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؖؕؕؕؕؕؕؕؕؕؕؕؖؖؖؖؖؖؖؖؖؖؖٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞٞ٘ۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛۛܺܺܺܺܺܺܺܺ݉݉݉݉݊݊݊݊݊݊݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅݅ࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣧࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣨࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤࣤ์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์์๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋๋ືືືືືືືືືືືືືືືືືືືືືືືຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶຶ*",
            "я бы так хотел выебать макс в её сочную маленькую попочку   ",
            "Кто сядет мне на лицо девочки   ",
            "дима: охудеть на мою бабушку похоже почему у меня стоит  ",
            "Я прям на тел кончил густой спермой",
            "Давай я тебе член, а ты мне пизду?  ",
            "Сучка моя больше б с тобой артов токо на тебя дрочу   ",
            "Бля охуенно Я бы их всех трахнул  ах",
            "Короче дрочу и представляю как отлижу ей   ",
            "Ох уж эта сексуальная белль Я бы её т р а х н у л бы в а н а л",
            "самые сексуальные девушки это бравлершы ",
            "люблю дрочить только сперма не белая ",
            "люблю подрочить",
            "Крч белль и тара просто огонь Так жёстко я не кончал   ",
            "колет ни такая секси как блезняшки белль   ",
            "Жду фото ВАШИХ сисек (только девушкам-девочкам) есле хотите могу скинуть в ответ фото крепкого мужского члена ",
            "Я вобше долбанулся кончил на порно бравл старс два раза пиздец ",
            "Она не такая молодая как я поэтому её мало ебут  ",
            "можно тебя нежно в попку? ",
            },
        [8] = { -- 2022 - 23
            "пидор мамке дай своей пососать и соси наш цыганский хуй, ",
            "упал нахуй на смерть ", "и на коленях извиняться я сказал ",
            "сосать *глюп* *глюп* ",
            "Я сильнее чем ты ",
            "Получай в ебло от души ",
            "Развлекай мнея мой раб ",
            "Запахло неудачником ",
            "Шерсть ебучай упал  ",
            "Не пртивник ",
            "Писю нюхуй сука ",
            "Руки в брюки хуй в карман ",
            "Ветер в харю я хуярю ",
            "причина тряски? ",
            "почему упал? ",
            "а ты че упал то а ,? ",
            "что-то у тебя в попке ах это же мой пенис ",
            "Соснул хуйца лол ",
            "ДоПрыГался(ت)ДрУжоЧеК ", "не фурри пошёл на хуй гегра",
            "$$$ кешбек по зубам $$$ ",  "у тебя хедшотом с днём новых пиздюлей", "сам пошёл нахуй блять успокойся, ты в шоколаде нахуй ", "так это ты ёбаный шаболда упал",
            "чето умер...", "соси хуй пизлюк",
            "ХУЕПРЫГАЛО ТУСОВОЧНОЕ КУДА ПОЛЕТЕЛО",
            "таких лохов как ты я в жизни не встречал....",
            "Что с ебалом?", "на нахуй лежать блять", "лузнул быдласка %", "сын тупой шкуры упал", "упал ботинок", "стою над всеми вами", "набил табло", "пососал богатырского хуйца",
            "сдался чмырь ёпта", "причесал бошку пулей", "сдохла чуха ебаная", "лсый глубос отлетел в автобус", "сука пидарас козёл сука сдохни",
        },
        [9] = { -- pornosait
            "Ты сдох потому-что не купил IlyaWare! действуй? ", "Так и не выебал в жопу, а она ведь давала. Чем больше пузо тем мягче хуй. ", "Наташа медведева? ", "Чувак как клоун выглядит со своими смешками и классами в камеру. Скукота. ", "пиздец, ну что за уебок ", "Мне жалко ее ", ")))) тоже жаль)) ее мужа)) ", "Самый главный вопрос не задала - есть ли бойфренд? ", "Имя кто знает ? ", "Pussy is perfect. ", "Very hot 🔥 girls and Big cock nice ", "И я хочу ебаца в ротик и в попу отдамся любому ", "Ksenia ))) ", "Привет, есть девушки для дружбы?, отправь мне запрос и мы пообщаемся, если хочешь ^~^ ", "スラブ人は本当に美しいと思いました。 ", "Кто такая брюнетка которая сосет ! В джинсах? ", "Megeeeee1 хочу так же ",
            "ok ok , i explain myself, some may think i am not supposed to know her name as a female myself *.* LOL ", "Dam sexy woman ", "Id pop the biggest nut on this bitch as well! ",
            },
        [10] = {
            },
            " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
        [11] = {
            },
            " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
        [12] = {
            },
            " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
        [13] = {
            },
            " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
        [14] = {
        },

    },
}

serj.antidalbaeb = function(text, maxChars)
    local str = ""

    for i=1, maxChars do
        str = str .. (text[i] || "")
    end

    return str
end

serj.hitlogs = {data = {}}
serj.add = {x = 0, y = 0}
serj.helpers = {
    lerp = function(self, start, end_pos, time, delta)
        if (math.abs(start - end_pos) < (delta or 0.01)) then return end_pos end

        time = FrameTime() * (time * 175)
        if time < 0 then
          time = 0.01
        elseif time > 1 then
          time = 1
        end
        return ((end_pos - start) * time + start)
    end,
}
serj.MultiColorText = function(data, x, y)
    local total_width = 0
    local width = 0
    surface.SetFont( "hitlogs" )
    for _, v in pairs(data) do
        local text = v[1]
        local text_width, text_height = surface.GetTextSize( text )
        total_width = total_width + text_width
    end

    for _, v in ipairs(data) do
        local text = v[1]
        local text_width, text_height = surface.GetTextSize( text )
        local x2 = (x - total_width / 2 + width)
	    draw.SimpleText( v[1], "hitlogs", x2+1, y+1, Color( 0, 0, 0, v[2].a) )
	    draw.SimpleText( v[1], "hitlogs", x2, y, v[2] )

        width = width + text_width
    end
end

serj.hitlogs.on_draw = function()
    local sc = {x = scrw, y = scrh}
    local x, y = sc.x/2, sc.y/1.2
    serj.add.y = 0
    for k, v in ipairs(serj.hitlogs.data) do
        local text = v[1]
        local r, g, b = v.color.r, v.color.g, v.color.b
        local realtime = RealTime()
        if v.time + 1 > realtime then
            v.alpha = serj.helpers:lerp(v.alpha, 1, 0.095)
            v.alpha1 = serj.helpers:lerp(v.alpha, 1, 0.05)
        end

        serj.add.y = serj.add.y + 15*v.alpha
        local wh = Color(255, 255, 255, v.alpha*255)
        local ch = Color(r, g, b, v.alpha*255)
        serj.MultiColorText({
            {
                text[1],
                wh
            },
            {
                text[2],
                ch
            },
            {
                text[3],
                wh
            },
            {
                text[4],
                ch
            },
            {
                text[5],
                wh
            },
            {
                text[6],
                ch
            },
            {
                text[7],
                wh
            },
            {
                text[8],
                ch
            },
            {
                text[9],
                wh
            }
        }, x + v.alpha1*100 - 100, y - serj.add.y)

        if v.time + 5 < realtime then
            v.alpha = serj.helpers:lerp(v.alpha, 0, 0.05)
            v.alpha1 = serj.helpers:lerp(v.alpha1, 2, 0.04)
        end
        if v.alpha < 0.01 and (v.time + 6 < realtime) or #serj.hitlogs.data > 50 then
            table.remove(serj.hitlogs.data, k)
        end
    end
end
serj.hitlog_hitboxes = {
    ["ValveBiped.Bip01_R_Hand"] = "Right Hand",
    ["ValveBiped.Bip01_R_Forearm"] = "Right Hand",
    ["ValveBiped.Bip01_R_UpperArm"] = "Right Hand",

    ["ValveBiped.Bip01_L_Hand"] = "Left Hand",
    ["ValveBiped.Bip01_L_Forearm"] = "Left Hand",
    ["ValveBiped.Bip01_L_UpperArm"] = "Left Hand",

    ["ValveBiped.Bip01_Spine2"] = "Chest",

    ["ValveBiped.Bip01_Pelvis"] = "Pelvis",

    ["ValveBiped.Bip01_R_Thigh"] = "Right Leg",
    ["ValveBiped.Bip01_R_Calf"] = "Right Leg",
    ["ValveBiped.Bip01_R_Toe0"] = "Right Leg",
    ["ValveBiped.Bip01_R_Foot"] = "Right Leg",

    ["ValveBiped.Bip01_L_Thigh"] = "Left Leg",
    ["ValveBiped.Bip01_L_Calf"] = "Left Leg",
    ["ValveBiped.Bip01_L_Toe0"] = "Left Leg",
    ["ValveBiped.Bip01_L_Foot"] = "Left Leg",

    ["ValveBiped.Bip01_Head1"] = "Head",

    ["generic"] = "generic"
}

gameevent.Listen("player_hurt")
hook.Add( "player_hurt", "player_hurt_example", function( data )
	local health = data.health
	local priority = SERVER and data.Priority or 5
	local hurted = Player( data.userid )
	local attackerid = data.attacker

	if attackerid == me:UserID() then
		serj.hits = serj.hits + 1
        if serj.target != nil then
            serj.AddResolverStep(serj.target,false)
        end
        if serj.cfg.Vars["misc_hitsound"] then
            if serj.cfg.Vars["misc_hitsound_sound"] == 1 then
                surface.PlaySound("phx/hmetal1.wav")
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 2 then
                surface.PlaySound("player/headshot1.wav")
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 3 then
                surface.PlaySound("phx/eggcrack.wav")
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 4 then
                surface.PlaySound("buttons/blip2.wav")
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 5 then
                surface.PlaySound("phx/hmetal2.wav")
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 6 then
                surface.PlaySound("phx/hmetal3.wav")
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 7 then
                surface.PlaySound("garrysmod/balloon_pop_cute.wav")
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 8 then
                surface.PlaySound("common/stuck1.wav")
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 9 then
                sound.PlayURL ( "https://cdn.discordapp.com/attachments/985740310938263613/1213395043034079263/announcer_kill_ultra_01.mp3?ex=65f55132&is=65e2dc32&hm=9d9955d57e1661c8926825ce98ff9db0303463a024c4aa02aedeeb23578ea532&", "noblock", function( s )end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 10 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210100367765934111/BulbasaurKillsound.mp3?ex=65e954ca&is=65d6dfca&hm=b6aa27c5f06e2c366ac2c3a854de4599a0969ae16ae95e7dbcfc6296f3078644&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 11 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210100725112119366/SavePointKillsound.mp3?ex=65e9551f&is=65d6e01f&hm=aaee85b54ba8e713f15ee29345907928920097af5e6be43d140550ebbed10aed&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 13 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101222468485180/MarioYeahooHitsound.mp3?ex=65e95596&is=65d6e096&hm=321460331b6a3686ef4da49178e24b5c84836005dff8d478b0d14cbfbacf26ac&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 14 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101222900764682/SuperMarioThwompMaleHitsound.mp3?ex=65e95596&is=65d6e096&hm=36ab82298c9ea79c8902ea2e451e92031bb0beed93aac9bfa2d419877f9741b4&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 15 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101223181787146/MarioCoinHitsound.mp3?ex=65e95596&is=65d6e096&hm=a3257e229db6bf819b2568960a149e70c6df46ef97d5a3969d025b20c150fcbb&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 16 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101536047235072/MinecraftVillagerHitsound.mp3?ex=65e955e0&is=65d6e0e0&hm=d32daa07f79786d360ef5761c69d9b711fa286da3aab7b5f077bb4678ff7c6c8&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 17 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101536429056030/AnvilLandPitchUpHitsound.mp3?ex=65e955e0&is=65d6e0e0&hm=94662a55c10f621ab0994fe7b36d22f3d1451019ab4777c41bd4c06e1033ba54&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 18 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101536760270928/MinecraftEggPopHitsound.mp3?ex=65e955e0&is=65d6e0e0&hm=b538a03888fe4b8066a265af1187a49ce841a7c1a9bf064976e4f60944f34fee&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 19 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101537091624970/MinecraftHit1Hitsound.mp3?ex=65e955e1&is=65d6e0e1&hm=9cee54e1f9c99ee07d7b4c59ca9662975ed918558bfe48ab9cf1b5f7ca0eb1a1&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 20 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101537456787466/MinecraftHit2Hitsound.mp3?ex=65e955e1&is=65d6e0e1&hm=7e2ca3eb6df33a5fce3bf2eb32adc952337bf72dcb56fdd68885c6fad49c245e&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 21 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101537867694090/MinecraftHit3Hitsound.mp3?ex=65e955e1&is=65d6e0e1&hm=88271172396868b24a432218ae0909d04dbcaafc57ef67262d80aa7685853d4b&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 22 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101888767496192/TF2SoldierBarkHitsound.mp3?ex=65e95634&is=65d6e134&hm=298b4e89b803dc5ccd04236839481df8eccdfd94e8626b1841c194dedb29be58&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 23 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101889077616680/TF2HeavyPootHitsound.mp3?ex=65e95634&is=65d6e134&hm=04c5540c5c4d54c4fa2a00cbaf74a1c3e95b9c795f888b867e0aac3d7577f1d0&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 24 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210102155252338739/YoshiTongueShortHitsound.mp3?ex=65e95674&is=65d6e174&hm=a341432796162c6449157c6277ec1778c755aa7ea5f2066f50afdac515e7f91e&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 25 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210102264669147176/DMC_MenuSoundHitsound.mp3?ex=65e9568e&is=65d6e18e&hm=7da6b4b5f78ae1bfe7a8b07d0983c8c6cef1cfaebd40fda3899ab1a4e807e426&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 26 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210102361708560414/TheRevez1CountDotShortHitsound.mp3?ex=65e956a5&is=65d6e1a5&hm=8fe4a3c0b6e982185473093d951b70c83c3c9eddeec463528c3456b97fa99da2&", "", function()end )
            elseif serj.cfg.Vars["misc_hitsound_sound"] == 27 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210102821391958026/BoomBapOneTap1Hitsound.mp3?ex=65e95713&is=65d6e213&hm=38f2bee9dba17a8da15d248f5a7ee244f6b47a77e4f3442bb10c2d8274cf3b26&", "", function()end )
            end
        end
        if serj.cfg.Vars["logs_hurt"] then
            local attackerply = Player( attackerid )
            local hitlogc = string.ToColor(serj.cfg.Colors["logs_hurt"])

            local bone = "Generic"

            if attackerply:GetEyeTrace().HitBoxBone != nil then
                bone = serj.hitlog_hitboxes[hurted:GetBoneName(attackerply:GetEyeTrace().HitBoxBone)]
            end

            table.insert(serj.hitlogs.data, {
                {
                    "Hit ",
                    hurted:Nick(),
                    " in the ",
                    bone,
                    " for ",
                    tostring(string.gsub(data.health-hurted:Health(), "-", "")),
                    " damage (",
                    tostring(data.health),
                    " health remaining)",
                },
                alpha = 0,
                alpha1 = 0,
                time = RealTime(),
                color = hitlogc,
            })

        end
	end
end )

serj.ovoshi = 0
serj.killstreak = 0
serj.nextact = 0

hook.Add( "PostDrawTranslucentRenderables", "penis", function()
        if serj.cfg.Vars["penis_s"] then
        local pos = me:GetBonePosition(me:LookupBone("ValveBiped.Bip01_Head1")) + Vector(0,0,15)

        render.SetColorMaterial()

        local левое_яйцо = Vector(pos.x-8,pos.y,pos.z)
        local правое_яйцо = Vector(pos.x+8,pos.y,pos.z)

        local radius = 5
        local wideSteps = 10
        local tallSteps = 10

        render.DrawSphere( левое_яйцо, radius, wideSteps, tallSteps, Color( 255, 102, 209) )
        render.DrawSphere( правое_яйцо, radius, wideSteps, tallSteps, Color( 255, 102, 209) )

        render.DrawSphere( pos+Vector(0,0,25), radius, wideSteps, tallSteps, Color( 255, 29, 78) )
        for i = 1,10 do
            render.DrawSphere( pos+Vector(0,0,2*i), radius, wideSteps, tallSteps, Color( 255, 102, 209 ) )
end
end
end )

function serj.skinhelp()
    print("skins - https://discord.gg/BBwpuZHAdu")
end

function serj.ball()
        for i = 1,1 do
            RunConsoleCommand("gm_spawnsent","sent_ball") --gm_spawnsent
        end

end

gameevent.Listen("entity_killed")
hook.Add( "entity_killed", "entity_killed_example", function( data )
    local victim = Entity(data.entindex_killed)
    local attacker = Entity(data.entindex_attacker)

    if attacker == me and attacker != victim and !victim:IsNPC() and (victim:IsPlayer() or victim:IsBot() ) then
        serj.ovoshi = serj.ovoshi + 1
        serj.killstreak = serj.killstreak + 1
        if serj.cfg.Vars["dance_spam_kt"] and me:Alive() and !me:IsPlayingTaunt() and CurTime() > serj.nextact then
            if !serj.cfg.Vars["dance_spam_kt_bs"] then
                RunConsoleCommand("act", "disagree")
            else
                RunConsoleCommand("act", "laugh")
                serj.brawlstars_unizil = true
                timer.Simple(3,function() serj.brawlstars_unizil = false end)
            end

            serj.nextact = CurTime() + 0.3
        end

        if serj.cfg.Vars["misc_killsound"] then
            if serj.cfg.Vars["misc_killsound_sound"] == 1 then
                surface.PlaySound("phx/hmetal1.wav")
            elseif serj.cfg.Vars["misc_killsound_sound"] == 2 then
                surface.PlaySound("player/headshot1.wav")
            elseif serj.cfg.Vars["misc_killsound_sound"] == 3 then
                surface.PlaySound("phx/eggcrack.wav")
            elseif serj.cfg.Vars["misc_killsound_sound"] == 4 then
                surface.PlaySound("buttons/blip2.wav")
            elseif serj.cfg.Vars["misc_killsound_sound"] == 5 then
                surface.PlaySound("phx/hmetal2.wav")
            elseif serj.cfg.Vars["misc_killsound_sound"] == 6 then
                surface.PlaySound("phx/hmetal3.wav")
            elseif serj.cfg.Vars["misc_killsound_sound"] == 7 then
                surface.PlaySound("garrysmod/balloon_pop_cute.wav")
            elseif serj.cfg.Vars["misc_killsound_sound"] == 8 then
                surface.PlaySound("common/stuck1.wav")
            elseif serj.cfg.Vars["misc_killsound_sound"] == 9 then
                surface.PlaySound( "https://cdn.discordapp.com/attachments/1200710986164879362/1210099752310669342/Blood2Killsound.mp3?ex=65e95437&is=65d6df37&hm=2d86bd91a58eec12eec8d61fbba4ae0b24957953a98b222901ed4c157ee6cc16&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 10 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210100367765934111/BulbasaurKillsound.mp3?ex=65e954ca&is=65d6dfca&hm=b6aa27c5f06e2c366ac2c3a854de4599a0969ae16ae95e7dbcfc6296f3078644&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 11 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210100725112119366/SavePointKillsound.mp3?ex=65e9551f&is=65d6e01f&hm=aaee85b54ba8e713f15ee29345907928920097af5e6be43d140550ebbed10aed&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 13 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101222468485180/MarioYeahooHitsound.mp3?ex=65e95596&is=65d6e096&hm=321460331b6a3686ef4da49178e24b5c84836005dff8d478b0d14cbfbacf26ac&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 14 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101222900764682/SuperMarioThwompMaleHitsound.mp3?ex=65e95596&is=65d6e096&hm=36ab82298c9ea79c8902ea2e451e92031bb0beed93aac9bfa2d419877f9741b4&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 15 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101223181787146/MarioCoinHitsound.mp3?ex=65e95596&is=65d6e096&hm=a3257e229db6bf819b2568960a149e70c6df46ef97d5a3969d025b20c150fcbb&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 16 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101536047235072/MinecraftVillagerHitsound.mp3?ex=65e955e0&is=65d6e0e0&hm=d32daa07f79786d360ef5761c69d9b711fa286da3aab7b5f077bb4678ff7c6c8&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 17 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101536429056030/AnvilLandPitchUpHitsound.mp3?ex=65e955e0&is=65d6e0e0&hm=94662a55c10f621ab0994fe7b36d22f3d1451019ab4777c41bd4c06e1033ba54&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 18 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101536760270928/MinecraftEggPopHitsound.mp3?ex=65e955e0&is=65d6e0e0&hm=b538a03888fe4b8066a265af1187a49ce841a7c1a9bf064976e4f60944f34fee&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 19 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101537091624970/MinecraftHit1Hitsound.mp3?ex=65e955e1&is=65d6e0e1&hm=9cee54e1f9c99ee07d7b4c59ca9662975ed918558bfe48ab9cf1b5f7ca0eb1a1&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 20 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101537456787466/MinecraftHit2Hitsound.mp3?ex=65e955e1&is=65d6e0e1&hm=7e2ca3eb6df33a5fce3bf2eb32adc952337bf72dcb56fdd68885c6fad49c245e&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 21 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101537867694090/MinecraftHit3Hitsound.mp3?ex=65e955e1&is=65d6e0e1&hm=88271172396868b24a432218ae0909d04dbcaafc57ef67262d80aa7685853d4b&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 22 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101888767496192/TF2SoldierBarkHitsound.mp3?ex=65e95634&is=65d6e134&hm=298b4e89b803dc5ccd04236839481df8eccdfd94e8626b1841c194dedb29be58&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 23 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210101889077616680/TF2HeavyPootHitsound.mp3?ex=65e95634&is=65d6e134&hm=04c5540c5c4d54c4fa2a00cbaf74a1c3e95b9c795f888b867e0aac3d7577f1d0&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 24 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210102155252338739/YoshiTongueShortHitsound.mp3?ex=65e95674&is=65d6e174&hm=a341432796162c6449157c6277ec1778c755aa7ea5f2066f50afdac515e7f91e&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 25 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210102264669147176/DMC_MenuSoundHitsound.mp3?ex=65e9568e&is=65d6e18e&hm=7da6b4b5f78ae1bfe7a8b07d0983c8c6cef1cfaebd40fda3899ab1a4e807e426&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 26 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210102361708560414/TheRevez1CountDotShortHitsound.mp3?ex=65e956a5&is=65d6e1a5&hm=8fe4a3c0b6e982185473093d951b70c83c3c9eddeec463528c3456b97fa99da2&", "", function()end )
            elseif serj.cfg.Vars["misc_killsound_sound"] == 27 then
                sound.PlayURL( "https://cdn.discordapp.com/attachments/1200710986164879362/1210102821391958026/BoomBapOneTap1Hitsound.mp3?ex=65e95713&is=65d6e213&hm=38f2bee9dba17a8da15d248f5a7ee244f6b47a77e4f3442bb10c2d8274cf3b26&", "", function()end )
            end
        end

        if serj.cfg.Vars["misc_killsay"] then
            local cmsg = serj.chatSpam.ks[serj.cfg.Vars["misc_killsay_lang"]]
            local fmsg = cmsg[mrandom(#cmsg)]
            local selectedMessage = math.random(1, 8)

            if serj.cfg.Vars["misc_killsay_o"] then
                if serj.ovoshi <= 1 then
                    RunConsoleCommand("say", "начинаемм доминириваеть !")
                elseif serj.ovoshi > 1 then
                    if selectedMessage == 1 then
                        RunConsoleCommand("say", "таких лохов как - " .. victim:Nick() .. " - в жизни не встречал....")
                    elseif selectedMessage == 2 then
                        RunConsoleCommand("say", "мусорка упала - " .. victim:Nick() .. " - прям в канаву....")
                    elseif selectedMessage == 3 then
                        RunConsoleCommand("say", "у тебя хедшотом - " .. victim:Nick() .. " - с днём новых пиздюлей....")
                    elseif selectedMessage == 4 then
                        RunConsoleCommand("say", "Блять так ты слабый - " .. victim:Nick() .. " - Отсосал мой хуй жидко....")
                    elseif selectedMessage == 5 then
                        RunConsoleCommand("say", "его - " .. victim:Nick() .. " - как и его маму выебал....")
                    elseif selectedMessage == 6 then
                        RunConsoleCommand("say", "а вот он - " .. victim:Nick() .. " - всосал прям жёстко....")
                    elseif selectedMessage == 7 then
                        RunConsoleCommand("say", "жирная свинья - " .. victim:Nick() .. " - вьебал по гланды....")
                    elseif selectedMessage == 8 then
                        RunConsoleCommand("say", "я его - " .. victim:Nick() .. " - убил нахуй бомжа....")
                    end
                end
            else
                RunConsoleCommand("say", fmsg)
            end
        end
        if serj.cfg.Vars["misc_killsound_ks"] then
            if serj.killstreak > 0 then
                if serj.killstreak == 1 then
                    surface.PlaySound("firstkill.wav")
                elseif serj.killstreak == 2 then
                    surface.PlaySound("doublekill.wav")
                elseif serj.killstreak == 3 then
                    surface.PlaySound("dominating.wav")
                elseif serj.killstreak == 4 then
                    surface.PlaySound("megakill.wav")
                elseif serj.killstreak == 5 then
                    surface.PlaySound("monsterkill.wav")
                elseif serj.killstreak == 6 then
                    surface.PlaySound("godlike.wav")
                elseif serj.killstreak == 7 or serj.killstreak > 7 then
                    surface.PlaySound("holyshit.wav")
                end
            end
        end
    end

    if attacker != me and me == victim then
        local deadmessage = math.random(1, 4)

        if serj.cfg.Vars["misc_killsay"] and serj.cfg.Vars["misc_killsay_o"] then
            if serj.ovoshi > 0 then
                if deadmessage == 1 then
                    RunConsoleCommand("say", "уебал бомжей - " .. serj.ovoshi .. " - чёто скучно пизда")
                elseif deadmessage == 2 then
                    RunConsoleCommand("say", "собрал овощей - " .. serj.ovoshi .. " - приятный урожай")
                elseif deadmessage == 3 then
                    RunConsoleCommand("say", "убил ботов - " .. serj.ovoshi .. " - а противники то где?")
                elseif deadmessage == 4 then
                    RunConsoleCommand("say", "собрал ботов - " .. serj.ovoshi .. " - слишком скучно я аж умер(")
                end
            end
        end

        serj.killstreak = 0
        serj.ovoshi = 0
    end

    if me == victim then
        if serj.cfg.Vars["antiaim_sr"] then
            serj.headrot = serj.headrot + 1
            if headrot > 4 then
                serj.headrot = -3
            elseif serj.headrot <= 0 then
            end
        else
            serj.headrot = 0
        end
    end

end )

serj.Otvetki = {
    [1] = {
        "про мать было лишнее",
        "я твою маму ебал",
        "а может твоя",
        "твоя мать щлюха",
        "я твою маму камазом давил",
        "я твою матку ногами топтал",
        "твоя мать сдохла",
        "а может твоя?",
        "а твояяяяяяя",
        "у тебя хоть самого мать есть?",
        "да да твоя то сдохла",
        "твою в гробу видал",
        "твоя на помойке гниет",
        "твою маму негры ебали",
        "моя жива твоя мертва ауф",
        "я твою матку ебал кирпичом",
        "я твоей маме голову бил камнем блять",
        "твоя мама на кладбище живет моя в доме ауф",
        "я твою маму в мусорке видал ее бомжы ебали",
    },
    [2] = {
        "молчи сын бляди",
        "от сына хуйни слышу",
        "я твою маму ебал родился ты",
        "сын суки пасть офф",
        "молчи сын бляди тупой",
        "ауу дебилчик сын твари молчиии",
        "от сыня шлюхи слышу",
        "сыночек я твою мать ебал",
        "сынок говна сказал...",
        "сын говна офай рот",
        "рот на 0 сын твари",
        "сын падали ебучей молчи",
        "тебя шлюха родила как бы",
        "помалкивай там сынок бляди",
        "сынок шлюхи ротик на зомочек",
    },
    [3] = {
        "твой отец пидор",
        "твой батя алкаш ебаный",
        "отец твой спился эх..",
        "я твоего отца ногами пиздил",
        "я твоему отцу пальцы ломал",
        "у тебя нет отца только отчимы",
        "у тебя не отца не матери одни собаки эххх.",
    },
    [4] = {
        "я твою семью уродов в цирке видал",
        "твою семью нищюю на помйоке видел",
        "твоих родственников таптал",
        "твоя семья на помойке живет",
        "как там твоя семья хачей поживает?",
        "как тоам твои родные хачики?",
        "я твою семью сжигал в печке",
        "твоя семья в могиле покоится",
        "твоя семья помои жрет",
        "семья твоя в печке живет",
        "я твоих сестер и братьев ебал",
        "дедов и бабушек твоих в землю закапывал",
        "земля металом твоим родным",
        "тебя собаки воспитали",
    },
    [5] = {
        "мать твоя шлюха", "мать твоя сучка",
        "молчи сука", "молчи шлюха",
        "сука твоя мать", "пасть закрой щлюха мать твоя",
        "я мать твою ебал шлюху", "сука твоя бабушка я ее пожилую пизду трахал",
        "сучку мать твою трахал и на костре жарил", "я твою мать за 5 рублей снимал",
        "твою мать трахать любой может (она шлюха) ахахха", "мать твоя шлюшка хахахаха",
        "бабуля твоя сука хахах", "ты сам то шлюха маленькая хахаха",
    },
    [6] = {
        "без мата пж", "чел ты ток матом умееш ругатся",
        "без мата умееш говорить?", "как много мата эх",
    },
}

function serj.findInText(text,slovo)
    for k, v in pairs(slovo) do
        if text:find(v) then
            return true
        end
    end
    return false
end

serj.slova = {}
serj.slova.matka = {}
-- Слова про мать
serj.slova.matka = {
    "мать",
    "матер",
    "мам",
    "матух",
    "матб",
    "мамк",
    "ммат",
    "ммамк",
    "matb", -- пиздец
    "мамаш",
    "матуш",
    "мамашк",
    "свиноматк",
}
-- слова про сына (типо "ты сын говна" или тп)
serj.slova.sinishka = {
    "сын",
}
-- слова про отца
serj.slova.otec = {
    "отец",
    "отца",
    "отцу",
    "пап",
    "батя",
    "батю",
    "бате",
    "отчи",
    "отче",
    "папа",
}
-- брат, сестра, бабуля, дед
serj.slova.semya = {
    "сестр",
    "систр",
    "сестре",
    "бабушка",
    "бабуш",
    "бабк",
    "бабул",
    "семь",
    "дед",
    "брат",
}
-- щлюха, сучка
serj.slova.shluha = {
    "шлю",
    "шлюх",
    "суч",
    "сук",
    "проститу",
    "простет",
    "шма",
}
-- хуесос, чмо, говноед
serj.slova.huesosi = {
    "хуес",
    "чмо",
    "далба",
    "говное",
    "крип",
    "диби",
    "деби",
    "доди",
    "даун",
    "аути",
    "тупо",
    "тупа",
    "куколд",
    "блядь",
    "бляд",
    "очкош",
    "хохол",
    "хохл",
    "ебан",
    "хуйл",
    "mq",
}
-- матюки
serj.slova.mati = {
    "бл",
    "ху",
    "сос",
    "еб",
    "гей",
    "залуп",
}

function serj.Chatter(gadosti)
    local text = gadosti:lower()
    local pro_matku = serj.Otvetki[1]
    local pro_sina = serj.Otvetki[2]
    local pro_papku = serj.Otvetki[3]
    local pro_srmyu = serj.Otvetki[4]
    local pro_shluhu = serj.Otvetki[5]
    local pro_mati = serj.Otvetki[6]

    if serj.findInText(text,serj.slova.matka) then
        return pro_matku[mrandom(#pro_matku)]
    elseif serj.findInText(text,serj.slova.sinishka) then
        return pro_sina[mrandom(#pro_sina)]
    elseif serj.findInText(text,serj.slova.otec) then
        return pro_papku[mrandom(#pro_papku)]
    elseif serj.findInText(text,serj.slova.semya) then
        return pro_srmyu[mrandom(#pro_srmyu)]
    elseif serj.findInText(text,serj.slova.shluha) then
        return pro_shluhu[mrandom(#pro_shluhu)]
    elseif serj.findInText(text,serj.slova.mati) then
        return pro_mati[mrandom(#pro_mati)]
    else
        return false
    end

end

serj.govorittime = 1
serj.resptimer = 1
gameevent.Listen("player_say")
hook.Add( "player_say", "player_say_example", function( data )
	local priority = SERVER and data.Priority or 1
	local id = data.userid
	local text = data.text


    if serj.cfg.Vars["misc_chatspam_ar"] then
        local cmsg = serj.chatSpam.ar[serj.cfg.Vars["misc_chatspam_lang"]]
        local fmsg = cmsg[mrandom(#cmsg)]
        local otvetka = serj.Chatter(text)

        if id != me:UserID() then
            if serj.cfg.Vars["misc_chatbot"] and otvetka != false then
                RunConsoleCommand("say",otvetka)
            else
                RunConsoleCommand("say",fmsg)
            end
        end
    end

end )

hook.Add( "HUDShouldDraw", "YbralHood", function( name )
    if serj.cfg.Vars["hud_disable_hl2_hud"] then
            return false
        end
end)

serj.aspectratio = scrw / scrh
serj.verticalfov = mrad(200)
serj.realfov = 90 * mtan(mtan(serj.verticalfov * 9.5) * serj.aspectratio) * 9.5
serj.trailpos = {}
function serj.HUDPaint()
    if serj.cfg.Vars["self_trail"] then
        local alpha = math.abs(math.sin(CurTime() * serj.cfg.Vars["self_trailm"]) * 255)
		local hsv = string.ToColor( serj.cfg.Colors["self_trail"])
        local fadedColor = Color(hsv.r, hsv.g, hsv.b, alpha)
		surfaceSetDrawColor(hsv.r, hsv.g, hsv.b)
		for i = 1, #serj.trailpos-1 do
			local pos = serj.trailpos[i]:ToScreen()
			local prevpos = serj.trailpos[i+1]:ToScreen()
            surface.SetDrawColor(fadedColor)         --string.ToColor( serj.cfg.Colors["self_trail"]))
			surfaceDrawLine(pos.x,pos.y,prevpos.x,prevpos.y)
		end
	end
	serj.trailpos[#serj.trailpos+1] = LocalPlayer():GetPos()

	if #serj.trailpos > 1 * serj.cfg.Vars["self_traild"] then -- 25
		table.remove(serj.trailpos,1)
	end


    --[[if serj.cfg.Vars["self_trail"] then
        local alpha = math.abs(math.sin(CurTime() * serj.cfg.Vars["self_trailm"] * 255))
        local hsv = HSVToColor(CurTime() % 6 * 60, 1, 1)
        local fadedColor = Color(hsv.r, hsv.g, hsv.b, alpha)

        for i = 1, #serj.trailpos - 1 do
            local pos = serj.trailpos[i]:ToScreen()
            local prevpos = serj.trailpos[i + 1]:ToScreen()
            surface.SetDrawColor(fadedColor)
            surface.SetMaterial(Material("trails/love"))
            surface.DrawTexturedRectUV(pos.x, pos.y, 16, 16, 0, 0, 1, 1)
            surface.DrawLine(pos.x, pos.y, prevpos.x, prevpos.y)
        end
    end]]

    local trgv = serj.targetVector:ToScreen()

	if serj.cfg.Vars["as_enable"] then
        local aimbot_snapline_color = string.ToColor(serj.cfg.Colors["as_enable"])
        if serj.target != nil and serj.targetVector != nil then
            surfaceSetDrawColor(aimbot_snapline_color.r,aimbot_snapline_color.g,aimbot_snapline_color.b,aimbot_snapline_color.a)
            surfaceDrawLine( scrw/2, scrh/2, trgv.x, trgv.y)
        end
    end
    if serj.cfg.Vars["ap_enable"] then
        local avc = string.ToColor(serj.cfg.Colors["ap_enable"])
        if serj.target != nil and serj.targetVector != nil then
            if serj.cfg.Vars["ap_box"] then
                surfaceSetDrawColor(avc)
                surfaceDrawRect(trgv.x-2, trgv.y-2, 4,4)
                else
                serj.surfaceTexture(trgv.x-8, trgv.y-8, 15,15, "sprites/glow04_noz_gmod",avc)
            end
        --end
    end
    end


    if serj.cfg.Vars["legit_fov_draw"] then
        local rad = (mtan(mrad(serj.cfg.Vars["legit_fov_val"]) * 0.37) / mtan(serj.realfov)) * scrw

		surfaceDrawCircle(scrw * 0.5, scrh * 0.5, rad, string.ToColor(serj.cfg.Colors["legit_fov_draw"]))
    end

    serj.hitlogs.on_draw()
end

serj.act = "robot"
serj.acts = {
    "robot",
    "muscle",
    "laugh",
    "bow",
    "cheer",
    "wave",
    "becon",
    "agree",
    "disagree",
    "forward",
    "group",
    "half",
    "zombie",
    "dance",
    "pers",
    "halt",
    "salute",
}
serj.chatspamcd = 0

serj.oldFile = serj.cfg.Vars["dprot_file_lyb"]
serj.oldSql = serj.cfg.Vars["dprot_sql"]
serj.oldSM = serj.cfg.Vars["dprot_qmenu"]
serj.oldDupes = serj.cfg.Vars["dprot_dupes"]
serj.oldHTMLorDHTML = serj.cfg.Vars["dprot_html"]
serj.oldCGF = serj.cfg.Vars["dprot_cg"]
serj.oldSteamWorksss = serj.cfg.Vars["dprot_sw"]
serj.oldHttpDed = serj.cfg.Vars["dprot_http"]
serj.oldGameGui = serj.cfg.Vars["dprot_clcgameui"]
serj.olddmgforcee = serj.cfg.Vars["allah_damage_force"]


serj.kakishi = {
    "имба чит скаж.и какой софт у тебя а скаж?",
    "▶︎•၊၊||၊|။||||။‌‌‌‌‌၊|• 0:10", "ПАЦАГЫ ЧИФ ЗАШЁЛ ЛИВАЙТЕ БЛЯ ПИЗДА Я В БАНЕ ПОХОД,..У", "с нами бох  ", "бял я вроде екзек купил а сосу че са писдец",
    "шо за софты?", "Я бы жоска выйбал твою маму и кончел ей на лицо", "дай нейл пж нейла бялт я бомж пж", "ьля не регает а какой софт а скажи а бла плж",
    "какие читы у вас?", "чет не давно купил чит илвар или катк там ну пох короче", "ЛАМИНААААААААААт я в тренде а парин скажи пдж а ьля а треш",
    "норм читы у вас какие скажите ?", "ьты по легиту играеш а да тип да",
    "че за читы у ввас ткие мощные?",
    "у мегня цфф нгорм чит а не парин?",
    "эхй парень что за чит ?",
    "я с ильвмаром а вы?>",
    "пж ресы пж тко зашёл пж",
    "епацаны дай те кфг на екзек пж а парнини пж",
    "у тебя что илвар откуд/??ю",
    "Ты в школи не учелся штоле? откуда стоко ошибак",
    "бля поправь граматику пото м пиши глупый",
    "чел тебе не стыдно такой бред писать?",
    "иди уроки учи",
    "ЧИТ ГОВНО БЛЯТЬ ЕБАНОЕ КИСЛЫЙ МАМКУ СВОЮ ПРОАДАЛ ЧИЩЙ сука не ганьбіть і зливи",
    "inтерpoляция это как что как а чит топ понял", "купил ильявар теперь ебу вас в очечо", "это что илвар ебёт а как купит я прост чебря 00 (",
    "Я прямо как Ильназ Галяиев тоже с илваре 2 ахзазазхф",
    "полегсе пошел ти щинок ти че старый !Ю:",
}

function serj.Think()

    if serj.cfg.Vars["dprot_e"] then

        if serj.oldFile != serj.cfg.Vars["dprot_file_lyb"] and serj.cfg.Vars["dprot_file_lyb"] then
            file.CreateDir = function()end
            file.Delete = function()end
            file.Write = function()end
            file.Exists = function()end
            file.Find = function()end
            file.Open = function()end

            function fm:Seek( pos )
                return false
            end
            function fm:Size()
                return nil
            end
            function fm:WriteBool( bool )
                return false
            end
            function fm:ReadFloat()
                return nil
            end

            serj.oldFile = serj.cfg.Vars["dprot_file_lyb"]
        elseif serj.oldFile != serj.cfg.Vars["dprot_file_lyb"] and !serj.cfg.Vars["dprot_file_lyb"] then
            file.CreateDir = function(name)
                local oldfunc = serj.oldCreateDir(name)
                return oldfunc
            end
            file.Delete = function(name)
                local oldfunc = serj.oldFileDelete(name)
                return oldfunc
            end
            file.Write = function(f,c)
                local oldfunc = serj.oldFileWrite(f,c)
                return oldfunc
            end
            file.Exists = function(n,g)
                local oldfunc = serj.oldFileExists(n,g)
                return oldfunc
            end
            file.Find = function(n,p,s)
                local oldfunc = serj.oldFileFind(n,p,s)
                return oldfunc
            end
            file.Open = function(fn,fm,gp)
                local oldfunc = serj.oldFileOpen(fn,fm,gp)
                return oldfunc
            end

            function fm:Seek( pos )
                return serj.OldSeek( pos )
            end
            function fm:Size()
                return serj.OldSize()
            end
            function fm:WriteBool( bool )
                return serj.OldWriteBool(bool)
            end
            function fm:ReadFloat()
                return serj.OldReadFloat()
            end

            serj.oldFile = serj.cfg.Vars["dprot_file_lyb"]
        end

        if serj.oldSql != serj.cfg.Vars["dprot_sql"] and serj.cfg.Vars["dprot_sql"] then
            sql.Begin = function()end
            sql.Commit = function()end
            sql.Query = function()end
            sql.QueryRow = function()end
            sql.QueryValue = function()end

            serj.oldSql = serj.cfg.Vars["dprot_sql"]
        elseif serj.oldSql != serj.cfg.Vars["dprot_sql"] and !serj.cfg.Vars["dprot_sql"] then
            sql.Begin = function()
                local oldfunc = serj.oldSqlBegin()
                return oldfunc
            end
            sql.Commit = function()
                local oldfunc = serj.oldSqlCommit()
                return oldfunc
            end
            sql.Query = function(textik)
                local oldfunc = serj.oldSqlQuery(textik)
                return oldfunc
            end
            sql.QueryRow = function(s,n)
                local oldfunc = serj.oldSqlQueryRow(s,n)
                return oldfunc
            end
            sql.QueryValue = function(q)
                local oldfunc = serj.oldSqlQueryValue(q)
                return oldfunc
            end

            serj.oldSql = serj.cfg.Vars["dprot_sql"]
        end

        if serj.oldSM != serj.cfg.Vars["dprot_qmenu"] and serj.cfg.Vars["dprot_qmenu"] then
            spawnmenu.DoSaveToTextFiles = function()end
            spawnmenu.SaveToTextFiles = function()end

            serj.oldSM = serj.cfg.Vars["dprot_qmenu"]
        elseif serj.oldSM != serj.cfg.Vars["dprot_qmenu"] and !serj.cfg.Vars["dprot_qmenu"] then
            spawnmenu.DoSaveToTextFiles = function(s)
                local oldfunc = serj.oldSpawnMenu1(s)
                return oldfunc
            end
            spawnmenu.SaveToTextFiles = function(s)
                local oldfunc = serj.oldSpawnMenu2(s)
                return oldfunc
            end

            serj.oldSM = serj.cfg.Vars["dprot_qmenu"]
        end

        if serj.oldDupes != serj.cfg.Vars["dprot_dupes"] and serj.cfg.Vars["dprot_dupes"] then
            engine.OpenDupe = function()end
            engine.WriteDupe = function()end

            serj.oldDupes = serj.cfg.Vars["dprot_dupes"]
        elseif serj.oldDupes != serj.cfg.Vars["dprot_dupes"] and !serj.cfg.Vars["dprot_dupes"] then
            engine.OpenDupe = function(dName)
                local oldfunc = serj.oldOpenDupe(dName)
                return oldfunc
            end
            engine.WriteDupe = function(d,j)
                local oldfunc = serj.oldWriteDupe(d,j)
                return oldfunc
            end

            serj.oldDupes = serj.cfg.Vars["dprot_dupes"]
        end

        if serj.oldHTMLorDHTML != serj.cfg.Vars["dprot_html"] and serj.cfg.Vars["dprot_html"] then
            gui.OpenURL = function()end
            function pnl:SetHTML()
            end
            function pnl:OpenURL()
            end
            function pnl:RunJavascript()
            end

            serj.oldHTMLorDHTML = serj.cfg.Vars["dprot_html"]
        elseif serj.oldHTMLorDHTML != serj.cfg.Vars["dprot_html"] and !serj.cfg.Vars["dprot_html"] then
            gui.OpenURL = function(url)
                return serj.OldGuiOpenUrl(url)
            end
            function pnl:SetHTML( code )
                return serj.OldHTML(code)
            end
            function pnl:OpenURL( url )
                return serj.OldOpenURL(url)
            end
            function pnl:RunJavascript(js)
                return serj.OldJSOnetapCrack2022(js)
            end

            serj.oldHTMLorDHTML = serj.cfg.Vars["dprot_html"]
        end

        if serj.oldCGF != serj.cfg.Vars["dprot_cg"] and serj.cfg.Vars["dprot_cg"] then
            collectgarbage = function()
                return 0
            end

            serj.oldCGF = serj.cfg.Vars["dprot_cg"]
        elseif serj.oldCGF != serj.cfg.Vars["dprot_cg"] and !serj.cfg.Vars["dprot_cg"] then
            collectgarbage = function(puk)
                local oldfunc = serj.oldCG(puk)
                return oldfunc
            end

            serj.oldCGF = serj.cfg.Vars["dprot_cg"]
        end

        if serj.oldSteamWorksss != serj.cfg.Vars["dprot_sw"] and serj.cfg.Vars["dprot_sw"] then
            steamworks.Download = function()end
            steamworks.DownloadUGC = function()end
            steamworks.IsSubscribed = function()end
            steamworks.OpenWorkshop = function()end
            steamworks.RequestPlayerInfo = function()end
            steamworks.ShouldMountAddon = function()end

            serj.oldSteamWorksss = serj.cfg.Vars["dprot_sw"]
        elseif serj.oldSteamWorksss != serj.cfg.Vars["dprot_sw"] and !serj.cfg.Vars["dprot_sw"] then
            steamworks.Download = function(s,b,f)
                return serj.oldSteamWorksDownload(s,b,f)
            end
            steamworks.DownloadUGC = function(s,f)
                return serj.oldSteamWorksDownloadUGC(s,f)
            end
            steamworks.IsSubscribed = function(s)
                return serj.oldSteamWorksSub(s)
            end
            steamworks.OpenWorkshop = function()
                return serj.oldSteamWorksOW()
            end
            steamworks.RequestPlayerInfo = function(s,c)
                return serj.oldSteamWorksReq(s,c)
            end
            steamworks.ShouldMountAddon = function(item)
                return serj.oldSteamWorksSMA(item)
            end

            serj.oldSteamWorksss = serj.cfg.Vars["dprot_sw"]
        end

        if serj.oldHttpDed != serj.cfg.Vars["dprot_http"] and serj.cfg.Vars["dprot_http"] then
            http.Fetch = function()end
            http.Post = function()end

            serj.oldHttpDed = serj.cfg.Vars["dprot_http"]
        elseif serj.oldHttpDed != serj.cfg.Vars["dprot_http"] and !serj.cfg.Vars["dprot_http"] then
            http.Fetch = function(s,f,ff,t)
                return serj.OldHttpFetch(s,f,ff,t)
            end
            http.Post = function(s,t,f,ff,fff,tt)
                return serj.OldHttpPost(s,t,f,ff,fff,tt)
            end

            serj.oldHttpDed = serj.cfg.Vars["dprot_http"]
        end

        if serj.oldGameGui != serj.cfg.Vars["dprot_clcgameui"] and serj.cfg.Vars["dprot_clcgameui"] then
            gui.HideGameUI = function()end
            gui.ActivateGameUI = function()end
            gui.EnableScreenClicker = function()end

            serj.oldGameGui = serj.cfg.Vars["dprot_clcgameui"]
        elseif serj.oldGameGui != serj.cfg.Vars["dprot_clcgameui"] and !serj.cfg.Vars["dprot_clcgameui"] then
            gui.HideGameUI = function()
                return serj.oldguiHide()
            end
            gui.ActivateGameUI = function()
                return serj.oldguiActivate()
            end

            gui.EnableScreenClicker = function(b)
                return serj.oldClicker(b)
            end

            serj.oldGameGui = serj.cfg.Vars["dprot_clcgameui"]
        end

        if serj.olddmgforcee != serj.cfg.Vars["allah_damage_force"] and serj.cfg.Vars["allah_damage_force"] then
            gui.HideGameUI = function()end
            function ctdi:SetDamageForce( vec )
                print("ПОПАДАНИЕ ")
                return serj.oldDamageForce(vec*78600)
            end
            function ctdi:SetDamageType( num )
                print("ИЗИ ")
                return serj.oldDamageType(67108864)
            end


            serj.olddmgforcee = serj.cfg.Vars["allah_damage_force"]
        elseif serj.olddmgforcee != serj.cfg.Vars["allah_damage_force"] and !serj.cfg.Vars["allah_damage_force"] then
            function ctdi:SetDamageForce( vec )
                return serj.oldDamageForce(vec)
            end
            function ctdi:SetDamageType( num )
                return serj.oldDamageType(num)
            end

            serj.olddmgforcee = serj.cfg.Vars["allah_damage_force"]
        end


        if serj.cfg.Vars["dprot_data_clear"] then
            local penises, directories = serj.oldFileFind( "*", "DATA" )
            for k,z in pairs(directories) do
                if z != "serj" then
                    local fffiles, adddirs = serj.oldFileFind( z.."/*", "DATA" )
                   -- print(z)
                    --PrintTable(fffiles)
                    if fffiles != nil then
                        for i = 1,#fffiles do
                            --print(z.."/"..fffiles[i])
                            if file.Size(z.."/"..fffiles[i], "DATA") > serj.cfg.Vars["dprot_data_clear_"] * 1024 then
                                print( "Found and deleted file in dir " .. z .. " . file name " .. fffiles[i] .. " .File size " .. file.Size(z.."/"..fffiles[i], "DATA") )
                                serj.oldFileDelete(z.."/"..fffiles[i])
                            end
                        end
                    end
                end
            end
            for k,z in pairs(penises) do
                --print(k)
                --PrintTable(penises)
                if file.Size(penises[k], "DATA") > serj.cfg.Vars["dprot_data_clear_"] * 1024 then
                    print( "Found and deleted. file name " .. penises[k] .. " .File size " .. file.Size(penises[k], "DATA") )
                    serj.oldFileDelete(penises[k])
                end

            end
        end
    end

    if serj.cfg.Vars["misc_avtoobsh"] and CurTime() > serj.govorittime then
        local whattosay = serj.kakishi[mrandom(#serj.kakishi)]
        RunConsoleCommand("say",whattosay)
        serj.govorittime = CurTime() + mrandom(5,55)
    end

    -- handjob
    if serj.cfg.Vars["Handjob"] then
        serj.PerformHandjob(cmd)
    end

    -- keybinds
    for key, keyState in pairs(serj.activebinds) do
        if istable(key) then return end
        if serj.cfg.Keybinds.mode[key] == 1 then
            if input.IsKeyDown(serj.cfg.Keybinds[key]) or input.IsMouseDown(serj.cfg.Keybinds[key]) then
                serj.activebinds[key] = true
            else
                serj.activebinds[key] = false
            end
        end
    end
    -- hueta
	if serj.cfg.Vars["misc_chatspam"] and CurTime() > serj.chatspamcd then
        local cmsg = serj.chatSpam.spam[ serj.cfg.Vars["misc_chatspam_lang"]]
        local fmsg = cmsg[mrandom(#cmsg)]

        RunConsoleCommand("say",fmsg)
        serj.chatspamcd = CurTime() + serj.cfg.Vars["misc_chatspam_timer"]
    end
	if serj.cfg.Vars["dancer"] and me:Alive() and !me:IsPlayingTaunt() and CurTime() > serj.nextact then
        serj.act = serj.acts[serj.cfg.Vars["dance"]]

		RunConsoleCommand("act", serj.act)
		serj.nextact = CurTime() + 0.3
	end
	if input.IsKeyDown(KEY_DELETE) and !menukey then
        if serj.Panels.frame then
            serj.CloseFrame()
            if serj.Panels.colorPicker != false then
                serj.Panels.colorPicker:Remove()
                serj.Panels.colorPicker = false
            end
            if serj.Panels.adapCfg != false then
                serj.Panels.adapCfg:Remove()
                serj.Panels.adapCfg = false
            end
            if serj.Panels.binder != false then
                serj.Panels.binder:Remove()
                serj.Panels.binder = false
            end
        else
            OpenGUI()
            RestoreCursorPosition()
        end
    end
	if serj.cfg.Vars["misc_3rdp"] then
		if serj.cfg.Keybinds["key_tp"] == 0 then
			serj.tperson = true
		elseif ( ( ( serj.cfg.Keybinds["key_tp"] >= 107 and serj.cfg.Keybinds["key_tp"] <= 113 ) and input.IsMouseDown(serj.cfg.Keybinds["key_tp"] ) and !serj.tperson_cd || input.IsKeyDown(serj.cfg.Keybinds["key_tp"]) and !serj.tperson_cd ) ) then
			serj.tperson = !serj.tperson
			serj.tperson_cd = true
			timer.Simple(0.3, function() serj.tperson_cd = false end)
		end
	end

	menukey = input.IsKeyDown(KEY_DELETE)
    --sound.PlayURL( "https://cdn.discordapp.com/attachments/898654929240064061/977282553193066536/saw.mp3", "mono", function() end )
end

serj.hitmarkerTable = {}
function serj.TraceAttack(ent, dmg, dir, trace)
	if(!IsFirstTimePredicted()) then return; end
    local vHitPos, vSrc;
    vHitPos = trace.HitPos;
    vSrc = trace.StartPos;
	table.insert(serj.hitmarkerTable, {vHitPos, 1})
end
serj.chamsVisible = "!flat"
serj.chamsInVisible = "!flat"


serj.chamsMaterials = {
    "!flat",
    "!textured",
    "models/shiny",
    "models/props_combine/health_charger_glass",
    "models/wireframe",
    "!blaze",
    "!hoverball",
    "!MovingWireframe",
    "!MovingShiny",
    "!portal",
}
function serj.RenderChams()
	local realanglecolor = string.ToColor(serj.cfg.Colors["real_chams_real"])
    local chamsVisible = serj.chamsMaterials[serj.cfg.Vars["chams_visible_mat"]] or "!flat"
    local chamsInVisible = serj.chamsMaterials[serj.cfg.Vars["chams_invisible_mat"]] or "!flat"
    local chamsRagdoll = serj.chamsMaterials[serj.cfg.Vars["chams_ragdolls_mat"]] or "!flat"
    local chamsGun = serj.chamsMaterials[serj.cfg.Vars["viewmodel_wireframe"]] or "!blaze"
    local realchams = serj.chamsMaterials[serj.cfg.Vars["real_chams_realtype"]] or "!blaze"

    --[[if serj.cfg.Vars["real_chams_m"] == 1 then
        serj.rlchams = "!flat"
    elseif serj.cfg.Vars["real_chams_m"] == 2 then
        serj.rlchams = "!textured"
    elseif serj.cfg.Vars["real_chams_m"] == 3 then
        serj.rlchams = "models/shiny"
    elseif serj.cfg.Vars["real_chams_m"] == 4 then
        serj.rlchams = "models/props_combine/health_charger_glass"
    elseif serj.cfg.Vars["real_chams_m"] == 5 then
        serj.rlchams = "models/wireframe"
    elseif serj.cfg.Vars["real_chams_m"] == 6 then
        serj.rlchams = "!glowcham2"
    elseif serj.cfg.Vars["real_chams_m"] == 7 then
        serj.rlchams = "!hoverball"
    elseif serj.cfg.Vars["real_chams_m"] == 8 then
        serj.rlchams = "!MovingWireframe"
    elseif serj.cfg.Vars["real_chams_m"] == 9 then
        serj.rlchams = "!MovingShiny"
    end]]

    if chamsInVisible:StartWith("!") then
        chamsInVisible = chamsInVisible .. "_z"
    end



    local cf = (1/255)
    local visivleCol = string.ToColor(serj.cfg.Colors["chams_visible"])
    local invisibleCol = string.ToColor(serj.cfg.Colors["chams_invisible"])
    local ragdollCol = string.ToColor(serj.cfg.Colors["chams_ragdolls"])

    cam.Start3D()
        for k, v in ipairs(player.GetAll()) do
            if IsValid(v) and v:Alive() and v != me then
                if serj.cfg.Vars["chams_invisible"] then
                    if !chamsInVisible:StartWith("!") then
                        cam.IgnoreZ(true)
                    end
                    render.MaterialOverride(Material(chamsInVisible))
                    render.SetColorModulation(invisibleCol.r * cf, invisibleCol.g * cf, invisibleCol.b * cf)
                    v:SetRenderMode(1)
                    --v:SetColor(Color(0,0,0,0))
                    v:DrawModel()

                    if serj.cfg.Vars["chams_invisible_att"] then
                        if IsValid(v:GetActiveWeapon()) then
                            local vv = v:GetActiveWeapon()
                            --vv:SetRenderMode(1)
                            vv:DrawModel()
                        end
                    end
                    if !chamsInVisible:StartWith("!") then
                        cam.IgnoreZ(false)
                    end
                end
                if serj.cfg.Vars["real_chams_real"] then
                    cam.Start3D()
                        for k, v in ipairs(player.GetAll()) do
                            if IsValid(v) and v:Alive() and v == me then
                                render.MaterialOverride(Material(realchams))
                                render.SetBlend(realanglecolor.a/255)
                                render.SetColorModulation(realanglecolor.r/255, realanglecolor.g/255, realanglecolor.b/255)
                                v:SetRenderMode(1)
                                v:SetColor(Color(255, 255, 255, 0))
                                v:DrawModel()
                            end
                        end
                    cam.End3D()
                end
                if serj.cfg.Vars["chams_visible"] then
                    render.MaterialOverride(Material(chamsVisible))
                    render.SetColorModulation( visivleCol.r * cf, visivleCol.g * cf, visivleCol.b * cf )
                    v:DrawModel()

                    if serj.cfg.Vars["chams_visible_att"] then
                        if IsValid(v:GetActiveWeapon()) then
                            local vv = v:GetActiveWeapon()
                            vv:DrawModel()
                        end
                    end
                end
            end
            if serj.cfg.Vars["snaplines"] then
                if serj.cfg.Vars["snaplines_pos"] == 1 then
                    local MaxX, MaxY, MinX, MinY
                    if MaxX != nil then
                        MaxX, MaxY, MinX, MinY = math.max( MaxX, ScreenPos.x ), math.max( MaxY, ScreenPos.y), math.min( MinX, ScreenPos.x ), math.min( MinY, ScreenPos.y)
                    end
                sSDC( string.ToColor(serj.cfg.Colors["snaplines"]))
                sDL( ScrW() / 2 - 1, ScrH() , MaxX - ( MaxX - MinX ) / 2 - 1, MaxY )
                elseif serj.cfg.Vars["snaplines_pos"] == 2 then
                sSDC( string.ToColor(serj.cfg.Colors["snaplines"]))
                sDL( ScrW() / 2 , ScrH() / 2 , MaxX - ( MaxX - MinX ) / 2 - 1, MaxY )
                end
            end
            if serj.cfg.Vars["chams_ragdolls"] then
                local ragdoll = v:GetRagdollEntity()
                if IsValid(ragdoll) then
                    render.MaterialOverride(Material(chamsRagdoll))
                    render.SetColorModulation( ragdollCol.r * cf, ragdollCol.g * cf, ragdollCol.b * cf )
                    v:SetRenderMode(0)
                    --v:SetColor(Color(0,0,0,0))
                    ragdoll:DrawModel()
                    --ragdoll:ManipulateBoneScale( 0, Vector(CurTime()*35,CurTime()*35,CurTime()*35) )
                end
            end
        end
    cam.End3D()

--[[]
	 --TODO
    cam.Start3D()
    for k, v in ipairs(player.GetAll()) do
        if IsValid(v) and v:Alive() and v == me then
            if IsValid(v:GetActiveWeapon()) then
                local gun = v:GetActiveWeapon():GetClass()

                if serj.cfg.gunSkins[gun] then
                    render.SetColorModulation(serj.cfg.gunSkins[gun][4]/255,serj.cfg.gunSkins[gun][5]/255,serj.cfg.gunSkins[gun][6]/255)
                    render.SetBlend(serj.cfg.gunSkins[gun][7]/255)
                    render.MaterialOverride(Material(serj.cfg.gunSkins[gun][1]))
                else
                    render.SetColorModulation(1,1,1)
                    render.MaterialOverride(Material(""))
                end

                v:GetActiveWeapon():SetRenderMode(1)
                v:GetActiveWeapon():SetColor(Color(255, 255, 255, 0))
                v:GetActiveWeapon():DrawModel()
            end
        end
    end
    cam.End3D()


    if serj.cfg.Vars["real_chams_real"] then
        cam.Start3D()
            for k, v in ipairs(player.GetAll()) do
                if IsValid(v) and v:Alive() and v == me then
                    render.MaterialOverride(Material(rlchams))
                    render.SetBlend(realanglecolor.a/255)
                    render.SetColorModulation(realanglecolor.r/255, realanglecolor.g/255, realanglecolor.b/255)
                    v:SetRenderMode(1)
                    v:SetColor(Color(255, 255, 255, 0))
                    v:DrawModel()
                end
            end
        cam.End3D()
    end

    if serj.cfg.Vars["chams_invisible"] then
        cam.Start3D()
            for k, v in ipairs(player.GetAll()) do
                if IsValid(v) and v:Alive() and v != me then
                    cam.IgnoreZ(true)
                    render.SetColorModulation( invisibleCol.r * cf, invisibleCol.g * cf, invisibleCol.b * cf )
                    render.SetBlend( invisibleCol.a * cf)
                    render.MaterialOverride(Material(serj.))
                    v:SetRenderMode(1)
                    v:DrawModel()
                    if serj.cfg.Vars["chams_invisible_att"] then
                        if IsValid(v:GetActiveWeapon()) then
                            local vGun = v:GetActiveWeapon()
                            vGun:SetRenderMode(1)
                            vGun:DrawModel()
                        end
                    end
                    cam.IgnoreZ(false)
                    render.SetColorModulation(1, 1, 1)
                    render.SetBlend(1)
                    render.MaterialOverride()
                    v:DrawModel()
                    if serj.cfg.Vars["chams_invisible_att"] then
                        if IsValid(v:GetActiveWeapon()) then
                            local vGun = v:GetActiveWeapon()
                            vGun:DrawModel()
                        end
                    end
                end
            end
        cam.End3D()
    end
    if serj.cfg.Vars["chams_visible"] then
        cam.Start3D()
            for k, v in ipairs(player.GetAll()) do
                if IsValid(v) and v:Alive() and v != me then
                    render.SetColorModulation( visivleCol.r * cf, visivleCol.g * cf, visivleCol.b * cf )
                    render.SetBlend( visivleCol.a * cf)
                    render.MaterialOverride(Material(serj.chamsVisible))
                    v:SetRenderMode(1)
                    v:SetColor(Color(255, 255, 255, 0))
                    v:DrawModel()

                end
            end
        cam.End3D()
    end


    ]]


    render.SetColorModulation(1, 1, 1)
    render.SetBlend(1)
    render.MaterialOverride()

    if !serj.cfg.Vars["chams_invisible"] and !serj.cfg.Vars["chams_visible"] then
		for k, v in pairs(player.GetAll()) do
			v:SetRenderMode(0)
            if !serj.cfg.Vars["chams_invisible_att"] and !serj.cfg.Vars["chams_visible_att"] then
                if IsValid(v:GetActiveWeapon()) then
                    local vGun = v:GetActiveWeapon()
                    vGun:SetRenderMode(0)
                end
            end

		end
	end
end

local backtrackrecords = {}
local function BacktrackRecord(ply)
    local deadtime = CurTime() - 100 / 1000

    local records = backtrackrecords[ply]
    if !records then
        records = {}
        backtrackrecords[ply] = records
    end
end

function serj.IsTickHittable( ply, cmd, tick )
    if ded.GetLatency(0) > 1 then return false end

    local serverArriveTick = ded.GetServerTime(cmd) + ded.GetLatency(0) + ded.GetLatency(1)
    local diff = serverArriveTick - serj.btrecords[ ply ][ tick ].simulationtime

    if diff > serj.cfg.Vars["Backtrack_time"] / 1000 then return false end

    return true
end

function serj.FindBacktrack( cmd, ply )
    local ticks = #serj.btrecords[ ply ]
    local canhit = {}

    for i = 1, ticks do
        if serj.IsTickHittable( ply, cmd, i ) then
            canhit[ #canhit + 1 ] = i
        end
    end

    return canhit
end

function serj.FindFirstHittableTicks( ply, cmd )
    local tickcount = #serj.btrecords[ ply ]

    if !tickcount then return 1 end

    for i = 1, tickcount do
        if serj.IsTickHittable( ply, cmd, i ) then
            return i
        end
    end
end

do
    local lastdist, lasttick = 1337, 1

    function serj.FindClosestHittableTicks( ply, cmd )
        local mypos = me:EyePos()
        local records = serj.btrecords[ ply ]
        local firstticks = serj.FindFirstHittableTicks( ply, cmd )
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

serj.addBulletBeam = {}
serj.addBulletImpact = {}
serj.addBulletBeamEnemy = {}
serj.addBulletImpactEnemy = {}
serj.numBulletImpacts = 0
serj.numPlayerHurts = 0
function serj.OnImpact(data)
	local bestPlayer = nil
    local bestDistance = math.huge
    for _, ply in ipairs(player.GetAll()) do
        local distance = ply:EyePos():DistToSqr(data.m_vStart)
        if distance < bestDistance then
            bestPlayer = ply
            bestDistance = distance
        end
    end

    if bestPlayer == me then

        serj.numBulletImpacts = serj.numBulletImpacts + 1

        table.insert(serj.addBulletBeam, {
            data.m_vStart,
            data.m_vOrigin,
            serj.cfg.Vars["misc_bullettrace_time"],

        })
        table.insert(serj.addBulletImpact, {
            data.m_vOrigin,
            serj.cfg.Vars["misc_bulletimpact_time"],
        })

    end

    if bestPlayer != me then
        if serj.cfg.Vars["misc_bullettrace_onlyt"] then
            if bestPlayer != serj.target then return end
        end
        table.insert(serj.addBulletBeamEnemy, {
            data.m_vStart,
            data.m_vOrigin,
            serj.cfg.Vars["misc_bullettrace_time_e"],
        })
        table.insert(serj.addBulletImpactEnemy, {
            data.m_vOrigin,
            serj.cfg.Vars["misc_bulletimpact_time_e"],
        })
    end
end
function serj.BulletBeams()
	if serj.cfg.Vars["misc_bullettrace_e"] then
        for k,v in next, serj.addBulletBeamEnemy do
            if(v[3] <= 0) then
                table.remove(serj.addBulletBeamEnemy, k);
                continue;
            end
            serj.addBulletBeamEnemy[k][3] = serj.addBulletBeamEnemy[k][3] - FrameTime();
            local pos1, pos2 = v[1], v[2];
            cam.Start3D();
                if serj.cfg.Vars["misc_bullettrace_blinking_e"] then
                    render.SetMaterial(Material("sprites/tp_beam001"))
                else
                    render.SetMaterial(Material("sprites/physbeama"))
                end
                if serj.cfg.Vars["misc_bullettrace_type_e"] == 1 then
                    render.DrawBeam(v[1], v[2], 4, 1, 1, string.ToColor(serj.cfg.Colors["misc_bullettrace_e"]))
                else
                    render.DrawLine( v[1], v[2] , string.ToColor(serj.cfg.Colors["misc_bullettrace_e"]) )
                end
            cam.End3D();
        end
    end
    if serj.cfg.Vars["misc_bulletimpact_e"] then
        for k,v in next, serj.addBulletImpactEnemy do
            if(v[2] <= 0) then
                table.remove(serj.addBulletImpactEnemy, k);
                continue;
            end
            serj.addBulletImpactEnemy[k][2] = serj.addBulletImpactEnemy[k][2] - FrameTime();
            local posImpact = v[1];
            cam.Start3D();
                render.SetColorMaterial()

                cam.IgnoreZ( true )
                    render.DrawBox( posImpact, Angle(0,0,0), Vector( 10, 10, 10 ), -Vector( 10, 10, 10 ), string.ToColor(serj.cfg.Colors["misc_bulletimpact_e"]) )
                cam.IgnoreZ( false )

                render.DrawWireframeBox( posImpact, Angle(0,0,0), Vector( 10, 10, 10 ), -Vector( 10, 10, 10 ), string.ToColor(serj.cfg.Colors["misc_bulletimpact_e"]), true )

                if serj.cfg.Vars["misc_bulletimpact_glow_e"] then
                    render.SetMaterial( Material("sprites/light_ignorez") )
                    render.DrawSprite( posImpact, 52, 52, string.ToColor(serj.cfg.Colors["misc_bulletimpact_e"]))
                end

            cam.End3D();
        end
    end
    -- My bullets
    if serj.cfg.Vars["misc_bullettrace"] then
        for k,v in next, serj.addBulletBeam do
            if(v[3] <= 0) then
                table.remove(serj.addBulletBeam, k);
                continue;
            end
            serj.addBulletBeam[k][3] = serj.addBulletBeam[k][3] - FrameTime();
            local pos1, pos2 = v[1], v[2];
            cam.Start3D();
                if serj.cfg.Vars["misc_bullettrace_blinking"] then
                    render.SetMaterial(Material("sprites/tp_beam001"))
                else
                    render.SetMaterial(Material("sprites/physbeama"))
                end
                if serj.cfg.Vars["misc_bullettrace_type"] == 1 then
                    render.DrawBeam(v[1], v[2], 4, 1, 1, string.ToColor(serj.cfg.Colors["misc_bullettrace"]))
                else
                    render.DrawLine( v[1], v[2] , string.ToColor(serj.cfg.Colors["misc_bullettrace"]) )
                end
            cam.End3D();
        end
    end
    if serj.cfg.Vars["misc_bulletimpact"] then
        for k,v in next, serj.addBulletImpact do
            if(v[2] <= 0) then
                table.remove(serj.addBulletImpact, k);
                continue;
            end
            serj.addBulletImpact[k][2] = serj.addBulletImpact[k][2] - FrameTime();
            local posImpact = v[1];
            cam.Start3D();
                render.SetColorMaterial()

                cam.IgnoreZ( true )
                    render.DrawBox( posImpact, Angle(0,0,0), Vector( 2, 2, 2 ), -Vector( 2, 2, 2 ), string.ToColor(serj.cfg.Colors["misc_bulletimpact"]) )
                cam.IgnoreZ( false )

                render.DrawWireframeBox( posImpact, Angle(0,0,0), Vector( 2, 2, 2 ), -Vector( 2, 2, 2 ), string.ToColor(serj.cfg.Colors["misc_bulletimpact"]), true )

                if serj.cfg.Vars["misc_bulletimpact_glow"] then
                    render.SetMaterial( Material("sprites/light_ignorez") )
                    render.DrawSprite( posImpact, 32, 32, string.ToColor(serj.cfg.Colors["misc_bulletimpact"]))
                end

            cam.End3D();
        end
    end
end
function serj.DisableWorldModulation()
	for k, v in pairs( Entity( 0 ):GetMaterials() ) do
   		Material( v ):SetVector( "$color", Vector(1, 1, 1) )
   		Material( v ):SetFloat( "$alpha", 1 )
	end
end
function serj.DisablePropModulation()

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

end
serj.OldWorldModState = serj.cfg.Vars["wall_color"]
serj.OldWorldModColor = serj.cfg.Colors["wall_color"]
serj.OldPropModState = serj.cfg.Vars["prop_color"]
serj.OldPropModColor = serj.cfg.Colors["prop_color"]

serj.OldShakeFunc = serj.cfg.Vars["misc_shakeoverride"]

function serj.UpdateWorldModulation()

	local col = string.ToColor(serj.cfg.Colors["wall_color"])

	for k, v in pairs( Entity( 0 ):GetMaterials() ) do
   		Material( v ):SetVector( "$color", Vector(col.r * (1 / 255), col.g * (1 / 255), col.b * (1 / 255)) )
   		Material( v ):SetFloat( "$alpha", col.a * (1 / 255) )
	end

end

function serj.UpdatePropModulation()

	local col = string.ToColor(serj.cfg.Colors["prop_color"])

	for k, v in pairs(ents.FindByClass("prop_physics")) do
		v:SetRenderMode( RENDERMODE_TRANSCOLOR )
		v:SetColor(col)
	end

    for k, v in pairs(ents.FindByClass("prop_dynamic")) do
		v:SetRenderMode( RENDERMODE_TRANSCOLOR )
		v:SetColor(col)
	end

    for k, v in pairs(ents.FindByClass("prop_static")) do
		v:SetRenderMode( RENDERMODE_TRANSCOLOR )
		v:SetColor(col)
	end

end

serj.scropeAlpha = 0
hook.Add("Think", "updater", function()
    local sckycvar = GetConVar("r_3dsky")

	if serj.OldWorldModState != serj.cfg.Vars["wall_color"] and serj.cfg.Vars["wall_color"] then
		serj.UpdateWorldModulation()
		serj.OldWorldModState = serj.cfg.Vars["wall_color"]
		serj.OldWorldModColor = serj.cfg.Colors["wall_color"]
	elseif serj.OldWorldModState != serj.cfg.Vars["wall_color"] and !serj.cfg.Vars["wall_color"] then
		serj.DisableWorldModulation()
		serj.OldWorldModState = serj.cfg.Vars["wall_color"]
		serj.OldWorldModColor = serj.cfg.Colors["wall_color"]
	end
	if serj.OldWorldModColor != serj.cfg.Colors["wall_color"] and serj.cfg.Vars["wall_color"] then
		serj.UpdateWorldModulation()
		serj.OldWorldModState = serj.cfg.Vars["wall_color"]
		serj.OldWorldModColor = serj.cfg.Colors["wall_color"]
	end
    if serj.OldShakeFunc != serj.cfg.Vars["misc_shakeoverride"] and serj.cfg.Vars["misc_shakeoverride"] then
        util.ScreenShake = function(pos,amplitude,frequency,duration,radius)
            return false
        end

		serj.OldShakeFunc = serj.cfg.Vars["misc_shakeoverride"]
	elseif serj.OldShakeFunc != serj.cfg.Vars["misc_shakeoverride"] and !serj.cfg.Vars["misc_shakeoverride"] then
        util.ScreenShake = function(pos,amplitude,frequency,duration,radius)
            local scsh = serj.screenShake( pos,amplitude,frequency,duration,radius )
            return scsh
        end

		serj.OldShakeFunc = serj.cfg.Vars["misc_shakeoverride"]
	end

	if serj.OldPropModState != serj.cfg.Vars["prop_color"] and serj.cfg.Vars["prop_color"] then
		serj.UpdatePropModulation()
		serj.OldPropModState = serj.cfg.Vars["prop_color"]
		serj.OldPropModColor = serj.cfg.Colors["prop_color"]
	elseif serj.OldPropModState != serj.cfg.Vars["prop_color"] and !serj.cfg.Vars["prop_color"] then
		serj.DisablePropModulation()
		serj.OldPropModState = serj.cfg.Vars["prop_color"]
		serj.OldPropModColor = serj.cfg.Colors["prop_color"]
	end
	if serj.OldPropModColor != serj.cfg.Colors["prop_color"] and serj.cfg.Vars["prop_color"] then
		serj.UpdatePropModulation()
		serj.OldPropModState = serj.cfg.Vars["prop_color"]
		serj.OldPropModColor = serj.cfg.Colors["prop_color"]
	end

    if (serj.cfg.Vars["sky_3d"] and sckycvar:GetBool() == true) then
        RunConsoleCommand("r_3dsky", "0")
    elseif (!serj.cfg.Vars["sky_3d"] and sckycvar:GetBool() == false) then
        RunConsoleCommand("r_3dsky", "1")
    end

end)
function serj.SetupWorldFog()
	if serj.cfg.Vars["fog_e"] then
		local col = string.ToColor(serj.cfg.Colors["fog_e"])

		render.FogMode( MATERIAL_FOG_LINEAR )
		render.FogStart(serj.cfg.Vars["fog_s"])
		render.FogEnd(serj.cfg.Vars["fog_end"])
		render.FogMaxDensity(serj.cfg.Vars["fog_d"])
		render.FogColor(col.r, col.g, col.b)

		return true
	end
end
function serj.SetupSkyboxFog(skyboxscale)
    if serj.cfg.Vars["fog_e"] then
        local col = string.ToColor(serj.cfg.Colors["fog_e"])

        render.FogMode(MATERIAL_FOG_LINEAR)
        render.FogStart(serj.cfg.Vars["fog_s"] * skyboxscale)
        render.FogEnd(serj.cfg.Vars["fog_end"] * skyboxscale)
        render.FogMaxDensity(serj.cfg.Vars["fog_d"])
        render.FogColor(col.r, col.g, col.b)

        local snowEmitter = ParticleEmitter(Vector(0, 0, 0))
        snowEmitter:SetPos(Vector(0, 0, 0))

        local playerPos = LocalPlayer():GetPos()

        for i = 1, serj.cfg.Vars["snow_particles_count"] do
            local pos = playerPos + Vector(math.random(-2000, 2000), math.random(-2000, 2000), math.random(0, 1000))
            local particle = snowEmitter:Add("sprites/glow04_noz", pos)

            if particle then
                particle:SetVelocity(Vector(0, 0, -50))
                particle:SetDieTime(math.random(5, 15))
                particle:SetStartAlpha(150)
                particle:SetEndAlpha(0)
                particle:SetStartSize(5)
                particle:SetEndSize(1)
                particle:SetRoll(math.random(0, 360))
                particle:SetColor(col.r, col.g, col.b)
                particle:SetGravity(Vector(0, 0, -10))
                particle:SetAirResistance(0)
            end
        end

        snowEmitter:Finish()

        return true
    end
end
serj.SourceSkyname = GetConVar("sv_skyname"):GetString()
serj.origsky = serj.SourceSkyname
serj.SourceSkyPre = {"lf", "ft", "rt", "bk", "dn", "up"}
serj.SourceSkyMat = {
    Material("skybox/".. serj.SourceSkyname.. "lf"),
    Material("skybox/".. serj.SourceSkyname.. "ft"),
    Material("skybox/".. serj.SourceSkyname.. "rt"),
    Material("skybox/".. serj.SourceSkyname.. "bk"),
    Material("skybox/".. serj.SourceSkyname.. "dn"),
    Material("skybox/".. serj.SourceSkyname.. "up")
}
function serj.ChangeSkybox(skyboxname)
    for i = 1, 6 do
        D = Material("skybox/".. skyboxname.. serj.SourceSkyPre[i]):GetTexture("$basetexture")
        serj.SourceSkyMat[i]:SetTexture("$basetexture", D)
    end
end
function serj.ChangeSkyColor(reset)
    local col = string.ToColor(serj.cfg.Colors["sky_c"])
    for i = 1, 6 do
        if !reset then
            serj.SourceSkyMat[i]:SetVector( "$color", Vector(col.r * (1 / 255), col.g * (1 / 255), col.b * (1 / 255)) )
        else
            serj.SourceSkyMat[i]:SetVector( "$color", Vector(1,1,1) )
        end
    end
end

local skyboxRotationSpeed = 0.1
local textureRotationSpeed = 50

function serj.RenderScene()
    local currentYaw = RealTime() * skyboxRotationSpeed
    local rotationAngle = Angle(0, currentYaw, 0)
    render.SetMaterial(Material("skybox/" .. serj.cfg.Vars["skyboxname"]))

    cam.Start3D(Vector(0, 0, 0), rotationAngle, 90, 0, 0, ScrW(), ScrH())
        --render.DrawBox(Vector(-16384, -16384, -16384), Vector(16384, 16384, 16384), Color(255, 255, 255, 255), true)
    cam.End3D()

    if serj.cfg.Vars["sky_c"] then
        serj.ChangeSkyColor()
    else
        serj.ChangeSkyColor(true)
    end
    if serj.cfg.Vars["orange"] then
        for k, v in pairs(Entity(0):GetMaterials()) do
            Material(v):SetTexture("$basetexturetransform", "center .5 .5 scale 1 1 rotate " .. tostring(RealTime() * textureRotationSpeed))
            Material(v):SetTexture("$basetexture", "path_to_your_beautiful_texture")
        end
    end
end
serj.LightingModeChanged = false
function serj.penisRender()
	if serj.cfg.Vars["fullbright"] then
		render.SetLightingMode( 1 )
		serj.LightingModeChanged = true
	end
end
function serj.EndOfLightingMod()
	if serj.LightingModeChanged then
		render.SetLightingMode( 0 )
		serj.LightingModeChanged = false
	end
end



function serj.GetENTPos ( Ent )
	if Ent:IsValid() then
		local Points = {
			Vector( Ent:OBBMaxs().x, Ent:OBBMaxs().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMaxs().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMins().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMins().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMins().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMins().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMaxs().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMaxs().y, Ent:OBBMaxs().z )
		}
		local MaxX, MaxY, MinX, MinY
		local V1, V2, V3, V4, V5, V6, V7, V8
		local isVis
		for k, v in pairs( Points ) do
			local ScreenPos = Ent:LocalToWorld( v ):ToScreen()
			isVis = ScreenPos.visible
			if MaxX != nil then
				MaxX, MaxY, MinX, MinY = mmax( MaxX, ScreenPos.x ), mmax( MaxY, ScreenPos.y), mmin( MinX, ScreenPos.x ), mmin( MinY, ScreenPos.y)
			else
				MaxX, MaxY, MinX, MinY = ScreenPos.x, ScreenPos.y, ScreenPos.x, ScreenPos.y
			end

			if V1 == nil then
				V1 = ScreenPos
			elseif V2 == nil then
				V2 = ScreenPos
			elseif V3 == nil then
				V3 = ScreenPos
			elseif V4 == nil then
				V4 = ScreenPos
			elseif V5 == nil then
				V5 = ScreenPos
			elseif V6 == nil then
				V6 = ScreenPos
			elseif V7 == nil then
				V7 = ScreenPos
			elseif V8 == nil then
				V8 = ScreenPos
			end
		end
		return MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis
	end
end
function serj.drawPlayerBox(ply)

    --[[if serj.cfg.Vars["Hitnumbers"] and #serj.hitnums > 0 then
        local n, c = string_ToColor( serj.cfg.Colors["Hitnumbers"] ), string_ToColor( serj.cfg.Colors["Hitnumbers_krit"] )

        surface_SetFont( "font-02" )

        for i = #serj.hitnums, 1, -1 do
            local v = serj.hitnums[ i ]

            if v.time < CT - 1 then table_remove( serj.hitnums, i ) continue end

            surface_SetTextColor( v.crit and c or n )

            v.add = math_Approach( v.add, v.add - (CT - 1) * 5, FT / 2 )

            surface_SetTextPos( scrwc - v.add * v.xdir, scrhc - v.add * v.ydir )
            surface_DrawText( v.dmg )
        end
    end]]

    local hsvtocolor = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
    local teamcol = team.GetColor( ply:Team() )
    local boxcolor = string.ToColor(serj.cfg.Colors["esp_box"])
    local frcol = string.ToColor(serj.cfg.Colors["esp_box_fr"])
    local gradcolor, fillcolor = string.ToColor(serj.cfg.Colors["esp_box_grad"]), string.ToColor(serj.cfg.Colors["esp_box_f"])
    if serj.cfg.Vars["esp_box_team"] then
        boxcolor = teamcol
        gradcolor = Color(teamcol.r,teamcol.g,teamcol.b,gradcolor.a)
        fillcolor = Color(teamcol.r,teamcol.g,teamcol.b,fillcolor.a)
    else
        boxcolor = string.ToColor(serj.cfg.Colors["esp_box"])
        gradcolor = string.ToColor(serj.cfg.Colors["esp_box_grad"])
        fillcolor = string.ToColor(serj.cfg.Colors["esp_box_f"])
    end

    if serj.cfg.Vars["esp_box_grad_r"] then
        gradcolor = Color(hsvtocolor.r,hsvtocolor.g,hsvtocolor.b,gradcolor.a)
    end
    if serj.cfg.Vars["esp_box_f_r"] then
        fillcolor = Color(hsvtocolor.r,hsvtocolor.g,hsvtocolor.b,fillcolor.a)
    end


    local boxcolortar = string.ToColor(serj.cfg.Colors["esp_box_trg"])

    local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis = serj.GetENTPos( ply )

    local XLen, YLen = MaxX - MinX, MaxY - MinY

    if serj.cfg.Vars["esp_box_f"] then
        draw.RoundedBox(0,MinX,MinY,XLen,YLen,Color(fillcolor.r,fillcolor.g,fillcolor.b,fillcolor.a))
end

    if serj.cfg.Vars["esp_box_grad"] then
        serj.surfaceTexture(MinX,MinY,XLen,YLen,"gui/gradient_up",gradcolor)
    end

    if serj.cfg.Vars["esp_box_trg"] and serj.target != nil and ply == serj.target then
        surfaceSetDrawColor(boxcolortar.r,boxcolortar.g,boxcolortar.b)
    elseif serj.cfg.Vars["esp_box_r"] then
        surfaceSetDrawColor(hsvtocolor.r,hsvtocolor.g,hsvtocolor.b)
    else
        surfaceSetDrawColor(boxcolor.r,boxcolor.g,boxcolor.b)
    end

    if serj.cfg.Vars["esp_box_type"] == 1 then
        surfaceDrawOutlinedRect(MinX,MinY,XLen,YLen,1)
    elseif serj.cfg.Vars["esp_box_type"] == 2 then
        surfaceDrawLine( MaxX, MaxY, MinX + XLen * 0.7, MaxY)
        surfaceDrawLine( MinX, MaxY, MinX + XLen * 0.3, MaxY)
        surfaceDrawLine( MaxX, MaxY, MaxX, MinY + YLen * 0.75)
        surfaceDrawLine( MaxX, MinY, MaxX, MinY + YLen * 0.25)
        surfaceDrawLine( MinX, MinY, MaxX - XLen * 0.7, MinY )
        surfaceDrawLine( MaxX, MinY, MaxX - XLen * 0.3, MinY )
        surfaceDrawLine( MinX, MinY, MinX, MaxY - YLen * 0.75)
        surfaceDrawLine( MinX, MaxY, MinX, MaxY - YLen * 0.25)
    elseif serj.cfg.Vars["esp_box_type"] == 4 then
        surfaceSetDrawColor(0,0,0)
        surfaceDrawOutlinedRect(MinX,MinY,XLen,YLen,3)
    elseif serj.cfg.Vars["esp_box_type"] == 5 then
local centerX = (MinX + MaxX) / 2
local centerY = (MinY + MaxY) / 2
local radiusX = (MaxX - MinX) * 0.55
local radiusY = (MaxY - MinY) * 0.55

local points = {}
local segments = 50

for i = 1, segments do
    local angle = (i / segments) * math.pi * 2
    local x = centerX + math.cos(angle) * radiusX
    local y = centerY + math.sin(angle) * radiusY
    points[i] = {x, y}
end

for i = 1, segments - 1 do
    surfaceDrawLine(points[i][1], points[i][2], points[i + 1][1], points[i + 1][2])
end
surfaceDrawLine(points[segments][1], points[segments][2], points[1][1], points[1][2])
    elseif serj.cfg.Vars["esp_box_type"] == 6 then
        local centerX = (MinX + MaxX) / 2
local centerY = (MinY + MaxY) / 2
local radius = (MaxX - MinX) * 0.95

local points = {}
local segments = 6

for i = 1, segments do
    local angle = (i / segments) * math.pi * 2
    local x = centerX + math.cos(angle) * radius
    local y = centerY + math.sin(angle) * radius
    points[i] = {x, y}
end

-- угол ебать
for i = 1, segments - 1 do
    surfaceDrawLine(points[i][1], points[i][2], points[i + 1][1], points[i + 1][2])
end
surfaceDrawLine(points[segments][1], points[segments][2], points[1][1], points[1][2])
elseif serj.cfg.Vars["esp_box_type"] == 7 then
    local centerX = (MinX + MaxX) / 2
local centerY = (MinY + MaxY) / 2
local depth = 50

local vertices = {
    {MinX, MaxY},
    {MaxX, MaxY},
    {MaxX, MinY},
    {MinX, MinY}
}


for i, vertex in ipairs(vertices) do
    local x = vertex[1]
    local y = vertex[2]
    local perspectiveFactor = depth / (depth + y)
    vertices[i][1] = centerX + (x - centerX) * perspectiveFactor
    vertices[i][2] = centerY + (y - centerY) * perspectiveFactor
end

for i = 1, #vertices - 1 do
    surfaceDrawLine(vertices[i][1], vertices[i][2], vertices[i + 1][1], vertices[i + 1][2])
end
surfaceDrawLine(vertices[#vertices][1], vertices[#vertices][2], vertices[1][1], vertices[1][2])
elseif serj.cfg.Vars["esp_box_type"] == 8 then



        if serj.cfg.Vars["esp_box_fr"] and table.HasValue(serj.cfg["friends"], ply:SteamID()) then
            surfaceSetDrawColor(frcol.r,frcol.g,frcol.b,frcol.a)
        elseif serj.cfg.Vars["esp_box_trg"] and serj.target != nil and ply == serj.target then
            surfaceSetDrawColor(boxcolortar.r,boxcolortar.g,boxcolortar.b)
        elseif serj.cfg.Vars["esp_box_r"] then
            surfaceSetDrawColor(hsvtocolor.r,hsvtocolor.g,hsvtocolor.b)
        else
            surfaceSetDrawColor(boxcolor.r,boxcolor.g,boxcolor.b)
        end
        surfaceDrawOutlinedRect(MinX+1,MinY+1,XLen-2,YLen-2,1)

end
end
function serj.drawESPText(text,color,x,y)

    surfaceSetTextColor( color.r, color.g, color.b )
	surfaceSetTextPos( x, y )
	surfaceSetFont( "ESP Font" )
	surfaceDrawText( text )

end
serj.bones = {
	{ S = "ValveBiped.Bip01_Head1", E = "ValveBiped.Bip01_Neck1" },
	{ S = "ValveBiped.Bip01_Neck1", E = "ValveBiped.Bip01_Spine4" },
	{ S = "ValveBiped.Bip01_Spine4", E = "ValveBiped.Bip01_Spine2" },
	{ S = "ValveBiped.Bip01_Spine2", E = "ValveBiped.Bip01_Spine1" },
	{ S = "ValveBiped.Bip01_Spine1", E = "ValveBiped.Bip01_Spine" },
	{ S = "ValveBiped.Bip01_Spine", E = "ValveBiped.Bip01_Pelvis" },
	{ S = "ValveBiped.Bip01_Spine2", E = "ValveBiped.Bip01_L_UpperArm" },
	{ S = "ValveBiped.Bip01_L_UpperArm", E = "ValveBiped.Bip01_L_Forearm" },
	{ S = "ValveBiped.Bip01_L_Forearm", E = "ValveBiped.Bip01_L_Hand" },
	{ S = "ValveBiped.Bip01_Spine2", E = "ValveBiped.Bip01_R_UpperArm" },
	{ S = "ValveBiped.Bip01_R_UpperArm", E = "ValveBiped.Bip01_R_Forearm" },
	{ S = "ValveBiped.Bip01_R_Forearm", E = "ValveBiped.Bip01_R_Hand" },
	{ S = "ValveBiped.Bip01_Pelvis", E = "ValveBiped.Bip01_L_Thigh" },
	{ S = "ValveBiped.Bip01_L_Thigh", E = "ValveBiped.Bip01_L_Calf" },
	{ S = "ValveBiped.Bip01_L_Calf", E = "ValveBiped.Bip01_L_Foot" },
	{ S = "ValveBiped.Bip01_L_Foot", E = "ValveBiped.Bip01_L_Toe0" },
	{ S = "ValveBiped.Bip01_Pelvis", E = "ValveBiped.Bip01_R_Thigh" },
	{ S = "ValveBiped.Bip01_R_Thigh", E = "ValveBiped.Bip01_R_Calf" },
	{ S = "ValveBiped.Bip01_R_Calf", E = "ValveBiped.Bip01_R_Foot" },
	{ S = "ValveBiped.Bip01_R_Foot", E = "ValveBiped.Bip01_R_Toe0" },
}

function serj.PlayerESP()
    local pingColor = string.ToColor(serj.cfg.Colors["esp_ping"])
    local nameColor = string.ToColor(serj.cfg.Colors["esp_name"])
    local weaponColor = string.ToColor(serj.cfg.Colors["esp_wep"])
    local healthColor = string.ToColor(serj.cfg.Colors["esp_hp"])
    local armorColor = string.ToColor(serj.cfg.Colors["esp_ap"])
    local groupcol = string.ToColor(serj.cfg.Colors["esp_group"])
    local mcol = string.ToColor(serj.cfg.Colors["esp_money"])
    local healthbarColor = string.ToColor(serj.cfg.Colors["esp_hp_bar"])
    local healthbarColor2 = string.ToColor(serj.cfg.Colors["esp_hp_bar_gradient"])

    for balls, gamer in pairs(player.GetAll()) do
        if IsValid(gamer) then
            local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis = serj.GetENTPos( gamer )
            local XLen, YLen = MaxX - MinX, MaxY - MinY
            surfaceSetFont("ESP Font")

            gamer.DormantAlpha = gamer.DormantAlpha or 255
            if gamer:IsDormant() then
                gamer.DormantAlpha = math.Approach(gamer.DormantAlpha,serj.cfg.Vars["alpha_dormant"],FrameTime()*200)
            else
                gamer.DormantAlpha = math.Approach(gamer.DormantAlpha,255,FrameTime()*200)
            end

            if gamer != me and gamer:Alive() then
                surface.SetAlphaMultiplier(gamer.DormantAlpha/255)
                --gamer.DormantAlpha = math.Approach(gamer.DormantAlpha,255)

                -- esp elements
                if serj.cfg.Vars["esp_box"] then
                    if serj.cfg.Vars["esp_box_type"] != 3 then
                        serj.drawPlayerBox(gamer)
                    else
                        cam.Start3D()
                            render.DrawWireframeBox( gamer:GetPos(), Angle(0, 0, 0), gamer:OBBMins(), gamer:OBBMaxs(), string.ToColor(serj.cfg.Colors["esp_box"]), true )
                        cam.End3D()
                    end
                end




                if serj.cfg.Vars["tracer"] then
                    cam.Start3D( EyePos(), EyeAngles() )
                        for k, gamer in pairs( player.GetAll() ) do
                            if gamer and IsValid( gamer ) and gamer:Alive() and gamer != LocalPlayer() then
                                local tr = gamer:GetEyeTrace()
                                local hue = (RealTime()*70)%360
                                local color = HSVToColor(hue, 1, 1)
                                render.DrawLine( gamer:GetShootPos(), tr.HitPos, color, true )
                            end
                        end
                    cam.End3D()
                end
                if serj.cfg.Vars["dormant"] then
                    gamer.DormantAlpha = gamer.DormantAlpha or 125

                    function SetDormantAlpha(newAlpha)
                        gamer.DormantAlpha = newAlpha
                    end
                end
                if serj.cfg.Vars["esp_skeleton"] then
                    surfaceSetDrawColor( string.ToColor(serj.cfg.Colors["esp_skeleton"]) )
                    for _, b in pairs( serj.bones ) do
                        if gamer:LookupBone(b.S) != nil and gamer:LookupBone(b.E) != nil then
                            local spos, epos = gamer:GetBonePosition(gamer:LookupBone(b.S)):ToScreen(), gamer:GetBonePosition(gamer:LookupBone(b.E)):ToScreen()
                            if spos.visible and epos.visible then
                                surfaceDrawLine( spos.x, spos.y, epos.x, epos.y )
                            end
                        end
                    end
                end
                --[[if serj.cfg.Vars["esp_ping"] then
                    local pinglenx,pingleny = surfaceGetTextSize(gamer:Ping(), 32)
                    serj.drawESPText(serj.antidalbaeb(gamer:Ping(), 32),pingColor,MinX+XLen/2-pinglenx/2,MinY-pingleny)
                end]]
                if serj.cfg.Vars["esp_name"] then
                    local namelenx,nameleny = surfaceGetTextSize(serj.antidalbaeb(gamer:Name(), 32))
                    serj.drawESPText(serj.antidalbaeb(gamer:Name(), 32),nameColor,MinX+XLen/2-namelenx/2,MinY-nameleny)
                end
                /*
                -- TODO
                serj.guiCheckBox("Money","esp_money",playerespan,true)

                */
                if serj.cfg.Vars["esp_team"] then
                    local col = team.GetColor(gamer:Team())
                    local teamx,teamy = surfaceGetTextSize(team.GetName(gamer:Team()))
                    serj.drawESPText(team.GetName(gamer:Team()),col,MinX+XLen/2-teamx/2,MinY-teamy*2+4)
                end

                --[[if serj.cfg.Vars["esp_rwep"] then
                    if UpdatedVars and UpdatedVars.Ent then
                        for Layer = 0, 13 do
                            if not UpdatedVars.Ent:IsValidLayer(Layer) then
                                continue
                            end

                            local SequenceID = UpdatedVars.Ent:GetLayerSequence(Layer)
                            if UpdatedVars.Ent:GetSequenceActivityName(SequenceID):find("RELOAD") then
                                local enemyPos = UpdatedVars.Ent:GetPos():ToScreen()
                                surface.SetDrawColor(255, 0, 0)
                                surface.DrawCircle(enemyPos.x, enemyPos.y, 10)
                                break
                            end
                        end
                    end
                end]]

                --[[if UpdatedVars.Ent.StartedReloading > 0 and Cat.Cfg.Vars.ReloadingBar then
                    Cat.DrawBar( 2, ( Cat.CurrentTime - UpdatedVars.Ent.StartedReloading ), UpdatedVars.Ent:SequenceDuration( SequenceID ), Cat.Cfg.Colors.ReloadingBar, Cat.Cfg.Colors.ReloadingBarBg, Cat.Cfg.Vars.ReloadingGradient, Cat.Cfg.Colors.ReloadingBarGr )
                end]]


                if serj.cfg.Vars["esp_wep"] and IsValid(gamer:GetActiveWeapon()) then
                    surface.SetFont( "font-02" )
                    local weplenx,wepleny = surfaceGetTextSize(gamer:GetActiveWeapon():GetClass())
                    local text = gamer:GetActiveWeapon():GetClass()
                    --local weaponEng = {rust_ak47 = "Assault Rifle", rust_bandages = "Bandages", rust_beancan = "Beancan", rust_hands = "Hands", rust_boltrifle = "Bolt Action Rifle", rust_bow = "Bow", rust_bow2 = "Compound bow", rust_buildingplan = "Building plan", rust_c4 = "Timed Explosive Charge", rust_card = "Card", rust_combatfnife = "Combat Knife", rust_crossbow = "Crossbow", rust_customsmg = "Custom SMG", rust_dbarrel = "Double Barrel", rust_eoka = "Eoka", rust_hammer = "Hammer", rust_hatchet = "Iron hatchet", rust_jackhammer = "Jackhammer", rust_l96 = "L96 Rifle", rust_lr300 = "LR-300 Assault Rifle", rust_m249 = "M249", rust_m92 = "M92 Pistol", rust_medicalsyringe = "Medical syringe", rust_melee = "Melee", rust_mp5 = "MP5A4", rust_nailgun = "Nailgun", rust_pickaxe = "Iron pickaxe", rust_pump = "Pump shotgun", rust_python = "Python revolver", rust_revolver = "Revolver", rust_rock = "Rock", rust_rpg = "Rocket Launcher", rust_sap = "Semi-Automatic Pistol", rust_sar = "Semi-Automatic Rifle", rust_satchel = "Satchel", rust_spas12 = "Spas-12 Shotgun", rust_spear = "Wooden Spear", rust_stonehatchet = "Stone Hatchet", rust_stonepickaxe = "Stone Pickaxe", rust_supplysignal = "Supply Signal", rust_thompson = "Thompson", rust_waterpipe = "Waterpipe shotgun", rust_wiretool = "Wire"}
                    --local weaponsRus = {rust_ak47 = "АК-47", rust_bandages = "Бинты", rust_beancan = "Бобовая граната", rust_hands = "Руки", rust_boltrifle = "Болтовка", rust_bow = "Лук", rust_bow2 = "Композитный лук", rust_buildingplan = "План Строительства", rust_c4 = "Взрывчатка С4", rust_card = "Карта", rust_combatfnife = "Нож", rust_crossbow = "Арбалет", rust_customsmg = " СМГ", rust_dbarrel = "Двухстволка", rust_eoka = "Еока", rust_hammer = "Киянка", rust_hatchet = "Металлический топор", rust_jackhammer = "Бур", rust_l96 = "Винтовка L96", rust_lr300 = "Винтовка LR-300", rust_m249 = "M249", rust_m92 = "Пистолет m92", rust_medicalsyringe = "Медицинский шприц", rust_melee = "нож хз", rust_mp5 = "MP5A4", rust_nailgun = "Гвоздомёт", rust_pickaxe = "Металлическая Кирка", rust_pump = "Помповый дробовик", rust_python = "Питон", rust_revolver = "Револьвер", rust_rock = "Камень", rust_rpg = "Ракетница", rust_sap = "Полуавтоматический пистолет(Пэшка)", rust_sar = "Берданка", rust_satchel = "Сачель", rust_spas12 = "Дробовик Spas-12", rust_spear = "Копьё", rust_stonehatchet = "Каменный топор", rust_stonepickaxe = "Каменная кирка", rust_supplysignal = "Сигнальная граната", rust_thompson = "Томпсон", rust_waterpipe = "Самодельный дробовик (пайп)", rust_wiretool = "Провод"}
                    serj.drawESPText(gamer:GetActiveWeapon():GetClass(),weaponColor,MinX+XLen/2-weplenx/2,MaxY)
                end

                if serj.cfg.Vars["esp_rwep"] then
                    for i = 0, 13 do
                        if gamer:IsValidLayer(i) then
                            if gamer:GetSequenceActivityName(gamer:GetLayerSequence(i)):find("RELOAD") then
                                name = "RELOADING"
                                break
                            end
                        end
                    end
                end

                if serj.cfg.Vars["admin_detect2"] then
                    local userGroup = gamer:GetUserGroup()

    if userGroup ~= "user" then
        local adminMenu = vgui.Create("DFrame")
        adminMenu:SetSize(400, 200)
        adminMenu:SetTitle("Админ в сети!")
        adminMenu:Center()
        adminMenu:MakePopup()

        local adminText = vgui.Create("DLabel", adminMenu)
        adminText:SetText("СЫН БЛЯДИ В СЕТИ.")
        adminText:SetPos(50, 50)
        adminText:SetSize(300, 100)
    end
                end

                if serj.cfg.Vars["admin_detect"] then
                if gamer:SteamID64() == "76561198293925967" and "76561199276141767" then
                    surface.SetTextColor( 255, 0, 0)
                    surface.SetTextPos(ScrW()/2,ScrH()/2)
                    surface.DrawText( "АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! АДМИН В СЕТИ!!!!! " )
                end
            end

            if serj.cfg.Vars["hitbox"] then
                if gamer:GetHitBoxGroupCount() != nil then
                    for group = 0, gamer:GetHitBoxGroupCount() - 1 do
                         for hitbox = 0, gamer:GetHitBoxCount( group ) - 1 do
                             local pos, ang = gamer:GetBonePosition( gamer:GetHitBoxBone(hitbox, group) )
                             local mins, maxs = gamer:GetHitBoxBounds(hitbox, group)
                             cam.Start3D()
                                render.DrawWireframeBox( pos, ang, mins, maxs, strToColor(serj.cfg.Colors["hitbox"]), true)
                            cam.End3D()
                            --print(serj.cfg.Colors["hitbox"])
                        end
                    end
                end
            end

            --[[if serj.cfg.Vars["esp_group"] then
                local w,h = surfaceGetTextSize(gamer:GetUserGroup())
                serj.drawESPText(gamer:GetUserGroup(),groupcol,MinX+XLen/2-w/2,MaxY+h-4)
            end]]


                if serj.cfg.Vars["esp_group"] then
                    local w,h = surfaceGetTextSize(gamer:GetUserGroup())
                    serj.drawESPText(gamer:GetUserGroup(),groupcol,MinX+XLen/2-w/2,MaxY+h-4)
                end

                if serj.cfg.Vars["esp_hp"] then
                    local hplenx,hpleny = surfaceGetTextSize(gamer:Health())

                    serj.drawESPText(gamer:Health(),healthColor,MinX-hplenx-6,MinY)

                end

                if serj.cfg.Vars["esp_hpda"] then
                        if UpdatedVars and UpdatedVars.Ent then
                            local maxAmmo = UpdatedVars.Ent:GetMaxClip1()
                            local currentAmmo = UpdatedVars.Ent:Clip1()

                            local ammoPercentage = currentAmmo / maxAmmo

                            local barWidth = 100
                            local barHeight = 10
                            local barX = UpdatedVars.Ent:GetPos():ToScreen().x - barWidth / 2
                            local barY = UpdatedVars.Ent:GetPos():ToScreen().y + 20

                            draw.RoundedBox(4, barX, barY, barWidth, barHeight, Color(50, 50, 50))
                            draw.RoundedBox(4, barX, barY, barWidth * ammoPercentage, barHeight, Color(0, 255, 0))
                        end
                end

                if serj.cfg.Vars["esp_ap"] then
                    local aplenx,apleny = surfaceGetTextSize(gamer:Armor())
                    serj.drawESPText(gamer:Armor(),armorColor,MaxX+2,MinY)
                end

                -- bars
                if serj.cfg.Vars["esp_hp_bar"] then
                    local hp = gamer:Health() * YLen / 100;
                    if(hp > YLen) then hp = YLen; end
                    local diff = YLen - hp

                    surfaceSetDrawColor(0, 0, 0, 255);
                    surfaceDrawRect(MinX - 5, MinY, 4, YLen);
                    if serj.cfg.Vars["esp_hp_bar_ac"] then
                        surfaceSetDrawColor( ( 100 - gamer:Health() ) * 2.55, gamer:Health() * 2.55, 0, 255)
                    else
                        surfaceSetDrawColor(healthbarColor.r,healthbarColor.g,healthbarColor.b)
                    end
                    surfaceDrawRect(MinX - 4, MinY + diff+1, 2, hp-2);
                    if serj.cfg.Vars["esp_hp_bar_gradient"] then
                        serj.surfaceTexture(MinX - 4, MinY + diff+1, 2, hp-2,"gui/gradient_up",healthbarColor2)
                    end
                end
            end
        end
    end
    surface.SetAlphaMultiplier(255)
end

function serj.playerDataUpdate( ply )
    if not serj.playerCache[ ply ] then
        serj.playerCache[ ply ] = {}

        serj.playerTableUpdate( ply )
        return
    end

    serj.playerTableUpdate( ply )
end

function serj.OOfarrows()
    RotatedArrow = function(x, y, ang)
        local ang1 = Angle(0, ang, 0):Forward() * serj.cfg.Vars["oof_arrows_as"]
        local ang2 = Angle(0, ang + 120, 0):Forward() * (serj.cfg.Vars["oof_arrows_as"] - 1)
        local ang3 = Angle(0, ang - 120, 0):Forward() * (serj.cfg.Vars["oof_arrows_as"] - 1)

        local p0 = {x = x, y = y}
        local poly = {
            {x = p0.x + ang1.x, y = p0.y + ang1.y},
            {x = p0.x + ang2.x, y = p0.y + ang2.y},
            {x = p0.x + ang3.x, y = p0.y + ang3.y},
        }
        return poly
    end

    if serj.cfg.Vars["oof_arrows"] then

        local myTeam = me:Team()
        local eye = me:EyePos()

        local lcolor = string.ToColor(serj.cfg.Colors["oof_arrows"])
        local clr0, dormClr = Color(lcolor.r,lcolor.g,lcolor.b,lcolor.a/2), string.ToColor(serj.cfg.Colors["oof_arrows_d"])
        local clr1 = lcolor, string.ToColor(serj.cfg.Colors["oof_arrows_d"])

        local xScale, yScale = ScrW() / 250, ScrH() / 250
        local xScale, yScale = xScale * serj.cfg.Vars["oof_arrows_ad"], yScale * serj.cfg.Vars["oof_arrows_ad"]

        for k,plr in ipairs(player.GetAll()) do
            if(!plr || plr == me || !plr:Alive()) then continue end

            local angle = (plr:EyePos() - eye):Angle()
            local addPos = Angle(0, (serj.fa.y - angle.y) - 90, 0):Forward()

            local pos = Vector(ScrW() / 2, ScrH() / 2, 0) + Vector(addPos.x * xScale, addPos.y * yScale, 0)

            if(mabs(mNormalizeAng(angle.y - serj.fa.y)) < 60) then return end

            // ARROW

            local arrow = RotatedArrow(pos.x, pos.y, (serj.fa.y - angle.y) - 90)

            if serj.cfg.Vars["oof_arrows_d"] then
                if plr:IsDormant() then
                    surfaceSetDrawColor(dormClr)
                else
                    if serj.cfg.Vars["oof_arrows_b"] then
                        surfaceSetDrawColor(clr0.r,clr0.g,mfloor( msin( CurTime() * serj.cfg.Vars["oof_arrows_bs"] + plr:EntIndex() ) * 20 ) + 65)
                    else
                        surfaceSetDrawColor(clr0)
                    end
                end
            else
                if serj.cfg.Vars["oof_arrows_b"] then
                    surfaceSetDrawColor(clr0.r,clr0.g,clr0.b,mfloor( msin( CurTime() * serj.cfg.Vars["oof_arrows_bs"] + plr:EntIndex() ) * 20 ) + 65)
                else
                    surfaceSetDrawColor(clr0)
                end
            end

            draw.NoTexture()
            surface.DrawPoly(arrow)

            // Pidoras name
            local Pidoras = plr:Nick()
            local textX, textY = pos.x, pos.y + 20
            draw.SimpleText(Pidoras, "font-09", textX, textY, color_white, TEXT_ALIGN_CENTER)

            if serj.cfg.Vars["oof_arrows_d"] then
                if plr:IsDormant() then
                    surfaceSetDrawColor(dormClr)
                else
                    if serj.cfg.Vars["oof_arrows_b"] then
                        surfaceSetDrawColor(clr1.r,clr1.g,clr1.b,mfloor( msin( CurTime() * serj.cfg.Vars["oof_arrows_bs"] + plr:EntIndex() ) * 20 ) + 65)
                    else
                        surfaceSetDrawColor(clr1)
                    end
                end
            else
                if serj.cfg.Vars["oof_arrows_b"] then
                    surfaceSetDrawColor(clr1.r,clr1.g,clr1.b,mfloor( msin( CurTime() * serj.cfg.Vars["oof_arrows_bs"] + plr:EntIndex() ) * 20 ) + 65)
                else
                    surfaceSetDrawColor(clr1)
                end
            end
        end
    end
end
serj.estscope = {
    ["weapon_csgo_snip_ssg08"] = true,
    ["weapon_csgo_snip_awp"] = true,
    ["weapon_csgo_snip_g3sg1"] = true,
    ["weapon_csgo_snip_scar20"] = true,
}

function serj.KColors(bb)
    if bb == 1 then
        fcolor = Color(255,255,255)
    elseif bb == 2 then
        fcolor = Color(110,255,231)
    elseif bb == 3 then
        fcolor = Color(255,162,75)
    elseif bb == 4 then
        fcolor = Color(255,77,77)
    elseif bb == 5 then
        fcolor = Color(162,104,255)
    elseif bb == 6 then
        fcolor = Color(255,88,180)
    end
    return fcolor
end

serj.targethudy = 0
serj.targethudx = 0
serj.targeta = 0
serj.targethp = 0
serj.targetap = 0
function serj.drawKeybinds()
    local a = LocalPlayer()
    local d = GetHostName()
    local e = math.Round(1/engine.TickInterval()-1)
    local bindx, bindy =  serj.cfg.Vars["i_keybinds_x"], serj.cfg.Vars["i_keybinds_y"]
    local thx, thy =  serj.cfg.Vars["i_targethud_x"], serj.cfg.Vars["i_targethud_y"]
    local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
    local hsv2 = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
    local keybindcolor = string.ToColor(serj.cfg.Colors["i_keybinds"])
    local wmarkcolor = string.ToColor(serj.cfg.Colors["i_watermark"])

    local a = LocalPlayer()
    local d = GetHostName()
    local e = math.Round(1/engine.TickInterval()-1)
    local bindx, bindy =  serj.cfg.Vars["i_keybinds_x"], serj.cfg.Vars["i_keybinds_y"]
    local thx, thy =  serj.cfg.Vars["i_targethud_x"], serj.cfg.Vars["i_targethud_y"]
    local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
    local hsv2 = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
    local keybindcolor = string.ToColor(serj.cfg.Colors["i_keybinds"])
    local wmarkcolor = string.ToColor(serj.cfg.Colors["i_watermark"])
--local ping = a:Ping()
local playerCount = #player.GetHumans()
local averagePing = 0
local fps = math.Round(1/FrameTime())
local ping = a:Ping()
local mapName = game.GetMap()
local uptime = os.time() - os.clock()

local adminCount = 0
for _, ply in ipairs(player.GetAll()) do
    if ply:IsAdmin() then
        adminCount = adminCount + 1
    end
end

--       local wmstring = serverName .. " | " .. serj.antidalbaeb(me:Name(), 32) .. " | " .. fps .. " FPS | " .. playerCount .. " игрок" .. (playerCount > 1 and "ов" or "") .. " | " .. ping .. " ms | " .. mapName .. " | Uptime: " .. uptime .. " секунд"
    --local wmstring = "Server: " .. d .. " | Player: " .. serj.antidalbaeb(a:Name(), 32) .. " | Frame Rate: " .. math.Round(1/FrameTime()) .. " FPS | Players: " .. #player.GetHumans() .. " | Ping: " .. a:Ping() .. " ms | Keybinds: (" .. bindx .. ", " .. bindy .. ") | Target HUD: (" .. thx .. ", " .. thy .. ")"
    -- 2 билд        local wmstring = "Server: " .. d .. " | Player: " .. serj.antidalbaeb(a:Name(), 32) .. " | Frame Rate: " .. math.Round(1/FrameTime()) .. " FPS | Players: " .. #player.GetHumans() .. " | Ping: " .. a:Ping() .. " ms"
    local wmstring = "IlyaWare.waib.cc | " .. serj.antidalbaeb(me:Name(), 32) .. " | " ..math.Round(1/FrameTime()).." FPS | "..#player.GetHumans().." player | "..a:Ping().." ms | Admins: ".. adminCount ,
    surfaceSetFont("IndicatorFont")
    local wamrkw, wmarkh = surfaceGetTextSize(wmstring)

    local wmarkpos = scrw - wamrkw - 20

    if serj.cfg.Vars["i_watermark"] then
        if serj.cfg.Vars["i_f"] == 1 then
            draw.RoundedBox(0,wmarkpos+5,5,wamrkw+10,25,Color(25, 25, 25))
            serj.Petyshara(wmarkpos+5,5,wamrkw+10,5,-1260)
            draw.SimpleText(wmstring,"IndicatorFont",wmarkpos+10,9,color_white)
        elseif serj.cfg.Vars["i_f"] == 2 then
            draw.RoundedBox(3,wmarkpos+5,5,wamrkw+10,25,Color(25, 25, 25))
            draw.RoundedBox(10,wmarkpos+7,6,wamrkw+6,2,hsv)
            serj.surfaceTexture(wmarkpos+7,6,wamrkw+6,2,"gui/center_gradient",Color(255,255,255,66))
            draw.SimpleText(wmstring,"IndicatorFont",wmarkpos+10,9,color_white)
        elseif serj.cfg.Vars["i_f"] == 3 then
            draw.RoundedBox(0,wmarkpos+5,5,wamrkw+10,25,Color(25, 25, 25, 200))
            draw.RoundedBox(0,wmarkpos+5,5,wamrkw+10,2,wmarkcolor)
            serj.surfaceTexture(wmarkpos+5,5,wamrkw+10,2,"gui/center_gradient",Color(255,255,255,66))
            draw.SimpleText(wmstring,"IndicatorFont",wmarkpos+10,9,color_white)
        elseif serj.cfg.Vars["i_f"] == 4 then
            draw.RoundedBox(0,wmarkpos+5,5,wamrkw+10,25,Color(25, 25, 25))
            surfaceSetDrawColor(wmarkcolor)
            surfaceDrawRect(wmarkpos+6,6,wamrkw+8,1)
            serj.surfaceTexture(wmarkpos+6,7,1,21,"gui/gradient_down",wmarkcolor)
            serj.surfaceTexture(wmarkpos+wamrkw+13,7,1,21,"gui/gradient_down",wmarkcolor)
            draw.SimpleText(wmstring,"IndicatorFont",wmarkpos+10,9,color_white)
        elseif serj.cfg.Vars["i_f"] == 5 then
            draw.RoundedBoxEx(8,wmarkpos+5,5,wamrkw+10,13,wmarkcolor,true,true,false,false)
            draw.RoundedBoxEx(8,wmarkpos+5,17,wamrkw+10,12,Color(wmarkcolor.r-415,wmarkcolor.g-425,wmarkcolor.b-475),false,false,true,true)
            draw.RoundedBox(6,wmarkpos+7,7,wamrkw+6,20,Color(25, 25, 25))
            draw.SimpleText(wmstring,"IndicatorFont",wmarkpos+10,9,color_white)
        elseif serj.cfg.Vars["i_f"] == 6 then
            draw.RoundedBox(0,wmarkpos-800,-1903,wamrkw+5,25,Color(25, 25, 25, 200))
        serj.Petyshara(wmarkpos-700,900,wamrkw+5,5,-1360)
            draw.SimpleText(wmstring,"IndicatorFont",wmarkpos-700,903,color_red)
        end
    end

    if serj.cfg.Vars["i_keybinds"] then
        local keybind_count = {}

        for key, keyState in pairs(serj.activebinds) do
            if (serj.cfg.Vars["i_ignore_ks"] or keyState) and serj.cfg.Keybinds.showInBinds[key] then
                keybind_count[#keybind_count + 1] = {
                    serj.translateKeybinds.name[key],
                    serj.translateKeybinds.mode[serj.cfg.Keybinds.mode[key]],
                }
            end
        end

        local bind_h = 25

        if serj.cfg.Vars["i_s"] == 1 then
            draw.RoundedBox(0,bindx,bindy,200,25,Color(25, 25, 25))
            serj.surfaceTexture(bindx,bindy,200,4,"gradient.png",color_white)
            draw.SimpleText("Keybinds","IndicatorFont",bindx+100,bindy+13,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        elseif serj.cfg.Vars["i_s"] == 2 then
            draw.RoundedBox(3,bindx,bindy,200,25,Color(25,25,25))
		    draw.RoundedBox(10,bindx+2,bindy+1,196,2,hsv)
            serj.surfaceTexture(bindx+2,bindy+1,196,2,"gui/center_gradient",Color(255,255,255,66))
            draw.SimpleText("Keybinds","IndicatorFont",bindx+100,bindy+13,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        elseif serj.cfg.Vars["i_s"] == 3 then
            draw.RoundedBox(0,bindx,bindy,200,25,Color(25,25,25,200))
		    draw.RoundedBox(0,bindx,bindy,200,2,keybindcolor)
            serj.surfaceTexture(bindx,bindy,196,2,"gui/center_gradient",Color(255,255,255,66))
            draw.SimpleText("Keybinds","IndicatorFont",bindx+100,bindy+13,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        elseif serj.cfg.Vars["i_s"] == 5 then
            draw.RoundedBox(0,bindx,bindy,200,25,Color(25, 25, 25))
            surfaceSetDrawColor(keybindcolor)
            surfaceDrawRect(bindx+1,bindy+1,198,1)
            serj.surfaceTexture(bindx+1,bindy+2,1,21,"gui/gradient_down",keybindcolor)
            serj.surfaceTexture(bindx+198,bindy+2,1,21,"gui/gradient_down",keybindcolor)
            draw.SimpleText("Keybinds","IndicatorFont",bindx+100,bindy+13,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        elseif serj.cfg.Vars["i_s"] == 6 then
            draw.RoundedBoxEx(8,bindx,bindy,200,15,keybindcolor,true,true,false,false)
            draw.RoundedBoxEx(8,bindx,bindy+15,200,10,Color(keybindcolor.r-45,keybindcolor.g-45,keybindcolor.b-45),false,false,true,true)
            draw.RoundedBox(6,bindx+2,bindy+2,196,21,Color(25, 25, 25))
            draw.SimpleText("Keybinds","IndicatorFont",bindx+100,bindy+11,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        elseif serj.cfg.Vars["i_s"] == 7 then
            draw.RoundedBox(0,bindx,bindy,200,25,Color(25, 25, 25,200))
        serj.Petyshara(bindx,bindy,199,2,50)
            draw.RoundedBox(0,bindx,bindy+23,200,2,Color(25, 25, 25,160))
            draw.SimpleText("Keybinds","IndicatorFont",bindx+100,bindy+13,color_white,TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end

        for i = 1, #keybind_count do
            local kb_str2 = keybind_count[i][2]
            local kb_str = keybind_count[i][1]
            local stringw, stringh = surfaceGetTextSize(kb_str .. " - " .. kb_str2)


            if serj.cfg.Vars["i_s"] == 1 then
                draw.RoundedBox(0,bindx,bindy+i*(bind_h),200,bind_h,Color(30,30,30))
                draw.SimpleText(kb_str,"IndicatorFont",bindx+4,bindy+i*(bind_h)+3,Color(185,250,255))
                draw.SimpleText(kb_str2,"IndicatorFont",bindx+195,bindy+i*(bind_h)+3,Color(181,255,96),TEXT_ALIGN_RIGHT)
            elseif serj.cfg.Vars["i_s"] == 2 then
                serj.surfaceTexture(bindx,bindy+i*(bind_h)+1,200,bind_h-2,"gui/gradient",Color(11,11,11,235))
                draw.SimpleText(kb_str,"IndicatorFont",bindx+4,bindy+i*(bind_h)+3,color_white)
                draw.SimpleText(kb_str2,"IndicatorFont",bindx+195,bindy+i*(bind_h)+3,color_white,TEXT_ALIGN_RIGHT)
            elseif serj.cfg.Vars["i_s"] == 3 then
                draw.SimpleText(kb_str,"IndicatorFont",bindx+4,bindy+i*(bind_h),color_white)
                draw.SimpleText(kb_str2,"IndicatorFont",bindx+195,bindy+i*(bind_h),color_white,TEXT_ALIGN_RIGHT)
            elseif serj.cfg.Vars["i_s"] == 4 then
                hsv2 = HSVToColor( ( CurTime() * 50 + i ) % 360, 1, 1 )
                draw.RoundedBox(0,scrw-stringw-18,5+i*(bind_h),stringw+18,bind_h,Color(25,25,25,200))
                draw.RoundedBox(0,scrw-4,5+i*(bind_h),4,bind_h,hsv2)
                draw.SimpleText(kb_str .. " - " .. kb_str2,"IndicatorFont",scrw-10-stringw,5+i*(bind_h)+4,color_white)
            elseif serj.cfg.Vars["i_s"] == 5 then
                serj.surfaceTexture(bindx,bindy+i*(bind_h)+1,200,bind_h-2,"gui/gradient",Color(11,11,11,235))
                draw.SimpleText(kb_str,"IndicatorFont",bindx+4,bindy+i*(bind_h)+3,color_white)
                draw.SimpleText(kb_str2,"IndicatorFont",bindx+195,bindy+i*(bind_h)+3,color_white,TEXT_ALIGN_RIGHT)
            elseif serj.cfg.Vars["i_s"] == 6 then
                draw.SimpleText(kb_str,"IndicatorFont",bindx+4,bindy+i*(bind_h),color_white)
                draw.SimpleText(kb_str2,"Font",bindx+195,bindy+i*(bind_h),color_white,TEXT_ALIGN_RIGHT)
            elseif serj.cfg.Vars["i_s"] == 7 then
                draw.RoundedBox(0,bindx,bindy+i*(bind_h),200,bind_h,Color(30,30,30,150))
                draw.SimpleText(kb_str,"IndicatorFont",bindx+4,bindy+i*(bind_h)+3,Color(255,255,255))
                draw.SimpleText(kb_str2,"IndicatorFont",bindx+195,bindy+i*(bind_h)+3,Color(96,255,14403),TEXT_ALIGN_RIGHT)
            elseif serj.cfg.Vars["i_s"] == 8 then
                draw.SimpleText(kb_str .. " [" .. kb_str2 .. "]","IndicatorFont",scrw/2,scrh/2+i*(bind_h),serj.KColors(i),TEXT_ALIGN_CENTER)
            end
        end



        if serj.Panels.frame then
            local framepos_x, framepos_y = serj.Panels.frame:GetPos()
            if serj.inRect(bindx,bindy,bindx+200,bindy+25) and input.IsMouseDown(107) and !serj.inRect(framepos_x,framepos_y,900,700) then
                serj.cfg.Vars["i_keybinds_x"], serj.cfg.Vars["i_keybinds_y"] = gui.MouseX()-100, gui.MouseY()-12
            end
        end
    end


--[[if serj.cfg.Vars["chat_text2"] then
    serj.entityCache = {}
serj.allowedClasses = {}

    cam_Start3D()
            for i = 1, #serj.entityCache do
                local v = serj.entityCache[ i ]

                if not IsValid( v.entity ) then return end

                if v.position:DistToSqr( pos ) > ed then continue end

                render.DrawWireframeBox( v.position, v.entity:GetAngles(), v.entity:OBBMins(), v.entity:OBBMaxs(), ultimate.Colors[255], true )
            end
        end
        cam.End3D()
    end
end]]


--hook.Add("entity_killed", "csl_entity_killed", function(data)
    if serj.cfg.Vars["info_list"] then

    end
--end)

    --[[if serj.cfg.Vars["info_list"] then
        local inflictor = Entity(data.entindex_inflictor)
    local attacker = ents.GetByIndex(data.entindex_attacker)
    local victim = ents.GetByIndex(data.entindex_killed)
    local weapon = attacker:GetActiveWeapon():GetClass()

    chat.AddText(Color(180, 180, 180), "You killed ", Color(255, 255, 255), victim:Nick(), Color(180, 180, 180), " (", Color(255, 255, 255), victim:SteamID(), Color(180, 180, 180), ")", "killed you using ", Color(255, 255, 255), inflictor)
    chat.AddText(Color(255, 255, 255), attacker:Nick(), Color(255, 255, 255), Color(180, 180, 180), " (", Color(255, 255, 255), attacker:SteamID(), Color(180, 180, 180), ") ",  "killed you using ", Color(255, 255, 255), inflictor)
    end]]


    if serj.cfg.Vars["i_targethud"] then
        local winchance = "by ilyaware"
        local ping = "ah oh v popky"

        local maxlen = serj.targethudy-20
        if IsValid(serj.target) then
            serj.targethp = Lerp(FrameTime()*5,serj.targethp,mClamp(serj.target:Health(),0,100))

            if IsValid(me:GetActiveWeapon()) and me:GetActiveWeapon():Clip1() <= 0 then
                winchance = "[Info] - No ammo"
            elseif !IsValid(serj.target:GetActiveWeapon()) and IsValid(me:GetActiveWeapon()) then
                winchance = "[Info] - Ez win"
            elseif serj.target:Health() < 10 and serj.target:Health() < me:Health() then
                winchance = "[Info] - Ezichka Owning"
            elseif me:Health() < 10 and serj.target:Health() > me:Health() then
                winchance = "[Info] - YOU ARE DEAD..."
            elseif serj.target:Health() > me:Health() then
                winchance = "[Info] - Loosing :("
            elseif serj.target:Health() == me:Health() then
                winchance = "[Info] - Same chance"
            elseif serj.target:Health() < me:Health() then
                winchance = "[Info] - Dominating"
            end

            if serj.target:Ping() > me:Ping() then
                ping = " (bigger)"
            elseif serj.target:Ping() < me:Ping() then
                ping = " (advantage)"
            elseif serj.target:Ping() == me:Ping() then
                ping = " (same)"
            else
                ping = ""
            end


            --targethp = math.Clamp(serj.target:Health(),0,100)
            --targetap = math.Clamp(serj.target:Armor(),0,100)
            serj.targethudy = math.Approach(serj.targethudy,340,FrameTime()*500)
            serj.targethudx = math.Approach(serj.targethudx,120,FrameTime()*500)
            serj.targeta =  math.Approach( serj.targeta,255,FrameTime()*500)
        else
            serj.targethudy = math.Approach(serj.targethudy,0,FrameTime()*350)
            serj.targethudx = math.Approach(serj.targethudx,0,FrameTime()*350)
            serj.targeta =  math.Approach( serj.targeta,0,FrameTime()*350)
        end

        draw.RoundedBox(0,thx+150-serj.targethudy/2,thy,serj.targethudy,serj.targethudx,Color(22, 22, 22, serj.targeta))
        --draw.RoundedBox(0,thx+150-serj.targethudy/2,thy,serj.targethudy,serj.targethudx,Color(22, 22, 22, serj.targeta))
        serj.surfaceTexture(thx+150-serj.targethudy/2,thy,serj.targethudy,4,"!MovingWireframe",Color(255,255,255,serj.targeta))
        surface.SetMaterial(Material("gradient.png"))

        if IsValid(serj.target) then
            local lw = string.len(serj.target:Name())
            --print(lw)
            draw.SimpleText(serj.antidalbaeb(serj.target:Name(), 32),"THUDFONT",thx+150-serj.targethudy/2+120,thy+12,Color(255,255,255,serj.targeta))
            if IsValid(serj.target:GetActiveWeapon()) then
                draw.SimpleText(serj.target:GetActiveWeapon():GetClass(),"THUDFONT",thx+150-serj.targethudy/2+120,thy+45,Color(255,255,255,serj.targeta))
            else
                draw.SimpleText("No valid weapon","THUDFONT",thx+150-serj.targethudy/2+120,thy+45,Color(255,255,255,serj.targeta))
            end
            draw.SimpleText(winchance,"THUDFONT",thx+150-serj.targethudy/2+120,thy+65,Color(255,255,255,serj.targeta))
            draw.SimpleText("Ping: " .. serj.target:Ping() .. ping,"THUDFONT",thx+150-serj.targethudy/2+120,thy+85,Color(255,255,255,serj.targeta))

            --local targetcol = string.ToColor(serj.cfg.Colors["i_targethudcolor"])
            draw.NoTexture()
            surface.SetMaterial(Material("!MovingWireframe"),serj.targeta)
            draw.Circle( thx+150-serj.targethudy/2+60, thy+62, 48, 64 , 100 )
            --surface.SetMaterial(Material("!portal"))
            surfaceSetDrawColor(22, 22, 22, serj.targeta) --string.ToColor(serj.cfg.Colors["     -  =    "])
            draw.Circle( thx+150-serj.targethudy/2+60, thy+62, 48, 64 , serj.targethp )
            draw.NoTexture()
            surfaceSetDrawColor(22, 22, 22, serj.targeta)
            draw.Circle( thx+150-serj.targethudy/2+60, thy+62, 36, 64 , 100 )

            draw.SimpleText((serj.target:Health()/serj.target:GetMaxHealth()*100).."%","THUDFONT",thx+150-serj.targethudy/2+60,thy+serj.targethudx/2+4,Color(255,255,255,serj.targeta),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        end
        if serj.Panels.frame then
            local framepos_x, framepos_y = serj.Panels.frame:GetPos()
            if serj.inRect(thx,thy,thx+300,thy+150) and input.IsMouseDown(107) and !serj.inRect(framepos_x,framepos_y,900,700) then
                serj.cfg.Vars["i_targethud_x"], serj.cfg.Vars["i_targethud_y"] = gui.MouseX()-100, gui.MouseY()-12
            end
        end
    end
end

local spotstable = {}
for i = 1, 100 do
    spotstable[ i ] = { x = mRand( 1, scrw ), y = mRand( 1, scrh ), x2 = mRand( -2, 2 ), y2 = mRand( -2, 2 ) }
end
--[[http.Fetch("https://cdn.discordapp.com/attachments/985740310938263613/1216139964614578187/dot.png?ex=65ff4d9a&is=65ecd89a&hm=a176299651a217320f42a655f729a1fc485e11446deabc6cae5c791aa3e4a32a&",function(s)
    file.Write("dot.png",s)
end)]]
local randomimage = {
    "data/dot.png",
}

bebriki = {}
for bebr = 1, 100 do
    bebriki[#bebriki+1] = table.Random(randomimage)
end
serj.bgalpha = 0
function serj.basedGigailyshaga()
    if serj.cfg.Vars["estetika_fill"] then
        if serj.Panels.frame != false then
            serj.bgalpha = math.Approach(serj.bgalpha,245,FrameTime()*150)
        else
            serj.bgalpha = math.Approach(serj.bgalpha,0,FrameTime()*250)
        end
        if serj.bgalpha > 245 then serj.bgalpha = 245 end
        local bgcolor = string.ToColor(serj.cfg.Colors["estetika_fill"])
        surfaceSetDrawColor(bgcolor.r,bgcolor.g,bgcolor.b,serj.bgalpha)
        surfaceDrawRect(0,0,scrw,scrh)
    end
    if serj.cfg.Vars["estetika"] and serj.Panels.frame != false then
        local estetikacolor

        for a = 1, serj.cfg.Vars["estetika_num"] do
            local spot = spotstable[ a ]
            if spot.x >= scrw or spot.x <= 0 then
                spot.x2 = -spot.x2
            end
                if spot.y >= scrh or spot.y <= 0 then
                spot.y2 = -spot.y2
            end
            spotstable[ a ].x = spot.x + spot.x2
            spotstable[ a ].y = spot.y + spot.y2
        end
        local function distance( x1, y1, x2, y2 )
            local dx = x1 - x2
            local dy = y1 - y2
            return math.sqrt ( dx * dx + dy * dy )
        end
        for a = 1, serj.cfg.Vars["estetika_num"] do
            local spot = spotstable[ a ]
            for b = 1, serj.cfg.Vars["estetika_num"] do
                local spot2 = spotstable[ b ]
                if serj.cfg.Vars["estetika_r"] then
                    estetikacolor = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
                else
                    estetikacolor = Color( 255, 255, 255 )
                end
                if a ~= b and mabs( spot2.x - spot.x ) <= 100 and mabs( spot2.y - spot.y ) <= 100 then
                    surfaceSetDrawColor(estetikacolor.r, estetikacolor.g, estetikacolor.b, 100-distance(spot2.x, spot2.y, spot.x, spot.y))
                    surfaceDrawLine( spot.x+32, spot.y+32, spot2.x+32, spot2.y+32 )
                end
            end
        serj.surfaceTexture(spot.x, spot.y,65,65,bebriki[a],estetikacolor)
        end
    end



	--[[]
    if serj.bsendpacket then
        draw.SimpleText("BSENDPACKET","font-02",5,ScrH()/2+50,Color(0,255,0))
        --draw.SimpleText("FL: " .. fakeLagTicks .. " / " .. fakeLagfactor,"font-02",5,ScrH()/2+20,Color(0,255,0))
    else
        draw.SimpleText("BSENDPACKET","font-02",5,ScrH()/2+50,Color(255,0,0))
        --draw.SimpleText("FL: " .. fakeLagTicks .. " / " .. fakeLagfactor,"font-02",5,ScrH()/2+20,Color(255,0,0))
    end

    --draw.SimpleText("SPEED: " .. math.Round(me:GetVelocity():Length()),"font-02",5,ScrH()/2+45,Color(255,255,255))

    draw.SimpleText("HITS: " .. serj.hits,"font-02",5,ScrH()/2+70,Color(255,161,85))
    draw.SimpleText("SHOTS: " .. serj.shot,"font-02",5,ScrH()/2+90,Color(183,255,100))
    draw.SimpleText("MISSES: " .. serj.shot - serj.hits .. " ( " .. math.Round(((serj.shot - serj.hits)/serj.shot)*100) .. "% )","font-02",5,ScrH()/2+110,Color(255,100,100))


    if serj.target != nil then
        draw.SimpleText("Target: " .. serj.target:Name(),"font-02",ScrW()/2,ScrH()/2+25,Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
        draw.SimpleText("HP: " .. serj.target:Health(),"font-02",ScrW()/2,ScrH()/2+45,Color(255,166,83),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
    end
	[]]


    --serj.hitmarker = {4}
    if serj.cfg.Vars["misc_hitmarker"] then
        local hitmarkercolor = string.ToColor(serj.cfg.Colors["misc_hitmarker"])
        for k, v in next, serj.hitmarkerTable do
            local pos = v[1]:ToScreen()
            local sposx, sposy = ScrW()/2, ScrH()/2

            if(v[2] <= 0) then
                table.remove(serj.hitmarkerTable, k);
                continue;
            end
            --v[5] = v[5] - FrameTime()
            v[2] = v[2] - FrameTime() * (serj.cfg.Vars["misc_hitmarker_die"] * 1)           --math.Round(serj.cfg.Vars["misc_3rdp_s"]*10))

            surfaceSetDrawColor(hitmarkercolor.r,hitmarkercolor.g,hitmarkercolor.b,hitmarkercolor.a)
            if serj.cfg.Vars["misc_hitmarker_pos"] == 1 then
                surfaceDrawLine( pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2 )
                surfaceDrawLine( pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2 )
                surfaceDrawLine( pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2 )
                surfaceDrawLine( pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2 )
            elseif serj.cfg.Vars["misc_hitmarker_pos"] == 2 then
                surface.SetDrawColor(string.ToColor(serj.cfg.Colors["hit1"]))
surface.DrawLine(pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2)

surface.SetDrawColor(string.ToColor(serj.cfg.Colors["hit2"]))
surface.DrawLine(pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2)

surface.SetDrawColor(string.ToColor(serj.cfg.Colors["hit3"]))
surface.DrawLine(pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2)

surface.SetDrawColor(string.ToColor(serj.cfg.Colors["hit4"]))
surface.DrawLine(pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2)
            elseif serj.cfg.Vars["misc_hitmarker_pos"] == 3 then
                local hsv = HSVToColor(CurTime() % 6 * 60, 1, 1)
                local rainbow = Color(hsv.r, hsv.g, hsv.b, alpha)
                surface.SetDrawColor(rainbow)
                surface.DrawLine(pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2)

                surface.SetDrawColor(rainbow)
                surface.DrawLine(pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2)

                surface.SetDrawColor(rainbow)
                surface.DrawLine(pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2)

                surface.SetDrawColor(rainbow)
                surface.DrawLine(pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2)
            elseif serj.cfg.Vars["misc_hitmarker_pos"] == 3 then
                local hsv = HSVToColor(CurTime() % 6 * 60, 1, 1)
                local rainbow = Color(hsv.r, hsv.g, hsv.b, alpha)
                surface.SetDrawColor(rainbow)
                surface.DrawRect(pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2)

                surface.SetDrawColor(rainbow)
                surface.DrawRect(pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2)

                surface.SetDrawColor(rainbow)
                surface.DrawRect(pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2)

                surface.SetDrawColor(rainbow)
                surface.DrawRect(pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2)
            end
        end
    end
    if serj.cfg.Vars["csgo_bscope"] then
        local col = string.ToColor(serj.cfg.Colors["csgo_bscope"])
        local fcolor = Color(col.r,col.g,col.b,col.a)
        local curw = me:GetActiveWeapon()
        if IsValid(me) and IsValid(curw) then
            if !serj.cfg.Vars["csgo_bscope_alt"] then
                if curw.Scope != nil then
                    if curw:GetClass():StartWith("weapon_csgo_") then
                        curw:SetNWString( "ScopeAlpha", 0 )
                        --if curw.Scope != 0 then
							serj.scropeAlpha = math.Approach(serj.scropeAlpha,85+(curw.Scope*10),FrameTime()*250)
                        --else
							serj.scropeAlpha = math.Approach(serj.scropeAlpha,0,FrameTime()*250)
                        --end
                        --if scropeAlpha > 1 then
                            --surfaceTexture(scrw/2+5,scrh/2,scropeAlpha,2,"gui/gradient_up",fcolor)
                            --surfaceTexture(scrw/2-5-scropeAlpha,scrh/2,scropeAlpha,2,"gui/gradient_up",fcolor)
                            --surfaceTexture(scrw/2,scrh/2+5,2,scropeAlpha,"gui/gradient_up",fcolor)
                            --surfaceTexture(scrw/2,scrh/2-5-scropeAlpha,2,scropeAlpha,"gui/gradient_up",fcolor)

                        --end
                        --print(curw.Scope)
                        if serj.cfg.Vars["csgo_bscope_dl"] then
                            if curw.Scope != 0 then
                                surfaceSetDrawColor(0,0,0,245)
                                surfaceDrawLine(0,scrh/2,scrw,scrh/2)
                                surfaceDrawLine(scrw/2,0,scrw/2,scrh)
                            end
                        end
                    end
                end
            else
                if serj.estscope[curw:GetClass()] then
                    if curw:GetZoomLevel() == 0 then
                        serj.scropeAlpha = math.Approach(serj.scropeAlpha,128,FrameTime()*250)
                    end
                    if curw:GetZoomLevel() == 2 then
                        serj.scropeAlpha = math.Approach(serj.scropeAlpha,85,FrameTime()*250)
                    end
                    if curw:GetZoomLevel() == 1 then
                        serj.scropeAlpha = math.Approach(serj.scropeAlpha,0,FrameTime()*650)
                    end

                    curw:SetZoomLevel( 1 )
                    curw:SetZoom( 0 )

                    serj.surfaceTexture(scrw/2+5,scrh/2,serj.scropeAlpha,2,"gui/gradient",fcolor)
                    serj.surfaceTexture(scrw/2-5-serj.scropeAlpha/2,scrh/2+1,serj.scropeAlpha,2,"gui/gradient",fcolor,180)
                    serj.surfaceTexture(scrw/2,scrh/2+5,2,serj.scropeAlpha,"gui/gradient_down",fcolor)
                    serj.surfaceTexture(scrw/2,scrh/2-5-serj.scropeAlpha,2,serj.scropeAlpha,"gui/gradient_up",fcolor)
                elseif curw:GetClass():StartWith("m9k_")  then
                    if me:KeyDown(IN_ATTACK2) and (!me:KeyDown(IN_SPEED) and !me:KeyDown(IN_USE)) then
                        serj.scropeAlpha = math.Approach(serj.scropeAlpha,128,FrameTime()*250)
                    else
                        serj.scropeAlpha = math.Approach(serj.scropeAlpha,0,FrameTime()*650)
                    end

                    curw:SetIronsights(false)

                    serj.surfaceTexture(scrw/2+5,scrh/2,serj.scropeAlpha,2,"gui/gradient",fcolor)
                    serj.surfaceTexture(scrw/2-5-serj.scropeAlpha/2,scrh/2+1,serj.scropeAlpha,2,"gui/gradient",fcolor,180)
                    serj.surfaceTexture(scrw/2,scrh/2+5,2,serj.scropeAlpha,"gui/gradient_down",fcolor)
                    serj.surfaceTexture(scrw/2,scrh/2-5-serj.scropeAlpha,2,serj.scropeAlpha,"gui/gradient_up",fcolor)
                end
            end
        end
    end

    if serj.cfg.Vars["i_indicators"] then
        local ind_count = {}

        --if serj.cfg.Vars["i_indicators"] then
        --    ind_count[#ind_count + 1] = {"SPEED: " .. math.Round(me:GetVelocity():Length()),"",5,ScrH()/2+45,Color(255,255,255)}
        --end

        --if serj.cfg.Vars["aa_enable"] then
        --    ind_count[#ind_count + 1] = {"LBY: ",mabs(math.Round(math.AngleDifference(serj.vRealAngles.y,serj.vFakeAngles.y))),0,45}
        --end

        if serj.cfg.Vars["i_indicators"] then
            ind_count[#ind_count + 1] = {"< > ","On walk safe shoot",0,60}
        end


        if serj.cfg.Vars["i_indicators"] then
            ind_count[#ind_count + 1] = {"Mass lag: ",serj.fakeLagTicks,0,13}
        end

        if serj.cfg.Vars["i_indicators"] then
            ind_count[#ind_count + 1] = {"Anti backkshoot: ","Massive",10,25}
        end

        if serj.cfg.Vars["i_indicators"] then
            ind_count[#ind_count + 1] = {"FAST S: ","Ideal",10,25}
        end

        if serj.cfg.Vars["i_indicators"] then
            ind_count[#ind_count + 1] = {"BACKSHOOT % : ",math.Round(2/FrameTime()),0,25}
        end

        if serj.cfg.Vars["i_indicators"] then
            ind_count[#ind_count + 1] = {"YAW: ","jitter abuse",10,25}
        end

        if serj.cfg.Vars["i_indicators"] then
            ind_count[#ind_count + 1] = {"LBY: Extreme ",math.Round(1/FrameTime()),10,25}
        end

        if serj.cfg.Vars["i_indicators"] and serj.activebinds["slow_key"] then
            ind_count[#ind_count + 1] = {"ABUSE LAG: ","ON",10,25}
        end

        if serj.cfg.Vars["i_indicators"] and serj.activebinds["key_cstrafe"] then
            ind_count[#ind_count + 1] = {"Circle strafe: ","ON",10,25}
        end

        if serj.cfg.Vars["i_indicators_h"] then
            ind_count[#ind_count + 1] = {"HITS: " .. serj.hits,"",10,25}
        end

        if serj.cfg.Vars["i_indicators_h"] then
            ind_count[#ind_count + 1] = {"SHOTS: " .. serj.shot,"",5,ScrH()/2+90,Color(183,255,100)}
        end

        if serj.cfg.Vars["i_indicators_h"] then
            ind_count[#ind_count + 1] = {"MISSES: " .. serj.shot - serj.hits .. " ( " .. math.Round(((serj.shot - serj.hits)/serj.shot)*100) .. "% )","",5,ScrH()/2+110,Color(255,100,100)}
        end

        if serj.cfg.Vars["i_indicators_targetik"] then
            ind_count[#ind_count + 1] = {"Target: " .. serj.target:Name(),"",ScrW()/2,ScrH()/2+25,Color(255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER}
        end

        if serj.cfg.Vars["i_indicators_targetik"] then
            ind_count[#ind_count + 1] = {"HP: " .. serj.target:Health(),"",ScrW()/2,ScrH()/2+45,Color(255,166,83),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER}
        end

        if serj.cfg.Vars["move_fd"] and serj.activebinds["key_fd"] then
            ind_count[#ind_count + 1] = {"FAKEDUCK","",12,189}
        end



        for i = 1, #ind_count do
            local str, str2 = ind_count[i][1], ind_count[i][2]
            local tw, th = surfaceGetTextSize(str)

            if !isnumber(ind_count[i][2]) then
                surfaceSetTextColor(string.ToColor(serj.cfg.Colors["i_indicators"]))
            else
                if ind_count[i][4] < ind_count[i][2] then
                    surfaceSetTextColor(string.ToColor(serj.cfg.Colors["i_indicators_h"]))
                elseif ind_count[i][3] < ind_count[i][2] then
                    surfaceSetTextColor(string.ToColor(serj.cfg.Colors["i_indicators_fps"]))
                else
                    surfaceSetTextColor(string.ToColor(serj.cfg.Colors["i_indicators_target"]))
                end
            end





            surfaceSetTextPos(1000,scrh/2 - th + th * i)
            surfaceSetFont("IndicatorFont")
            surfaceDrawText(str .. str2)
            surfaceSetTextColor(5,5,2)
        end

    end

    -- keybinds
    serj.drawKeybinds()

    -- Crosshair
    if serj.cfg.Vars["ch_e"] then
        local csizew = serj.cfg.Vars["ch_size"]
        local crosshair_color = string.ToColor(serj.cfg.Colors["ch_e"])
        if serj.cfg.Vars["ch_type"] == 1 then

            --left
            draw.RoundedBox(0,scrw/2-csizew-15,scrh/2-csizew/2,csizew+10,csizew,crosshair_color)
            --right
            draw.RoundedBox(0,scrw/2+4,scrh/2-csizew/2,csizew+10,csizew,crosshair_color)
            --top
            draw.RoundedBox(0,scrw/2-csizew/2,scrh/2-csizew/2-15,csizew,csizew+10,crosshair_color)
            --down
            draw.RoundedBox(0,scrw/2-csizew/2,scrh/2+4,csizew,csizew+10,crosshair_color)

        elseif serj.cfg.Vars["ch_type"] == 2 then
            draw.RoundedBox(0,scrw/2-csizew/2-1,scrh/2-csizew/2-1,csizew+2,csizew+2,color_black)
            draw.RoundedBox(0,scrw/2-csizew/2,scrh/2-csizew/2,csizew,csizew,crosshair_color)
        elseif serj.cfg.Vars["ch_type"] == 3 then

        elseif serj.cfg.Vars["ch_type"] == 4 then

        elseif serj.cfg.Vars["ch_type"] == 5 then
            draw.SimpleText("⊹","font-02",scrw/2,scrh/2,crosshair_color,TEXT_ALIGN_CENTER,TEXT_ALIGNCENTER)
        elseif serj.cfg.Vars["ch_type"] == 6 then
            draw.SimpleText("₊","font-02",scrw/2,scrh/2,crosshair_color,TEXT_ALIGN_CENTER,TEXT_ALIGNCENTER)
        elseif serj.cfg.Vars["ch_type"] == 7 then
            draw.SimpleText("𒅒","font-02",scrw/2,scrh/2,crosshair_color,TEXT_ALIGN_CENTER,TEXT_ALIGNCENTER)
        elseif serj.cfg.Vars["ch_type"] == 8 then
            draw.SimpleText("𒈔","font-02",scrw/2,scrh/2,crosshair_color,TEXT_ALIGN_CENTER,TEXT_ALIGNCENTER)
        elseif serj.cfg.Vars["ch_type"] == 9 then
            draw.SimpleText("𒇫","font-02",scrw/2,scrh/2,crosshair_color,TEXT_ALIGN_CENTER,TEXT_ALIGNCENTER)
        elseif serj.cfg.Vars["ch_type"] == 10 then
            draw.SimpleText("𒄆","font-02",scrw/2,scrh/2,crosshair_color,TEXT_ALIGN_CENTER,TEXT_ALIGNCENTER)

        end
    end

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
	elseif ( !ply:IsOnGround() and len >= 1000 ) then
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

			ply:SetPoseParameter( "vertical_velocity", ( dp < 0 and dp || 0 ) + fwd:Dot( Velocity ) * 0.005 )

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
    --serj.guiCheckBox("Enable crosshair","ch_e",crosshairsp,true)
    --serj.DropDown("Crosshair type", {"Default","Box","Zвастика","Nazi"}, "ch_type", crosshairsp)
    --serj.CreateSlider("Crosshair size", "", "ch_size", 1, 15, 0,crosshairsp)

end
local hide = {
	["CHudCrosshair"] = true,
}

--[[]
hook.Add("HUDPaint","crossmark",function()
    if serj.cfg.Vars["Aimbot_marker"] then
        local pos = serj.targetVector:ToScreen()
        local csizewz = serj.cfg.Vars["ch_mark"]
        local crosshaircolor = string.ToColor(serj.cfg.Colors["ch_markcol"])

        --left
        draw.RoundedBox(0,scrw/2-csizew-15,scrh/2-csizew/2,csizew+10,csizew,crosshair_color)
        --right
        draw.RoundedBox(0,scrw/2+4,scrh/2-csizew/2,csizew+10,csizew,crosshair_color)

        --surface.SetDrawColor( string.ToColor( serj.cfg.Colors["Aimbot_marker"] ) )

        --top
        draw.RoundedBox(0,scrw/2-csizew/2,scrh/2-csizew/2-15,csizew,csizew+10,crosshair_color)
        --down
        draw.RoundedBox(0,scrw/2-csizew/2,scrh/2+4,csizew,csizew+10,crosshair_color)
    end
    end)
--]]

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if serj.cfg.Vars["ch_e"] and ( hide[ name ] ) then
		return false
	end
end )
serj.drawoverlay = false
hook.Add("PreDrawViewModel", "predraw", function(vm,ply,wep)
    local overlayCol = string.ToColor(serj.cfg.Colors["viewmodel_wireframe"])
	if !me:Alive() or !IsValid(me:GetActiveWeapon()) then return end

	local gun = me:GetActiveWeapon():GetClass()
    if gun:StartWith("cw_") then return end

	if me:Alive() and me:GetActiveWeapon():GetClass() != nil then

        if serj.cfg.gunModels[gun] then
            vm:SetModel(serj.cfg.gunModels[gun][1])
        end

        if serj.cfg.Vars["viewmodel_flip_e"] then
            if serj.cfg.Vars["viewmodel_flip"] then
                me:GetActiveWeapon().ViewModelFlip = true
            else
                me:GetActiveWeapon().ViewModelFlip = false
            end
        end

		if serj.cfg.gunSkins[gun] then
            render.SetColorModulation(serj.cfg.gunSkins[gun][4]/255,serj.cfg.gunSkins[gun][5]/255,serj.cfg.gunSkins[gun][6]/255)
			render.SetBlend(serj.cfg.gunSkins[gun][7]/255)
            render.MaterialOverride(Material(serj.cfg.gunSkins[gun][1]))
		else
            render.SetColorModulation(1,1,1)
			render.MaterialOverride(Material(""))
		end
		render.SetBlend(1)
	end
    if serj.cfg.Vars["viewmodel_wireframe"] then --and serj.cfg.Vars["viewmodel_wiretype"] == 1 then
        if serj.drawoverlay then
            local Gunebat = serj.chamsMaterials[serj.cfg.Vars["viewmodel_wiretype"]] or "!flat"
            local pulseValue = (math.sin(CurTime() * serj.cfg.Vars["viewmodel_move"]) + 1) / 2
            local startColor = string.ToColor(serj.cfg.Colors["viewmodel_wireframe1"])
            local endColor = string.ToColor(serj.cfg.Colors["viewmodel_wireframe"])
            local overlayCol = LerpColor(pulseValue, startColor, endColor)

            render.SetColorModulation(overlayCol.r/255, overlayCol.g/255, overlayCol.b/225)
            render.MaterialOverride(Material(Gunebat))
        else
            render.SetColorModulation(1, 1, 1)
        end
        render.SetBlend(1)
    end
    --[[if serj.cfg.Vars["viewmodel_wiretype"] == 2 then
        if serj.drawoverlay then
            local pulseValue = (math.sin(CurTime() * serj.cfg.Vars["viewmodel_move"]) + 1) / 2
            local startColor = string.ToColor(serj.cfg.Colors["viewmodel_wireframe1"])
            local endColor = string.ToColor(serj.cfg.Colors["viewmodel_wireframe"])
            local overlayCol = LerpColor(pulseValue, startColor, endColor)

            render.SetColorModulation(overlayCol.r/255, overlayCol.g/255, overlayCol.b/225)
            render.MaterialOverride(Material("!hoverball"))
        else
            render.SetColorModulation(1, 1, 1)
        end
        render.SetBlend(1)
    end
    if serj.cfg.Vars["viewmodel_wiretype"] == 3 then
        if serj.drawoverlay then
            local pulseValue = (math.sin(CurTime() * serj.cfg.Vars["viewmodel_move"]) + 1) / 2
            local startColor = string.ToColor(serj.cfg.Colors["viewmodel_wireframe1"])
            local endColor = string.ToColor(serj.cfg.Colors["viewmodel_wireframe"])
            local overlayCol = LerpColor(pulseValue, startColor, endColor)

            render.SetColorModulation(overlayCol.r/255, overlayCol.g/255, overlayCol.b/225)
            render.MaterialOverride(Material("!MovingWireframe"))
        else
            render.SetColorModulation(1, 1, 1)
        end
        render.SetBlend(1)
    end
    if serj.cfg.Vars["viewmodel_wiretype"] == 4 then
        if serj.drawoverlay then
            local pulseValue = (math.sin(CurTime() * serj.cfg.Vars["viewmodel_move"]) + 1) / 2
            local startColor = string.ToColor(serj.cfg.Colors["viewmodel_wireframe1"])
            local endColor = string.ToColor(serj.cfg.Colors["viewmodel_wireframe"])
            local overlayCol = LerpColor(pulseValue, startColor, endColor)

            render.SetColorModulation(overlayCol.r/255, overlayCol.g/255, overlayCol.b/225)
            render.MaterialOverride(Material("!portal"))
        else
            render.SetColorModulation(1, 1, 1)
        end
        render.SetBlend(1)
    end]]


        --[[if serj.drawoverlay then
            local pulseValue = (math.sin(CurTime() * 5) + 1) / 2
            local startColor = Color(255, 0, 0,225)
            local endColor = Color(string.ToColor(serj.cfg.Colors["viewmodel_wireframe"]))
            local overlayCol = LerpColor(pulseValue, startColor, endColor)

            render.SetColorModulation(overlayCol.r/255, overlayCol.g/255, overlayCol.b/225)
            render.MaterialOverride(Material("!MovingShiny"))
        else
            render.SetColorModulation(1, 1, 1)
        end
        render.SetBlend(1)]]
end)

hook.Add("PostDrawViewModel", "Postdraw", function()
    local gun = me:GetActiveWeapon():GetClass()
	render.SetColorModulation(1, 1, 1)
    render.MaterialOverride()
    render.SetBlend(1)
    render.SuppressEngineLighting(false)

    if serj.drawoverlay then return end

    if serj.cfg.Vars["viewmodel_wireframe"] and !gun:StartWith("cw_") then
        serj.drawoverlay = true
        LocalPlayer():GetViewModel():DrawModel()
        serj.drawoverlay = false
    end
end)









serj.isCanTrace = true
function serj.Trace()
	if (not serj.isCanTrace) then
		return
	end
	serj.isCanTrace = false
	index = 1
	indexF = index * .1
	trace = util.TraceEntity({
		start = LocalPlayer():GetPos(),
		endpos = physenv.GetGravity() * (0.5 * indexF * indexF) + LocalPlayer():GetVelocity() * indexF + LocalPlayer():GetPos(),
		filter = LocalPlayer()
	}, LocalPlayer())
	while (not trace.Hit) do
		render.DrawLine(trace.StartPos, trace.HitPos, Color(250, 250, 250), true)
		index = index + 1
		indexF = index * .1
		indexFN = index * .1 - .1
		trace = util.TraceEntity({
			start = physenv.GetGravity() * (0.5 * indexFN * indexFN) + LocalPlayer():GetVelocity() * indexFN + LocalPlayer():GetPos(),
			endpos = physenv.GetGravity() * (0.5 * indexF * indexF) + LocalPlayer():GetVelocity() * indexF + LocalPlayer():GetPos(),
			filter = LocalPlayer()
		}, LocalPlayer())
		if (index > 256) then
			break
		end
	end
	render.DrawLine(trace.StartPos, trace.HitPos, Color(255, 250, 250), true)
	serj.isCanTrace = true
	return trace.HitPos
end
--[[hook.Add("2435454", "666", function(bD, bS)
    if not serj.cfg.Vars["fall_predict2"] then return end
    if not LocalPlayer():IsOnGround() then
        local pw = serj.Trace()
        --render.DrawWireframeBox(pw, Angle(), LocalPlayer():OBBMins(), LocalPlayer():OBBMaxs(), Color(250, 250, 250), true)
        local traceResult = util.TraceLine({
            start = pw,
            endpos = pw - Vector(0, 0, 1000),
            mask = MASK_SOLID_BRUSHONLY
        })
        if traceResult.Hit then
            local fallPos = traceResult.HitPos
            local textPos = fallPos + Vector(0, 0, 10)
            cam.Start3D2D(textPos, Angle(0, EyeAngles().y - 90, 90), 0.2)
            render.DrawLine(ply:GetPos(), trace, Color(250, 250, 250), true)
            cam.End3D2D()
        end
    end
end)]]
--[[hook.Add("Think", "FallPredictor", function()
    if not serj.cfg.Vars["fall_predict1"] then return end

    if not LocalPlayer():IsOnGround() then
        local pw = serj.Trace()
        local traceResult = util.TraceLine({
            start = pw,
            endpos = pw - Vector(0, 0, 1000),
            mask = MASK_SOLID_BRUSHONLY
        })

        if traceResult.Hit then
            local fallPos = traceResult.HitPos
            local textPos = fallPos + Vector(0, 0, 10)
            local fallTime = (fallPos.z - LocalPlayer():GetPos().z) / 550
            local fallTimeString = string.format("%.1f", fallTime)

            local damage = 0
            if LocalPlayer():GetVelocity().z < -500 then
                damage = math.abs(LocalPlayer():GetVelocity().z / 100)
            end

            -- Рисуем текст
            local text = "Падение через " .. fallTimeString .. " сек. Урон: " .. damage
            cam.Start3D2D(textPos, Angle(0, EyeAngles().y - 90, 90), 0.2)
                draw.SimpleText(text, "Default", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            cam.End3D2D()

            -- Рисуем круг или крестик при приземлении
            if LocalPlayer():GetVelocity().z >= 0 then
                -- Рисуем круг
                render.SetColorMaterial()
                render.DrawSphere(fallPos, 10, 8, 8, Color(0, 255, 0, 255)) -- Зеленый круг
            else
                -- Рисуем крестик
                local size = 10
                render.DrawLine(fallPos + Vector(-size, -size, 0), fallPos + Vector(size, size, 0), Color(255, 0, 0, 255), true)
                render.DrawLine(fallPos + Vector(-size, size, 0), fallPos + Vector(size, -size, 0), Color(255, 0, 0, 255), true)
            end
        end
    end
end)]]
local trajectoryPoints = {} -- Хранит точки траектории

hook.Add("PostDrawTranslucentRenderables", "3434", function(bD, bS)
    if not serj.cfg.Vars["fall_predict"] then return end
    local player = LocalPlayer()

    -- Проверяем, находится ли игрок в прыжке
    if not player:IsOnGround() then
        local pw = serj.Trace()
        local traceResult = util.TraceLine({
            start = pw,
            endpos = pw - Vector(0, 0, 1000),
            mask = MASK_SOLID_BRUSHONLY
        })

        if traceResult.Hit then
            local fallPos = traceResult.HitPos
            local textPos = fallPos + Vector(0, 0, 10)
            local fallTime = (fallPos.z - player:GetPos().z) / 550
            local fallTimeString = string.format("%.1f", fallTime)

            local velocityZ = player:GetVelocity().z
            local damage = 0
            if velocityZ < -500 then
                damage = math.max(0, (math.abs(velocityZ) - 500) / 10)
            end

            local text = "Падение через " .. fallTimeString .. " сек. Урон: " .. math.floor(damage)
            cam.Start3D2D(textPos, Angle(0, EyeAngles().y - 90, 90), 0.2)
                draw.SimpleTextOutlined(text, "DermaLarge", 0, 0, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 1, Color(0, 0, 0))
            cam.End3D2D()

            -- Отображаем модель игрока
            local model = player:GetModel() -- Получаем модель игрока
            local modelPos = fallPos + Vector(0, 0, 20) -- Позиция для отображения модели
            local modelAngle = Angle(0, EyeAngles().y, 0) -- Угол поворота модели

            -- Рисуем модель
            local modelEnt = ClientsideModel(model, RENDER_GROUP_OPAQUE_ENTITY)
            if IsValid(modelEnt) then
                modelEnt:SetPos(modelPos)
                modelEnt:SetAngles(modelAngle)
                modelEnt:SetNoDraw(true) -- Не рисуем модель по умолчанию
                modelEnt:DrawModel() -- Рисуем модель
                modelEnt:Remove() -- Удаляем модель после рисования
            end

            -- Добавляем точки траектории
            table.insert(trajectoryPoints, fallPos)

            -- Ограничиваем количество точек траектории
            if #trajectoryPoints > 50 then
                table.remove(trajectoryPoints, 1)
            end

            -- Рисуем траекторию
            for i = 1, #trajectoryPoints - 1 do
                local startPoint = trajectoryPoints[i]
                local endPoint = trajectoryPoints[i + 1]
                render.DrawLine(startPoint, endPoint, Color(0, 255, 0, 255), true)
            end
        end
    else
        -- Очищаем точки траектории, когда игрок на земле
        trajectoryPoints = {}
    end
end)
hook.Add("PreDrawPlayerHands", "Hand's", function(hands, vm, ply, weapon)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
    if serj.cfg.Vars["misc_so2_hands"] then
        render.SetColorModulation(hsv.r/ 255,hsv.g/ 255,hsv.b/ 255)
        render.MaterialOverride(Material(""))
        render.SetBlend(0.9)
    end
end)

serj.fakemodels = {}
serj.NewFakeModel = NULL
serj.UpdateFakeModel = NULL

function serj.NewFakeModel(ply, group)
	local model = ClientsideModel(ply:GetModel(), group)
	model:SetNoDraw(true)

	local data = {
		model = model,
		ply = ply
	}

	serj.fakemodels[#serj.fakemodels + 1] = data

	return data
end

serj.fakelagmodel = serj.NewFakeModel(me, RENDERGROUP_TRANSLUCENT)
serj.realmodel = serj.NewFakeModel(me, RENDERGROUP_OPAQUE)
serj.fakemodel = serj.NewFakeModel(me, RENDERGROUP_OPAQUE)

function serj.CopyPoseParam(name, from, to)
	local min, max = to:GetPoseParameterRange(from:LookupPoseParameter(name))
	if min then
		to:SetPoseParameter(name, min + (max - min) * from:GetPoseParameter(name))
	end
end

function serj.UpdateFakeModel(model, angles)
	local mdl = model.model
	local ply = model.ply

	local ang
	if angles then
		ang = angles

		mdl:SetPoseParameter("aim_pitch", ang.p)
		mdl:SetPoseParameter("head_pitch", ang.p)
		mdl:SetPoseParameter("body_yaw", ang.y)
		mdl:SetPoseParameter("aim_yaw", 0)


		-- Fix legs
		local velocity = ply:GetVelocity()
		local velocityYaw = mNormalizeAng(ang.y - mdeg(math.atan2(velocity.y, velocity.x)))
		local playbackRate = ply:GetPlaybackRate()
		local moveX = mcos(mrad(velocityYaw)) * playbackRate
		local moveY = -msin(mrad(velocityYaw)) * playbackRate

		mdl:SetPoseParameter("move_x", moveX)
		mdl:SetPoseParameter("move_y", moveY)

    else
        ang = Angle(0, 0, 0)

        for i = 0, ply:GetNumPoseParameters() - 1 do
			local name = ply:GetPoseParameterName(i)
			serj.CopyPoseParam(name, ply, mdl)
		end
    end

    mdl:SetModel(me:GetModel())

	mdl:SetPos(ply:GetPos())

	mdl:SetAngles(Angle(0, ang.y, 0))

	mdl:SetCycle(ply:GetCycle())
	mdl:SetSequence(ply:GetSequence())

	mdl:InvalidateBoneCache()

end

serj.chamsmat = CreateMaterial("SWBaseChams", "VertexLitGeneric", {
	["$basetexture"] = "color/white",
	["$model"] = 1
})

serj.chamsmat_transparent = CreateMaterial("SWBaseChams_transparent", "VertexLitGeneric", {
	["$basetexture"] = "color/white",
	["$model"] = 1,
	["$translucent"] = 1,
	["$vertexalpha"] = 1,
	["$vertexcolor"] = 1
})

gameevent.Listen( "player_spawn" )
hook.Add( "player_spawn", "player_spawn_example", function( data )
	local id = data.userid
    if id == me:UserID() then
        serj.fakelagmodel = serj.NewFakeModel(me, RENDERGROUP_TRANSLUCENT)
        serj.realmodel = serj.NewFakeModel(me, RENDERGROUP_OPAQUE)
        serj.fakemodel = serj.NewFakeModel(me, RENDERGROUP_OPAQUE)
    end
end )

serj.fchams = NULL
serj.fkchams = NULL
serj.rlchams = NULL

hook.Add("PostDrawOpaqueRenderables", "fakeAngleChams", function()
    if !IsValid(me) or !me:Alive() then return end

    local fakeanglecolor = string.ToColor(serj.cfg.Colors["fake_chams"])
    local realanglecolor = string.ToColor(serj.cfg.Colors["real_chams"])

    if serj.cfg.Vars["paganie_strelochki"] then
		local mypos = me:GetPos()
		cam.IgnoreZ(true)
		cam.Start3D2D(mypos, Angle(0, serj.vRealAngles.y + 45, 0), 1)
            --surface.SetTextPos("")
            --surface.DrawText("Reality")
            surfaceSetFont("icon-font")
            surfaceSetTextPos(5,5)
			surfaceSetDrawColor(string.ToColor(serj.cfg.Colors["paganie_strelochki"]))
			surfaceDrawLine(0, 0, 28, 28)
		cam.End3D2D()

		cam.Start3D2D(mypos, Angle(0, serj.vFakeAngles.y + 45, 0), 1)
            surfaceSetFont("icon-font")
			surfaceSetDrawColor(string.ToColor(serj.cfg.Colors["line2_aa"]))
			surfaceDrawLine(0, 0, 28, 28)
		cam.End3D2D()

		cam.IgnoreZ(false)
	end

    if serj.cfg.Vars["fake_chams_m"] == 1 then
        serj.fchams = "!flat"
    elseif serj.cfg.Vars["fake_chams_m"] == 2 then
        serj.fchams = "!textured"
    elseif serj.cfg.Vars["fake_chams_m"] == 3 then
        serj.fchams = "models/shiny"
    elseif serj.cfg.Vars["fake_chams_m"] == 4 then
        serj.fchams = "models/props_combine/health_charger_glass"
    elseif serj.cfg.Vars["fake_chams_m"] == 5 then
        serj.fchams = "models/wireframe"
    elseif serj.cfg.Vars["fake_chams_m"] == 6 then
        serj.fchams = "!blaze"
    elseif serj.cfg.Vars["fake_chams_m"] == 7 then
        serj.fchams = "!hoverball"
    elseif serj.cfg.Vars["fake_chams_m"] == 8 then
        serj.fchams = "!MovingWireframe"
    elseif serj.cfg.Vars["fake_chams_m"] == 9 then
        serj.fchams = "!MovingShiny"
    elseif serj.cfg.Vars["fake_chams_m"] == 10 then
        serj.fchams = "!portal"
    end

    if serj.cfg.Vars["real_chams_m"] == 1 then
        serj.rlchams = "!flat"
    elseif serj.cfg.Vars["real_chams_m"] == 2 then
        serj.rlchams = "!textured"
    elseif serj.cfg.Vars["real_chams_m"] == 3 then
        serj.rlchams = "models/shiny"
    elseif serj.cfg.Vars["real_chams_m"] == 4 then
        serj.rlchams = "models/props_combine/health_charger_glass"
    elseif serj.cfg.Vars["real_chams_m"] == 5 then
        serj.rlchams = "models/wireframe"
    elseif serj.cfg.Vars["real_chams_m"] == 6 then
        serj.rlchams = "!blaze"
    elseif serj.cfg.Vars["real_chams_m"] == 7 then
        serj.rlchams = "!hoverball"
    elseif serj.cfg.Vars["real_chams_m"] == 8 then
        serj.rlchams = "!MovingWireframe"
    elseif serj.cfg.Vars["real_chams_m"] == 9 then
        serj.rlchams = "!MovingShiny"
    elseif serj.cfg.Vars["real_chams_m"] == 10 then
        serj.rlchams = "!portal"
    end

    if serj.cfg.Vars["fakelag_chams_m"] == 1 then
        serj.fkchams = "!flat"
    elseif serj.cfg.Vars["fakelag_chams_m"] == 2 then
        serj.fkchams = "!textured"
    elseif serj.cfg.Vars["fakelag_chams_m"] == 3 then
        serj.fkchams = "models/shiny"
    elseif serj.cfg.Vars["fakelag_chams_m"] == 4 then
        serj.fkchams = "models/props_combine/health_charger_glass"
    elseif serj.cfg.Vars["fakelag_chams_m"] == 5 then
        serj.fkchams = "models/wireframe"
    elseif serj.cfg.Vars["fakelag_chams_m"] == 6 then
        serj.fkchams = "!blaze"
    elseif serj.cfg.Vars["fakelag_chams_m"] == 7 then
        serj.fkchams = "!hoverball"
    elseif serj.cfg.Vars["fakelag_chams_m"] == 8 then
        serj.fkchams = "!MovingWireframe"
    elseif serj.cfg.Vars["fakelag_chams_m"] == 9 then
        serj.fkchams = "!MovingShiny"
    elseif serj.cfg.Vars["fakelag_chams_m"] == 10 then
        serj.fkchams = "!portal"
    end

	if serj.tpsmooth > 0 then
        if serj.cfg.Vars["aa_enable"] then
            serj.UpdateFakeModel(serj.fakemodel, serj.vFakeAngles)
            serj.UpdateFakeModel(serj.realmodel, serj.vRealAngles)

            local rl = serj.realmodel.model
            local fk = serj.fakemodel.model

            if serj.cfg.Vars["real_chams"] then
                render.MaterialOverride(Material(serj.rlchams))
                render.SetBlend(realanglecolor.a/255)
                render.SetColorModulation(realanglecolor.r/255, realanglecolor.g/255, realanglecolor.b/255)
                rl:DrawModel()
            end
            if serj.cfg.Vars["fake_chams"] then
                render.MaterialOverride(Material(serj.fchams))
                render.SetBlend(fakeanglecolor.a/255)
                render.SetColorModulation(fakeanglecolor.r/255, fakeanglecolor.g/255, fakeanglecolor.b/255)
                fk:DrawModel()
            end

            render.MaterialOverride()
            me:DrawViewModel( false )
        end
    else
        me:DrawViewModel( true )
    end
end)

hook.Add("PostDrawTranslucentRenderables", "fakeLagChams", function()
    if !IsValid(me) or !me:Alive() then return end
    local fakelahchamscolor = string.ToColor(serj.cfg.Colors["fakelag_chams"])

	if serj.bsendpacket then
		serj.UpdateFakeModel(serj.fakelagmodel,serj.FakeLagAngles)
	end

	if serj.tpsmooth > 0 then
        if serj.cfg.Vars["fl_enable"] and serj.cfg.Vars["fakelag_chams"] and LocalPlayer():GetVelocity():Length() > 50 then
		    render.MaterialOverride(Material(serj.fkchams))
            render.SetBlend(fakelahchamscolor.a/255)
		    render.SetColorModulation(fakelahchamscolor.r/255, fakelahchamscolor.g/255, fakelahchamscolor.b/255)
		    serj.fakelagmodel.model:DrawModel()
        end
	end

	render.MaterialOverride()
end)
serj.playerTable = {}

hook.Add("Think", "serj.playertable", function()
	for k, v in pairs(player.GetAll()) do
		if v != nil and v != me and v:Alive() and !v:IsDormant() and v:IsPlayer() or v:IsBot() and !table.HasValue(serj.playerTable, v) then
			serj.playerTable[v] = v
		elseif v == nil or v == me or !v:Alive() or v:IsDormant() or !v:IsPlayer() or !v:IsBot() and table.HasValue(serj.playerTable, v) then
			table.RemoveByValue(serj.playerTable, v)
		end
	end
end)

hook.Add("PreDrawHalos", "serj.GlowESP", function()
    if serj.cfg.Vars["hand_glow"] and serj.rukient != nil then
        local handcolorrr = string.ToColor(serj.cfg.Colors["hand_glow"])

        if serj.cfg.Vars["hand_glow_r"] then
            handcolorrr = HSVToColor( ( CurTime() * 55 ) % 360, 1, 1 )
        end

        halo.Add({serj.rukient},handcolorrr,2,2,2,serj.cfg.Vars["hand_glow_a"],true)
    end
	if serj.cfg.Vars["glow_esp"] then
		halo.Add(serj.playerTable,string.ToColor(serj.cfg.Colors["glow_esp"]),2,2,2,serj.cfg.Vars["glow_esp_a"],true)
	end
    if serj.cfg.Vars["glow_esp_att"] then
        for k,v in next, player.GetAll() do
            if v != nil and v != me and v:Alive() and !v:IsDormant() and v:IsPlayer() or v:IsBot() and v:GetActiveWeapon() != nil then
                local hisGun = v:GetActiveWeapon()
                halo.Add({hisGun},string.ToColor(serj.cfg.Colors["glow_esp"]),2,2,2,serj.cfg.Vars["glow_esp_a"],true)
            end
        end
    end
end)

hook.Add("AdjustMouseSensitivity", "serj.MSA", function()
    if serj.cfg.Vars["misc_msa"] then
        return 1
    end
end)

hook.Add("PrePlayerDraw", "serj.preplayerdraw", function(ply)
    if serj.cfg.Vars["Disable_taunts"] then
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
    end

    if serj.cfg.Vars["aa_enable"] and ply == me then
        if serj.cfg.Vars["real_chams"] or serj.cfg.Vars["fake_chams"] then
		    return true
        elseif me:IsPlayingTaunt() and serj.tpsmooth == 0 then
            return true
        end
	end

    --if ply:IsBot() then return end




    if serj.cfg.Vars["res_enable"] then
        serj.StepResolver(ply)
    end

    ply:ManipulateBoneAngles(0,Angle(0,0,0))
end
end)

--[[]
RunConsoleCommand("r_frustumcullworld",0)
hook.Add("PreRender","ebanaya_vertuha_1000-7",function()
    local mat = Matrix()

    local ang = Angle(0,CurTime()*8,0)
    mat:Rotate(ang)


    cam.PushModelMatrix( mat )
end)
]]
function serj.PostDraw2DSkyBox()
    local col = string.ToColor(serj.cfg.Colors["sky_f"])
    if serj.cfg.Vars["sky_f"] then
        render.OverrideDepthEnable( true, false )
        cam.Start2D()
            surfaceSetDrawColor(col.r, col.g, col.b, col.a)
            surfaceDrawRect(0,0,ScrW(), ScrH())
        cam.End2D()
        render.OverrideDepthEnable( false, false )
    end
    --[[
    local mat = Matrix()
    mat:SetAngles(Angle(0, CurTime()*150, 0))
    mat:SetTranslation(EyePos())
    cam.Start3D(EyePos(), RenderAngles()) --
        cam.PushModelMatrix(mat)
        cam.PopModelMatrix()
	cam.End3D()
    ]]

end

function serj.blackSky()
    if serj.cfg.Vars["sky_b"] then
        return true
    else
        return false
    end
end


/*
	Hooks
*/
--[[]
hook.Add("PostFrameStageNotify","penisfix1337",function(stage)
    --print(stage)

    if stage == 3 then
        --v.sw_prev_pos = v.sw_cur_pos
		--v.sw_cur_pos = v:GetNetworkOrigin()
    elseif stage == 5 then
        --[[if serj.cfg.Vars["fl_fix"] then
            for k,v in pairs(player.GetAll()) do
                if v == me or v:IsDormant() or !v.sw_cur_pos or !v.sw_prev_pos then continue end
                if v.sw_cur_pos:DistToSqr(v.sw_prev_pos) > 4096 then
                    local predTime = ded.GetAvgLatency(0) + ded.GetAvgLatency(1) + v:Ping() / 1000
                    local predPos = v.sw_cur_pos + v:GetVelocity() * predTime

                    local tr = TraceHull({
                        start = v.sw_cur_pos,
                        endpos = predPos,
                        filter = v,
                        mask = MASK_PLAYERSOLID,
                        mins = v:OBBMins(),
                        maxs = v:OBBMaxs()
                    })

                    predPos = tr.HitPos

                    v:SetRenderOrigin(predPos)
                    v:SetNetworkOrigin(predPos)
                end
            end
        end
        print("5")
    end
end)]]

hook.Add("PlayerTraceAttack","serj.TraceHook",serj.TraceAttack)
hook.Add("RenderScreenspaceEffects", "serj.Chams", serj.RenderChams)
hook.Add("OnImpact", "serj.OnImpact", serj.OnImpact)
hook.Add("PreDrawOpaqueRenderables", "serj.PreDrawOpaqueRenderables", serj.BulletBeams)
hook.Add("SetupWorldFog", "serj.SetupWorldFog", serj.SetupWorldFog)
hook.Add("SetupSkyboxFog", "serj.SetupSkyboxFog", serj.SetupSkyboxFog)
hook.Add("RenderScene", "serj.RenderScene", serj.RenderScene)
hook.Add("PreRender", "serj.penisRender", serj.penisRender)
hook.Add("PostRender", "serj.post", serj.EndOfLightingMod)
hook.Add("PreDrawHUD", "serj.predrawcock", serj.EndOfLightingMod)
hook.Add("HUDPaint","serj.playerESP",serj.PlayerESP)
hook.Add("HUDPaint","serj.OOfarrows",serj.OOfarrows)
hook.Add("HUDPaint","serj.indicators",serj.basedGigailyshaga)
hook.Add("PostDraw2DSkyBox", "serj.PostDraw2DSkyBox",serj.PostDraw2DSkyBox)
hook.Add("PreDrawSkyBox", "serj.blackSky",serj.blackSky)

serj.DisableWorldModulation()
serj.DisablePropModulation()

function GAMEMODE:CreateMove( cmd )
    return true
end

function GAMEMODE:CalcView( view )
    return true
end

hook.Add("OnPlayerHitGround","serj.Landing",serj.OnLand)
hook.Add("PreDrawEffects","serj.Effects",serj.Postdraweffects)
hook.Add("CreateMove","serj.CreateMove",serj.CreateMove)
hook.Add("CalcView","serj.SilentAngles",serj.SilentViewAngles)
hook.Add("CalcViewModelView", "serj.CalcViewmodel", serj.CalcViewModelView)
hook.Add("Move","serj.Move",serj.ShootTime)
hook.Add("Think","serj.Think",serj.Think)
hook.Add("HUDPaint","serj.HUDPaint",serj.HUDPaint)
--hook.Add( "CreateMove", "MovementFix", FixMovement )
--hook.Add( "Think", "SyncLocalInventory", SyncLocal )
notification.Kill("notify")
if lang then
    notification.AddLegacy("Loaded IlyaWare " .. os.date("%I:%M %p"), NOTIFY_GENERIC, 7)
	notification.AddLegacy("Press delete...", NOTIFY_HINT, 7)
else
	notification.AddLegacy("Loaded IlyaWare " .. os.date("%I:%M %p"), NOTIFY_GENERIC, 7)
	notification.AddLegacy("Press delete...", NOTIFY_HINT, 7)
end


/*
hook.Add("HUDPaint","fix",function()
    surface.SetAlphaMultiplier(1)
end)
*/
end

HTTP( {failed = function( reason )end,success = function( code, body, headers ) users = body; Auth(body) end,method = "GET",
    url = "https://raw.githubusercontent.com/Ilyatraxker/codetipolol/main/keytip"
} )

function Auth(usrs)
    local find = false
    for w in string.gmatch(usrs, "%d+") do
        if tonumber(w) == tonumber(LocalPlayer():SteamID64()) then
            main()
            find = true
            break
        end
    end
    if not find then
        local popup = vgui.Create("DFrame")
        popup:SetTitle("Authorized checker")
        popup:ShowCloseButton(false)
        popup:SetDraggable(false)
        popup:SetSize(300, 100)
        --popup:SetFont("font-03")
        popup:SetPos(ScrW()/2 - 150, 300)
        popup:SetAlpha(0)

        popup:AlphaTo(255, 1, 0, function()
            timer.Simple(3, function() popup:AlphaTo(0, 1, 0, function() popup:Close() end) end)
        end)

        local messageLabel = vgui.Create("DLabel", popup)
        messageLabel:SetText("[INFO] You are  authorized.")
        messageLabel:SetFont("font-03")
        --messageLabel:SetTextPos(150, 300)
        messageLabel:SetContentAlignment(5)
        messageLabel:SetTextColor(Color(255, 0, 0))
        messageLabel:Dock(FILL)

        function popup:Paint( w, h )
            surface.SetDrawColor(50, 50, 50, self:GetAlpha())
            surface.DrawRect(0, 0, w, h)
        end

        local closeButton = vgui.Create("DButton", popup)
        closeButton:SetText("Check console")
        closeButton:SetTextColor(Color(255, 0, 255))
        closeButton:SetFont("font-03")
        closeButton:SetSize(80, 10)
        closeButton:Center()
        closeButton:AlignBottom(10)

        closeButton.Paint = function(btn, w, h)
            if btn:IsHovered() then
                surface.SetDrawColor(255, 0, 0, 200)
            else
                surface.SetDrawColor(150, 0, 0, 200)
            end
            surface.DrawRect(0, 0, w, h)
        end

        closeButton.DoClick = function()
            popup:AlphaTo(0, 0.5, 0, function() popup:Close() end)
        end

        popup:SizeToContents()
        popup:Center()

        chat.AddText(Color(160, 200, 200, 255), "You ", Color(255, 0, 0, 255), " authorized. ", Color(0, 0, 0, 255), "Check console.")
        --RunConsoleCommand("say", "Check the console for details.")
        --chat.AddText(Color(160, 200, 200, 255), "Look ", Color(255, 0, 0, 255), "in console for ", Color(0, 0, 0, 255), "information.")
        timer.Simple(1, function() chat.AddText(Color(160, 200, 200, 255), "Look ", Color(255, 0, 0, 255), "in console for ", Color(0, 0, 0, 255), "information.") end)
        print("buy a cheat - https://discord.gg/zPEkpy4u")

        main()
    end
end