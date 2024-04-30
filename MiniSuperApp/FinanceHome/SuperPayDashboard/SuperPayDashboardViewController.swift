//
//  SuperPayDashboardViewController.swift
//  MiniSuperApp
//
//  Created by hogang on 4/30/24.
//

import ModernRIBs
import UIKit
import SnapKit

protocol SuperPayDashboardPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class SuperPayDashboardViewController: UIViewController, SuperPayDashboardPresentable, SuperPayDashboardViewControllable {
    
    weak var listener: SuperPayDashboardPresentableListener?
    
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
        label.text = "슈퍼페이 잔고"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var topupButton: UIButton = {
        let button = UIButton()
        button.setTitle("충전하기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(topupButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let cardView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        view.layer.cornerCurve = .continuous
        view.backgroundColor = .systemIndigo
        return view
    }()
    
    private let currentcyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        label.text = "원"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let balanceAmountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let balanceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        return stackView
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
        view.addSubview(cardView)
        
        headerStackView.addArrangedSubview(titleLabel)
        headerStackView.addArrangedSubview(topupButton)
        
        cardView.addSubview(balanceStackView)
        balanceStackView.addArrangedSubview(balanceAmountLabel)
        balanceStackView.addArrangedSubview(currentcyLabel)
        
        headerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
        }
        
        cardView.snp.makeConstraints {
            $0.top.equalTo(headerStackView.snp.bottom).offset(10)
            $0.height.equalTo(180.0)
            $0.leading.trailing.equalToSuperview().inset(20.0)
            $0.bottom.equalToSuperview().inset(20.0)
        }
        
        balanceStackView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    func updateBalance(_ balance: String) {
        balanceAmountLabel.text = balance
    }
        
    @objc
    private func topupButtonDidTap() {
        
    }
}
