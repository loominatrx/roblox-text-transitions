--// Text Transitions by Loominatrx //--

-- Info: Text Transitions is a API that is made for your needs in your game.
--       I hope this API is useful for you.

--[[ Available Transitions:

	 - Fade 1 (normal fade)
	 - Fade 2 (left to right)
	 - Fade 3 (right to left)
	 - Pop (pops up on your screen)
	 - Slide Down 1 (Slides the letters down from left to right)
	 - Slide Down 2 (Slides the letters down from right to left)
	 - Slide Down 3 (Slides the letters down)
	 - Slide Down 4 (Slides the letters down from left to right w/ back effect.)
	 - Slide Down 5 (Slides the letters down from right to left w/ back effect.)
	 - Slide Up 1 (Slides the letters up from left to right)
	 - Slide Up 2 (Slides the letters up from right to left)
	 - Slide Up 3 (Slides the letters up)
	 - Slide Up 4 (Slides the letters up from left to right w/ back effect.)
	 - Slide Up 5 (Slides the letters up from right to left w/ back effect.)
	 
	 You could make your own version, if you want to!
]]


-- Usage :

--// Define these two.
local modules = script.Parent.Modules
local transitions = modules.Transitions

--// Get the font map handler
local FontMapHandler = require(modules:WaitForChild("FontMapHandler"))

-- I'd recommend you to make it to a function form.

--// Transition In
function TransitionIn(transition, text, size, font, tweenTime)
	--// Get the required letters.
	--   This will be useful for transition like Slide Up and Slide down.
	local fontMap = FontMapHandler:GetRequiredLetters(text, font, size)
	
	--// Get the transition module.
	local t = require(transitions[transition])
	
	--// Return the transition frame.
	--   Don't mind the 'script.Parent' because you can still move it to your desired frame.
	return t:TransitionIn(text, fontMap, tweenTime, script.Parent)
	
end

--// Transition Out
function TransitionOut(transition, text, size, font, tweenTime)
	
	--// Get the required letters.
	--   This will be useful for transition like Slide Up and Slide down.
	local fontMap = FontMapHandler:GetRequiredLetters(text, font, size)

	--// Get the transition module.
	local t = require(transitions[transition])

	--// Return the transition frame.
	--   Don't mind the 'script.Parent' because you can still move it to your desired frame.
	return t:TransitionOut(text, fontMap, tweenTime, script.Parent)

end

local TI = TransitionIn("Fade 1", "Hello, world!", 50, Enum.Font.SourceSans, 1)
wait(2)
local TO = TransitionOut("Fade 1", "Hello, world!", 50, Enum.Font.SourceSans, 1)
TI:Destroy()
wait(1)
TO:Destroy()
