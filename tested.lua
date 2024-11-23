local url1 = "https://raw.githubusercontent.com/Scoverk1/GG/main/gg.lua"
local url2 = "https://raw.githubusercontent.com/Endoroloh/Listed/main/ex.lua"

-- Mengambil skrip pertama
local response = game:HttpGet(url1)

-- Mengecek apakah skrip pertama valid (misalnya, jika skrip pertama ditemukan dan valid)
if response then
    -- Memanggil skrip pertama
    loadstring(response)()
    
    -- Panggil skrip kedua
    loadstring(game:HttpGet(url2))()
else
    -- Jika bukan skrip pertama, tampilkan pesan error
    print("harap coba lagi")
end
