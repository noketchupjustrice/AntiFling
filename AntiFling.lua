-- Made by noketchupjustrice#3666
-- Added more waits and made the code look more stupid
-- Will update and make the code look cleaner when i have time
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Debris = game:GetService("Debris") -- :scream:

for i,v in pairs(game.workspace:GetDescendants()) do
    if v:IsA("NoCollisionConstraint") then
        Debris:AddItem(v, 1/0)
    end
end

function NoCol()
    for i,Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer then
            if not Player then
                repeat task.wait() until Player
            end
            if not Player.Character then
                repeat task.wait() until Player.Character
            end
            if not Player.Character:FindFirstChildOfClass("Humanoid") then
                repeat task.wait() until Player.Character:FindFirstChildOfClass("Humanoid")
            end
            if not Player.Character:FindFirstChild("HumanoidRootPart") then
                repeat task.wait() until Player.Character:FindFirstChild("HumanoidRootPart")
            end
            if not Player.Character:FindFirstChild("Head") then
                repeat task.wait() until Player.Character:FindFirstChild("Head")
            end
            if not LocalPlayer then
                repeat task.wait() until LocalPlayer
            end
            if not LocalPlayer.Character then
                repeat task.wait() until LocalPlayer.Character
            end
            if not LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                repeat task.wait() until LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
            end
            if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                repeat task.wait() until LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            end
            if not LocalPlayer.Character:FindFirstChild("Head") then
                repeat task.wait() until LocalPlayer.Character:FindFirstChild("Head")
            end
            for i,TargetPart in pairs(Player.Character:GetDescendants()) do
                if TargetPart:IsA("BasePart") then
                    for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            if not v:FindFirstChild("NoCollisionConstraint") then
                                local NoCol = Instance.new("NoCollisionConstraint", TargetPart)
                                NoCol.Enabled = true; NoCol.Part0 = v; NoCol.Part1 = TargetPart;
                                coroutine.wrap(function()
                                    Player.CharacterAdded:Connect(function(PlayerCharacter)
                                        if not Player then
                                            repeat task.wait() until Player
                                        end
                                        if not PlayerCharacter then
                                            repeat task.wait() until PlayerCharacter
                                        end
                                        if not PlayerCharacter:FindFirstChildOfClass("Humanoid") then
                                            repeat task.wait() until PlayerCharacter:FindFirstChildOfClass("Humanoid")
                                        end
                                        if not PlayerCharacter:FindFirstChild("HumanoidRootPart") then
                                            repeat task.wait() until PlayerCharacter:FindFirstChild("HumanoidRootPart")
                                        end
                                        if not PlayerCharacter:FindFirstChild("Head") then
                                            repeat task.wait() until PlayerCharacter:FindFirstChild("Head")
                                        end
                                        if not LocalPlayer then
                                            repeat task.wait() until LocalPlayer
                                        end
                                        if not LocalPlayer.Character then
                                            repeat task.wait() until LocalPlayer.Character
                                        end
                                        if not LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                                            repeat task.wait() until LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                                        end
                                        if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                            repeat task.wait() until LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                                        end
                                        if not LocalPlayer.Character:FindFirstChild("Head") then
                                            repeat task.wait() until LocalPlayer.Character:FindFirstChild("Head")
                                        end
                                        for i,v in pairs(game.Players:GetPlayers()) do
                                            if v ~= LocalPlayer then
                                                for i,DestroyPart in pairs(v.Character:GetDescendants()) do
                                                    if v:IsA("NoCollisionConstraint") then
                                                        Debris:AddItem(v, 1/0)
                                                    end
                                                end
                                            end
                                        end
                                        NoCol()
                                    end)()
                                end)
                            end
                        end
                    end
                end
            end
        end
    end
end

NoCol()

game.Players.PlayerAdded:Connect(function(Player)
    if not Player then
        repeat task.wait() until Player
    end
    if not Player.Character then
        repeat task.wait() until Player.Character
    end
    if not Player.Character:FindFirstChildOfClass("Humanoid") then
        repeat task.wait() until Player.Character:FindFirstChildOfClass("Humanoid")
    end
    if not Player.Character:FindFirstChild("HumanoidRootPart") then
        repeat task.wait() until Player.Character:FindFirstChild("HumanoidRootPart")
    end
    if not Player.Character:FindFirstChild("Head") then
        repeat task.wait() until Player.Character:FindFirstChild("Head")
    end
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer then
            if not v.Character then
                repeat task.wait() until v.Character
            end
            for i,DestroyPart in pairs(v.Character:GetDescendants()) do
                if v:IsA("NoCollisionConstraint") then
                    Debris:AddItem(v, 1/0)
                end
            end
        end
    end
    NoCol()
end)

LocalPlayer.CharacterAdded:Connect(function()
    if not LocalPlayer then
        repeat task.wait() until Player
    end
    if not LocalPlayer.Character then
        repeat task.wait() until LocalPlayer.Character
    end
    if not LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        repeat task.wait() until LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    end
    if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        repeat task.wait() until LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    end
    if not LocalPlayer.Character:FindFirstChild("Head") then
        repeat task.wait() until LocalPlayer.Character:FindFirstChild("Head")
    end
    for i,v in pairs(game.Players:GetPlayers()) do
        if v ~= LocalPlayer then
            for i,DestroyPart in pairs(v.Character:GetDescendants()) do
                if v:IsA("NoCollisionConstraint") then
                    Debris:AddItem(v, 1/0)
                end
            end
        end
    end
    NoCol()
end)
