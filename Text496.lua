-- 🔒 ANTI DUPLICADO (CLAVE PARA AUTO EXECUTE)
if getgenv().AutoExecLoaded then return end
getgenv().AutoExecLoaded = true

repeat task.wait() until game:IsLoaded()

-- 🔁 RE-EJECUTAR EN TELEPORT
if queue_on_teleport then
    queue_on_teleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text496/refs/heads/main/Text496.lua"))()')
end
local keyTerminado = false

task.spawn(function()
	while task.wait(0.1) do
		local p = workspace.GameplayParts.Doors.Normal.Buildable:FindFirstChild("Plank")
		local b = p and p:FindFirstChild("Buildable", true)

		if b and b:IsA("MeshPart") and b.Transparency == 0 then
			p:Destroy()
			break
		end
	end
end)

task.spawn(function()
	print("Sistema White iniciado")

	local collectables = workspace.GameplayAssets.Items.Collectable.Collectable

	repeat
		local encontrado = false

		for i = 1, 13 do
			if collectables:FindFirstChild(tostring(i)) then
				encontrado = true
				break
			end
		end

		task.wait(0.2)
	until not encontrado

	print("No quedan Collectables")

	repeat
		task.wait(0.2)
	until keyTerminado

	local Players = game:GetService("Players")
	local player = Players.LocalPlayer

	local character = player.Character or player.CharacterAdded:Wait()
	local root = character:WaitForChild("HumanoidRootPart")

	-- Puerta blanca
	local puerta = workspace.GameplayParts.Doors.Normal.Paintable:FindFirstChild("White")

	if not puerta then
		warn("No existe puerta blanca")
		return
	end

	local centro

	for _, v in ipairs(puerta:GetDescendants()) do
		if v:IsA("BasePart") then
			centro = v
			break
		end
	end

	if not centro then
		warn("Puerta sin BasePart")
		return
	end

	-- Cubo blanco
	local white = workspace.GameplayAssets.Items.Normal.PaintBucket:FindFirstChild("White")

	if white then
		print("Cubo blanco encontrado")

		local rootWhite = white:FindFirstChild("Root", true)

		if rootWhite and rootWhite:IsA("BasePart") then
			root.CFrame = rootWhite.CFrame * CFrame.new(0, 3, 0)

			task.wait(0.5)

			local prompt = rootWhite:FindFirstChildOfClass("ProximityPrompt")

			if prompt then
				repeat
					fireproximityprompt(prompt)
					task.wait(0.2)
				until not white:IsDescendantOf(workspace)

				print("Cubo blanco recogido")

task.spawn(function()
	task.wait(10)

	while puerta and puerta:IsDescendantOf(workspace) do
		root.CFrame = centro.CFrame * CFrame.new(0, 0, 4)
		task.wait(0.2)
	end
end)
			end
		end
	else
		print("No hay cubo blanco")
	end

	character = player.Character or player.CharacterAdded:Wait()
	root = character:WaitForChild("HumanoidRootPart")

	root.CFrame = centro.CFrame * CFrame.new(0, 0, 4)

	task.wait(0.5)

	local click

	for _, v in ipairs(puerta:GetDescendants()) do
		if v:IsA("ClickDetector") then
			click = v
			break
		end
	end

	if click then
		print("Abriendo puerta blanca")

		repeat
			fireclickdetector(click)
			task.wait(0.1)
		until not puerta:IsDescendantOf(workspace)

		print("Puerta blanca abierta")
	end
end)

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()
local root = character:WaitForChild("HumanoidRootPart")

