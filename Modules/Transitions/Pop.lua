local module = {}
local tweenService = game:GetService("TweenService")
local textService = game:GetService("TextService")

local function GetEachChildrenSize(guiobj, Type)
	local size = 0
	local childs = guiobj:GetChildren()
	for i = 1, #childs do
		size += childs[i].Size.X[Type]
	end
	return size
end

local function Vector2ToUDim2(v2)
	return UDim2.new(0, v2.X, 0, v2.Y)
end

function module:TransitionIn(text, fontMap, tweenTime, parent)
	fontMap = fontMap:GetChildren()[1]
	local font, size = fontMap.Font, fontMap.TextSize
	
	local frame = Instance.new("TextLabel")
	frame.Name = "Transition"
	frame.BackgroundTransparency = 1
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.TextColor3 = Color3.new(1, 1, 1)
	frame.Text = text
	frame.Size = UDim2.new(0, 0, 0, 0)
	frame.Font = font
	frame.TextSize = 0
	frame.TextTransparency = 1
	frame.Parent = parent
	
	tweenService:Create(frame, TweenInfo.new(tweenTime, Enum.EasingStyle.Back, Enum.EasingDirection.Out), 
		{Size = Vector2ToUDim2(textService:GetTextSize(text, frame.TextSize, frame.Font, Vector2.new(10000, 10000))),
			TextSize = size, TextTransparency = 0
		}
	):Play()
	return frame
	
end

function module:TransitionOut(text, fontMap, tweenTime, parent, font, size)
	fontMap = fontMap:GetChildren()[1]
	local font, size = fontMap.Font, fontMap.TextSize

	local frame = Instance.new("TextLabel")
	frame.Name = "Transition"
	frame.BackgroundTransparency = 1
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.TextColor3 = Color3.new(1, 1, 1)
	frame.Text = text
	frame.Font = font
	frame.TextSize = size
	frame.Size = Vector2ToUDim2(textService:GetTextSize(text, frame.TextSize, frame.Font, Vector2.new(10000, 10000)))
	frame.Parent = parent

	tweenService:Create(frame, TweenInfo.new(tweenTime, Enum.EasingStyle.Back, Enum.EasingDirection.In), 
		{Size = UDim2.new(0, 0, 0, 0), TextSize = 0, TextTransparency = 1}
	):Play()

	return frame
end

return module
