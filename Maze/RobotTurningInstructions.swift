//
//  RobotTurningInstructions.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/5/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func randomlyRotateRightOrLeft(robot: ComplexRobotObject) {
        let randomNumber = arc4random() % 2
        
        // Randomly calls either robot.rotateRight() or robot.rotateLeft() (based on the value of the randomNumber constant)
        if(randomNumber == 0) {
            robot.rotateRight()
        } else {
            robot.rotateLeft()
        }
    }
    
    func continueStraightOrRotate(robot: ComplexRobotObject, wallInfo: (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        let randomNumber = arc4random() % 2
        
        // Randomly calls either robot.move() or randomlyRotateRightOrLeft(robot: ComplexRobotObject)
        if(randomNumber == 0) {
            robot.move()
        } else {
            turnTowardClearPath(robot, wallInfo: wallInfo)
        }
    }
    
    func turnTowardClearPath(robot: ComplexRobotObject, wallInfo: (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int)) {
        
        // Tells the robot which way to turn toward the clear path by checking direction of robot and wallInfo
                if robot.direction == .Left && wallInfo.down {
                  robot.rotateRight()
              } else if robot.direction == .Up && wallInfo.left {
                   robot.rotateRight()
              } else if robot.direction == .Right && wallInfo.up {
                robot.rotateRight()
              } else if robot.direction ==  .Down && wallInfo.right {
                robot.rotateRight()
              } else {
                robot.rotateLeft()
        }
    }
    
}