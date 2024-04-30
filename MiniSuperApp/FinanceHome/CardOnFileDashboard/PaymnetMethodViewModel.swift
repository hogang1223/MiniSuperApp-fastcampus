//
//  PaymnetMethodViewModel.swift
//  MiniSuperApp
//
//  Created by hogang on 4/30/24.
//

import UIKit

struct PaymentMethodViewModel {
    let name: String
    let digits: String
    let color: UIColor
    
    init(_ paymentMethod: PaymentMethod) {
        name = paymentMethod.name
        digits = "**** \(paymentMethod.digits)"
        color = UIColor.init(hex: paymentMethod.color) ?? .systemGray2
    }
}
