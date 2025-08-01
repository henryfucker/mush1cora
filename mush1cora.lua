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

local function getAvatarThumbnail(userId)
    local success, result = pcall(function()
        return game:GetService("Players"):GetUserThumbnailAsync(userId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
    end)
    if success and result then
        return result
    else
        -- Return a default image or rbxthumb link if failed
        return "rbxthumb://type=AvatarHeadShot&id="..tostring(userId).."&w=420&h=420"
    end
end

-- // About Tab Content
local greetingLabel = AboutSection:NewLabel(getGreeting() .. ", " .. LocalPlayer.DisplayName .. "!")

-- Avatar Image (Add it to the section's parent frame)
local avatarImageLabel = Instance.new("ImageLabel")
avatarImageLabel.Name = "UserAvatar"
avatarImageLabel.Size = UDim2.new(0, 100, 0, 100)
avatarImageLabel.Position = UDim2.new(0, 10, 0, 10) -- Adjust position as needed within the section
avatarImageLabel.BackgroundTransparency = 1
avatarImageLabel.Image = getAvatarThumbnail(LocalPlayer.UserId)
avatarImageLabel.Parent = AboutSection.SectionFrame -- Add directly to the section's frame

-- Info Text Labels
local infoTextLabel = InfoSection:NewLabel("Versão: 1.0.0")
local scriptCountLabel = InfoSection:NewLabel("Scripts disponíveis: Carregando...")
local updatesLabel = InfoSection:NewLabel("Verificar atualizações: https://henry1911.ct.ws/mush1cora")
local descriptionLabel = InfoSection:NewLabel("Hub de scripts para Brookhaven RP.")
local updatesNoteLabel = InfoSection:NewLabel("As atualizações são diretas, não é necessário mudar o link do script.")

-- // Changelog Section
ChangelogSection:NewLabel("- Versão inicial da mush1cora Hub.")
ChangelogSection:NewLabel("- Adicionados vários scripts para Brookhaven RP.")

-- // Settings Tab Content
local ToggleUIButton = SettingsSection:NewButton("Alternar Visibilidade da GUI", "Esconde ou mostra a GUI", function()
    KavoUi:ToggleUI()
end)

-- // Movable Toggle Button
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Mush1coraToggleButton"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")

local ToggleButton = Instance.new("TextButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Size = UDim2.new(0, 120, 0, 30)
ToggleButton.Position = UDim2.new(0.5, -60, 0.9, 0) -- Centered horizontally, bottom
ToggleButton.Text = "Mostrar/Esconder Hub"
ToggleButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BorderSizePixel = 0
ToggleButton.ZIndex = 10
ToggleButton.Parent = ScreenGui

-- // Make Toggle Button Draggable
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

-- // Make Main Hub Window Draggable
-- Find the main Kavo UI ScreenGui and the main frame
spawn(function()
    wait(1) -- Wait a bit for the UI to be fully created
    local kavoScreenGui = CoreGui:FindFirstChild("kavo-ui-library")
    if kavoScreenGui then
        local mainFrame = kavoScreenGui:FindFirstChild("Main")
        if mainFrame and mainFrame:FindFirstChild("Bar") then
            local dragBar = mainFrame.Bar

            local mainDragging
            local mainDragInput
            local mainDragStart
            local mainStartPos

            local function updateMain(input)
                local delta = input.Position - mainDragStart
                mainFrame.Position = UDim2.new(mainStartPos.X.Scale, mainStartPos.X.Offset + delta.X, mainStartPos.Y.Scale, mainStartPos.Y.Offset + delta.Y)
            end

            dragBar.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    mainDragging = true
                    mainDragStart = input.Position
                    mainStartPos = mainFrame.Position

                    input.Changed:Connect(function()
                        if input.UserInputState == Enum.UserInputState.End then
                            mainDragging = false
                        end
                    end)
                end
            end)

            dragBar.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    mainDragInput = input
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if input == mainDragInput and mainDragging then
                    updateMain(input)
                end
            end)
        end
    end
end)

-- // Script Execution Logic
local scripts = {
    {
        name = "Soluna",
        loadstring_code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Patheticcs/Soluna-API/refs/heads/main/brookhaven.lua", true))()'
    },
    {
        name = "XXXOMER12345678",
        loadstring_code = 'loadstring(game:HttpGet("https://pastebin.com/raw/LCmR8qkj"))()'
    },
    {
        name = "FHub",
        loadstring_code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/OpenSourceEngine/Script/refs/heads/main/Brookhaven.lua"))()'
    },
    {
        name = "IceHub",
        loadstring_code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Waza80/scripts-new/main/IceHubBrookhaven.lua"))()'
    },
    {
        name = "Sander XY (Bypass Deluxe)",
        loadstring_code = 'loadstring(game:HttpGet("https://raw.githubusercontent.com/TrollGuiMaker/epic-sander-bypass/refs/heads/main/sander%20is%20a%20skid"))()'
    }
}

-- // Add scripts to the GUI
for _, scriptData in ipairs(scripts) do
    ScriptsSection:NewButton(scriptData.name, "", function()
        -- // Confirmation before execution (using native Roblox prompt or Kavo notification if available)
        -- Using a simple Spawn to prevent blocking the UI thread during potential long load times
        spawn(function()
            local success, result = pcall(function()
                -- Attempt to use SetCore notification if possible
                StarterGui:SetCore("SendNotification", {
                    Title = "Confirmar Execução";
                    Text = "Executar o script " .. scriptData.name .. "?";
                    Icon = "";
                    Duration = 5;
                    Callback = function(buttonText)
                        if buttonText == "OK" or buttonText == 1 then -- OK button
                            -- // Execute the script
                            loadstring(scriptData.loadstring_code)()
                        end
                    end;
                    Button1 = "OK";
                    Button2 = "Cancelar";
                })
            end)

            if not success then
                -- Fallback if SetCore fails (e.g., not supported by executor)
                -- Just execute directly or use a print statement for confirmation in console
                -- For now, let's just execute with a warning print
                warn("Não foi possível mostrar notificação de confirmação. Executando script diretamente: " .. scriptData.name)
                loadstring(scriptData.loadstring_code)()
            end
        end)
    end)
end

-- // Update Script Count
spawn(function()
    -- // Simulate fetching script count (replace with actual logic if needed)
    wait(2) -- Simulate delay
    scriptCountLabel:UpdateLabel("Scripts disponíveis: " .. #scripts)
end)

-- // Ensure the main hub GUI is visible after loading
-- Kavo UI usually shows by default after creation.
