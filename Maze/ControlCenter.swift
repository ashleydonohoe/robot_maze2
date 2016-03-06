//
//  ControlCenter.swift
//  Maze
//
//  Created by Jarrod Parkes on 8/14/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//
import UIKit

class ControlCenter {

    var mazeController: MazeController!

    func moveComplexRobot(myRobot: ComplexRobotObject) {
        
        // Constants to determine if robot is facing a wall, get walls surrounding the robot, and set values of different situations encountered
        let robotIsBlocked = isFacingWall(myRobot, direction: myRobot.direction)
        let myWallInfo = checkWalls(myRobot)
        let isThreeWayJunction = (myWallInfo.numberOfWalls == 1)
        let isTwoWayPath = (myWallInfo.numberOfWalls == 2)
        let isDeadEnd = (myWallInfo.numberOfWalls == 3)
        

        //  Enables the robot to choose how to move based on whether it's moved and what kind of position it's facing - a dead end, two way path, or three-way junction
        if isThreeWayJunction && robotIsBlocked {
            randomlyRotateRightOrLeft(myRobot)
        } else if isThreeWayJunction && !robotIsBlocked {
            continueStraightOrRotate(myRobot, wallInfo: myWallInfo)
            // Robot continues forward if there's a two way path and it's not blocked
        } else if isTwoWayPath && !robotIsBlocked {
            myRobot.move()
            // Robot turns toward clear path is if's blocked and at a two way path
        } else if isTwoWayPath && robotIsBlocked {
            turnTowardClearPath(myRobot, wallInfo: myWallInfo)
        }
            // Rotates at a dead end if blocked, otherwise continues forward
        else if isDeadEnd {
        
            if isDeadEnd && !robotIsBlocked {
                myRobot.move()
            }
        
            if isDeadEnd && robotIsBlocked {
                myRobot.rotateRight()
            }
        }
    }
    
    func previousMoveIsFinished(robot: ComplexRobotObject) {
            self.moveComplexRobot(robot)
    }
}
