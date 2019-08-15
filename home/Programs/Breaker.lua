local robot = require("robot")
local computer = require("computer")
robot.select(1)
print("Started breaking bridge")
print("Make sure bridge block in first slot")
print("Make sure tool is in tool slot")
while not robot.detect() do
  if robot.compareDown() then
    print("Breaking")
    robot.swingDown()
  else
    print("Moving")z
    robot.forward()
  end
end
if robot.compare() then
  robot.swingDown()
  print("Finish up...")
end
print("Done!")
computer.beep(261, 0.6)
computer.beep(329, 0.5)
computer.beep(392, 0.3)
computer.beep(523, 0.7)