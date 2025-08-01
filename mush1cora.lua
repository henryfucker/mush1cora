--[[
  Mush1cora Hub Premium - Brookhaven RP
  Versão 2.0 - UI Premium Completa
  Desenvolvido por Henry1911
]]--

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")

-- Carregar Fluent UI
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

-- Configurações da UI
local UI = Fluent:Create({
    Title = "Mush1cora Hub Premium",
    SubTitle = "Brookhaven RP",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

-- Funções úteis
local function getGreeting()
    local hour = tonumber(os.date("%H"))
    if hour >= 6 and hour < 12 then
        return "Bom dia"
    elseif hour >= 12 and < 18 then
        return "Boa tarde"
    else
        return "Boa noite"
    end
end

local function playSound(id, volume)
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://"..tostring(id)
    sound.Volume = volume or 0.5
    sound.Parent = SoundService
    sound:Play()
    game:GetService("Debris"):AddItem(sound, sound.TimeLength)
end

-- Tela de boas-vindas
local WelcomeScreen = Instance.new("ScreenGui")
WelcomeScreen.Name = "Mush1coraWelcome"
WelcomeScreen.Parent = game.CoreGui
WelcomeScreen.ResetOnSpawn = false

local WelcomeFrame = Instance.new("Frame")
WelcomeFrame.Size = UDim2.new(0, 400, 0, 300)
WelcomeFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
WelcomeFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
WelcomeFrame.BorderSizePixel = 0
WelcomeFrame.ClipsDescendants = true
WelcomeFrame.Parent = WelcomeScreen

local Corner = Instance.new("UICorner")
Corner.CornerRadius = UDim.new(0, 8)
Corner.Parent = WelcomeFrame

local Logo = Instance.new("ImageLabel")
Logo.Size = UDim2.new(0, 120, 0, 120)
Logo.Position = UDim2.new(0.5, -60, 0.2, -60)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://14226499062" -- Substitua por um ID de imagem válido
Logo.Parent = WelcomeFrame

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Position = UDim2.new(0, 0, 0.5, 0)
Title.BackgroundTransparency = 1
Title.Text = "MUSH1CORA HUB PREMIUM"
Title.TextColor3 = Color3.fromRGB(255, 50, 50)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 24
Title.Parent = WelcomeFrame

local SubTitle = Instance.new("TextLabel")
SubTitle.Size = UDim2.new(1, 0, 0, 20)
SubTitle.Position = UDim2.new(0, 0, 0.6, 0)
SubTitle.BackgroundTransparency = 1
SubTitle.Text = "Brookhaven RP • v2.0"
SubTitle.TextColor3 = Color3.fromRGB(200, 200, 200)
SubTitle.Font = Enum.Font.Gotham
SubTitle.TextSize = 14
SubTitle.Parent = WelcomeFrame

local StartButton = Instance.new("TextButton")
StartButton.Size = UDim2.new(0, 180, 0, 40)
StartButton.Position = UDim2.new(0.5, -90, 0.8, -20)
StartButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
StartButton.Text = "INICIAR EXPERIÊNCIA"
StartButton.TextColor3 = Color3.white
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 16
StartButton.Parent = WelcomeFrame

local CornerBtn = Instance.new("UICorner")
CornerBtn.CornerRadius = UDim.new(0, 6)
CornerBtn.Parent = StartButton

-- Animação de entrada
playSound(1841928191, 0.3) -- Som de inicialização

for i = 0, 1, 0.1 do
    WelcomeFrame.BackgroundTransparency = 1 - i
    wait(0.02)
end

-- Main UI
local Options = Fluent.Options

do -- Main Window
    Fluent:Notify({
        Title = "Bem-vindo!",
        Content = string.format("%s, %s! A Mush1cora Hub foi carregada com sucesso!", getGreeting(), Player.Name),
        Duration = 5
    })

    -- Tabs
    local HomeTab = UI:AddTab({
        Title = "Início",
        Icon = "home"
    })

    local ScriptsTab = UI:AddTab({
        Title = "Scripts",
        Icon = "code"
    })

    local PlayerTab = UI:AddTab({
        Title = "Jogador",
        Icon = "user"
    })

    local SettingsTab = UI:AddTab({
        Title = "Configurações",
        Icon = "settings"
    })

    -- Home Tab
    do
        HomeTab:AddParagraph({
            Title = "🌟 Mush1cora Hub Premium",
            Content = "A hub mais avançada para Brookhaven RP, com scripts premium e interface moderna."
        })

        local HomeSection = HomeTab:AddSection("Informações")

        HomeTab:AddLabel("👋 "..getGreeting()..", "..Player.DisplayName.."!")
        HomeTab:AddLabel("📅 Data: "..os.date("%d/%m/%Y"))
        HomeTab:AddLabel("🕒 Hora: "..os.date("%H:%M"))
        HomeTab:AddLabel("🎮 Jogo: Brookhaven RP")

        local StatsSection = HomeTab:AddSection("Estatísticas")

        local PlayersLabel = StatsSection:AddLabel("👥 Jogadores: "..#Players:GetPlayers())
        Players:PlayerAdded:Connect(function()
            PlayersLabel:SetText("👥 Jogadores: "..#Players:GetPlayers())
        end)

        Players:PlayerRemoving:Connect(function()
            PlayersLabel:SetText("👥 Jogadores: "..#Players:GetPlayers())
        end)

        HomeTab:AddButton({
            Title = "Copiar link de invite",
            Description = "Convide seus amigos para o jogo",
            Callback = function()
                setclipboard("https://www.roblox.com/games/4924922222/Brookhaven-RP")
                Fluent:Notify({
                    Title = "Sucesso",
                    Content = "Link copiado para a área de transferência!",
                    Duration = 3
                })
            end
        })
    end

    -- Scripts Tab
    do
        local AutoFarmSection = ScriptsTab:AddSection("Auto Farm")

        AutoFarmSection:AddToggle("AutoMoney", {
            Title = "Coletar Dinheiro Automático",
            Default = false,
            Callback = function(Value)
                if Value then
                    Fluent:Notify({
                        Title = "Auto Farm",
                        Content = "Dinheiro automático ativado!",
                        Duration = 3
                    })
                    -- Aqui viria o código do script
                else
                    Fluent:Notify({
                        Title = "Auto Farm",
                        Content = "Dinheiro automático desativado!",
                        Duration = 3
                    })
                end
            end
        })

        AutoFarmSection:AddToggle("AutoRob", {
            Title = "Roubo Automático",
            Default = false,
            Callback = function(Value)
                -- Código do script
            end
        })

        local TeleportSection = ScriptsTab:AddSection("Teleportes")

        TeleportSection:AddDropdown("Locations", {
            Title = "Locais",
            Values = {"Casa", "Dealership", "Hospital", "Polícia", "Loja"},
            Default = "Casa",
            Callback = function(Value)
                -- Código de teleporte
            end
        })

        local ScriptsSection = ScriptsTab:AddSection("Scripts Premium")

        local scriptsList = {
            {name = "Soluna", desc = "Script completo para Brookhaven", url = "https://raw.githubusercontent.com/Patheticcs/Soluna-API/main/brookhaven.lua"},
            {name = "XXXOMER13245678", desc = "Bypass e funções premium", url = "https://pastebin.com/raw/LCmR8qkj"},
            {name = "FHub", desc = "Farm automático e mais", url = "https://raw.githubusercontent.com/OpenSourceEngine/Script/main/Brookhaven.lua"},
            {name = "IceHub", desc = "Interface moderna com funções", url = "https://raw.githubusercontent.com/Waza80/scripts-new/main/IceHubBrookhaven.lua"},
            {name = "Sander XY", desc = "Bypass Deluxe", url = "https://raw.githubusercontent.com/TrollGuiMaker/epic-sander-bypass/main/sander%20is%20a%20skid"}
        }

        for _, script in pairs(scriptsList) do
            ScriptsSection:AddButton({
                Title = script.name,
                Description = script.desc,
                Callback = function()
                    Fluent:Notify({
                        Title = "Carregando script",
                        Content = "Iniciando "..script.name.."...",
                        Duration = 3
                    })
                    
                    local success, err = pcall(function()
                        loadstring(game:HttpGet(script.url))()
                    end)
                    
                    if success then
                        Fluent:Notify({
                            Title = "Sucesso!",
                            Content = script.name.." carregado com sucesso!",
                            Duration = 5,
                            SubContent = "Aproveite as funções :)"
                        })
                    else
                        Fluent:Notify({
                            Title = "Erro!",
                            Content = "Falha ao carregar "..script.name,
                            Duration = 5,
                            SubContent = tostring(err)
                        })
                    end
                end
            })
        end
    end

    -- Player Tab
    do
        local CharacterSection = PlayerTab:AddSection("Personagem")

        CharacterSection:AddSlider("WalkSpeed", {
            Title = "Velocidade",
            Description = "Ajusta a velocidade de movimento",
            Default = 16,
            Min = 16,
            Max = 100,
            Rounding = 0,
            Callback = function(Value)
                if Player.Character then
                    local humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.WalkSpeed = Value
                    end
                end
            end
        })

        CharacterSection:AddSlider("JumpPower", {
            Title = "Pulo",
            Description = "Ajusta a altura do pulo",
            Default = 50,
            Min = 50,
            Max = 200,
            Rounding = 0,
            Callback = function(Value)
                if Player.Character then
                    local humanoid = Player.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid.JumpPower = Value
                    end
                end
            end
        })

        CharacterSection:AddButton({
            Title = "Resetar Personagem",
            Description = "Teletransporta para o spawn",
            Callback = function()
                if Player.Character then
                    Player.Character:BreakJoints()
                end
            end
        })

        local VisualSection = PlayerTab:AddSection("Visual")

        VisualSection:AddToggle("Esp", {
            Title = "ESP (Ver jogadores)",
            Default = false,
            Callback = function(Value)
                -- Código ESP
            end
        })

        VisualSection:AddToggle("Tracers", {
            Title = "Linhas para jogadores",
            Default = false,
            Callback = function(Value)
                -- Código tracers
            end
        })
    end

    -- Settings Tab
    do
        SettingsTab:AddParagraph({
            Title = "Configurações da UI",
            Content = "Personalize a aparência da Mush1cora Hub"
        })

        local ThemeSection = SettingsTab:AddSection("Tema")

        ThemeSection:AddDropdown("UITheme", {
            Title = "Tema",
            Values = {"Dark", "Light", "Darker", "Aqua", "Amethyst"},
            Default = "Dark",
            Callback = function(Value)
                UI:SetTheme(Value)
            end
        })

        ThemeSection:AddColorpicker("UIColor", {
            Title = "Cor principal",
            Default = Color3.fromRGB(200, 50, 50),
            Callback = function(Value)
                UI:ChangeThemeOption("Accent", Value)
            end
        })

        local ConfigSection = SettingsTab:AddSection("Configurações")

        ConfigSection:AddKeybind("ToggleKeybind", {
            Title = "Tecla para mostrar/esconder",
            Mode = "Toggle", -- Hold, Toggle
            Default = Enum.KeyCode.RightControl,
            Callback = function(Value)
                -- Já é tratado automaticamente pela Fluent
            end
        })

        ConfigSection:AddButton({
            Title = "Salvar configurações",
            Callback = function()
                SaveManager:Save(game.PlaceId)
                Fluent:Notify({
                    Title = "Configurações salvas",
                    Content = "Suas preferências foram salvas!",
                    Duration = 3
                })
            end
        })

        ConfigSection:AddButton({
            Title = "Carregar configurações",
            Callback = function()
                SaveManager:Load(game.PlaceId)
                Fluent:Notify({
                    Title = "Configurações carregadas",
                    Content = "Suas preferências foram aplicadas!",
                    Duration = 3
                })
            end
        })

        -- Sobre
        local AboutSection = SettingsTab:AddSection("Sobre")

        AboutSection:AddLabel("Mush1cora Hub Premium v2.0")
        AboutSection:AddLabel("Desenvolvido por Henry1911")
        AboutSection:AddLabel("Contato: henry1911.ct.ws/mush1cora")

        AboutSection:AddButton({
            Title = "Copiar link de contato",
            Callback = function()
                setclipboard("henry1911.ct.ws/mush1cora")
                Fluent:Notify({
                    Title = "Link copiado",
                    Content = "O link foi copiado para a área de transferência!",
                    Duration = 3
                })
            end
        })
    end
end

-- Fechar tela de boas-vindas ao iniciar
StartButton.MouseButton1Click:Connect(function()
    playSound(142376227, 0.3) -- Som de clique
    
    -- Animação de saída
    local tween = TweenService:Create(
        WelcomeFrame,
        TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        {Position = UDim2.new(0.5, -200, -1, -150)}
    )
    tween:Play()
    
    tween.Completed:Wait()
    WelcomeScreen:Destroy()
    
    -- Mostrar UI principal
    UI:Show()
end)

-- Gerenciador de configurações
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

SaveManager:IgnoreThemeSettings()
SaveManager:SetIgnoreIndexes({"ToggleKeybind"})

InterfaceManager:SetFolder("Mush1coraHub")
SaveManager:SetFolder("Mush1coraHub/brookhaven")

InterfaceManager:BuildInterfaceSection(SettingsTab)
SaveManager:BuildConfigSection(SettingsTab)

-- Carregar configurações
SaveManager:Load(game.PlaceId)
