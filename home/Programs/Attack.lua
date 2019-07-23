local robot = require("robot")
local computer = require("computer")
print("DEATH started - THERE IS NO exit")
while true do
  if robot.detect() or not robot.forward() then
    print("Obstacle Detected, turning left")
    robot.swing()
    robot.turnLeft()
    if robot.detect() or not robot.forward()  then
      robot.swing()
      print("Left is blocked, trying right")
      robot.turnRight()
      robot.turnRight()
      if robot.detect() or not robot.forward() then
        robot.swing()
        print("Right is also blocked, turning around")
        robot.swing()
        robot.turnRight()
        if robot.detect() or not robot.forward() then
          print("I'm stuck! Going upwards")
          robot.swing()
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
