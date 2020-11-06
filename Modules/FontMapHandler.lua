local gen = {}

local TextService = game:GetService("TextService")
local fontMaps = script.Parent.Parent:FindFirstChild("FontMaps")

if not fontMaps then
	fontMaps = Instance.new("Folder")
	fontMaps.Name = "FontMaps"
	fontMaps.Parent = script.Parent.Parent
end

--local emojis = require(script.Parent.Emojis)
local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-=!@#$%^&*()_+[]{};'\:|,./<>?`~ \"" --..emojis

function Vector2toUDim2(v2)
	return UDim2.new(0, v2.X, 0, v2.Y)
end

function gen:GetFontMap(font, size)
	local mapFolder = fontMaps:FindFirstChild(font.Name..size)
	
	if not mapFolder then
		mapFolder = Instance.new("Folder")
		mapFolder.Name = font.Name..size
		mapFolder.Parent = fontMaps
		
		for i = 1, #chars do
			local str = chars:sub(i,i)
			local label = Instance.new("TextLabel")
			label.Name = str
			label.Text = str
			label.TextSize = size
			label.Font = font
			label.TextColor3 = Color3.new(1,1,1)
			label.BackgroundTransparency = 1
			label.Size = Vector2toUDim2(TextService:GetTextSize(str, label.TextSize, label.Font, Vector2.new(10000,10000)))
			label.Visible = false
			label.Parent = mapFolder
			game:GetService("RunService").RenderStepped:Wait()
		end
	end
	
	return mapFolder
end

function gen:GetRequiredLetters(text, font, size)
	local mapFolder = fontMaps:FindFirstChild(font.Name..size)

	if not mapFolder then
		mapFolder = Instance.new("Folder")
		mapFolder.Name = font.Name..size
		mapFolder.Parent = fontMaps
	end
	
	for i = 1, #text do
		local str = text:sub(i,i)
		if not mapFolder:FindFirstChild(str) then
			local label = Instance.new("TextLabel")
			label.Name = str
			label.Text = str
			label.TextSize = size
			label.Font = font
			label.TextColor3 = Color3.new(1,1,1)
			label.BackgroundTransparency = 1
			label.Size = Vector2toUDim2(TextService:GetTextSize(str, label.TextSize, label.Font, Vector2.new(10000,10000)))
			label.Visible = false
			label.Parent = mapFolder
		end
		--game:GetService("RunService").RenderStepped:Wait()
	end

	return mapFolder
end

return gen