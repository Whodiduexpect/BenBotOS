-- Require libs
local robot = require("robot")
local computer = require("computer")
local component = require("component")
local geolyzer = component.proxy("geolyzer")

-- Define variables
local isNextStopHopper = false -- Keeps track if the next stop is the hopper
local analyze = nil -- We'll use this later
local currentSlot = 1
local slotSwitch = nil
--- Let's make sure that last one is true
robot.select(1)

-- Define functions
local function getAge ()    -- Get the age of the crop based on the analasis
    for k,v in pairs(analyze) do
        local i = k
        if i == "metadata" then
            local n = v
            return n
        end
    end
end

local function select (slot) -- Changes both the currentSlot var and the current slot
	robot.select(slot)
	currentSlot = slot
end

local function placeSeed () 
	for i = 1, 16 do -- Repeats 16 times with i set to the current repeat number (to check every inventory slot)
		select(i)
		robot.placeDown()
		if robot.detectDown() then
			print("Placed seed")
			return slot
		end
		print(i .. " is not a seed")
	end
	print("Found no seeds")
	return nil
end

local function dropWheat () -- Same premise as the other one, but the check is the other way around
	for i = 1, 16 do
		if robot.count(i) > 0 then
			robot.select(i)
			robot.placeDown()
			if not robot.detectDown() then
				print("Wheat found")
				robot.drop()
				break
			end
			robot.swingDown()
		end
	end
end

-- Main loop
while true do
	while not robot.detect() do
		analyze = component.geolyzer.analyze(0)
		if getAge() == 7 then -- If crop is fully grown
			robot.swingDown()
			placeSeed()
		end
		robot.forward()
	end
	-- When we detect something
	if isNextStopHopper then
		print("Checking wheat...")
		dropWheat()
		isNextStopHopper = false
	else
		isNextStopHopper = true
	end
	robot.turnAround()
end