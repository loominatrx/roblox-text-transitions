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
	
	local frame = Instance.new("Frame")
	frame.Name = "Transition"
	frame.BackgroundTransparency = 1
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Size = Vector2ToUDim2(textService:GetTextSize(text, size, font, Vector2.new(10000, 10000)))
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.ClipsDescendants = true
	frame.Parent = parent
	
	local label = Instance.new("TextLabel")
	label.Name = "Transition"
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0.5, 0, 1, 0)
	label.AnchorPoint = Vector2.new(0.5, 0)
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Text = text
	label.Font = font
	label.TextSize = size
	label.Size = Vector2ToUDim2(textService:GetTextSize(text, label.TextSize, label.Font, Vector2.new(10000, 10000)))
	label.Parent = frame
	
	label:TweenPosition(UDim2.new(0.5, 0, 0, 0), "InOut", "Quint", tweenTime, true)
	return frame
	
end

function module:TransitionOut(text, fontMap, tweenTime, parent)
	fontMap = fontMap:GetChildren()[1]
	local font, size = fontMap.Font, fontMap.TextSize
	
	local frame = Instance.new("Frame")
	frame.Name = "Transition"
	frame.BackgroundTransparency = 1
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Size = Vector2ToUDim2(textService:GetTextSize(text, size, font, Vector2.new(10000, 10000)))
	frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	frame.ClipsDescendants = true
	frame.Parent = parent

	local label = Instance.new("TextLabel")
	label.Name = "Transition"
	label.BackgroundTransparency = 1
	label.Position = UDim2.new(0.5, 0, 0, 0)
	label.AnchorPoint = Vector2.new(0.5, 0)
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Text = text
	label.Font = font
	label.TextSize = size
	label.Size = Vector2ToUDim2(textService:GetTextSize(text, label.TextSize, label.Font, Vector2.new(10000, 10000)))
	label.Parent = frame

	label:TweenPosition(UDim2.new(0.5, 0, 1, 0), "InOut", "Quint", tweenTime, true)

	return frame
end

return module
