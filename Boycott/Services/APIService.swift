//
//  APIService.swift
//  Boycott
//
//  Created by Amit on 22/4/25.
//
import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchBrands(completion: @escaping (Result<[BrandData], Error>) -> Void) {
        guard let url = URL(string: "https://sea-turtle-app-6u8fo.ondigitalocean.app/api/brands?sort[0]=priority:desc&sort[1]=name:asc&pagination[limit]=500&populate=alternative") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {
            data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(BrandResponse.self, from: data)
                completion(.success(decoded.data))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
