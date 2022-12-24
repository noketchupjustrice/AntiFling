-- Made by noketchupjustrice#3666
-- Fixed up some stuff should work better
-- Adding re parenting when you reset so it works better now
-- I haven't lagged at all with this I don't know if its just my pc
-- If you lag with this then you're pc is shit
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function NoCol()
    for i,Player in pairs(Players:GetPlayers()) do
        if Player ~= LocalPlayer then
            if not Player.Character then
                repeat task.wait() until Player.Character
            end
            if not Player.Character:FindFirstChildOfClass("Humanoid") then
                repeat task.wait() until Player.Character:FindFirstChildOfClass("Humanoid")
            end
            for i,TargetPart in pairs(Player.Character:GetDescendants()) do
                if TargetPart:IsA("BasePart") then
                    for i,v in pairs(LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            if not v:FindFirstChild("NoCollisionConstraint") then
                                local NoCol = Instance.new("NoCollisionConstraint", TargetPart)
                                NoCol.Enabled = true; NoCol.Part0 = v; NoCol.Part1 = TargetPart;
                                coroutine.wrap(function()
                                    Player.CharacterAdded:Connect(function()
                                        if not LocalPlayer.Character then
                                            repeat task.wait() until LocalPlayer.Character
                                        end
                                        if not LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                                            repeat task.wait() until LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                                        end
                                        for i,v in pairs(game:GetDescendants()) do
                                            if v:IsA("NoCollisionConstraint") then
                                                v:Destroy()
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

Players.PlayerAdded:Connect(NoCol)

LocalPlayer.CharacterAdded:Connect(function()
    if not LocalPlayer.Character then
        repeat task.wait() until LocalPlayer.Character
    end
    if not LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
        repeat task.wait() until LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
    end
    for i,v in pairs(game:GetDescendants()) do
        if v:IsA("NoCollisionConstraint") then
            v:Destroy()
        end
    end
    NoCol()
end)
