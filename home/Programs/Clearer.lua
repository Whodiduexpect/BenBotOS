-- Require libs
local robot = require("robot")
local computer = require("computer")
local term = require("term")

-- Make it clear where you put the thing
print("Please put me in a corner of the top layer of the space with what you want to clear on my right")

-- Ask questions
::askquestions::

--- Ask the length of the space we should clear
print("What is the length of the space that I should clear?")
local desiredLength = tonumber(io.read())

--- Ask the width of the space we should clear
print("What is the width of the space that I should clear?")
local desiredWidth = tonumber(io.read())

--- Ask the height of the space we should clear
print("What is the height of the space that I should clear?")
local desiredHeight = tonumber(io.read())

-- Calculate the total blocks
local totalBlocks = desiredLength * desiredWidth * desiredHeight

-- Check that the space that's going to be cleared isn't 0 or smaller
if totalBlocks < 1 then
	print("Invalid space")
	goto askquestions
end

-- Start
term.clear()
print("Started clearing out " .. totalBlocks .. " blocks!")
print("Please make sure I have a tool in the tool slot")

-- Define some variables to keep track of our progress
local currentLength = 1
local currentWidth = 1
local currentHeight = 0
-- And some additional ones
local moved = nil
local shouldRight = true

-- Define some functions
function safeMove ()
	if robot.detect() then
		robot.swing()
	end
	moved = robot.forward()
	while not moved do
		moved = robot.forward()
	end
end

function alternate ()
		if shouldRight then
			robot.turnRight()
			safeMove()
			robot.turnRight()
			shouldRight = false
		else
			robot.turnLeft()
			safeMove()
			robot.turnLeft()
			shouldRight = true
		end
end

while currentHeight < desiredHeight do
	while currentWidth < desiredWidth do
		while currentLength < desiredLength do
			safeMove()
			currentLength = currentLength + 1
		end
		alternate()
		currentLength = 1
		currentWidth = currentWidth + 1
	end
	while currentLength < desiredLength do
		safeMove()
		currentLength = currentLength + 1
	end
	if currentHeight + 1 < desiredHeight then
		robot.swingDown()
		robot.down()
		robot.turnAround()
	end
	currentWidth = 1
	currentLength = 1
	currentHeight = currentHeight + 1
end
print("Finished " .. totalBlocks .. " !")
computer.beep(261, 0.6)
computer.beep(329, 0.5)
computer.beep(392, 0.3)
computer.beep(523, 0.7)