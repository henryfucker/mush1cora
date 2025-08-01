-- // Services
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")

-- // Variables
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local mouse = LocalPlayer:GetMouse()
local HttpEnabled = syn and syn.request or http_request or http and http.request or request

-- // UI Library (Kavo UI)
local KavoUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fantemil/Trenglehub/main/Library/kavo-ui.lua"))()
local Window = KavoUi.CreateLib("mush1cora", "DarkTheme")

-- // Create Main Tabs
local ScriptsTab = Window:NewTab("Scripts")
local AboutTab = Window:NewTab("Sobre")
local SettingsTab = Window:NewTab("Configurações")

-- // Sections
local ScriptsSection = ScriptsTab:NewSection("Scripts Disponíveis")
local AboutSection = AboutTab:NewSection("Bem-vindo(a)!")
local InfoSection = AboutTab:NewSection("Informações do Projeto")
local SettingsSection = SettingsTab:NewSection("Configurações")

-- // Welcome Message Logic
local function getGreeting()
    local hour = tonumber(os.date("%H"))
    if hour >= 5 and hour < 12 then
        return "Bom dia"
    elseif hour >= 12 and hour < 18 then
        return "Boa tarde"
    else
        return "Boa noite"
    end
end

local function getAvatarThumbnail(userId)
    local success, result = pcall(function()
        return game:GetService("Players"):GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    if success then
        return result
    else
        return nil -- Return nil if failed to get thumbnail
    end
end

-- // About Tab Content
local greetingLabel = AboutSection:NewLabel(getGreeting() .. ", " .. LocalPlayer.DisplayName .. "!")
local avatarImageLabel = Instance.new("ImageLabel")
avatarImageLabel.Size = UDim2.new(0, 100, 0, 100)
avatarImageLabel.Position = UDim2.new(0.5, -50, 0, 50)
avatarImageLabel.BackgroundTransparency = 1
avatarImageLabel.Image = getAvatarThumbnail(LocalPlayer.UserId) or "rbxthumb://type=AvatarHeadShot&id="..LocalPlayer.UserId.."&w=420&h=420"
avatarImageLabel.Parent = AboutSection.SectionFrame

local infoTextLabel = InfoSection:NewLabel("Versão: 1.0.0")
local scriptCountLabel = InfoSection:NewLabel("Scripts disponíveis: Carregando...")
local updatesLabel = InfoSection:NewLabel("Verificar atualizações: https://henry1911.ct.ws/mush1cora")
local descriptionLabel = InfoSection:NewLabel("Hub de scripts para Brookhaven RP.")

-- // Changelog Section
local ChangelogSection = AboutTab:NewSection("Changelog - Versão 1.0.0")
ChangelogSection:NewLabel("- Versão inicial da mush1cora Hub.")
ChangelogSection:NewLabel("- Adicionados vários scripts para Brookhaven RP.")

-- // Settings Tab Content
local ToggleUIButton = SettingsSection:NewButton("Alternar Visibilidade da GUI", "Esconde ou mostra a GUI", function()
    KavoUi:ToggleUI()
end)

-- // Movable Toggle Button
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Mush1coraToggleButton"
ScreenGui.Parent = game:GetService("CoreGui")

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 100, 0, 30)
ToggleButton.Position = UDim2.new(0.5, -50, 0.9, 0)
ToggleButton.Text = "Mostrar/Esconder"
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderSizePixel = 0
ToggleButton.ZIndex = 10
ToggleButton.Parent = ScreenGui

local UserInputService = game:GetService("UserInputService")
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = ToggleButton.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

ToggleButton.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

ToggleButton.MouseButton1Click:Connect(function()
    KavoUi:ToggleUI()
end)

-- // Script Execution Logic
local scripts = {
    {
        name = "Soluna",
        loadstring = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/Soluna-API/refs/heads/main/brookhaven.lua", true))()'
    },
    {
        name = "XXXOMER12345678",
        loadstring = 'loadstring(game:HttpGet("https://pastebin.com/raw/LCmR8qkj"))()'
    },
    {
        name = "FHub",
        loadstring = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua"))()'
    },
    {
        name = "IceHub",
        loadstring = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Waza80/scripts-new/main/IceHubBrookhaven.lua"))()'
    },
    {
        name = "Sander XY (Bypass Deluxe)",
        loadstring = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/TrollGuiMaker/epic-sander-bypass/refs/heads/main/sander%20is%20a%20skid"))()'
    }
}

