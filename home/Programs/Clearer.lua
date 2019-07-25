-- Require libs
local robot = require(robot)

-- Ask questions
::askquestions::

--- Ask the length of the space we should clear
print("What is the length of the space that I should clear?")
local length = tonumber(io.read())

--- Ask the width of the space we should clear
print("What is the width of the space that I should clear?")
local width = tonumber(io.read())

--- Ask the height of the space we should clear
print("What is the height of the space that I should clear?")
local height = tonumber(io.read())

-- Check that the space that's going to be cleared isn't 0 or smaller

if length * width * height < 1 then
	print("Invalid space")
	goto askquestions
end

-- Start
print("Started clearing out " .. length * width * height .. " blocks!")
print("Please make sure I have a tool in the tool slot")
