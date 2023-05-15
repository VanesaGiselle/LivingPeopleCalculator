//
//  LivingPeople.swift
//  LivingPeople
//
//  Created by Vanesa Korbenfeld on 14/05/2023.
//

import Foundation

//Living People: Given a list of people with their birth and death years, implement a method to compute the year with the most number of people alive. You may assume that all people were born between 1900 and 2000 (inclusive). If a person was alive during any portion of that year, they should be included in that year's count. For example, Person (birth= 1908, death= 1909) is included in the counts for both 1908 and 1909.

class LivingPeopleCalculator {
    private var people: [Person]
    private var peopleAliveByYear: [Int : [Person]] = [:]
    
    init(people: [Person]) {
        self.people = people
    }
    
    func getTheYearsWithTheMostNumberOfPeopleAlive() -> [Int]? {
        if people.isEmpty {
            return nil
        }
        generatePeopleAliveByYear()
        
        return filterYearsWithTheMostNumberOfPeopleAlive()
    }
    
    private func generatePeopleAliveByYear() {
        for person in people {
            for year in person.born...person.death {
                peopleAliveByYear[year, default: []].append(person)
            }
        }
    }
    
    private func filterYearsWithTheMostNumberOfPeopleAlive() -> [Int]? {
        let peopleAliveCountByYear: [Int : Int] = peopleAliveByYear.mapValues{ $0.count }
        
        let maxPeopleAliveCountByYear = peopleAliveCountByYear.values.max()
        
        let filterMaxPeopleAliveCountByYear = peopleAliveCountByYear.filter{ $0.value == maxPeopleAliveCountByYear }
        
        return Array(filterMaxPeopleAliveCountByYear.keys)
    }
}
