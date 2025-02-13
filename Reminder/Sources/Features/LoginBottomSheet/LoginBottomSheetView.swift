//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Linconl Rufino on 05/02/25.
//

import Foundation
import UIKit
import SwiftUI

class LoginBottomSheetView: UIView {
    
    public weak var delegate: LoginBottomSheetViewDelegate?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Typography.subHeading
        label.text = "login.label.title".localize
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTitle: UILabel = {
        let label = UILabel()
        label.font = Typography.body
        label.text = "login.email.label.title".localize
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localize
        text.borderStyle = .roundedRect
        text.font = Typography.input
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var passwordTitle: UILabel = {
        let label = UILabel()
        label.font = Typography.body
        label.text = "login.password.label.title".localize
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.password.placeholder".localize
        text.borderStyle = .roundedRect
        text.isSecureTextEntry = true
        text.font = Typography.input
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("login.button.title".localize, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = Colors.primaryRedBase
        button.tintColor = .white
        button.layer.cornerRadius = Metrics.medium
        button.titleLabel?.font = Typography.subHeading
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        let exampleGest = UITapGestureRecognizer(target: self, action: #selector(exampelTaped))
        titleLabel.addGestureRecognizer(exampleGest)
    }
    
    @objc
    private func exampelTaped(){
        print("clicou na tela")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(titleLabel)
        addSubview(emailTitle)
        addSubview(emailTextField)
        addSubview(passwordTitle)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            
            emailTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.medium),
            emailTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: emailTitle.bottomAnchor, constant: Metrics.small),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordTitle.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTitle.bottomAnchor, constant: Metrics.small),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),

            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            loginButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.huge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.buttonSize)
        ])
    }
    
    @objc
    private func loginButtonDidTapped() {
        let user = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        delegate?.sendLoginData(user: user, password: password)
    }
}

// MARK: - Preview
struct LoginBottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }

    struct Container: UIViewRepresentable {
        func updateUIView(_ uiView: LoginBottomSheetView, context: Context) {}
        
        func makeUIView(context: Context) -> LoginBottomSheetView {
            return LoginBottomSheetView()
        }
    }
}
