-- Initial stuff
local term = require("term")
local robot = require("robot")
local computer = require("computer")
local currentSlot = 1
local currentBlocks = 0
local turnBackWhenDone = false
local nextSlot = 2
robot.select(1)

print("To run this, you need to have building blocks starting from the first slot")
print("As well as a pickaxe in the tool slot")

-- Ask some questions
print("How many blocks should I go for?")
local maxBlocks = tonumber(io.read())
--
::ask::
print("Should I turn back when I'm done?")
print("Enter Y for yes, or N for no")
-- Interpret the Y/N question
local userInput = io.read()
if userInput == "Y" then
  turnBackWhenDone = true
elseif userInput == "N" then
  turnBackWhenDone = false
else
  print("Invalid Answer")
  goto ask
end



-- Define function(s)
local function cycle ()
  print("I'm on block " .. currentBlocks .. ", " .. maxBlocks - currentBlocks .. " to go!") -- Say progress
  if not robot.detectDown() then   -- If we have to bridge
    if robot.count(currentSlot) == 0 then
      nextSlot = currentSlot + 1
      if robot.count(nextSlot) > 0 then
        robot.select(nextSlot)
        currentSlot = nextSlot
      elseif robot.count(1) > 0 then -- Just in case blocks collected went into first slot
        robot.select(1)
      end
    end
    robot.placeDown()
    while not robot.detectDown() do
      nextSlot = currentSlot + 1
      computer.beep()
      print("Failed to place block... Trying next slot")
      if currentSlot = 16 then
        robot.select(1)
        currentSlot = 1
      else
        robot.select(nextSlot)
        currentSlot = nextSlot
      end
      robot.placeDown()
    end
  end
  if robot.detect() then -- If we have to break forward
    robot.swing()
  end
  if robot.detectUp() then -- If we have to break up
    robot.swingUp()
  end
end

-- Stop functions, back to the code

term.clear()
print("Started Smart Tunneling/Bridging")

while currentBlocks < maxBlocks do -- The loop for every block
  cycle() -- Call our local function
  currentBlocks = currentBlocks + 1 -- Keep var up-to-date
  local moved = robot.forward()
  while not moved do
    moved = robot.forward()
   end
end

-- Finished!
cycle() -- DO THE LAST BLOCK
robot.select(1)
print("Done! Completed " .. maxBlocks .. " blocks!")
if turnBackWhenDone then
  print("Turning Back to start")
  robot.turnAround()
  local i = 0
  while i < maxBlocks do
    cycle()
    moved = robot.forward()
    while not moved do
      moved = robot.forward()
    end
    i = i + 1
  end
  print("I'm back to my starting position!")
end
computer.beep(261, 0.6)
computer.beep(329, 0.5)
computer.beep(392, 0.3)
computer.beep(523, 0.7)
