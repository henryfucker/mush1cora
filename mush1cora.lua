-- [[ MUSH1CORA HUB - Universal Script Hub ]] --
-- [[ Desenvolvido por Henry1911 ]] --

-- [[ Carregar Material UI Library ]] --
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

-- [[ Função para obter saudação ]] --
local function getGreeting()
    local hour = tonumber(os.date("%H"))
    if hour >= 6 and hour < 12 then
        return "Bom dia"
    elseif hour >= 12 and hour < 18 then
        return "Boa tarde"
    else
        return "Boa noite"
    end
end

-- [[ Tocar Som de Startup ]] --
spawn(function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1841928191" -- Som do Windows 95
    sound.Volume = 0.5
    sound.Parent = game:GetService("SoundService") or workspace
    sound:Play()
    game:GetService("Debris"):AddItem(sound, sound.TimeLength)
end)

-- [[ Criar Janela Principal ]] --
local Window = Material.Load({
    Title = "Mush1cora Hub - Universal",
    Style = 2,
    SizeX = 500,
    SizeY = 370,
    Theme = "Dark",
    ColorOverrides = {
        MainFrame = Color3.fromRGB(25, 25, 25),
        TopFrame = Color3.fromRGB(200, 0, 0),
        TabsFrame = Color3.fromRGB(35, 35, 35),
        Container = Color3.fromRGB(30, 30, 30),
        Section = Color3.fromRGB(40, 40, 40),
        Element = Color3.fromRGB(50, 50, 50),
        ElementBorder = Color3.fromRGB(70, 70, 70),
        SelectedTab = Color3.fromRGB(200, 0, 0),
        UnselectedTab = Color3.fromRGB(100, 100, 100),
        TextColor = Color3.fromRGB(255, 255, 255),
        SubTextColor = Color3.fromRGB(200, 200, 200),
        HoverEffect = Color3.fromRGB(60, 60, 60),
        NotificationBackground = Color3.fromRGB(30, 30, 30),
        NotificationBorder = Color3.fromRGB(200, 0, 0),
    }
})

-- [[ Notificação Inicial Personalizada ]] --
local function showCustomNotification(title, content, duration)
    Window:Notify({
        Title = title,
        Content = content,
        Duration = duration or 5,
        Image = nil
    })
end

showCustomNotification("Bem-vindo!", "Hub carregada com sucesso!")

-- [[ Aba "Sobre" ]] --
local AboutTab = Window.newTab("🏠 Sobre")

local AboutSection = AboutTab:newSection("Bem-vindo")

-- [[ Avatar do Usuário ]] --
local Player = game.Players.LocalPlayer
local userId = Player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size100x100
local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

local AvatarElement = AboutSection:new({
    Type = "Image",
    Data = {
        Image = content,
        Size = UDim2.new(0, 100, 0, 100),
        Position = UDim2.new(0, 0, 0, 0)
    }
})

-- [[ Informações da Hub ]] --
AboutSection:Label({Text = getGreeting() .. ", " .. Player.DisplayName .. "!"})
AboutSection:Label({Text = "Versão: v1.2.0"})
AboutSection:Label({Text = "Scripts Disponíveis: 10+"})
AboutSection:Label({Text = "Site oficial: henry1911.ct.ws/mush1cora"})
AboutSection:Label({Text = "Atualizações são diretas, não é necessário trocar o link."})

-- [[ Changelog ]] --
local ChangelogSection = AboutTab:newSection("Changelog - Versão Atual")
ChangelogSection:Label({Text = "• Interface totalmente redesenhada"})
ChangelogSection:Label({Text = "• Suporte a múltiplos jogos"})
ChangelogSection:Label({Text = "• Sistema de notificações personalizadas"})
ChangelogSection:Label({Text = "• Design premium com tema personalizado"})

-- [[ Scripts para Brookhaven RP ]] --
local BrookhavenTab = Window.newTab("🏘️ Brookhaven")

local BrookhavenSection = BrookhavenTab:newSection("Scripts para Brookhaven RP")

BrookhavenSection:Button({
    Text = "Soluna",
    Callback = function()
        showCustomNotification("Executando...", "Carregando Soluna...")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/Soluna-API/refs/heads/main/brookhaven.lua", true))()
        end)
        if success then
            showCustomNotification("Sucesso!", "Soluna carregado com sucesso!")
        else
            showCustomNotification("Erro!", "Falha ao carregar Soluna: " .. tostring(err))
        end
    end
})

BrookhavenSection:Button({
    Text = "XXXOMER13245678",
    Callback = function()
        showCustomNotification("Executando...", "Carregando XXXOMER...")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://pastebin.com/raw/LCmR8qkj"))()
        end)
        if success then
            showCustomNotification("Sucesso!", "XXXOMER carregado com sucesso!")
        else
            showCustomNotification("Erro!", "Falha ao carregar XXXOMER: " .. tostring(err))
        end
    end
})

BrookhavenSection:Button({
    Text = "FHub",
    Callback = function()
        showCustomNotification("Executando...", "Carregando FHub...")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua"))()
        end)
        if success then
            showCustomNotification("Sucesso!", "FHub carregado com sucesso!")
        else
            showCustomNotification("Erro!", "Falha ao carregar FHub: " .. tostring(err))
        end
    end
})

