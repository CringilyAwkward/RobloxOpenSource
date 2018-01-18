local players = game.Players:GetChildren()
local maps = game..Lightning.Maps:GetChildren()
local currentmap = game.Workspace:WaitForChild("CurrentMap")
local chosenmap = script:WaitForChild("ChosenMap")
local spawner = game.Workspace:WaitForChild("Spawn")-- Can change to other spawn names
local choices = {}

-- Choosing of the Map

function chooseMape()
	for i = 1,#maps do
		if maps[i]:isA("Model")then
			table.insert(choices,maps[i])
		end
	end
	local pickes = math.random(1,#maps)
    chosenmap.Value = choices[picked].Name
end

--Loading of the Map

function loadMap()
	local map = game.Lightning.Maps:FindFirstChild(chosenmap.Value)
	map:Clone().Parent = currentmap
end

-- Deleting of the map ( After Use )

function deleteMap()
	for i,v in pairs(currentmap:GetChildren())do
		if v:isA("Model") then
			v:Destroy()
		end
	end
end

-- Teleporting of the Players ( To Map )

function teleportPlayers()
	for i,v in pairs(players) do
		v.Character.HumanoidRootPart.CFrame = currentmap:FindFirstChild(chosenmap.Value).Spawn*CFrame.new(math.random(5,10),0,math.random(5,10))		
	end
end

-- Teleporting of the Players ( Back to Lobby )

function teleportBack()
	for i,v in pairs(players) do
		v.Character.HumanoidRootPart.Cframe = spawner.SpawnLocation.CFrame*CFrame.new(math.random(5,10),0,math.random(5,10))
	end
end

-- The Entire Cycle ( Numbers in brackets are when it happens after the other )

while true do
	wait(3)
	chooseMap()
	loadMap()
	wait(1)
	teleportPlayers()
	wait(10)
	deleteMap()
	teleportBack()
end
