//
//  LivingPeopleTests.swift
//  LivingPeopleTests
//
//  Created by Vanesa Korbenfeld on 14/05/2023.
//

import XCTest
@testable import LivingPeople

class LivingPeopleTests: XCTestCase {

    func testGetTheYearsWithTheMostNumberOfPeopleAlive() throws {
        let livingPeople = LivingPeopleCalculator(people: [
            Person(born: 1993, death: 2001),
            Person(born: 1994, death: 1996),
            Person(born: 1995, death: 2005)
        ])
        XCTAssertEqual(livingPeople.getTheYearsWithTheMostNumberOfPeopleAlive(), [1995, 1996])
    }
    
    func testGetTheYearsWithTheMostNumberOfPeopleAlive_WithoutPeople() throws {
        let livingPeople = LivingPeopleCalculator(people: [])
        XCTAssertEqual(livingPeople.getTheYearsWithTheMostNumberOfPeopleAlive(), nil)
    }
}
