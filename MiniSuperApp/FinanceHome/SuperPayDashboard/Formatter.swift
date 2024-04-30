//
//  Formatter.swift
//  MiniSuperApp
//
//  Created by hogang on 4/30/24.
//

import Foundation

struct Formatter {
    static let balanceFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
}
