-- Mush1cora Script Hub v2.0 Premium
-- Por Henry1911 (henry1911.fwh.is/mush1cora)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Configurações Premium
local CONFIG = {
    NOME_HUB = "mush1cora",
    VERSAO = "v2.0 Premium",
    COR_PRINCIPAL = Color3.fromRGB(170, 0, 0),
    COR_SECUNDARIA = Color3.fromRGB(20, 20, 20),
    COR_TERCIARIA = Color3.fromRGB(40, 40, 40),
    FONTE = "Gotham",
    SITE_OFICIAL = "henry1911.fwh.is/mush1cora",
    LINK_ATUALIZACOES = "https://henry1911.ct.ws/mush1cora",
    SCRIPTS = {
        ["Soluna"] = "https://raw.githubusercontent.com/Patheticcs/Soluna-API/main/brookhaven.lua",
        ["XXXOMER13245678"] = "https://pastebin.com/raw/LCmR8qkj",
        ["FHub"] = "https://raw.githubusercontent.com/OpenSourceEngine/Script/main/Brookhaven.lua",
        ["IceHub"] = "https://raw.githubusercontent.com/Waza80/scripts-new/main/IceHubBrookhaven.lua",
        ["Sander XY Deluxe"] = "https://raw.githubusercontent.com/TrollGuiMaker/epic-sander-bypass/main/sander%20is%20a%20skid"
    },
    SOUND_STARTUP = 90703113106852
}

-- Notificação Roblox
StarterGui:SetCore("SendNotification", {
    Title = CONFIG.NOME_HUB,
    Text = "Abraço do henry1911!",
    Duration = 5,
    Icon = "rbxassetid://6726285816"
})

-- Função para criar gradientes
local function CreateGradient(parent)
    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, CONFIG.COR_PRINCIPAL),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(100, 0, 0))
    })
    gradient.Rotation = 90
    gradient.Parent = parent
    return gradient
end

-- Função para criar sombras
local function CreateShadow(parent)
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Image = "rbxassetid://1316045217"
    shadow.ImageColor3 = Color3.new(0, 0, 0)
    shadow.ImageTransparency = 0.8
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    shadow.Size = UDim2.new(1, 10, 1, 10)
    shadow.Position = UDim2.new(0, -5, 0, -5)
    shadow.BackgroundTransparency = 1
    shadow.Parent = parent
    return shadow
end

-- Janela de aviso inicial premium
local function CriarJanelaAviso()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Mush1coraWarning"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 500, 0, 400)
    MainFrame.Position = UDim2.new(0.5, -250, 0.5, -200)
    MainFrame.BackgroundColor3 = CONFIG.COR_SECUNDARIA
    MainFrame.BorderSizePixel = 0
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    CreateShadow(MainFrame)

    local TopBar = Instance.new("Frame")
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundColor3 = CONFIG.COR_PRINCIPAL
    TopBar.BorderSizePixel = 0
    CreateGradient(TopBar)

    local Title = Instance.new("TextLabel")
    Title.Text = "⚠️ AVISO IMPORTANTE ⚠️"
    Title.Font = CONFIG.FONTE
    Title.TextSize = 22
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.TextXAlignment = Enum.TextXAlignment.Center

    local WarningText = Instance.new("TextLabel")
    WarningText.Text = "Você está prestes a iniciar a mush1cora Hub.\n\nAo prosseguir, você assume total responsabilidade por quaisquer penalidades aplicadas pela administração do Roblox.\n\nTodos os scripts contidos são para fins educacionais e de modificação visual, não afetando a gameplay de outros jogadores.\n\nSite oficial: " .. CONFIG.SITE_OFICIAL
    WarningText.Font = CONFIG.FONTE
    WarningText.TextSize = 16
    WarningText.TextColor3 = Color3.new(1, 1, 1)
    WarningText.BackgroundTransparency = 1
    WarningText.Size = UDim2.new(0.9, 0, 0, 250)
    WarningText.Position = UDim2.new(0.05, 0, 0.1, 0)
    WarningText.TextWrapped = true
    WarningText.TextYAlignment = Enum.TextYAlignment.Top

    local StartButton = Instance.new("TextButton")
    StartButton.Text = "INICIAR HUB"
    StartButton.Font = CONFIG.FONTE
    StartButton.TextSize = 18
    StartButton.Size = UDim2.new(0.4, 0, 0, 40)
    StartButton.Position = UDim2.new(0.3, 0, 0.85, 0)
    StartButton.BackgroundColor3 = CONFIG.COR_PRINCIPAL
    StartButton.TextColor3 = Color3.new(1, 1, 1)
    StartButton.BorderSizePixel = 0
    CreateGradient(StartButton)

    StartButton.MouseEnter:Connect(function()
        TweenService:Create(StartButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 0, 0)}):Play()
    end)

    StartButton.MouseLeave:Connect(function()
        TweenService:Create(StartButton, TweenInfo.new(0.2), {BackgroundColor3 = CONFIG.COR_PRINCIPAL}):Play()
    end)

    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://" .. CONFIG.SOUND_STARTUP
    Sound.Volume = 1
    Sound.Parent = ScreenGui

    -- Conectar eventos
    StartButton.MouseButton1Click:Connect(function()
        Sound:Play()
        TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)}):Play()
        wait(0.5)
        ScreenGui:Destroy()
        CriarMainGUI()
    end)

    -- Parentar elementos
    MainFrame.Parent = ScreenGui
    TopBar.Parent = MainFrame
    Title.Parent = TopBar
    WarningText.Parent = MainFrame
    StartButton.Parent = MainFrame
    ScreenGui.Parent = game.CoreGui

    -- Animação de entrada
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.5), {Size = UDim2.new(0, 500, 0, 400)}):Play()
end

