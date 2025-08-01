-- // Services
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- // Variables
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local mouse = LocalPlayer:GetMouse()
local HttpEnabled = syn and syn.request or http_request or http and http.request or request

-- // UI Library (Kavo UI) for Main Hub
local KavoUi = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fantemil/Trenglehub/main/Library/kavo-ui.lua"))()
local Window = KavoUi.CreateLib("mush1cora", "DarkTheme")

-- // Create Tabs (About first)
local AboutTab = Window:NewTab("Sobre")
local ScriptsTab = Window:NewTab("Scripts")
local SettingsTab = Window:NewTab("Configurações")

-- // Sections
local AboutSection = AboutTab:NewSection("Bem-vindo(a)!")
local InfoSection = AboutTab:NewSection("Informações do Projeto")
local ChangelogSection = AboutTab:NewSection("Changelog - Versão 1.0.0")
local ScriptsSection = ScriptsTab:NewSection("Scripts Disponíveis")
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

-- // About Tab Content
AboutSection:NewLabel(getGreeting() .. ", " .. LocalPlayer.DisplayName .. "!")

-- Botão para o site
local websiteButton = AboutSection:NewButton("Visitar Site Oficial", "Clique para copiar o link do site", function()
    local website = "https://henry1911.ct.ws/mush1cora"
    setclipboard(website)
    StarterGui:SetCore("SendNotification", {
        Title = "Link copiado!",
        Text = "O link do site foi copiado para sua área de transferência: "..website,
        Duration = 5
    })
end)

-- Info Text Labels
InfoSection:NewLabel("Versão: 1.0.0")
InfoSection:NewLabel("Scripts disponíveis: 5")
InfoSection:NewLabel("Descrição: Hub de scripts para Brookhaven RP")

-- Changelog
ChangelogSection:NewLabel("- Versão inicial da mush1cora Hub")
ChangelogSection:NewLabel("- Scripts otimizados para Brookhaven RP")
ChangelogSection:NewLabel("- Interface melhorada")

-- // Settings Tab Content
local ToggleUIButton = SettingsSection:NewButton("Alternar Visibilidade da GUI", "Esconde ou mostra a GUI", function()
    KavoUi:ToggleUI()
end)

-- // Movable Toggle Button
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Mush1coraToggleButton"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 120, 0, 30)
ToggleButton.Position = UDim2.new(0.5, -60, 0.9, 0)
ToggleButton.Text = "Mostrar/Esconder Hub"
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderSizePixel = 0
ToggleButton.ZIndex = 10
ToggleButton.Parent = ScreenGui

-- Make Toggle Button Draggable
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    ToggleButton.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

ToggleButton.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
    if input.UserInputType == Enum.UserInputType.MouseMovement then
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
        description = "Script avançado para Brookhaven",
        loadstring_code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/Soluna-API/refs/heads/main/brookhaven.lua", true))()'
    },
    {
        name = "XXXOMER12345678",
        description = "Bypass e funções úteis",
        loadstring_code = 'loadstring(game:HttpGet("https://pastebin.com/raw/LCmR8qkj"))()'
    },
    {
        name = "FHub",
        description = "Hub completo para Brookhaven",
        loadstring_code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua"))()'
    },
    {
        name = "IceHub",
        description = "Script leve e eficiente",
        loadstring_code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Waza80/scripts-new/main/IceHubBrookhaven.lua"))()'
    },
    {
        name = "Sander XY (Bypass Deluxe)",
        description = "Bypass avançado para Brookhaven",
        loadstring_code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/TrollGuiMaker/epic-sander-bypass/refs/heads/main/sander%20is%20a%20skid"))()'
    }
}

-- // Add scripts to the GUI with confirmation
for _, scriptData in ipairs(scripts) do
    ScriptsSection:NewButton(scriptData.name, scriptData.description, function()
        local confirmation = Instance.new("ScreenGui")
        confirmation.Name = "ScriptConfirmation"
        confirmation.Parent = CoreGui
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 300, 0, 150)
        frame.Position = UDim2.new(0.5, -150, 0.5, -75)
        frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        frame.BorderSizePixel = 0
        frame.Parent = confirmation
        
        local textLabel = Instance.new("TextLabel")
        textLabel.Size = UDim2.new(1, 0, 0.6, 0)
        textLabel.Position = UDim2.new(0, 0, 0, 0)
        textLabel.BackgroundTransparency = 1
        textLabel.Text = "Deseja executar o script:\n"..scriptData.name.."?"
        textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel.TextWrapped = true
        textLabel.Parent = frame
        
        local yesButton = Instance.new("TextButton")
        yesButton.Size = UDim2.new(0.4, 0, 0.3, 0)
        yesButton.Position = UDim2.new(0.05, 0, 0.65, 0)
        yesButton.Text = "Sim"
        yesButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        yesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        yesButton.Parent = frame
        
        local noButton = Instance.new("TextButton")
        noButton.Size = UDim2.new(0.4, 0, 0.3, 0)
        noButton.Position = UDim2.new(0.55, 0, 0.65, 0)
        noButton.Text = "Não"
        noButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        noButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        noButton.Parent = frame
        
        yesButton.MouseButton1Click:Connect(function()
            confirmation:Destroy()
            loadstring(scriptData.loadstring_code)()
        end)
        
        noButton.MouseButton1Click:Connect(function()
            confirmation:Destroy()
        end)
    end)
end

-- // Make the main window movable
local kavoScreenGui = CoreGui:FindFirstChild("kavo-ui-library")
if kavoScreenGui then
    local mainFrame = kavoScreenGui:FindFirstChild("Main")
    if mainFrame then
        local dragBar = mainFrame:FindFirstChild("Bar")
        
        if dragBar then
            local dragging, dragInput, dragStart, startPos
            
            local function update(input)
                local delta = input.Position - dragStart
                mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
            
            dragBar.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
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
            
            dragBar.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement then
                    dragInput = input
                end
            end)
            
            UserInputService.InputChanged:Connect(function(input)
                if input == dragInput and dragging then
                    update(input)
                end
            end)
        end
    end
end

-- Notification when loaded
StarterGui:SetCore("SendNotification", {
    Title = "mush1cora Hub",
    Text = "Hub carregado com sucesso!",
    Duration = 5
})
