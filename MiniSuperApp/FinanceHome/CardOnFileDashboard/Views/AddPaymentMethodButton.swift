//
//  AddPaymentMethodButton.swift
//  MiniSuperApp
//
//  Created by hogang on 4/30/24.
//

import UIKit
import SnapKit

final class AddPaymentMethodButton: UIControl {
    
    private let plusIcon: UIImageView = {
        let imageView = UIImageView(
            image: UIImage(
                systemName: "plus",
                withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .semibold)
            )
        )
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private func setupViews() {
        addSubview(plusIcon)
        
        plusIcon.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