-- Função para criar a GUI principal premium
function CriarMainGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Mush1coraHub"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Frame principal
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(0, 700, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -350, 0.5, -250)
    MainFrame.BackgroundColor3 = CONFIG.COR_SECUNDARIA
    MainFrame.BorderSizePixel = 0
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.ClipsDescendants = true
    MainFrame.Active = true
    MainFrame.Draggable = true
    CreateShadow(MainFrame)

    -- Topbar
    local Topbar = Instance.new("Frame")
    Topbar.Size = UDim2.new(1, 0, 0, 40)
    Topbar.BackgroundColor3 = CONFIG.COR_PRINCIPAL
    Topbar.BorderSizePixel = 0
    CreateGradient(Topbar)

    local Title = Instance.new("TextLabel")
    Title.Text = CONFIG.NOME_HUB .. "  |  " .. CONFIG.VERSAO
    Title.Font = CONFIG.FONTE
    Title.TextSize = 20
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(0.7, 0, 1, 0)
    Title.Position = UDim2.new(0.02, 0, 0, 0)
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local CloseButton = Instance.new("TextButton")
    CloseButton.Text = "X"
    CloseButton.Font = CONFIG.FONTE
    CloseButton.TextSize = 18
    CloseButton.Size = UDim2.new(0, 40, 1, 0)
    CloseButton.Position = UDim2.new(1, -40, 0, 0)
    CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    CloseButton.TextColor3 = Color3.new(1, 1, 1)
    CloseButton.BorderSizePixel = 0

    CloseButton.MouseEnter:Connect(function()
        CloseButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    end)

    CloseButton.MouseLeave:Connect(function()
        CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    end)

    local MinimizeButton = Instance.new("TextButton")
    MinimizeButton.Text = "_"
    MinimizeButton.Font = CONFIG.FONTE
    MinimizeButton.TextSize = 18
    MinimizeButton.Size = UDim2.new(0, 40, 1, 0)
    MinimizeButton.Position = UDim2.new(1, -80, 0, 0)
    MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
    MinimizeButton.BorderSizePixel = 0

    MinimizeButton.MouseEnter:Connect(function()
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    end)

    MinimizeButton.MouseLeave:Connect(function()
        MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end)

    -- Sidebar
    local Sidebar = Instance.new("Frame")
    Sidebar.Size = UDim2.new(0, 180, 1, -40)
    Sidebar.Position = UDim2.new(0, 0, 0, 40)
    Sidebar.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Sidebar.BorderSizePixel = 0

    local Scroll = Instance.new("ScrollingFrame")
    Scroll.Size = UDim2.new(1, 0, 1, -10)
    Scroll.Position = UDim2.new(0, 0, 0, 10)
    Scroll.BackgroundTransparency = 1
    Scroll.ScrollBarThickness = 5
    Scroll.ScrollBarImageColor3 = CONFIG.COR_PRINCIPAL

    local ButtonLayout = Instance.new("UIListLayout")
    ButtonLayout.Padding = UDim.new(0, 5)

    -- Conteúdo
    local ContentFrame = Instance.new("Frame")
    ContentFrame.Size = UDim2.new(1, -180, 1, -40)
    ContentFrame.Position = UDim2.new(0, 180, 0, 40)
    ContentFrame.BackgroundTransparency = 1

    -- Botão flutuante
    local FloatingButton = Instance.new("TextButton")
    FloatingButton.Text = ">"
    FloatingButton.Size = UDim2.new(0, 50, 0, 50)
    FloatingButton.Position = UDim2.new(0, 10, 0.5, -25)
    FloatingButton.BackgroundColor3 = CONFIG.COR_PRINCIPAL
    FloatingButton.TextColor3 = Color3.new(1, 1, 1)
    FloatingButton.Font = CONFIG.FONTE
    FloatingButton.TextSize = 20
    FloatingButton.Visible = false
    FloatingButton.BorderSizePixel = 0
    CreateGradient(FloatingButton)
    CreateShadow(FloatingButton)

    FloatingButton.MouseEnter:Connect(function()
        TweenService:Create(FloatingButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(200, 0, 0)}):Play()
    end)

    FloatingButton.MouseLeave:Connect(function()
        TweenService:Create(FloatingButton, TweenInfo.new(0.2), {BackgroundColor3 = CONFIG.COR_PRINCIPAL}):Play()
    end)

    -- Funções úteis
    local function GetSaudacao()
        local hora = os.date("*t").hour
        if hora < 12 then
            return "Bom dia"
        elseif hora < 18 then
            return "Boa tarde"
        else
            return "Boa noite"
        end
    end

    local function CriarBotaoSidebar(nome)
        local button = Instance.new("TextButton")
        button.Text = nome
        button.Font = CONFIG.FONTE
        button.TextSize = 16
        button.Size = UDim2.new(0.9, 0, 0, 40)
        button.Position = UDim2.new(0.05, 0, 0, 0)
        button.BackgroundColor3 = CONFIG.COR_TERCIARIA
        button.TextColor3 = Color3.new(1, 1, 1)
        button.BorderSizePixel = 0
        local stroke = Instance.new("UIStroke")
        stroke.Color = CONFIG.COR_PRINCIPAL
        stroke.Thickness = 1
        stroke.Parent = button

        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = CONFIG.COR_TERCIARIA}):Play()
        end)

        return button
    end

    -- Criar seções
    local Sections = {}

    -- Seção Sobre
    local SobreSection = Instance.new("Frame")
    SobreSection.Size = UDim2.new(1, 0, 1, 0)
    SobreSection.BackgroundTransparency = 1
    SobreSection.Visible = true

    local Saudacao = Instance.new("TextLabel")
    Saudacao.Text = GetSaudacao() .. ", " .. LocalPlayer.DisplayName
    Saudacao.Font = CONFIG.FONTE
    Saudacao.TextSize = 24
    Saudacao.TextColor3 = CONFIG.COR_PRINCIPAL
    Saudacao.BackgroundTransparency = 1
    Saudacao.Size = UDim2.new(1, -20, 0, 30)
    Saudacao.Position = UDim2.new(0, 20, 0, 10)
    Saudacao.TextXAlignment = Enum.TextXAlignment.Left

    local Avatar = Instance.new("ImageLabel")
    Avatar.Size = UDim2.new(0, 150, 0, 150)
    Avatar.Position = UDim2.new(0, 20, 0, 50)
    Avatar.BorderSizePixel = 0
    Avatar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

    local AvatarStroke = Instance.new("UIStroke")
    AvatarStroke.Color = CONFIG.COR_PRINCIPAL
    AvatarStroke.Thickness = 2
    AvatarStroke.Parent = Avatar

    pcall(function()
        Avatar.Image = Players:GetUserThumbnailAsync(
            LocalPlayer.UserId,
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size420x420
        )
    end)

    local InfoFrame = Instance.new("Frame")
    InfoFrame.Size = UDim2.new(0.7, -20, 0.7, 0)
    InfoFrame.Position = UDim2.new(0.3, 10, 0, 50)
    InfoFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    InfoFrame.BorderSizePixel = 0

    local InfoStroke = Instance.new("UIStroke")
    InfoStroke.Color = CONFIG.COR_PRINCIPAL
    InfoStroke.Thickness = 1
    InfoStroke.Parent = InfoFrame

    local InfoText = Instance.new("TextLabel")
    InfoText.Text = string.format(
        "%s %s\n• Scripts disponíveis: %d\n• Atualizações automáticas\n• Site oficial: %s\nÚltima versão: %s\n%s",
        CONFIG.NOME_HUB,
        CONFIG.VERSAO,
        #CONFIG.SCRIPTS,
        CONFIG.SITE_OFICIAL,
        CONFIG.VERSAO,
        "Desenvolvido com ❤️ por Henry1911"
    )
    InfoText.Font = CONFIG.FONTE
    InfoText.TextSize = 14
    InfoText.TextColor3 = Color3.new(1, 1, 1)
    InfoText.BackgroundTransparency = 1
    InfoText.Size = UDim2.new(0.9, 0, 0.9, 0)
    InfoText.Position = UDim2.new(0.05, 0, 0.05, 0)
    InfoText.TextXAlignment = Enum.TextXAlignment.Left
    InfoText.TextYAlignment = Enum.TextYAlignment.Top
    InfoText.TextWrapped = true

    -- Seção Scripts
    local ScriptsSection = Instance.new("ScrollingFrame")
    ScriptsSection.Size = UDim2.new(1, -20, 1, -20)
    ScriptsSection.Position = UDim2.new(0, 10, 0, 10)
    ScriptsSection.BackgroundTransparency = 1
    ScriptsSection.Visible = false
    ScriptsSection.ScrollBarThickness = 5
    ScriptsSection.ScrollBarImageColor3 = CONFIG.COR_PRINCIPAL

    local ScriptsLayout = Instance.new("UIListLayout")
    ScriptsLayout.Padding = UDim.new(0, 15)

    local ScriptsPadding = Instance.new("UIPadding")
    ScriptsPadding.PaddingTop = UDim.new(0, 10)
    ScriptsPadding.PaddingLeft = UDim.new(0, 10)

    for nome, url in pairs(CONFIG.SCRIPTS) do
        local button = Instance.new("TextButton")
        button.Text = nome
        button.Font = CONFIG.FONTE
        button.TextSize = 18
        button.Size = UDim2.new(0.95, 0, 0, 50)
        button.BackgroundColor3 = CONFIG.COR_TERCIARIA
        button.TextColor3 = Color3.new(1, 1, 1)
        button.BorderSizePixel = 0

        local buttonStroke = Instance.new("UIStroke")
        buttonStroke.Color = CONFIG.COR_PRINCIPAL
        buttonStroke.Thickness = 1
        buttonStroke.Parent = button

        local buttonGradient = Instance.new("UIGradient")
        buttonGradient.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 30, 30))
        })
        buttonGradient.Rotation = 90
        buttonGradient.Parent = button

        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(60, 60, 60)}):Play()
        end)

        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {BackgroundColor3 = CONFIG.COR_TERCIARIA}):Play()
        end)

        button.MouseButton1Click:Connect(function()
            ShowNotification("Script Executado", "Iniciando " .. nome .. "...", "rbxassetid://6726285816")
            loadstring(game:HttpGet(url, true))()
        end)

        button.Parent = ScriptsSection
    end

    -- Parentagem
    SobreSection.Parent = ContentFrame
    Saudacao.Parent = SobreSection
    Avatar.Parent = SobreSection
    InfoFrame.Parent = SobreSection
    InfoText.Parent = InfoFrame
    ScriptsSection.Parent = ContentFrame
    ScriptsLayout.Parent = ScriptsSection
    ScriptsPadding.Parent = ScriptsSection

    Sections["Sobre"] = SobreSection
    Sections["Scripts"] = ScriptsSection

    -- Criar botões sidebar
    local sobreBtn = CriarBotaoSidebar("Sobre")
    sobreBtn.Parent = Scroll

    local scriptsBtn = CriarBotaoSidebar("Scripts")
    scriptsBtn.Parent = Scroll

    -- Eventos dos botões sidebar
    sobreBtn.MouseButton1Click:Connect(function()
        for _, section in pairs(Sections) do
            section.Visible = false
        end
        SobreSection.Visible = true
    end)

    scriptsBtn.MouseButton1Click:Connect(function()
        for _, section in pairs(Sections) do
            section.Visible = false
        end
        ScriptsSection.Visible = true
    end)

    -- Botões topbar
    CloseButton.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)})
        tween:Play()
        tween.Completed:Wait()
        ScreenGui:Destroy()
    end)

    MinimizeButton.MouseButton1Click:Connect(function()
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 0, 0, 0)})
        tween:Play()
        tween.Completed:Wait()
        MainFrame.Visible = false
        FloatingButton.Visible = true
    end)

    FloatingButton.MouseButton1Click:Connect(function()
        FloatingButton.Visible = false
        MainFrame.Visible = true
        local tween = TweenService:Create(MainFrame, TweenInfo.new(0.3), {Size = UDim2.new(0, 700, 0, 500)})
        tween:Play()
    end)

    -- Finalizar parentagem
    Topbar.Parent = MainFrame
    Title.Parent = Topbar
    MinimizeButton.Parent = Topbar
    CloseButton.Parent = Topbar
    Sidebar.Parent = MainFrame
    Scroll.Parent = Sidebar
    ButtonLayout.Parent = Scroll
    ContentFrame.Parent = MainFrame
    MainFrame.Parent = ScreenGui
    FloatingButton.Parent = ScreenGui
    ScreenGui.Parent = game.CoreGui

    -- Animação de entrada
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    local tween = TweenService:Create(MainFrame, TweenInfo.new(0.5), {Size = UDim2.new(0, 700, 0, 500)})
    tween:Play()
end

-- Iniciar
CriarJanelaAviso()
