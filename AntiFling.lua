--\\ Made by noketchupjustrice#3666 //--
--\\ This is the laggy version of the script because it adds it to every part I decided to post this version because you guys are all skidss!!!111 //--
--\\ I will release a better working version and less funky formatted one if you stop being skids! //--
--\\ If you dont credit me your parents will like die or some shit //--

-- Most Comments are just explaining whats going on and how NoCollisionConstraints work because thats what is being used in this script
-- You can learn more about NoCollisionConstraints here: https://create.roblox.com/docs/reference/engine/classes/NoCollisionConstraint
-- Collision Groups can still be used for collision filtering, but you can't export that information to a model without adding a script to put them up when the game plays.
-- The NoCollisionConstraint instance is used to prevent collisions between two instances. Attached Parts will not collide with each other, but they may collide with the rest of the world. Touch events may still be received by both parts.
-- However, if you are trying to stop a large number of parts from colliding with another, it will be better to use Collision Groups.

-- Sorry for the bad formatting made this in a rush.
-- What we are trying to achive is everytime a player respawns, joins, leaves, ect.. we want to disable collisions without the need of a fast loop

-- First lets define our variables
local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local ApplyConstraint = function(PartParent, Part0, Part1) -- Making a function to make a NoCollisionConstraint instance and parenting it to the first argument
    local NoCollisionConstraint = Instance.new("NoCollisionConstraint")
    NoCollisionConstraint.Name = "NoCollisionConstraint"
    NoCollisionConstraint.Parent = PartParent
    NoCollisionConstraint.Enabled = true
    NoCollisionConstraint.Part0 = Part0
    NoCollisionConstraint.Part1 = Part1
end

-- First we will do this to the current players in our game
for i, Player in next, game.Players:GetPlayers() do -- Loop through the players
    if Player ~= LocalPlayer then -- Check if its not referencing to our player
        for i, TargetPart in next, Player.Character:GetDescendants() do -- Loop through the other players parts
            if TargetPart:IsA("BasePart") or TargetPart:IsA("Part") and not TargetPart:FindFirstChildOfClass("NoCollisionConstraint") then -- Finding a basepart which is what collides with our player and also checking if the constraint and its name is already in there
                for i, v in pairs(Character:GetChildren()) do -- Looping through our character
                    if v:isA("BasePart") then -- Finding a base part in our character to make the Part0 in the constrains property
                        ApplyConstraint(TargetPart, v, TargetPart) -- Applying the actual constraint to the other players and making our body parts Part0 after all checks are passed
                        coroutine.wrap(function()
                            Player.CharacterAdded:Connect(function()
                                if not Player.Character then -- Checking if they exist
                                    Player.CharacterAdded:Wait()
                                    Player.Character:WaitForChild("Humanoid")
                                    Player.Character:WaitForChild("Head")
                                end
                                    for i, TargetPart in next, Player.Character:GetDescendants() do -- Loop through the other players parts
                                        if TargetPart:IsA("BasePart") or TargetPart:IsA("Part") and not TargetPart:FindFirstChildOfClass("NoCollisionConstraint") then -- Finding a basepart which is what collides with our player and also checking if the constraint and its name is already in there
                                            for i, v in pairs(Character:GetChildren()) do -- Looping through our character
                                                if v:isA("BasePart") then -- Finding a base part in our character to make the Part0 in the constrains property
                                                ApplyConstraint(TargetPart, v, TargetPart) -- Applying the actual constraint to the other players and making our body parts Part0 after all checks are passed
                                            end
                                        end
                                    end
                                end   
                            end)
                        end)()
                    end
                end
            end
        end
    end
end

game.Players.PlayerAdded:Connect(function(Player) -- Player Added to make sure if anyone joins after the script is ran it will still apply the constraint
    if not Player.Character then -- Checking if they exist
        Player.CharacterAdded:Wait()
        Player.Character:WaitForChild("Humanoid")
        Player.Character:WaitForChild("Head")
    end
    Player.Character:WaitForChild("Humanoid")
    Player.Character:WaitForChild("Head")
    for i, TargetPart in next, Player.Character:GetDescendants() do -- Loop through the other players parts
        if TargetPart:IsA("BasePart") or TargetPart:IsA("Part") and not TargetPart:FindFirstChildOfClass("NoCollisionConstraint") then -- Finding a basepart which is what collides with our player and also checking if the constraint and its name is already in there
            for i, v in pairs(Character:GetChildren()) do -- Looping through our character
                if v:isA("BasePart") then -- Finding a base part in our character to make the Part0 in the constrains property
                    ApplyConstraint(TargetPart, v, TargetPart) -- Applying the actual constraint to the other players and making our body parts Part0 after all checks are passed
                    coroutine.wrap(function()
                        Player.CharacterAdded:Connect(function()
                        if not Player.Character then -- Checking if they exist
                            Player.CharacterAdded:Wait()
                        end
                        Player.Character:WaitForChild("Humanoid")
                        Player.Character:WaitForChild("Head")
                            for i, TargetPart in next, Player.Character:GetDescendants() do -- Loop through the other players parts
                                if TargetPart:IsA("BasePart") or TargetPart:IsA("Part") and not TargetPart:FindFirstChildOfClass("NoCollisionConstraint") then -- Finding a basepart which is what collides with our player and also checking if the constraint and its name is already in there
                                    for i, v in pairs(Character:GetChildren()) do -- Looping through our character
                                        if v:isA("BasePart") then -- Finding a base part in our character to make the Part0 in the constrains property
                                            ApplyConstraint(TargetPart, v, TargetPart) -- Applying the actual constraint to the other players and making our body parts Part0 after all checks are passed
                                        end
                                    end
                                end
                            end   
                        end)
                    end)()
                end
            end
        end
    end            
end)
