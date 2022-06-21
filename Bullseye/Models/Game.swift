//
//  Game.swift
//  Bullseye
//
//  Created by Robert Wrzochal on 20/06/2022.
//

import Foundation

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    
    
    func points(sliderValue: Int) -> Int {
        let difference = target - sliderValue
        let newScore = abs(difference)
        
        return 100 - newScore
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
    }
}
