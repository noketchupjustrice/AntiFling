--Updated few stuff and much faster
--If you are going to use to share out to the public credit me you skid. - noketchupjustrice#3666
--Everything should be fixed was just debating wether I should release this or not.
if not game:IsLoaded() then
	game.IsLoaded:Wait()
end;

-- Yea skid off this I know who you are
local RunService = game.RunService
local SpeedWaitBind = Instance.new("BindableEvent")
for _, v in ipairs({RunService.RenderStepped, RunService.Heartbeat, RunService.Stepped, RunService.PreRender, RunService.PostSimulation, RunService.PreSimulation}) do
    v.Connect(v, function()
        return SpeedWaitBind.Fire(SpeedWaitBind, tick())
    end)
end

local FastWait = function(Number)
    if not type(Number) == "number" then
        return
    else
        if Number == 0 or Number == "" or Number == " " then
            Number = 0
            SpeedWaitBind.Event:Wait(Number)
        else
            SpeedWaitBind.Event:Wait(number)
        end
    end
end

local Players = game:service("Players")
local LocalPlayer = Players.LocalPlayer

if not LocalPlayer.Character then
	repeat FastWait() until LocalPlayer.Character
end;

if not LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
	repeat FastWait() until LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
end;

if not LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
	repeat FastWait() until LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end;

if not LocalPlayer.Character:FindFirstChild("Head") then
	repeat FastWait() until LocalPlayer.Character:FindFirstChild("Head")
end;

local CheckInstance = function(Part)
	if Part.ClassName:lower():find("part") then
		local BaseInstance = Part;
		pcall(function()
			for i, Part in pairs(LocalPlayer.Character:GetDescendants()) do
				if Part.ClassName:lower():find("part") then
					local NoCollisionConstraint = Instance.new("NoCollisionConstraint", BaseInstance)
					NoCollisionConstraint.Enabled = true
					NoCollisionConstraint.Part0 = BaseInstance;
					NoCollisionConstraint.Part1 = Part;
				end
			end
		end)
	end
end;

local Insert = function(Target, Bool)
	local Start = function()
		local Inserted = {}
		if not Target.Character then
			Target.CharacterAdded:Wait()
		end;
		if not Target.Character:FindFirstChild("Head") then
			repeat FastWait() until Target.Character:FindFirstChild("Head")
		end;
		if not Target.Character:FindFirstChildOfClass("Humanoid") then
			repeat FastWait() until Target.Character:FindFirstChildOfClass("Humanoid")
		end;
		spawn(function()
			pcall(function()
				for i, v in pairs(Target.Character:GetDescendants()) do
					if v:IsA("NoCollisionConstraint") then
						v:Destroy()
					end
				end;
				for i, v in pairs(Target.Character:GetDescendants()) do
					CheckInstance(v)
				end;
				Target.Character.DescendantAdded:Connect(function(v)
					if not table.find(Inserted, v) then
						table.insert(Inserted, v)
						CheckInstance(v)
					end
				end)
			end)
		end)
	end;
	pcall(Start)
	if not Bool then
		Target.CharacterAdded:Connect(Start)
	end
end;

for i, v in pairs(Players:GetPlayers()) do
	if v ~= LocalPlayer then
		Insert(v, false)
	end
end;

Players.PlayerAdded:Connect(Insert, false)

local Reset = function()
	if not LocalPlayer.Character then
		LocalPlayer.CharacterAdded:Wait()
	end;
	if not LocalPlayer.Character:FindFirstChild("Head") then
		repeat FastWait() until LocalPlayer.Character:FindFirstChild("Head")
	end;
	if not LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
		repeat FastWait() until LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	end;
	for i, v in pairs(Players:GetPlayers()) do
		if v ~= LocalPlayer then
			pcall(function()
				for i, v in pairs(v.Character:GetDescendants()) do
					if v.IsA(v, "NoCollisionConstraint") then
						v:Destroy()
					end
				end
			end)
			Insert(v, true)
		end
	end
end;

LocalPlayer.CharacterAdded:Connect(Reset)
