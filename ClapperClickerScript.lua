local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Squex01/ClapperClickerScript/main/ClapperClicker.lua')))()
local w = library:CreateWindow("Clapper Clicker")
local b = w:CreateFolder("AutoFarm")
local f = w:CreateFolder("AutoRebirth")
local g = w:CreateFolder("Teleport")
local e = w:CreateFolder("Mix")
local u = w:CreateFolder("Credits")

if game:GetService("CoreGui"):FindFirstChild("PurchasePromptApp") then
    game:GetService("CoreGui").PurchasePromptApp:Destroy()
end

b:Toggle("Auto Clap",function(bool)
    shared.toggle = bool
    autoclap = bool
end)

f:Dropdown("Select World",{"Home","Desert","Snowy","Toy","Lava","Youtuber"},true,function(blubba)
    world = blubba
end)

f:Dropdown("Rebirth Button Nr.",{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50},true,function(blubb)
    rebirthamount = blubb
end)

f:Toggle("Auto Rebirth",function(bool)
    shared.toggle = bool
    autoreb = bool
end)

g:Button("TP Home",function()
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Teleport To World",1)
end)

g:Button("TP Desert",function()
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Teleport To World",2)
end)

g:Button("TP Snowy",function()
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Teleport To World",3)
end)

g:Button("TP Toy",function()
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Teleport To World",4)
end)

g:Button("TP Lava",function()
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Teleport To World",5)
end)

g:Button("TP Youtuber",function()
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Teleport To World",6)
end)

e:Slider("WalkSpeed",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

e:Slider("JumpPower",{min = 10; max = 200; precise = true; },function(value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
end)

e:Toggle("AntiAfk",function(bool)
    shared.toggle = bool
    AntiAfk = bool
end)

--Credits
u:Button("Relax",function()
    setclipboard("Relax")
end)

u:Button("Discrod Server",function()
    setclipboard("https://discord.gg/K4txdRSVfq")
end)


while wait() do

    spawn(function()
        if autoclap == true then
            game:GetService("ReplicatedStorage").RemoteEvent:FireServer("Clicker Activated",math.huge)
        end
    end)

    spawn(function()
        if autoreb == true then
            if world == "Home" then
                local args = {[1] = "Rebirth World",[2] = 1,[3] = rebirthamount}
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            elseif world == "Desert" then
                local args = {[1] = "Rebirth World",[2] = 2,[3] = rebirthamount}
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            elseif world == "Snowy" then
                local args = {[1] = "Rebirth World",[2] = 3,[3] = rebirthamount}
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            elseif world == "Toy" then
                local args = {[1] = "Rebirth World",[2] = 4,[3] = rebirthamount}
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            elseif world == "Lava" then
                local args = {[1] = "Rebirth World",[2] = 5,[3] = rebirthamount}
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            elseif world == "Youtuber" then
                local args = {[1] = "Rebirth World",[2] = 6,[3] = rebirthamount}
                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            end
        end
    end)

    spawn(function()
        if AntiAfk == true then
            local vu = game:GetService("VirtualUser")
            game:GetService("Players").LocalPlayer.Idled:connect(function()
            vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            end)
        end
    end)

end