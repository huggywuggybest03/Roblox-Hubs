local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt"))()
local win = DiscordLib:Window("Break In 2 Troll")
local serv = win:Server("Uncle Pete", "")
local btns = serv:Channel("spam lmao")

local spam = false
local player = game.Players.LocalPlayer

btns:Toggle("Spam Messages", false, function(bool)
    spam = bool
end)

spawn(function()
    while true do
        if spam then
            local Events = game.ReplicatedStorage.Events
            Events:WaitForChild("GiveTool"):FireServer("Key")
        local key = player.Backpack:FindFirstChild("Key")
            if key then
                key.Parent = player.Character
                Events:WaitForChild("KeyEvent"):FireServer()
                if key.Parent == player.Character then
                    key:Destroy() -- Prevents inventory overclogging
                end
            end
        end
        wait(0.1)
    end
end)
