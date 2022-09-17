--ez bypass lolol
ez = true
while ez == true do
    for i, v in next, game:GetService("Players"):GetPlayers() do
        if v and v ~= game:GetService("Players").LocalPlayer and v.Character then
            pcall(
                function()
                    for i, v in next, v.Character:GetDescendants() do
                        if v:IsA("BasePart") or v:IsA("Meshpart") and v.CanCollide then
                            v.CanCollide = false
                            v.Velocity = Vector3.new()
                            v.RotVelocity = Vector3.new()
                        end
                    end
                end
            )
        end
    end
    game:GetService("RunService").Stepped:wait()
end
