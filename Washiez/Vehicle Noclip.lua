-- use kavo ui
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Hagey Exploits - Washiez Car Wash", "GrapeTheme")

local TrollTab = Window:NewTab("Trolls")
local TrollSection = TrollTab:NewSection("Trolling")

local dropdown = TrollSection:NewDropdown("Select Vehicle", "Choose a vehicle for noclip.", {}, function(selectedCarName)
    local car = game.Workspace.SpawnedCars:FindFirstChild(game.Players.LocalPlayer.Name .. "-" .. selectedCarName)
    if car then
        local function disableCollision()
            for _, part in ipairs(car:GetDescendants()) do
                if part:IsA("BasePart") and not part.Name:match("Wheel") then
                    part.CanCollide = false -- Disables collisions allowing you to go through everything. Your charcter will still be collisioned so be careful.
                end
            end
        end
        disableCollision()
        print("Noclip enabled for:", selectedCarName)
    else
        print("Car not found:", selectedCarName)
    end
end)

local dropdownOptions = {}
local playerName = game.Players.LocalPlayer.Name

for _, car in ipairs(game.Workspace.SpawnedCars:GetChildren()) do
    local playerNamePart, carModelPart = car.Name:match("^(.-)%-(.+)$") -- Match "PlayerName-CarModel"
    if playerNamePart == playerName then -- Match the player's name with the car owner
        table.insert(dropdownOptions, carModelPart) -- Add only the car model to the dropdown
    end
end

-- refreshes every 5 secs
while wait(5) do
    dropdown:Refresh(dropdownOptions)
end
