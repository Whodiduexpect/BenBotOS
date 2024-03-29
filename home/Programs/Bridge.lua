-- Require libraries
local robot = require("robot")
local computer = require("computer")
local currentSlot = 1

print("Started Bridge")
print("Please make sure blocks are in first slot")
while not robot.detect() do
  if not robot.detectDown() then
    if robot.count(currentSlot) == 0 then
      if robot.count(currentSlot + 1) > 0 then
        robot.select(currentSlot + 1)
        currentSlot = currentSlot + 1
      end
    end
    print("Placing Block...")
    robot.placeDown()
    if not robot.detectDown() then
      computer.beep()
      print("Failed to place block...")
    end
  else
    print("Going Forward...")
    robot.forward()
  end
end
if not robot.detectDown() then
  print("Finishing up bridge...")
  robot.placeDown()
end
print("Bridge Complete")
computer.beep(261, 0.6)
computer.beep(329, 0.5)
computer.beep(392, 0.3)
computer.beep(523, 0.7)
