//
//  Predators.swift
//  JP Apex Predators
//
//  Created by Kinney Kare on 6/19/24.
//

import Foundation


class Predators {
    var apexPredators: [ApexPredator] = []
    
    init() {
        decodApexPredatorData()
    }
    
    func decodApexPredatorData() {
        guard let jsonFile = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: jsonFile)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            apexPredators = try decoder.decode([ApexPredator].self, from: data)
        } catch {
            print("Error decoding JSON data: \(error)")
        }
    }
    
    func search(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort { predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
}
