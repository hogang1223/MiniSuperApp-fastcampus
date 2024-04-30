//
//  PaymentMethod.swift
//  MiniSuperApp
//
//  Created by hogang on 4/30/24.
//

import Foundation

struct PaymentMethod: Decodable {
    let id: String
    let name: String
    let digits: String
    let color: String
    let isPrimary: Bool
}
