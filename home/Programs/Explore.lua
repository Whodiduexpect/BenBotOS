-- Require libraries
local robot = require("robot")
local computer = require("computer")

-- Starting text
print("Explore started - Reboot to exit")

while true do
  if robot.detect() or not robot.forward() then
    print("Obstacle Detected, turning left")
    if math.random(1,7) == 7 then
      robot.up()
      goto continue
    else
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
    end
    print("-All clear!-")
  else
    if math.random(1,10) == 10 then -- Randomly decide if we should turn
      if math.random(1,2) == 1 then -- Choose left or right
        robot.turnLeft()
      else
        robot.turnRight()
      end
    else
      robot.forward()
    end
  end
  if not robot.detectDown() then
    print("No ground detected! Going downwards")
    robot.down()
  end
  ::continue::
  print()
end
