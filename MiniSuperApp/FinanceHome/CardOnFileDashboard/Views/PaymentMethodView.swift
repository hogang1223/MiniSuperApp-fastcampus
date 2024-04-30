//
//  PaymentMethodView.swift
//  MiniSuperApp
//
//  Created by hogang on 4/30/24.
//

import UIKit
import SnapKit

final class PaymentMethodView: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(viewModel: PaymentMethodViewModel) {
        super.init(frame: .zero)
        
        setupViews()
        
        nameLabel.text = viewModel.name
        subtitleLabel.text = viewModel.digits
        backgroundColor = viewModel.color
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private func setupViews() {
        addSubview(nameLabel)
        addSubview(subtitleLabel)
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(24.0)
            $0.centerY.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(24.0)
            $0.centerY.equalToSuperview()
        }
    }
}
