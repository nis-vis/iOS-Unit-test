//
//  Player.swift
//  UnitTests
//
//  Created by Nishchal Visavadiya on 04/09/22.
//

import Foundation

/**
 * A model class to represent a player in the game
 */
class Player {
    
    private(set) var health = 100
    /**
     * Represent the hit power of the plyer,
     * i.e. how muhc damage this player can do in one hit
     */
    private(set) var hitPower = 10
    /**
     * Whether the player is dead or not
     */
    var isDead: Bool {
        get {
            return health <= 0
        }
    }
    
    /**
     * Increments the `hitPower` of self
     *
     * - Parameter inc: The increment value
     *
     * - Returns: New hit power
     */
    func increaseHitPowerBy(inc: Int) -> Int {
        hitPower += inc
        return hitPower
    }
    
    /**
     * Hits the playr passed in  parameter with Player.hitPower
     *
     * - Parameter player: The player to hit
     *
     * - Returns: Whether the hit was successful or not
     */
    func hit(player: Player) -> Bool {
        if player.isDead { return false }
        player.health -= hitPower
        return true
    }
}
