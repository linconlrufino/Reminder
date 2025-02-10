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
    
    private lazy var handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.font = Typography.label
        title.text = "login.label.title".localize
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private lazy var emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localize
        text.borderStyle = .roundedRect
        text.font = Typography.input
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
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
        button.layer.cornerRadius = Metrics.medium
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white
        self.layer.cornerRadius = Metrics.small
        
        addSubview(handleArea)
        addSubview(titleLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            handleArea.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.small),
            handleArea.centerXAnchor.constraint(equalTo: centerXAnchor),
            handleArea.widthAnchor.constraint(equalToConstant: 40),
            handleArea.heightAnchor.constraint(equalToConstant: 6),
            
            titleLabel.topAnchor.constraint(equalTo: handleArea.bottomAnchor, constant: Metrics.medium),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.huge),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.huge),

            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.huge),

            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: Metrics.medium),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.medium),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
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
