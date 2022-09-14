//
//  PlayerUnitTests.swift
//  UnitTestsTests
//
//  Created by Nishchal Visavadiya on 04/09/22.
//

import Foundation
import XCTest
@testable import UnitTests

class PlayerUnitTests: XCTestCase {
    
    private var sut: Player!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = Player()
    }
    
    func testHitPowerShouldIncrementBasedOnValueProvided() {
        // Given
        let oldHitPower = sut.hitPower
        
        // When
        let newHitPower = sut.increaseHitPowerBy(inc: 10)
        
        // Then
        XCTAssert(newHitPower == oldHitPower + 10, "Old hit power is incresed by value provided")
    }
    
    func testPlayerCanHitAnotherOneIfNotDead() {
        // Given
        let anotherPlayer = Player()
        XCTAssert(!anotherPlayer.isDead)
        
        // When
        let hitSuccessfull = sut.hit(player: anotherPlayer)
        
        // Then
        XCTAssert(hitSuccessfull == true, "Couuld no dealt damage")
    }
    
    func testPlayerShouldBeDeadAfterHealtIsDepleted() {
        // Given
        let anotherPlayer = Player()
        XCTAssert(!anotherPlayer.isDead)
        
        // When
        _ = sut.increaseHitPowerBy(inc: 100)
        let hitSuccessfull = sut.hit(player: anotherPlayer)
        
        // Then
        XCTAssert(hitSuccessfull == true, "Could no dealt damage")
        XCTAssert(anotherPlayer.isDead == true, "Player is not dead even after health less or equal to 0")
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
}
