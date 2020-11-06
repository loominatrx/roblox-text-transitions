local module = {}

local function GetEachChildrenSize(guiobj, Type)
	local size = 0
	local childs = guiobj:GetChildren()
	for i = 1, #childs do
		size += childs[i].Size.X[Type]
	end
	return size
end

function module:TransitionIn(text: string, fontMap: FontMap, tweenTime: number, parent: Instance)
	local frame = Instance.new("Frame")
	frame.Name = "Transition"
	frame.BackgroundTransparency = 1
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Parent = parent

	for i = 1, #text do
		local char = fontMap[text:sub(i,i)]:Clone()
		char.Position = UDim2.new(0,GetEachChildrenSize(frame, "Offset"),-1,0)
		char.Visible = true
		char.Parent = frame
	end

	frame.Size = UDim2.new(0,GetEachChildrenSize(frame, "Offset"),0,frame:GetChildren()[1].Size.Y.Offset)
	frame.Position = UDim2.new(0.5,0,0.5,0)
	frame.ClipsDescendants = true

	for i = 1, #text do
		wait((tweenTime or 1) / 50)
		local char = frame:GetChildren()[i]
		char:TweenPosition(UDim2.new(0,char.Position.X.Offset,0,0),"Out","Back",tweenTime or 1,true)
	end

	return frame
end

function module:TransitionOut(text: string, fontMap: FontMap, tweenTime: number, parent: Instance)
	local frame = Instance.new("Frame")
	frame.Name = "Transition"
	frame.BackgroundTransparency = 1
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Parent = parent

	for i = 1, #text do
		local char = fontMap[text:sub(i,i)]:Clone()
		char.Position = UDim2.new(0,GetEachChildrenSize(frame, "Offset"),0,0)
		char.Visible = true
		char.Parent = frame
	end

	frame.Size = UDim2.new(0,GetEachChildrenSize(frame, "Offset"),0,frame:GetChildren()[1].Size.Y.Offset)
	frame.Position = UDim2.new(0.5,0,0.5,0)
	frame.ClipsDescendants = true

	for i = 1, #text do
		wait((tweenTime or 1) / 50)
		local char = frame:GetChildren()[i]
		char:TweenPosition(UDim2.new(0,char.Position.X.Offset,-1,0),"In","Back",tweenTime or 1,true)
	end

	return frame
end

return module
