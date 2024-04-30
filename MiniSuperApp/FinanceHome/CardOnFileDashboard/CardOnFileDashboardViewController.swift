//
//  CardOnFileDashboardViewController.swift
//  MiniSuperApp
//
//  Created by hogang on 4/30/24.
//

import ModernRIBs
import UIKit
import SnapKit

protocol CardOnFileDashboardPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class CardOnFileDashboardViewController: UIViewController, CardOnFileDashboardPresentable, CardOnFileDashboardViewControllable {

    weak var listener: CardOnFileDashboardPresentableListener?
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.text = "카드 및 계좌"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cardOnFileStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var addMethodButton: AddPaymentMethodButton = {
        let button = AddPaymentMethodButton()
        button.roundCorners()
        button.backgroundColor = .systemGray4
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(headerStackView)
        view.addSubview(cardOnFileStackView)
        
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(seeAllButton)
        
        cardOnFileStackView.addArrangedSubview(addMethodButton)
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
        }
        
        cardOnFileStackView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(10.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
        }
        
        addMethodButton.snp.makeConstraints {
            $0.height.equalTo(60.0)
        }
        
    }
    
    func update(with viewModels: [PaymentMethodViewModel]) {
        cardOnFileStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        // [PaymentMethodViewModel] -> [PaymentMethodView]
        let views = viewModels.map(PaymentMethodView.init)
        views.forEach {
            $0.roundCorners()
            cardOnFileStackView.addArrangedSubview($0)
            $0.snp.makeConstraints {
                $0.height.equalTo(60.0)
            }
        }
        
    }
    
    @objc
    func seeAllButtonTapped() {
        
    }
    
    @objc
    func addButtonTapped() {
        
    }
}
