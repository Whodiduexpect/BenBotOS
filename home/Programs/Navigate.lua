-- Require libraries
local robot = require("robot")
local computer = require("computer")

-- starting message
print("Navigation started - Reboot to exit")

-- Navigation loop
while true do
  if robot.detect() or not robot.forward() then
    print("Obstacle Detected, turning left")
    robot.turnLeft()
    if robot.detect() or not robot.forward()  then
      print("Left is blocked, trying right")
      robot.turnRight()
      robot.turnRight()
      if robot.detect() or not robot.forward() then
        print("Right is also blocked, turning around")
        robot.turnRight()
        if robot.detect() or not robot.forward() then
          print("I'm stuck! Going upwards")
          robot.up()
          goto continue
        end
      end
    end
    print("-All clear!-")
  else
    robot.forward()
  end
  if not robot.detectDown() then
    print("No ground detected! Going downwards")
    robot.down()
  end
  ::continue::
  print()
end
