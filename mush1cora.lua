-- [[ MUSH1CORA HUB - Brookhaven RP Script Hub ]] --
-- [[ Desenvolvido por Henry1911 ]] --

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

-- [[ Tocar Som de Startup (Windows 95) ]] --
spawn(function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1841928191" -- Som do Windows 95
    sound.Volume = 0.5
    sound.Parent = game:GetService("SoundService") or workspace
    sound:Play()
    game:GetService("Debris"):AddItem(sound, sound.TimeLength)
end)

-- [[ Criar GUI Principal ]] --
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Mush1coraHub"
screenGui.Parent = game.CoreGui
screenGui.ResetOnSpawn = false

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 600, 0, 400)
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- [[ Topbar ]] --
local topbar = Instance.new("Frame")
topbar.Name = "Topbar"
topbar.Size = UDim2.new(1, 0, 0, 30)
topbar.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
topbar.BorderSizePixel = 0
topbar.Parent = mainFrame

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, -60, 1, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Mush1cora Hub - Brookhaven RP | v1.0.0"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.Code
titleLabel.TextSize = 14
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Position = UDim2.new(0, 10, 0, 0)
titleLabel.Parent = topbar

-- [[ Botões da Topbar ]] --
local minimizeButton = Instance.new("TextButton")
minimizeButton.Name = "MinimizeButton"
minimizeButton.Size = UDim2.new(0, 30, 1, 0)
minimizeButton.Position = UDim2.new(1, -60, 0, 0)
minimizeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
minimizeButton.Text = "_"
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.Font = Enum.Font.Code
minimizeButton.TextSize = 16
minimizeButton.BorderSizePixel = 0
minimizeButton.Parent = topbar

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 1, 0)
closeButton.Position = UDim2.new(1, -30, 0, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.Font = Enum.Font.Code
closeButton.TextSize = 16
closeButton.BorderSizePixel = 0
closeButton.Parent = topbar

-- [[ Sidebar ]] --
local sidebar = Instance.new("Frame")
sidebar.Name = "Sidebar"
sidebar.Size = UDim2.new(0, 150, 1, -30)
sidebar.Position = UDim2.new(0, 0, 0, 30)
sidebar.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
sidebar.BorderSizePixel = 0
sidebar.Parent = mainFrame

-- [[ Conteúdo Principal ]] --
local contentFrame = Instance.new("Frame")
contentFrame.Name = "ContentFrame"
contentFrame.Size = UDim2.new(1, -150, 1, -30)
contentFrame.Position = UDim2.new(0, 150, 0, 30)
contentFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
contentFrame.BorderSizePixel = 0
contentFrame.Parent = mainFrame

-- [[ Função para criar botões da sidebar ]] --
local function createSidebarButton(text, position)
    local button = Instance.new("TextButton")
    button.Name = text .. "Button"
    button.Size = UDim2.new(1, -20, 0, 30)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.Text = text
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.Code
    button.TextSize = 14
    button.BorderSizePixel = 0
    button.Parent = sidebar
    return button
end

-- [[ Criar botões da sidebar ]] --
local aboutButton = createSidebarButton("🏠 Sobre", UDim2.new(0, 10, 0, 10))
local scriptsButton = createSidebarButton("🧰 Scripts", UDim2.new(0, 10, 0, 50))

-- [[ Função para limpar conteúdo ]] --
local function clearContent()
    for _, child in pairs(contentFrame:GetChildren()) do
        if child:IsA("GuiObject") then
            child:Destroy()
        end
    end
end

-- [[ Função para mostrar conteúdo Sobre ]] --
local function showAbout()
    clearContent()
    
    local welcomeLabel = Instance.new("TextLabel")
    welcomeLabel.Name = "WelcomeLabel"
    welcomeLabel.Size = UDim2.new(1, -20, 0, 30)
    welcomeLabel.Position = UDim2.new(0, 10, 0, 10)
    welcomeLabel.BackgroundTransparency = 1
    welcomeLabel.Text = getGreeting() .. ", " .. game.Players.LocalPlayer.DisplayName .. "!"
    welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    welcomeLabel.Font = Enum.Font.Code
    welcomeLabel.TextSize = 16
    welcomeLabel.TextXAlignment = Enum.TextXAlignment.Left
    welcomeLabel.Parent = contentFrame
    
    -- [[ Avatar do Usuário ]] --
    local userId = game.Players.LocalPlayer.UserId
    local thumbType = Enum.ThumbnailType.HeadShot
    local thumbSize = Enum.ThumbnailSize.Size100x100
    local content, isReady = game.Players:GetUserThumbnailAsync(userId, thumbType, thumbSize)
    
    local avatarImage = Instance.new("ImageLabel")
    avatarImage.Name = "AvatarImage"
    avatarImage.Size = UDim2.new(0, 100, 0, 100)
    avatarImage.Position = UDim2.new(0, 10, 0, 50)
    avatarImage.BackgroundTransparency = 1
    avatarImage.Image = content
    avatarImage.Parent = contentFrame
    
    -- [[ Informações da Hub ]] --
    local infoLabel1 = Instance.new("TextLabel")
    infoLabel1.Name = "InfoLabel1"
    infoLabel1.Size = UDim2.new(1, -130, 0, 20)
    infoLabel1.Position = UDim2.new(0, 120, 0, 50)
    infoLabel1.BackgroundTransparency = 1
    infoLabel1.Text = "Versão: v1.0.0"
    infoLabel1.TextColor3 = Color3.fromRGB(255, 100, 100)
    infoLabel1.Font = Enum.Font.Code
    infoLabel1.TextSize = 14
    infoLabel1.TextXAlignment = Enum.TextXAlignment.Left
    infoLabel1.Parent = contentFrame
    
    local infoLabel2 = Instance.new("TextLabel")
    infoLabel2.Name = "InfoLabel2"
    infoLabel2.Size = UDim2.new(1, -130, 0, 20)
    infoLabel2.Position = UDim2.new(0, 120, 0, 75)
    infoLabel2.BackgroundTransparency = 1
    infoLabel2.Text = "Scripts Disponíveis: 5"
    infoLabel2.TextColor3 = Color3.fromRGB(255, 100, 100)
    infoLabel2.Font = Enum.Font.Code
    infoLabel2.TextSize = 14
    infoLabel2.TextXAlignment = Enum.TextXAlignment.Left
    infoLabel2.Parent = contentFrame
    
    local infoLabel3 = Instance.new("TextLabel")
    infoLabel3.Name = "InfoLabel3"
    infoLabel3.Size = UDim2.new(1, -130, 0, 20)
    infoLabel3.Position = UDim2.new(0, 120, 0, 100)
    infoLabel3.BackgroundTransparency = 1
    infoLabel3.Text = "Site: henry1911.ct.ws/mush1cora"
    infoLabel3.TextColor3 = Color3.fromRGB(255, 100, 100)
    infoLabel3.Font = Enum.Font.Code
    infoLabel3.TextSize = 14
    infoLabel3.TextXAlignment = Enum.TextXAlignment.Left
    infoLabel3.Parent = contentFrame
    
    local infoLabel4 = Instance.new("TextLabel")
    infoLabel4.Name = "InfoLabel4"
    infoLabel4.Size = UDim2.new(1, -20, 0, 20)
    infoLabel4.Position = UDim2.new(0, 10, 0, 160)
    infoLabel4.BackgroundTransparency = 1
    infoLabel4.Text = "Atualizações são diretas, não é necessário trocar o link."
    infoLabel4.TextColor3 = Color3.fromRGB(200, 200, 200)
    infoLabel4.Font = Enum.Font.Code
    infoLabel4.TextSize = 12
    infoLabel4.TextXAlignment = Enum.TextXAlignment.Left
    infoLabel4.Parent = contentFrame
    
    -- [[ Changelog ]] --
    local changelogLabel = Instance.new("TextLabel")
    changelogLabel.Name = "ChangelogLabel"
    changelogLabel.Size = UDim2.new(1, -20, 0, 20)
    changelogLabel.Position = UDim2.new(0, 10, 0, 200)
    changelogLabel.BackgroundTransparency = 1
    changelogLabel.Text = "Changelog - Versão Atual:"
    changelogLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    changelogLabel.Font = Enum.Font.Code
    changelogLabel.TextSize = 14
    changelogLabel.TextXAlignment = Enum.TextXAlignment.Left
    changelogLabel.Parent = contentFrame
    
    local changelogText = Instance.new("TextLabel")
    changelogText.Name = "ChangelogText"
    changelogText.Size = UDim2.new(1, -20, 0, 60)
    changelogText.Position = UDim2.new(0, 10, 0, 225)
    changelogText.BackgroundTransparency = 1
    changelogText.Text = "• Versão inicial da Mush1cora Hub\n• Integração com 5 scripts de Brookhaven\n• Design premium com tema preto e vermelho"
    changelogText.TextColor3 = Color3.fromRGB(200, 200, 200)
    changelogText.Font = Enum.Font.Code
    changelogText.TextSize = 12
    changelogText.TextXAlignment = Enum.TextXAlignment.Left
    changelogText.TextYAlignment = Enum.TextYAlignment.Top
    changelogText.Parent = contentFrame
end

-- [[ Função para mostrar conteúdo Scripts ]] --
local function showScripts()
    clearContent()
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Name = "ScriptsTitle"
    titleLabel.Size = UDim2.new(1, -20, 0, 30)
    titleLabel.Position = UDim2.new(0, 10, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Scripts Disponíveis"
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.Code
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = contentFrame
    
    -- [[ Função para criar botões de script ]] --
    local function createScriptButton(name, position, callback)
        local button = Instance.new("TextButton")
        button.Name = name .. "Button"
        button.Size = UDim2.new(1, -20, 0, 30)
        button.Position = position
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        button.Text = name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.Code
        button.TextSize = 14
        button.BorderSizePixel = 0
        button.Parent = contentFrame
        
        button.MouseButton1Click:Connect(callback)
        return button
    end
    
    -- [[ Criar botões dos scripts ]] --
    createScriptButton("Soluna", UDim2.new(0, 10, 0, 50), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/Soluna-API/refs/heads/main/brookhaven.lua", true))()
    end)
    
    createScriptButton("XXXOMER13245678", UDim2.new(0, 10, 0, 90), function()
        loadstring(game:HttpGet("https://pastebin.com/raw/LCmR8qkj"))()
    end)
    
    createScriptButton("FHub", UDim2.new(0, 10, 0, 130), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua"))()
    end)
    
    createScriptButton("IceHub", UDim2.new(0, 10, 0, 170), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Waza80/scripts-new/main/IceHubBrookhaven.lua"))()
    end)
    
    createScriptButton("Sander XY (Bypass Deluxe)", UDim2.new(0, 10, 0, 210), function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/TrollGuiMaker/epic-sander-bypass/refs/heads/main/sander%20is%20a%20skid"))()
    end)
end

-- [[ Conectar eventos dos botões da sidebar ]] --
aboutButton.MouseButton1Click:Connect(showAbout)
scriptsButton.MouseButton1Click:Connect(showScripts)

-- [[ Conectar eventos da topbar ]] --
minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- [[ Tornar a janela draggable ]] --
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

topbar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

topbar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- [[ Botão Flutuante para Mostrar/Esconder GUI ]] --
local DraggableObject = Instance.new("ScreenGui")
DraggableObject.Name = "DraggableObject"
DraggableObject.Parent = game.CoreGui
DraggableObject.ResetOnSpawn = false

local DragButton = Instance.new("TextButton")
DragButton.Name = "DragButton"
DragButton.Size = UDim2.new(0, 50, 0, 50)
DragButton.Position = UDim2.new(0, 300, 0, 300)
DragButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
DragButton.Text = "👁"
DragButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DragButton.Font = Enum.Font.Code
DragButton.TextSize = 20
DragButton.BorderSizePixel = 0
DragButton.Draggable = true
DragButton.Parent = DraggableObject

DragButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = not mainFrame.Visible
end)

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
WarningLabel.Text = "Você está prestes a iniciar a Mush1cora Hub.\n\nAo continuar, você assume total responsabilidade por possíveis penalidades impostas pela administração do Roblox.\n\nSite oficial: henry1911.fwh.is/mush1cora"
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
    mainFrame.Visible = true
    showAbout() -- Mostrar a aba Sobre por padrão
end)

-- Inicialmente esconder a GUI principal
mainFrame.Visible = false