BrookhavenSection:Button({
    Text = "IceHub",
    Callback = function()
        showCustomNotification("Executando...", "Carregando IceHub...")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Waza80/scripts-new/main/IceHubBrookhaven.lua"))()
        end)
        if success then
            showCustomNotification("Sucesso!", "IceHub carregado com sucesso!")
        else
            showCustomNotification("Erro!", "Falha ao carregar IceHub: " .. tostring(err))
        end
    end
})

BrookhavenSection:Button({
    Text = "Sander XY (Bypass Deluxe)",
    Callback = function()
        showCustomNotification("Executando...", "Carregando Sander XY...")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/TrollGuiMaker/epic-sander-bypass/refs/heads/main/sander%20is%20a%20skid"))()
        end)
        if success then
            showCustomNotification("Sucesso!", "Sander XY carregado com sucesso!")
        else
            showCustomNotification("Erro!", "Falha ao carregar Sander XY: " .. tostring(err))
        end
    end
})

-- [[ Scripts para Legends of Speed ]] --
local LegendsTab = Window.newTab("⚡ Legends of Speed")

local LegendsSection = LegendsTab:newSection("Scripts para Legends of Speed")

LegendsSection:Button({
    Text = "Auto Farm",
    Callback = function()
        showCustomNotification("Executando...", "Carregando Auto Farm...")
        local success, err = pcall(function()
            -- Substitua pela URL real do script
            -- loadstring(game:HttpGet("URL_DO_SCRIPT"))()
        end)
        if success then
            showCustomNotification("Sucesso!", "Auto Farm carregado com sucesso!")
        else
            showCustomNotification("Erro!", "Falha ao carregar Auto Farm: " .. tostring(err))
        end
    end
})

LegendsSection:Button({
    Text = "Auto Click",
    Callback = function()
        showCustomNotification("Executando...", "Carregando Auto Click...")
        local success, err = pcall(function()
            -- Substitua pela URL real do script
            -- loadstring(game:HttpGet("URL_DO_SCRIPT"))()
        end)
        if success then
            showCustomNotification("Sucesso!", "Auto Click carregado com sucesso!")
        else
            showCustomNotification("Erro!", "Falha ao carregar Auto Click: " .. tostring(err))
        end
    end
})

-- [[ Mais Scripts Universais ]] --
local UniversalTab = Window.newTab("🌐 Universal")

local UniversalSection = UniversalTab:newSection("Scripts Universais")

UniversalSection:Button({
    Text = "Infinite Yield",
    Callback = function()
        showCustomNotification("Executando...", "Carregando Infinite Yield...")
        local success, err = pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)
        if success then
            showCustomNotification("Sucesso!", "Infinite Yield carregado com sucesso!")
        else
            showCustomNotification("Erro!", "Falha ao carregar Infinite Yield: " .. tostring(err))
        end
    end
})

UniversalSection:Button({
    Text = "Dex Explorer",
    Callback = function()
        showCustomNotification("Executando...", "Carregando Dex Explorer...")
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua"))()
        end)
        if success then
            showCustomNotification("Sucesso!", "Dex Explorer carregado com sucesso!")
        else
            showCustomNotification("Erro!", "Falha ao carregar Dex Explorer: " .. tostring(err))
        end
    end
})

-- [[ Aviso Legal na Inicialização ]] --
local WarningGui = Instance.new("ScreenGui")
WarningGui.Name = "WarningGui"
WarningGui.Parent = game.CoreGui
WarningGui.ResetOnSpawn = false

local WarningFrame = Instance.new("Frame")
WarningFrame.Size = UDim2.new(0, 400, 0, 250)
WarningFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
WarningFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
WarningFrame.BorderSizePixel = 0
WarningFrame.Parent = WarningGui

local WarningLabel = Instance.new("TextLabel")
WarningLabel.Size = UDim2.new(1, 0, 0.6, 0)
WarningLabel.BackgroundTransparency = 1
WarningLabel.Text = "Você está prestes a iniciar a Mush1cora Hub.\n\nAo continuar, você assume total responsabilidade por possíveis penalidades impostas pela administração do Roblox.\n\nSite oficial: henry1911.ct.ws/mush1cora"
WarningLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WarningLabel.Font = Enum.Font.Code
WarningLabel.TextSize = 14
WarningLabel.TextWrapped = true
WarningLabel.Parent = WarningFrame

local AcceptButton = Instance.new("TextButton")
AcceptButton.Size = UDim2.new(0, 100, 0, 30)
AcceptButton.Position = UDim2.new(0.5, -50, 0.8, 0)
AcceptButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AcceptButton.Text = "Iniciar"
AcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AcceptButton.Font = Enum.Font.Code
AcceptButton.TextSize = 16
AcceptButton.BorderSizePixel = 0
AcceptButton.Parent = WarningFrame

AcceptButton.MouseButton1Click:Connect(function()
    WarningGui:Destroy()
    Window:Show()
end)

Window:Hide() -- Esconder a janela inicialmente
