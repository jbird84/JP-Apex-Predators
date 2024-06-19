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
}
