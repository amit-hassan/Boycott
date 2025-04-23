//
//  ContentView.swift
//  Boycott
//
//  Created by Amit on 22/4/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = BrandViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.brands) { brand in BrandCardView(brand: brand)
                        
                    }
                }
                .padding()
            }
            .navigationTitle("Brands")
        }
        .onAppear {
            viewModel.loadBrands()
        }
    }
}

#Preview {
    ContentView()
}
