//
//  BrandViewModel.swift
//  Boycott
//
//  Created by Amit on 22/4/25.
//

import Foundation

class BrandViewModel: ObservableObject {
    @Published var brands: [BrandData] = []
    
    func loadBrands() {
        APIService.shared.fetchBrands { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let data):
                    self.brands = data
                case .failure(let error):
                    print("Error fetching brands: \(error)")
                }
            }
        }
    }
}
