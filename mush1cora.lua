-- // Mush1Cora Hub - Script Hub Premium para Brookhaven
-- // Desenvolvido com base em Hyperlib, estilizado como terminal
-- // Autor: Mush1Cora | Baseado em autorização educacional
-- // Versão: 1.0.0

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local SoundService = game:GetService("SoundService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:FindService("UserInputService") or game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
while not LocalPlayer.Character or not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") do
    wait()
end

-- // Configurações
getgenv().Mush1CoraConfig = {
    Version = "1.0.0",
    Changelog = "• Primeira versão lançada\n• Todos os scripts integrados\n• Interface terminal aprimorada\n• Sistema de avatar e saudação",
    ScriptsCount = 5,
    OfficialSite = "https://henry1911.fwh.is/mush1cora",
    GitHubRepo = "https://github.com/henry1911/mush1cora", -- opcional
    WarnMessage = "Você está prestes a usar uma script hub. Isso pode violar as diretrizes do Roblox. Prossiga por sua conta e risco.",
    Scripts = {
        { Name = "Soluna", Script = 'https://raw.githubusercontent.com/Patheticcs/Soluna-API/refs/heads/main/brookhaven.lua' },
        { Name = "XXXOMER12345678", Script = 'https://pastebin.com/raw/LCmR8qkj' },
        { Name = "FHub", Script = 'https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua' },
        { Name = "IceHub", Script = 'https://raw.githubusercontent.com/Waza80/scripts-new/main/IceHubBrookhaven.lua' },
        { Name = "Sander XY (Deluxe Bypass)", Script = 'https://raw.githubusercontent.com/TrollGuiMaker/epic-sander-bypass/refs/heads/main/sander%20is%20a%20skid' }
    }
}

-- // Verifica se já está rodando
if getgenv().Mush1CoraLoaded then
    warn("Mush1Cora Hub já está carregada.")
    return
end
getgenv().Mush1CoraLoaded = true

-- // Saudação com base no horário
local function getSaudacao()
    local hora = os.date("%H")
    if hora < 6 then return "Boa madrugada" end
    if hora < 12 then return "Bom dia" end
    if hora < 18 then return "Boa tarde" end
    return "Boa noite"
end

-- // Carrega UI Library (Kavo UI ou Rayfield simulado)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Kavo%20UI%20Library.lua"))()
local Window = Library.CreateLib("Mush1Cora Hub v" .. getgenv().Mush1CoraConfig.Version, "DarkTheme")

-- // Fonte de terminal
local TerminalFont = Enum.Font.Code

-- // Som de Windows 95 (base64 para evitar dependência)
local Windows95Sound = Instance.new("Sound")
Windows95Sound.SoundId = "rbxassetid://160301849" -- Som de startup do Windows 95
Windows95Sound.Parent = SoundService
Windows95Sound.Volume = 1

-- // Janela de confirmação inicial
local ConfirmFrame = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Desc = Instance.new("TextLabel")
local Warn = Instance.new("TextLabel")
local Site = Instance.new("TextLabel")
local ConfirmBtn = Instance.new("TextButton")
local ExitBtn = Instance.new("TextButton")

ConfirmFrame.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ConfirmFrame.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- // Estilo da janela de confirmação
Frame.Size = UDim2.new(0, 500, 0, 300)
Frame.Position = UDim2.new(0.5, -250, 0.5, -150)
Frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Frame.BorderSizePixel = 2
Frame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Frame.Parent = ConfirmFrame

Title.Text = "Mush1Cora Hub"
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = TerminalFont
Title.TextSize = 24
Title.Parent = Frame

Desc.Text = "Você está prestes a iniciar a Mush1Cora Script Hub.\nEsta ferramenta é de uso educacional."
Desc.Size = UDim2.new(1, -20, 0, 60)
Desc.Position = UDim2.new(0, 10, 0, 60)
Desc.BackgroundTransparency = 1
Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
Desc.Font = TerminalFont
Desc.TextSize = 14
Desc.TextWrapped = true
Desc.Parent = Frame

Warn.Text = getgenv().Mush1CoraConfig.WarnMessage
Warn.Size = UDim2.new(1, -20, 0, 40)
Warn.Position = UDim2.new(0, 10, 0, 120)
Warn.BackgroundTransparency = 1
Warn.TextColor3 = Color3.fromRGB(255, 100, 100)
Warn.Font = TerminalFont
Warn.TextSize = 12
Warn.TextWrapped = true
Warn.Parent = Frame

Site.Text = "Site oficial: " .. getgenv().Mush1CoraConfig.OfficialSite
Site.Size = UDim2.new(1, -20, 0, 30)
Site.Position = UDim2.new(0, 10, 0, 160)
Site.BackgroundTransparency = 1
Site.TextColor3 = Color3.fromRGB(0, 150, 255)
Site.Font = TerminalFont
Site.TextSize = 12
Site.Parent = Frame

ConfirmBtn.Text = "INICIAR HUB"
ConfirmBtn.Size = UDim2.new(0, 200, 0, 40)
ConfirmBtn.Position = UDim2.new(0.5, -205, 0, 220)
ConfirmBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ConfirmBtn.BorderSizePixel = 1
ConfirmBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
ConfirmBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
ConfirmBtn.Font = TerminalFont
ConfirmBtn.TextSize = 16
ConfirmBtn.Parent = Frame

ExitBtn.Text = "SAIR"
ExitBtn.Size = UDim2.new(0, 200, 0, 40)
ExitBtn.Position = UDim2.new(0.5, 5, 0, 220)
ExitBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
ExitBtn.BorderSizePixel = 1
ExitBtn.BorderColor3 = Color3.fromRGB(255, 0, 0)
ExitBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
ExitBtn.Font = TerminalFont
ExitBtn.TextSize = 16
ExitBtn.Parent = Frame

-- // Eventos dos botões
ConfirmBtn.MouseButton1Click:Connect(function()
    Windows95Sound:Play()
    wait(Windows95Sound.TimeLength + 0.5)
    ConfirmFrame:Destroy()
    spawn(function()
        -- Inicia a hub principal
        createMainHub()
    end)
end)

ExitBtn.MouseButton1Click:Connect(function()
    ConfirmFrame:Destroy()
    warn("Usuário cancelou a execução da Mush1Cora Hub.")
end)

-- // Função principal da Hub
function createMainHub()
    -- // Obtém avatar do usuário
    local success, thumbnail = pcall(function()
        return game.Players:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48)
    end)
    local avatarUrl = success and thumbnail or "rbxasset://textures/ui/GuiImagePlaceholder.png"

    -- // Tabs
    local TabSobre = Window:NewTab("Sobre")
    local TabScripts = Window:NewTab("Scripts")
    local TabChangelog = Window:NewTab("Changelog")

    -- // === SEÇÃO SOBRE ===
    local SobreSection = TabSobre:NewSection("Sobre a Mush1Cora Hub")

    SobreSection:NewLabel(" ")
    SobreSection:NewLabel(getSaudacao() .. ", " .. LocalPlayer.DisplayName .. "!")

    -- // Avatar
    local AvatarFrame = Instance.new("ImageLabel")
    AvatarFrame.Size = UDim2.new(0, 64, 0, 64)
    AvatarFrame.Position = UDim2.new(0.5, -32, 0, 0)
    AvatarFrame.BackgroundTransparency = 1
    AvatarFrame.Image = avatarUrl
    AvatarFrame.BorderSizePixel = 2
    AvatarFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
    AvatarFrame.Parent = SobreSection:GetParentFrame()
    SobreSection:UpdatePadding(80)

    SobreSection:NewLabel(" ")
    SobreSection:NewLabel("Versão: " .. getgenv().Mush1CoraConfig.Version)
    SobreSection:NewLabel("Scripts Disponíveis: " .. getgenv().Mush1CoraConfig.ScriptsCount)
    SobreSection:NewLabel("Site Oficial: " .. getgenv().Mush1CoraConfig.OfficialSite)
    SobreSection:NewLabel("GitHub: " .. getgenv().Mush1CoraConfig.GitHubRepo)
    SobreSection:NewLabel(" ")
    SobreSection:NewLabel("Aviso: Atualizações são automáticas.")
    SobreSection:NewLabel("Não é necessário mudar o link do script.")

    -- // === SEÇÃO SCRIPTS ===
    local ScriptsSection = TabScripts:NewSection("Scripts do Brookhaven")

    for _, scriptData in ipairs(getgenv().Mush1CoraConfig.Scripts) do
        ScriptsSection:NewButton(scriptData.Name, "Executar script", function()
            spawn(function()
                pcall(function()
                    loadstring(game:HttpGet(scriptData.Script, true))()
                    StarterGui:SetCore("ChatMakeSystemMessage", {
                        Text = "[Mush1Cora] Script '" .. scriptData.Name .. "' carregado com sucesso!",
                        Color = Color3.fromRGB(0, 255, 0),
                        Font = TerminalFont,
                        FontSize = 18
                    })
                end)
            end)
        end)
    end

    -- // === SEÇÃO CHANGELOG ===
    local ChangelogSection = TabChangelog:NewSection("Changelog")
    ChangelogSection:NewLabel("Última Atualização (v" .. getgenv().Mush1CoraConfig.Version .. "):")
    for line in getgenv().Mush1CoraConfig.Changelog:gmatch("[^\r\n]+") do
        ChangelogSection:NewLabel("• " .. line)
    end

    -- // === BOTÃO FLUTUANTE PARA TOGGLE ===
    local FloatingButton = Instance.new("TextButton")
    FloatingButton.Text = "☰"
    FloatingButton.Size = UDim2.new(0, 40, 0, 40)
    FloatingButton.Position = UDim2.new(0, 10, 0, 10)
    FloatingButton.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    FloatingButton.BorderSizePixel = 1
    FloatingButton.BorderColor3 = Color3.fromRGB(255, 0, 0)
    FloatingButton.TextColor3 = Color3.fromRGB(255, 0, 0)
    FloatingButton.Font = TerminalFont
    FloatingButton.TextSize = 20
    FloatingButton.ZIndex = 10
    FloatingButton.Parent = game.Players.LocalPlayer.PlayerGui

    FloatingButton.MouseButton1Click:Connect(function()
        Library:ToggleUI()
        FloatingButton.Text = Library:WindowIsOpen() and "☰" or "▶"
    end)

    -- // TopBar personalizado (opcional: se quiser mais controle)
    local topBar = Window:GetFrame().Topbar
    topBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    topBar.Title.TextColor3 = Color3.fromRGB(255, 0, 0)
    topBar.Title.Font = TerminalFont

    -- // Aplicar fonte de terminal a todos os elementos
    for _, obj in ipairs(Window:GetFrame():GetDescendants()) do
        if obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
            obj.Font = TerminalFont
        end
    end

    -- // Notificação de boas-vindas
    StarterGui:SetCore("ChatMakeSystemMessage", {
        Text = "Bem-vindo à Mush1Cora Hub, " .. LocalPlayer.DisplayName .. "!",
        Color = Color3.fromRGB(255, 50, 50),
        Font = TerminalFont,
        FontSize = 24
    })

    -- // Aviso no chat
    task.delay(2, function()
        StarterGui:SetCore("ChatMakeSystemMessage", {
            Text = "Aviso: Esta hub é para fins educacionais. Use por sua conta e risco.",
            Color = Color3.fromRGB(255, 150, 0),
            Font = TerminalFont,
            FontSize = 14
        })
    end)
end

-- // Carregar automaticamente a janela de confirmação
-- (já está sendo exibida no início)
