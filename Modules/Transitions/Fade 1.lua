local module = {}

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

local tweenService = game:GetService("TweenService")
local textService = game:GetService("TextService")

function module:TransitionIn(text: string, fontMap: FontMap, tweenTime: number, parent: Instance)
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
	label.Position = UDim2.new(0.5, 0, 0.5, 0)
	label.AnchorPoint = Vector2.new(0.5, 0.5)
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Text = text
	label.Font = font
	label.TextSize = size
	label.Size = Vector2ToUDim2(textService:GetTextSize(text, label.TextSize, label.Font, Vector2.new(10000, 10000)))
	label.TextTransparency = 1
	label.Parent = frame

	tweenService:Create(label, TweenInfo.new(tweenTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
	
	return frame
end

function module:TransitionOut(text: string, fontMap: FontMap, tweenTime: number, parent: Instance)
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
	label.Position = UDim2.new(0.5, 0, 0.5, 0)
	label.AnchorPoint = Vector2.new(0.5, 0.5)
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Text = text
	label.Font = font
	label.TextSize = size
	label.Size = Vector2ToUDim2(textService:GetTextSize(text, label.TextSize, label.Font, Vector2.new(10000, 10000)))
	label.TextTransparency = 0
	label.Parent = frame

	tweenService:Create(label, TweenInfo.new(tweenTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()

	return frame
end

return module
