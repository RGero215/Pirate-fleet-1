//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {
        // Write your code here!
        let medium1 = Ship(length: 3, location: GridLocation(x:0, y:0), isVertical: false)
        let medium2 = Ship(length: 3, location: GridLocation(x:3, y:5 ), isVertical: true)
        let small = Ship(length: 2, location: GridLocation(x:5, y:3), isVertical: false)
        let large = Ship(length: 4, location: GridLocation(x:4, y: 7), isVertical: false)
        let xlarge = Ship(length: 5, location: GridLocation(x:7, y: 0), isVertical: true)
        
        human.addShipToGrid(medium1)
        human.addShipToGrid(medium2)
        human.addShipToGrid(small)
        human.addShipToGrid(large)
        human.addShipToGrid(xlarge)
        
        let firstMine = Mine(location: GridLocation(x:3, y:0), explosionText: "Got You!!!")
        let secondMine = Mine(location: GridLocation(x:0, y:4), explosionText: "Toast it!!!")
        
        human.addMineToGrid(firstMine)
        human.addMineToGrid(secondMine)
    
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = (gameStats.humanShipsSunk * gameStats.sinkBonus) + (gameStats.enemyShipsRemaining * gameStats.shipBonus) - (gameStats.numberOfHitsOnEnemy * gameStats.numberOfMissesByHuman)
        print("the value of final score is \(finalScore)")
        return finalScore
    }
}
