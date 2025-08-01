-- [[ MUSH1CORA HUB - Brookhaven RP ]] --
-- [[ Desenvolvido por Henry1911 ]] --

-- [[ Carregar Rayfield GUI ]] --
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

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

-- [[ Aviso Legal na Inicialização ]] --
local WarningGui = Instance.new("ScreenGui")
WarningGui.Name = "WarningGui"
WarningGui.Parent = game.CoreGui
WarningGui.ResetOnSpawn = false

local WarningFrame = Instance.new("Frame")
WarningFrame.Size = UDim2.new(0, 400, 0, 250)
WarningFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
WarningFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
WarningFrame.BorderSizePixel = 2
WarningFrame.BorderColor3 = Color3.fromRGB(200, 0, 0)
WarningFrame.Parent = WarningGui

local WarningLabel = Instance.new("TextLabel")
WarningLabel.Size = UDim2.new(1, -20, 0.7, 0)
WarningLabel.Position = UDim2.new(0, 10, 0, 10)
WarningLabel.BackgroundTransparency = 1
WarningLabel.Text = "Você está prestes a iniciar a Mush1cora Hub.\n\nAo continuar, você assume total responsabilidade por possíveis penalidades impostas pela administração do Roblox.\n\nSite oficial: henry1911.ct.ws/mush1cora"
WarningLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WarningLabel.Font = Enum.Font.Code
WarningLabel.TextSize = 14
WarningLabel.TextWrapped = true
WarningLabel.TextYAlignment = Enum.TextYAlignment.Top
WarningLabel.Parent = WarningFrame

local AcceptButton = Instance.new("TextButton")
AcceptButton.Size = UDim2.new(0, 100, 0, 30)
AcceptButton.Position = UDim2.new(0.5, -50, 0.85, 0)
AcceptButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
AcceptButton.Text = "Iniciar"
AcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AcceptButton.Font = Enum.Font.Code
AcceptButton.TextSize = 16
AcceptButton.BorderSizePixel = 0
AcceptButton.Parent = WarningFrame

-- [[ Criar Janela Principal (inicialmente invisível) ]] --
local Window = Rayfield:CreateWindow({
    Name = "Mush1cora Hub - Brookhaven RP",
    LoadingTitle = "Mush1cora Hub",
    LoadingSubtitle = "Carregando interface premium...",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "Mush1coraHub",
        FileName = "Config"
    },
    KeySystem = false
})

Window.Frame.Visible = false

-- [[ Notificação Inicial ]] --
Rayfield:Notify({
    Title = "Bem-vindo!",
    Content = "Mush1cora Hub carregada com sucesso!",
    Duration = 5,
    Image = 4483362458 -- Ícone padrão
})

-- [[ Aba "Sobre" ]] --
local AboutTab = Window:CreateTab("🏠 Sobre", 4483362458)
local AboutSection = AboutTab:CreateSection("Bem-vindo")

-- [[ Avatar do Usuário ]] --
local Player = game.Players.LocalPlayer
local userId = Player.UserId
local thumbType = Enum.ThumbnailType.HeadShot
local thumbSize = Enum.ThumbnailSize.Size100x100
local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Image = content
ImageLabel.BackgroundTransparency = 1
ImageLabel.Parent = AboutSection.Frame

-- [[ Informações da Hub ]] --
AboutTab:CreateLabel("🌟 " .. getGreeting() .. ", " .. Player.DisplayName .. "!")
AboutTab:CreateLabel("📄 Versão: v1.2.0")
AboutTab:CreateLabel("🧰 Scripts Disponíveis: 5")
AboutTab:CreateLabel("🌐 Site oficial: henry1911.ct.ws/mush1cora")
AboutTab:CreateLabel("🔄 Atualizações são diretas, não é necessário trocar o link.")

-- [[ Changelog ]] --
local ChangelogSection = AboutTab:CreateSection("Changelog - Versão Atual")
AboutTab:CreateLabel("• Interface totalmente redesenhada")
AboutTab:CreateLabel("• Foco total em scripts para Brookhaven RP")
AboutTab:CreateLabel("• Sistema de notificações premium")
AboutTab:CreateLabel("• Design vermelho/preto com fonte terminal")

-- [[ Aba de Scripts ]] --
local ScriptsTab = Window:CreateTab("🧰 Scripts", 4483362458)
local ScriptsSection = ScriptsTab:CreateSection("Scripts para Brookhaven RP")

-- [[ Função para criar botão de script com tratamento de erro ]] --
local function createScriptButton(name, url, isRaw)
    ScriptsTab:CreateButton({
        Name = name,
        Callback = function()
            Rayfield:Notify({
                Title = "Executando...",
                Content = "Carregando " .. name .. "...",
                Duration = 3,
                Image = 4483362458
            })
            
            local success, err = pcall(function()
                if isRaw == true then
                    loadstring(game:HttpGet(url, true))()
                else
                    loadstring(game:HttpGet(url))()
                end
            end)
            
            if success then
                Rayfield:Notify({
                    Title = "Sucesso!",
                    Content = name .. " carregado com sucesso!",
                    Duration = 5,
                    Image = 4483362458
                })
            else
                Rayfield:Notify({
                    Title = "Erro!",
                    Content = "Falha ao carregar " .. name .. ": " .. tostring(err),
                    Duration = 5,
                    Image = 4483362458
                })
            end
        end
    })
end

-- [[ Adicionar Scripts do Brookhaven ]] --
createScriptButton("Soluna", "https://raw.githubusercontent.com/Patheticcs/Soluna-API/refs/heads/main/brookhaven.lua", true)
createScriptButton("XXXOMER13245678", "https://pastebin.com/raw/LCmR8qkj", false)
createScriptButton("FHub", "https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua", false)
createScriptButton("IceHub", "https://raw.githubusercontent.com/Waza80/scripts-new/main/IceHubBrookhaven.lua", false)
createScriptButton("Sander XY (Bypass Deluxe)", "https://raw.githubusercontent.com/TrollGuiMaker/epic-sander-bypass/refs/heads/main/sander%20is%20a%20skid", false)

-- [[ Botão Flutuante para Mostrar/Esconder GUI ]] --
local DraggableObject = Instance.new("ScreenGui")
DraggableObject.Name = "DraggableObject"
DraggableObject.Parent = game.CoreGui
DraggableObject.ResetOnSpawn = false

local DragButton = Instance.new("TextButton")
DragButton.Name = "DragButton"
DragButton.Size = UDim2.new(0, 50, 0, 50)
DragButton.Position = UDim2.new(0, 300, 0, 300)
DragButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
DragButton.Text = "👁"
DragButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DragButton.Font = Enum.Font.Code
DragButton.TextSize = 20
DragButton.BorderSizePixel = 0
DragButton.Draggable = true
DragButton.Parent = DraggableObject

DragButton.MouseButton1Click:Connect(function()
    Window.Frame.Visible = not Window.Frame.Visible
end)

-- [[ Conectar evento do botão de aceitar ]] --
AcceptButton.MouseButton1Click:Connect(function()
    WarningGui:Destroy()
    Window.Frame.Visible = true
end)
