# BenBotOS

## Table of Contents
+ [About](#about)
+ [Getting Started](#getting_started)
+ [Usage](#usage)

## About <a name = "about"></a>
BenBotOS is an addition to OpenOS which adds new programs, libraries and more! It is designed for Creatix robots as it assumes that you have all the upgrades available. It also does not factor energy cost, as energy is unlimited on Creatix robots.

## Getting Started <a name = "getting_started"></a>
These instructions will get you a copy of the BenBotOS up and running on your robot.

### Installing

You will already need OpenOS installed and running to install BenBotOS

1. First up, put your install floppy into the floppy slot on your robot.
2. Hover over the install floppy in the floppy slot in your robot to find it's unique id. Take note of the first 3 characters. We will assume it's abc for this example
3. Start the robot if you haven't already
4. Go down one directory
```
cd ..
```
5. Copy the contents of the floppy to the home directory
```
copy mnt/abc/Update home
```
NOTE: Please make sure to replace "abc" to what was found in step 2

6. Go back in the home directory
```
cd home
```
7. Run the update program to update to BenBotOS (You can use it to update to the latest version too)
```
Update
```

Once the install process is complete you should see a Programs directory in the home directory with a bunch of programs.

## Usage <a name = "usage"></a>

Example Use: Making a bridge from one point to another

1. Go in the Programs directory
```
cd Programs
```
2. Run Bridge.lua
```
Bridge.lua
```
