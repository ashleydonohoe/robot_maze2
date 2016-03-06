//
//  WallLocations.swift
//  Maze
//
//  Created by Gabrielle Miller-Messner on 11/6/15.
//  Copyright © 2015 Udacity, Inc. All rights reserved.
//

import Foundation

extension ControlCenter {
    
    func isFacingWall(robot: ComplexRobotObject, direction: MazeDirection) -> Bool {
        
        let cell = mazeController.currentCell(robot)
        var isWall: Bool = false
        
        // Checks if the robot is facing any wall
        switch(direction) {
        case .Up:
            if cell.top {
                isWall = true
            }
        case .Down:
            if cell.bottom {
                isWall = true
            }
        case .Left:
            if cell.left {
                isWall = true
            }
        case .Right:
            if cell.right {
                isWall = true
            }
        }
    
        // Returns a Bool that represents whether the robot is currently facing a wall
        
        return isWall
    }
    
    func checkWalls(robot:ComplexRobotObject) -> (up: Bool, right: Bool, down: Bool, left: Bool, numberOfWalls: Int) {
        var numberOfWalls = 0
        let cell = mazeController.currentCell(robot)
        
        // Check is there is a wall at the top of the current cell
        let isWallUp = cell.top
        if isWallUp {
            numberOfWalls++
        }
        
        // Check if there is a wall to the right of the current cell
        let isWallRight = cell.right
        if isWallRight {
            numberOfWalls++
        }
        
        // Check if there is a wall at the bottom of the current cell
        let isWallBottom = cell.bottom
        if isWallBottom {
            numberOfWalls++
        }
        
        // Check if there is a wall to the left of the current cell
        let isWallLeft = cell.left
        if isWallLeft {
            numberOfWalls++
        }
        
        // Returns a tuple representing the bools for top, right, down & left, and the number of walls
        return (isWallUp, isWallRight, isWallBottom, isWallLeft, numberOfWalls)
    }

}