//
//  Players.swift
//  ScoreKeeperApp
//
//  Created by Austin Dobberfuhl on 11/7/23.
//

import Foundation

struct Player:Equatable, Comparable {
    
    let id: UUID
    var name: String
    var score: Int
    init(name: String, score: Int) {
        self.id = UUID()
        self.name = name
        self.score = score
    }
      
      static func ==(lhs: Player, rhs: Player) -> Bool {
          return lhs.id == rhs.id
      }
    
    static func < (lhs: Player, rhs: Player) -> Bool {
        return lhs.score < rhs.score
    }
}

