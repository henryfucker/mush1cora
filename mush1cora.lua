-- Mush1cora Script Hub v2.0 Premium - UI Refeita com base na EzLauncher
-- Por Henry1911 (henry1911.fwh.is/mush1cora)
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService") -- Para animações suaves
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

-- Configurações Premium
local CONFIG = {
    NOME_HUB = "mush1cora",
    VERSAO = "v2.0 Premium",
    -- Cores da Mush1cora
    COR_PRINCIPAL = Color3.fromRGB(170, 0, 0), -- Vermelho principal
    COR_SECUNDARIA = Color3.fromRGB(20, 20, 20), -- Fundo escuro
    COR_TERCIARIA = Color3.fromRGB(40, 40, 40), -- Elementos secundários
    -- Cores da EzLauncher (para UI)
    COR_SIDEBAR = Color3.fromRGB(35, 47, 62), -- Fundo da sidebar
    COR_DESTAQUE = Color3.fromRGB(18, 98, 159), -- Azul para destaques (topbar da seção)
    COR_DIVISOR = Color3.fromRGB(112, 112, 112), -- Cinza para divisores
    COR_TEXTO_PRIMARIO = Color3.fromRGB(211, 216, 226), -- Texto claro
    COR_TEXTO_SECUNDARIO = Color3.fromRGB(92, 106, 124), -- Texto secundário
    FONTE = Enum.Font.SourceSans, -- Fonte da EzLauncher
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

-- Função para criar sombras (mantida da original)
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

-- Janela de aviso inicial premium (mantida da original)
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

    local Title = Instance.new("TextLabel")
    Title.Text = "⚠️ AVISO IMPORTANTE ⚠️"
    Title.Font = CONFIG.FONTE
    Title.TextSize = 22
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.TextXAlignment = Enum.TextXAlignment.Center

    local WarningText = Instance.new("TextLabel")
    WarningText.Text = "Você está prestes a iniciar a mush1cora Hub.\nAo prosseguir, você assume total responsabilidade por quaisquer penalidades aplicadas pela administração do Roblox.\nTodos os scripts contidos são para fins educacionais e de modificação visual, não afetando a gameplay de outros jogadores.\nSite oficial: " .. CONFIG.SITE_OFICIAL
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

-- Função para criar a GUI principal com UI da EzLauncher
function CriarMainGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "Mush1coraHub"
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- Frame principal
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Size = UDim2.new(0, 700, 0, 500)
    MainFrame.Position = UDim2.new(0.5, -350, 0.5, -250)
    MainFrame.BackgroundColor3 = CONFIG.COR_SECUNDARIA
    MainFrame.BorderSizePixel = 0
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.ClipsDescendants = true
    MainFrame.Active = true -- Necessário para Draggable
    MainFrame.Draggable = true -- Torna arrastável
    CreateShadow(MainFrame)

    -- Topbar (estilo EzLauncher)
    local Topbar = Instance.new("Frame")
    Topbar.Name = "Topbar"
    Topbar.Size = UDim2.new(1, 0, 0, 40)
    Topbar.BackgroundColor3 = CONFIG.COR_PRINCIPAL
    Topbar.BorderSizePixel = 0

    local Title = Instance.new("TextLabel")
    Title.Name = "Title"
    Title.Text = CONFIG.NOME_HUB .. "  |  " .. CONFIG.VERSAO
    Title.Font = CONFIG.FONTE
    Title.TextSize = 20
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.BackgroundTransparency = 1
    Title.Size = UDim2.new(0.7, 0, 1, 0)
    Title.Position = UDim2.new(0.02, 0, 0, 0)
    Title.TextXAlignment = Enum.TextXAlignment.Left

    local CloseButton = Instance.new("TextButton")
    CloseButton.Name = "CloseButton"
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
    MinimizeButton.Name = "MinimizeButton"
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

    -- Container para seções (abaixo da topbar)
    local ContentContainer = Instance.new("Frame")
    ContentContainer.Name = "ContentContainer"
    ContentContainer.Size = UDim2.new(1, -20, 1, -60) -- Ajustado para espaço da topbar e padding
    ContentContainer.Position = UDim2.new(0, 10, 0, 50) -- Abaixo da topbar
    ContentContainer.BackgroundTransparency = 1
    ContentContainer.ClipsDescendants = true

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

    local function ShowNotification(title, text, icon)
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = 3,
            Icon = icon
        })
    end

    -- Função para criar uma seção estilo EzLauncher
    local function CriarSecao(nome, altura)
        local secao = Instance.new("Frame")
        secao.Name = nome .. "Section"
        secao.Size = UDim2.new(1, 0, 0, altura or 200) -- Altura padrão ou especificada
        secao.BackgroundColor3 = CONFIG.COR_SIDEBAR
        secao.BorderSizePixel = 0

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = secao

        -- Pasta para elementos da topbar da seção
        local SectionTopBar = Instance.new("Folder")
        SectionTopBar.Name = "SectionTopBar"

        local TopBarFrame = Instance.new("Frame")
        TopBarFrame.Name = "TopBarFrame"
        TopBarFrame.BackgroundColor3 = CONFIG.COR_DESTAQUE
        TopBarFrame.Size = UDim2.new(0, 2, 0, 32)
        TopBarFrame.Parent = SectionTopBar

        local TopBarCorner = Instance.new("UICorner")
        TopBarCorner.Parent = TopBarFrame

        local Divider = Instance.new("Frame")
        Divider.Name = "Divider"
        Divider.BackgroundColor3 = CONFIG.COR_DIVISOR
        Divider.BackgroundTransparency = 0.75
        Divider.BorderSizePixel = 0
        Divider.Position = UDim2.new(0, 0, 0, 32)
        Divider.Size = UDim2.new(1, 0, 0, 1)
        Divider.Parent = SectionTopBar

        local SectionTitle = Instance.new("TextLabel")
        SectionTitle.Name = "Title"
        SectionTitle.Text = nome
        SectionTitle.Font = CONFIG.FONTE
        SectionTitle.TextSize = 14
        SectionTitle.TextColor3 = CONFIG.COR_TEXTO_PRIMARIO
        SectionTitle.BackgroundTransparency = 1
        SectionTitle.Size = UDim2.new(1, -12, 0, 24)
        SectionTitle.Position = UDim2.new(0, 12, 0, 4)
        SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
        SectionTitle.Parent = SectionTopBar

        SectionTopBar.Parent = secao

        return secao
    end

    -- Seção Sobre (estilo EzLauncher)
    local SobreSection = CriarSecao("Sobre", 200)
    SobreSection.Name = "SobreSection"
    SobreSection.Size = UDim2.new(1, 0, 1, 0) -- Preenche todo o ContentContainer
    SobreSection.Visible = true

    local Saudacao = Instance.new("TextLabel")
    Saudacao.Name = "Saudacao"
    Saudacao.Text = GetSaudacao() .. ", " .. LocalPlayer.DisplayName
    Saudacao.Font = CONFIG.FONTE
    Saudacao.TextSize = 24
    Saudacao.TextColor3 = CONFIG.COR_PRINCIPAL
    Saudacao.BackgroundTransparency = 1
    Saudacao.Size = UDim2.new(1, -20, 0, 30)
    Saudacao.Position = UDim2.new(0, 10, 0, 42) -- Abaixo da topbar da seção
    Saudacao.TextXAlignment = Enum.TextXAlignment.Left

    local Avatar = Instance.new("ImageLabel")
    Avatar.Name = "Avatar"
    Avatar.Size = UDim2.new(0, 100, 0, 100)
    Avatar.Position = UDim2.new(0, 10, 0, 82) -- Abaixo da saudação
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
    InfoFrame.Name = "InfoFrame"
    InfoFrame.Size = UDim2.new(1, -130, 0.6, 0) -- Ajustar largura e altura
    InfoFrame.Position = UDim2.new(0, 120, 0, 82) -- À direita do avatar
    InfoFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    InfoFrame.BorderSizePixel = 0
    local InfoStroke = Instance.new("UIStroke")
    InfoStroke.Color = CONFIG.COR_PRINCIPAL
    InfoStroke.Thickness = 1
    InfoStroke.Parent = InfoFrame

    local InfoText = Instance.new("TextLabel")
    InfoText.Name = "InfoText"
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
    InfoText.TextColor3 = CONFIG.COR_TEXTO_PRIMARIO
    InfoText.BackgroundTransparency = 1
    InfoText.Size = UDim2.new(0.9, 0, 0.9, 0)
    InfoText.Position = UDim2.new(0.05, 0, 0.05, 0)
    InfoText.TextXAlignment = Enum.TextXAlignment.Left
    InfoText.TextYAlignment = Enum.TextYAlignment.Top
    InfoText.TextWrapped = true

    -- Seção Scripts (estilo EzLauncher)
    local ScriptsSection = CriarSecao("Scripts", 250)
    ScriptsSection.Name = "ScriptsSection"
    ScriptsSection.Size = UDim2.new(1, 0, 1, 0) -- Preenche todo o ContentContainer
    ScriptsSection.Visible = false

    -- ScrollingFrame para os scripts
    local ScriptsScroll = Instance.new("ScrollingFrame")
    ScriptsScroll.Name = "ScriptsScroll"
    ScriptsScroll.Size = UDim2.new(1, -20, 1, -52) -- Espaço para topbar e padding
    ScriptsScroll.Position = UDim2.new(0, 10, 0, 42) -- Abaixo da topbar da seção
    ScriptsScroll.BackgroundTransparency = 1
    ScriptsScroll.ScrollBarThickness = 5
    ScriptsScroll.ScrollBarImageColor3 = CONFIG.COR_PRINCIPAL
    ScriptsScroll.CanvasSize = UDim2.new(0, 0, 0, 0) -- Será ajustado dinamicamente
    ScriptsScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y -- Ajuste automático

    local ScriptsLayout = Instance.new("UIListLayout")
    ScriptsLayout.Padding = UDim.new(0, 10)
    ScriptsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    ScriptsLayout.SortOrder = Enum.SortOrder.LayoutOrder
    ScriptsLayout.Parent = ScriptsScroll

    -- Função para criar botão de script (estilo EzLauncher)
    local function CriarBotaoScript(nome)
        local button = Instance.new("TextButton")
        button.Name = nome .. "ScriptButton"
        button.Text = nome
        button.Font = CONFIG.FONTE
        button.TextSize = 16
        button.Size = UDim2.new(0.95, 0, 0, 40)
        button.BackgroundColor3 = Color3.fromRGB(41, 53, 68) -- Cor da EzLauncher
        button.TextColor3 = CONFIG.COR_TEXTO_PRIMARIO
        button.BorderSizePixel = 0
        button.AutoButtonColor = false -- Desativar cor automática

        local stroke = Instance.new("UIStroke")
        stroke.Color = Color3.fromRGB(112, 112, 112) -- Cor da borda da EzLauncher
        stroke.Thickness = 1
        stroke.Parent = button

        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(50, 60, 75) -- Cor ao passar o mouse
        end)
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(41, 53, 68)
        end)

        return button
    end

    -- Preencher a seção de scripts
    for nome, url in pairs(CONFIG.SCRIPTS) do
        local button = CriarBotaoScript(nome)
        button.Parent = ScriptsScroll

        button.MouseButton1Click:Connect(function()
            ShowNotification("Script Executado", "Iniciando " .. nome .. "...", "rbxassetid://6726285816")
            loadstring(game:HttpGet(url, true))()
        end)
    end

    -- Tabela para gerenciar seções
    local Sections = {
        Sobre = SobreSection,
        Scripts = ScriptsSection
    }

    -- Botões de navegação (simulando sidebar)
    local sobreBtn = Instance.new("TextButton")
    sobreBtn.Name = "SobreButton"
    sobreBtn.Text = "Sobre"
    sobreBtn.Font = CONFIG.FONTE
    sobreBtn.TextSize = 16
    sobreBtn.Size = UDim2.new(0, 100, 0, 30)
    sobreBtn.Position = UDim2.new(0, 10, 0, 10) -- Posição fixa para exemplo
    sobreBtn.BackgroundColor3 = CONFIG.COR_PRINCIPAL
    sobreBtn.TextColor3 = Color3.new(1, 1, 1)
    sobreBtn.BorderSizePixel = 0
    sobreBtn.Visible = false -- Escondido pois a navegação será feita por botões na topbar ou sidebar real

    local scriptsBtn = Instance.new("TextButton")
    scriptsBtn.Name = "ScriptsButton"
    scriptsBtn.Text = "Scripts"
    scriptsBtn.Font = CONFIG.FONTE
    scriptsBtn.TextSize = 16
    scriptsBtn.Size = UDim2.new(0, 100, 0, 30)
    scriptsBtn.Position = UDim2.new(0, 120, 0, 10) -- Posição fixa para exemplo
    scriptsBtn.BackgroundColor3 = CONFIG.COR_TERCIARIA
    scriptsBtn.TextColor3 = Color3.new(1, 1, 1)
    scriptsBtn.BorderSizePixel = 0
    scriptsBtn.Visible = false

    -- Eventos dos botões de navegação (exemplo)
    sobreBtn.MouseButton1Click:Connect(function()
        for _, section in pairs(Sections) do
            section.Visible = false
        end
        SobreSection.Visible = true
        -- Atualizar aparência dos botões
        sobreBtn.BackgroundColor3 = CONFIG.COR_PRINCIPAL
        scriptsBtn.BackgroundColor3 = CONFIG.COR_TERCIARIA
    end)
    scriptsBtn.MouseButton1Click:Connect(function()
        for _, section in pairs(Sections) do
            section.Visible = false
        end
        ScriptsSection.Visible = true
        -- Atualizar aparência dos botões
        scriptsBtn.BackgroundColor3 = CONFIG.COR_PRINCIPAL
        sobreBtn.BackgroundColor3 = CONFIG.COR_TERCIARIA
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
        -- Aqui você pode adicionar um botão flutuante se quiser
    end)

    -- Finalizar parentagem
    Topbar.Parent = MainFrame
    Title.Parent = Topbar
    MinimizeButton.Parent = Topbar
    CloseButton.Parent = Topbar

    ContentContainer.Parent = MainFrame

    SobreSection.Parent = ContentContainer
    Saudacao.Parent = SobreSection
    Avatar.Parent = SobreSection
    InfoFrame.Parent = SobreSection
    InfoText.Parent = InfoFrame

    ScriptsSection.Parent = ContentContainer
    ScriptsScroll.Parent = ScriptsSection
    -- ScriptsLayout já foi parentado

    -- sobreBtn.Parent = ScreenGui -- Descomente se quiser mostrar os botões de navegação
    -- scriptsBtn.Parent = ScreenGui

    MainFrame.Parent = ScreenGui
    ScreenGui.Parent = game.CoreGui

    -- Animação de entrada
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    local tween = TweenService:Create(MainFrame, TweenInfo.new(0.5), {Size = UDim2.new(0, 700, 0, 500)})
    tween:Play()

    -- Tornar a janela arrastável (função melhorada)
    local function MakeDraggable(guiObject)
        local dragging
        local dragInput
        local dragStart
        local startPos

        local function update(input)
            local delta = input.Position - dragStart
            guiObject.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end

        guiObject.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = guiObject.Position

                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)

        guiObject.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if input == dragInput and dragging then
                update(input)
            end
        end)
    end

    MakeDraggable(MainFrame)
end

-- Iniciar
CriarJanelaAviso()
