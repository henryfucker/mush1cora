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

-- // UI Library (Kavo UI) - Load it first for the disclaimer
local KavoDisclaimer = loadstring(game:HttpGet("https://raw.githubusercontent.com/Fantemil/Trenglehub/main/Library/kavo-ui.lua"))()
local DisclaimerWindow = KavoDisclaimer.CreateLib("Disclaimer", "DarkTheme")

-- // Disclaimer GUI Logic using Kavo UI
local DisclaimerTab = DisclaimerWindow:NewTab("Aviso")
local DisclaimerSection = DisclaimerTab:NewSection("Aviso Importante")

DisclaimerSection:NewLabel("Você está prestes a iniciar a hub do projeto mush1cora.")
DisclaimerSection:NewLabel("")
DisclaimerSection:NewLabel("Ao iniciar, você assume a responsabilidade de correr risco de penalidades pela administração do Roblox.")
DisclaimerSection:NewLabel("")
DisclaimerSection:NewLabel("Aviso: o único site do projeto é:")
DisclaimerSection:NewLabel("henry1911.fwh.is/mush1cora")
DisclaimerSection:NewLabel("")
DisclaimerSection:NewLabel("As atualizações são diretas, não é necessário mudar o link do script.")

local DisclaimerAccepted = false

local AcceptButton = DisclaimerSection:NewButton("ACEITAR E INICIAR HUB", "", function()
    DisclaimerAccepted = true
    -- Close the disclaimer window
    -- Note: Kavo UI doesn't seem to have a direct 'Close' or 'Destroy' for the whole window.
    -- We'll hide the GUI elements or destroy them.
    -- Let's try to destroy the underlying GUI.
    pcall(function()
        -- The Kavo UI creates a ScreenGui named 'kavo-ui-library'
        local kavoGui = CoreGui:FindFirstChild("kavo-ui-library")
        if kavoGui then
            kavoGui:Destroy()
        end
    end)
    -- Now proceed to load the main hub
    loadMainHub()
end)

local DeclineButton = DisclaimerSection:NewButton("RECUSAR", "", function()
    game:Shutdown() -- Or simply do nothing / close the script
end)

-- Function to load the main hub after disclaimer
local function loadMainHub()
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
    
    -- Create a frame to hold the avatar and info side-by-side if needed, or just add ImageLabel directly
    -- For simplicity with Kavo, we'll add the ImageLabel and then text labels.
    -- Kavo doesn't easily support complex layouts, so we'll place them sequentially.
    
    -- Avatar Image (Add it to the section's parent frame)
    local avatarImageLabel = Instance.new("ImageLabel")
    avatarImageLabel.Name = "UserAvatar"
    avatarImageLabel.Size = UDim2.new(0, 100, 0, 100)
    avatarImageLabel.Position = UDim2.new(0, 10, 0, 10) -- Adjust position as needed within the section
    avatarImageLabel.BackgroundTransparency = 1
    avatarImageLabel.Image = getAvatarThumbnail(LocalPlayer.UserId)
    avatarImageLabel.Parent = AboutSection.SectionFrame -- Add directly to the section's frame

    -- Info Text Labels (Position them below or next to the avatar)
    -- We'll place them below for now
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

    -- // Movable Toggle Button (Create after main UI is loaded)
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
    -- Kavo UI usually shows by default after creation, but let's make sure
    -- If there's a toggle state, ensure it's shown.
    -- There isn't a direct "Show" function, but ToggleUI will show if hidden.
    -- Since we just created it, it should be visible. If not, uncomment below.
    -- KavoUi:ToggleUI() -- This would hide it if visible, show if hidden. We assume it starts visible.
end

-- The script starts by showing the disclaimer window.
-- The main hub will be loaded inside the AcceptButton callback.