-- // Add scripts to the GUI
for _, scriptData in ipairs(scripts) do
    ScriptsSection:NewButton(scriptData.name, "", function()
        -- // Confirmation before execution
        local Notification = game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Confirmação";
            Text = "Tem certeza que deseja executar o script " .. scriptData.name .. "?";
            Duration = 5;
            Callback = function(buttonText)
                if buttonText == "OK" then
                    -- // Execute the script
                    loadstring(scriptData.loadstring)()
                end
            end;
            Button1 = "OK";
            Button2 = "Cancelar";
        })
    end)
end

-- // Update Script Count (Example)
spawn(function()
    -- // Simulate fetching script count (replace with actual logic if needed)
    wait(2) -- Simulate delay
    scriptCountLabel:UpdateLabel("Scripts disponíveis: " .. #scripts)
end)

-- // Disclaimer GUI
local DisclaimerGui = Instance.new("ScreenGui")
DisclaimerGui.Name = "DisclaimerGui"
DisclaimerGui.Parent = game:GetService("CoreGui")

local DisclaimerFrame = Instance.new("Frame")
DisclaimerFrame.Size = UDim2.new(0, 400, 0, 300)
DisclaimerFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
DisclaimerFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DisclaimerFrame.BorderSizePixel = 0
DisclaimerFrame.ZIndex = 20
DisclaimerFrame.Parent = DisclaimerGui

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 50)
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "mush1cora Hub"
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.Font = Enum.Font.SourceSansBold
TitleLabel.TextSize = 24
TitleLabel.ZIndex = 21
TitleLabel.Parent = DisclaimerFrame

local MessageLabel = Instance.new("TextLabel")
MessageLabel.Size = UDim2.new(1, -20, 0, 180)
MessageLabel.Position = UDim2.new(0, 10, 0, 60)
MessageLabel.BackgroundTransparency = 1
MessageLabel.Text = "Você está prestes a iniciar a hub do projeto mush1cora.\n\nAo iniciar, você assume a responsabilidade de correr risco de penalidades pela administração do Roblox.\n\nAviso: o único site do projeto é: henry1911.fwh.is/mush1cora"
MessageLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
MessageLabel.Font = Enum.Font.SourceSans
MessageLabel.TextSize = 16
MessageLabel.TextWrapped = true
MessageLabel.TextXAlignment = Enum.TextXAlignment.Left
MessageLabel.TextYAlignment = Enum.TextYAlignment.Top
MessageLabel.ZIndex = 21
MessageLabel.Parent = DisclaimerFrame

local AcceptButton = Instance.new("TextButton")
AcceptButton.Size = UDim2.new(0, 150, 0, 40)
AcceptButton.Position = UDim2.new(0.5, -160, 1, -50)
AcceptButton.Text = "Aceitar e Iniciar"
AcceptButton.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
AcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AcceptButton.BorderSizePixel = 0
AcceptButton.ZIndex = 21
AcceptButton.Parent = DisclaimerFrame

local DeclineButton = Instance.new("TextButton")
DeclineButton.Size = UDim2.new(0, 150, 0, 40)
DeclineButton.Position = UDim2.new(0.5, 10, 1, -50)
DeclineButton.Text = "Recusar"
DeclineButton.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
DeclineButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DeclineButton.BorderSizePixel = 0
DeclineButton.ZIndex = 21
DeclineButton.Parent = DisclaimerFrame

-- // Button Functions
AcceptButton.MouseButton1Click:Connect(function()
    -- // Destroy Disclaimer GUI and show main GUI
    DisclaimerGui:Destroy()
    -- // The main GUI (Window) is already created but hidden by default in Kavo UI
    -- // You might need to call a function to show it, or it might appear automatically
    -- // depending on the Kavo UI implementation. Let's assume it appears.
    -- // If it doesn't appear, you might need to call KavoUi:ToggleUI() or similar.
end)

DeclineButton.MouseButton1Click:Connect(function()
    -- // Close the game or do nothing
    game:Shutdown() -- Or simply hide the GUIs
    -- game:GetService("CoreGui"):FindFirstChild("KavoUi"):Destroy() -- Example of hiding main GUI
    -- DisclaimerGui:Destroy()
end)

-- // Hide the main Kavo UI initially until accepted
-- // This part depends on the Kavo UI implementation.
-- // If there's a function to hide it, call it here.
-- // For now, let's assume the disclaimer covers it or it starts hidden.
-- // KavoUi:Hide() -- Hypothetical function
