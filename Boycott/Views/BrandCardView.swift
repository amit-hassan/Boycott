//
//  BrandCardView.swift
//  Boycott
//
//  Created by Amit on 22/4/25.
//
import SwiftUI

struct BrandCardView: View {
    let brand: BrandData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if let imageUrl = brand.attributes.imageUrl,
               let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(height: 150)
                .cornerRadius(10)
            } else {
                Color.gray.opacity(0.3)
                    .frame(height: 150)
                    .cornerRadius(10)
            }
            
            Text(brand.attributes.name)
                .font(.headline)
            
            if let proof = brand.attributes.proof {
                Text(proof)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            if let alt = brand.attributes.alternative?.data {
                HStack {
                    if let imageUrl = alt.attributes.imageUrl,
                       let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                        } placeholder: {
                            Color.gray.opacity(0.3)
                        }
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    } else {
                        // Placeholder when imageUrl is nil
                        Color.gray.opacity(0.3)
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }

                    
                    Text("Alternative: \(alt.attributes.name)")
                        .font(.caption)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 4)
    }
}
