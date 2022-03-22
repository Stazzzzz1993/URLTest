//
//  Models.swift
//  CryptoTracker
//
//  Created by Admin on 3/21/22.
//

import Foundation

struct Crypto: Codable {
    let asset_id: String
    let name: String?
    let price_usd: Float?
    let id_icon: String?
}
