-- Mush1cora Script Hub v2.0 Premium - UI com Rayfield
-- Por Henry1911 (henry1911.fwh.is/mush1cora)

-- Configurações Premium
local CONFIG = {
    NOME_HUB = "mush1cora",
    VERSAO = "v2.0 Premium",
    COR_PRINCIPAL = Color3.fromRGB(170, 0, 0), -- Vermelho principal
    COR_SECUNDARIA = Color3.fromRGB(20, 20, 20), -- Fundo escuro
    COR_TERCIARIA = Color3.fromRGB(40, 40, 40), -- Elementos secundários
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

-- Carregar Rayfield
local RayfieldLibrary = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()

-- Notificação inicial
RayfieldLibrary:Notify({
   Title = CONFIG.NOME_HUB,
   Content = "Abraço do henry1911!",
   Duration = 5,
   Image = 6726285816,
   Actions = {
      Ignore = {
         Name = "Fechar",
         Callback = function()
         end
      },
   },
})

-- Criar a janela principal
local Window = RayfieldLibrary:CreateWindow({
   Name = CONFIG.NOME_HUB .. " | " .. CONFIG.VERSAO,
   LoadingTitle = "Carregando...",
   LoadingSubtitle = "por Henry1911",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "mush1cora_hub_config"
   },
   KeySystem = false,
})

-- Tab Início
local MainTab = Window:CreateTab("🏠 Início", 4483362458) -- Ícone de casa

-- Seção Principal
local MainSection = MainTab:CreateSection("Principal")

-- Saudação
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
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

MainTab:CreateLabel({Name = GetSaudacao() .. ", " .. LocalPlayer.DisplayName})
MainTab:CreateLabel({Name = "Bem-vindo à " .. CONFIG.NOME_HUB .. " " .. CONFIG.VERSAO})

-- Avatar (opcional, pode ser complexo com Rayfield)
-- Seção de Informações
local InfoSection = MainTab:CreateSection("Informações")
MainTab:CreateLabel({Name = "• Scripts disponíveis: " .. #CONFIG.SCRIPTS})
MainTab:CreateLabel({Name = "• Atualizações automáticas"})
MainTab:CreateLabel({Name = "• Site oficial: " .. CONFIG.SITE_OFICIAL})
MainTab:CreateLabel({Name = "Desenvolvido com ❤️ por Henry1911"})

-- Tab Scripts
local ScriptsTab = Window:CreateTab("📜 Scripts", 4483362458) -- Ícone de lista

-- Seção de Scripts
local ScriptsSection = ScriptsTab:CreateSection("Executar Scripts")

-- Criar botões para cada script
for nome, url in pairs(CONFIG.SCRIPTS) do
    ScriptsTab:CreateButton({
        Name = nome,
        Callback = function()
            RayfieldLibrary:Notify({
                Title = "Script Executado",
                Content = "Iniciando " .. nome .. "...",
                Duration = 3,
                Image = 6726285816,
                Actions = {
                    Ignore = {
                        Name = "Ok!",
                        Callback = function()
                            -- Notificação fechada
                        end
                    },
                },
            })
            -- Adicionar um pequeno atraso para a notificação aparecer
            task.spawn(function()
                loadstring(game:HttpGet(url, true))()
            end)
        end,
    })
end

-- Tab Configurações (opcional)
local ConfigTab = Window:CreateTab("⚙️ Configurações", 4483362458) -- Ícone de engrenagem

local ConfigSection = ConfigTab:CreateSection("Configurações da Hub")

ConfigTab:CreateToggle({
    Name = "Notificações",
    CurrentValue = true,
    Flag = "Notifications",
    Callback = function(Value)
        -- Aqui você pode adicionar lógica para desativar/ativar notificações
        print("Notificações:", Value)
    end,
})

ConfigTab:CreateButton({
    Name = "Verificar Atualizações",
    Callback = function()
        RayfieldLibrary:Notify({
            Title = "Verificação",
            Content = "Última versão: " .. CONFIG.VERSAO,
            Duration = 5,
            Image = 6726285816,
            Actions = {
                Ignore = {
                    Name = "Ok!",
                    Callback = function()
                    end
                },
            },
        })
    end,
})

ConfigTab:CreateButton({
    Name = "Fechar Hub",
    Callback = function()
        RayfieldLibrary:Destroy() -- Fecha a Rayfield e todos os elementos
    end,
})

-- Som de inicialização (tentativa)
pcall(function()
    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. CONFIG.SOUND_STARTUP
    sound.Volume = 1
    sound.Parent = game:GetService("SoundService") or workspace
    sound:Play()
    game:GetService("Debris"):AddItem(sound, sound.TimeLength)
end)
