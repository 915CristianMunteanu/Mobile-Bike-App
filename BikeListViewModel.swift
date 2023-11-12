//
//  BikeListViewModel.swift
//  Bike-App
//
//  Created by Munteanu, Cristian on 12.11.2023.
//

import Foundation

class BikeListViewModel: ObservableObject {
    @Published var bikes: [Bike] = []
    init() {
        bikes.append(Bike(brand: "Rockrider", model: "MTB", color: .black, serviceDue: 100))
        bikes.append(Bike(brand: "Cube", model: "Hybrid", color: .orange, serviceDue: 60))
        bikes.append(Bike(brand: "Focus", model: "Road", color: .purple, serviceDue: 120))
    }
    
    func addBike(bike: Bike) {
        bikes.append(bike)
    }
    
    func deleteBike(bike: Bike){
        bikes.removeAll { $0.id == bike.id}
    }
    
    func updateBike(bike: Bike, brand: String, model: String, color: Colors, serviceDue: Int) {
        if let index = bikes.firstIndex(where: { $0.id == bike.id }) {
            objectWillChange.send()
            bikes[index].brand = brand
            bikes[index].model = model
            bikes[index].color = color
            bikes[index].serviceDue = serviceDue
        }
    }
    
    func printBikes() {
        for bike in bikes {
            print(bike.id.uuidString)
            print(bike.brand)
            print(bike.model)
            print(bike.color.rawValue)
            print(bike.serviceDue)
        }
    }
}
