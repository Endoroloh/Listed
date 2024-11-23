-- URL yang valid untuk repository Anda
local validUrl = "https://raw.githubusercontent.com/Scoverk1/GG/main/gg.lua"

-- Fungsi untuk memeriksa apakah URL yang digunakan valid
local function isValidUrl(url)
    return url == validUrl
end

-- Fungsi untuk memuat skrip dengan pengecekan URL
local function loadScript(url)
    if isValidUrl(url) then
        return loadstring(game:HttpGet(url))()
    else
        warn("Skrip ini tidak dapat dijalankan karena berasal dari sumber yang tidak valid.")
        return nil
    end
end

-- Memuat skrip utama hanya jika URL valid
local script = loadScript("https://raw.githubusercontent.com/Scoverk1/GG/main/gg.lua")
if script then
    -- Lanjutkan dengan skrip yang valid
    local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
    local PhantomForcesWindow = Library:NewWindow("FTN By Skiddo")

    -- Fungsi utilitas untuk membuat tombol
    local function createButton(section, name, reward)
        section:CreateButton(name, function()
            local A_1 = name
            local A_2 = "Normal"
            local A_3 = game:GetService("ReplicatedStorage").Rewards[reward].Normal
            local Event = game:GetService("ReplicatedStorage").RewardsRE
            Event:FireServer(A_1, A_2, A_3)
        end)
    end

    -- Seksi 1: Rejoin Server
    local RejoinSection = PhantomForcesWindow:NewSection("Rejoin Server")
    RejoinSection:CreateButton("Rejoin", function()
        local placeId = game.PlaceId
        game:GetService("ReplicatedStorage").Teleport:FireServer(placeId)
    end)

    -- Fungsi untuk memuat data packs dari GitHub
    local function loadPacksFromGitHub()
        local url = "https://raw.githubusercontent.com/Endoroloh/Listed/main/packs.json"  -- Ganti dengan URL file GitHub Anda
        local rawData = game:HttpGet(url)  -- Mengunduh data dari GitHub
        local packs = game:GetService("HttpService"):JSONDecode(rawData)  -- Mengonversi JSON menjadi tabel Lua
        return packs
    end

    -- Memuat data packs dari GitHub
    local packs = loadPacksFromGitHub()

    -- Membuat tiap pack dan tombolnya sesuai urutan yang diinginkan
    local packOrder = {"Pack 1", "Pack 2", "Pack 3", "Pack 4", "Pack 5"}

    for _, packName in ipairs(packOrder) do
        local section = PhantomForcesWindow:NewSection(packName)
        for _, button in ipairs(packs[packName]) do
            createButton(section, button[1], button[2])
        end
    end
else
    -- Jika skrip tidak valid, hentikan eksekusi
    return
end