task.spawn(function()
	print("Sistema Key iniciado")

	-- Esperar que desaparezca la llave
	local keyFolder = workspace.GameplayAssets.Items.Normal.Tool
	local key = keyFolder:FindFirstChild("Key")

	if key then
		repeat
			task.wait(0.1)
		until not key:IsDescendantOf(workspace)
	end

	print("Key desapareció")

	-- Buscar puerta Key
	local puerta = workspace.GameplayParts.Doors.Normal.Unlockable:FindFirstChild("Key")

	if not puerta then
		warn("No existe la puerta Key")
		return
	end

	local centro

	for _, obj in ipairs(puerta:GetDescendants()) do
		if obj:IsA("BasePart") then
			centro = obj
			break
		end
	end

	if not centro then
		warn("No encontró parte de puerta")
		return
	end

	character = player.Character or player.CharacterAdded:Wait()
	root = character:WaitForChild("HumanoidRootPart")

	root.CFrame = centro.CFrame * CFrame.new(0, 0, 4)

	task.wait(0.5)

	local click

	for _, obj in ipairs(puerta:GetDescendants()) do
		if obj:IsA("ClickDetector") then
			click = obj
			break
		end
	end

	if click and typeof(fireclickdetector) == "function" then
		fireclickdetector(click)
		print("Puerta activada")
	end

	repeat
		task.wait(0.1)
	until not puerta:IsDescendantOf(workspace)

	print("Puerta abierta")

	-- Recoger Collectables
	local collectables = workspace.GameplayAssets.Items.Collectable.Collectable

	for i = 1, 13 do
		local item = collectables:FindFirstChild(tostring(i))

		if item then
			print("Intentando recoger:", i)

			repeat
				if not item:IsDescendantOf(workspace) then
					break
				end

				local rootItem = item:FindFirstChild("Root", true)

				if rootItem and rootItem:IsA("BasePart") then
					local prompt = rootItem:FindFirstChildOfClass("ProximityPrompt")

					if prompt then
						root.CFrame = rootItem.CFrame * CFrame.new(0, 3, 0)

						task.wait(0.3)

						if typeof(fireproximityprompt) == "function" then
							fireproximityprompt(prompt)
						end
					end
				end

				task.wait(0.2)
			until not item:IsDescendantOf(workspace)

			print("Recogido:", i)
		else
			warn("No existe Collectable:", i)
		end

		task.wait(0.3)
	end

	print("Terminado")

	keyTerminado = true
end)

task.spawn(function()

	local puerta = workspace.GameplayParts.Doors.Normal.Paintable:FindFirstChild("White")

	if puerta then
		repeat
			task.wait(0.2)
		until not puerta:IsDescendantOf(workspace)
	end

	print("No hay puerta blanca")

	local character = player.Character or player.CharacterAdded:Wait()
	local root = character:WaitForChild("HumanoidRootPart")

	root.CFrame = CFrame.new(-13, 2, 115)

	print("Teletransportado, esperando 15 segundos")

	task.wait(15)

	local humanoid = character:FindFirstChildOfClass("Humanoid")

	if humanoid then
		humanoid.Health = 0
	end

end)

task.spawn(function()
	local Players = game:GetService("Players")
	local TeleportService = game:GetService("TeleportService")
	local player = Players.LocalPlayer

	-- Esperar que desaparezca la puerta blanca
	task.spawn(function()
		local puerta = workspace.GameplayParts.Doors.Normal.Paintable:FindFirstChild("White")

		if puerta then
			repeat
				task.wait(0.2)
			until not puerta:IsDescendantOf(workspace)
		end

		task.wait(20)
		TeleportService:Teleport(game.PlaceId, player)
	end)

	task.spawn(function()
	local Players = game:GetService("Players")
	local TeleportService = game:GetService("TeleportService")
	local player = Players.LocalPlayer

	while task.wait(1) do
		local puerta = workspace.GameplayParts.Doors.Normal.Paintable:FindFirstChild("White")

		-- Solo revisar si la puerta blanca existe
		if puerta and puerta:IsDescendantOf(workspace) then
			local character = player.Character or player.CharacterAdded:Wait()
			local root = character:WaitForChild("HumanoidRootPart")

			local pos = root.Position
			local tiempo = 0

			while puerta and puerta:IsDescendantOf(workspace) do
				task.wait(1)

				if (root.Position - pos).Magnitude < 1 then
					tiempo += 1

					if tiempo >= 7 then
						TeleportService:Teleport(game.PlaceId, player)
						return
					end
				else
					pos = root.Position
					tiempo = 0
				end
			end
		end
	end
end)
		end)
loadstring(game:HttpGet("https://raw.githubusercontent.com/davidsebas348-hub/Text480/refs/heads/main/Text480.lua"))()
