//
//  Brand.swift
//  Boycott
//
//  Created by Amit on 22/4/25.
//
import Foundation

struct BrandResponse: Codable {
    let data: [BrandData]
}

struct BrandData: Codable, Identifiable {
    let id: Int
    let attributes: BrandAttributes
}

struct BrandAttributes: Codable {
    let name: String
    let imageUrl: String?
    let proof: String?
    let proofUrl: String?
    let priority: Bool?
    let createdAt: String?
    let updatedAt: String?
    let publishedAt: String?
    let tags: String?
    let filename: String?
    let alternative: AlternativeWrapper?
}

struct AlternativeWrapper: Codable {
    let data: AlternativeDetail?
}

struct AlternativeDetail: Codable {
    let id: Int
    let attributes: AlternativeAttributes
}

struct AlternativeAttributes: Codable {
    let name: String
    let imageUrl: String?
    let createdAt: String?
    let updatedAt: String?
    let publishedAt: String?
    let filename: String?
}
