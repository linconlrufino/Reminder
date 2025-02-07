//
//  File.swift
//  Reminder
//
//  Created by Linconl Rufino on 04/02/25.
//

import Foundation
import UIKit

class LoginBottomSheetViewController: UIViewController {
    
    private lazy var loginView: LoginBottomSheetView = {
        loginView = LoginBottomSheetView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        return loginView
    }()
    
    var handleAreaheight: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupGesture()
    }
    
    private func setup() {
        self.view.addSubview(loginView)

        setupConstraints()
    }
        
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        let heightConstraint = loginView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    private func setupGesture() {

    }
    
    private func handlePanGesture() {
        
    }
    
    func animateShow(completion: (() -> Void)? = nil) {
        self.view.layoutIfNeeded()
        loginView.transform = CGAffineTransform(translationX: 0, y: loginView.frame.height)
        UIView.animate(withDuration: 0.3, animations: {
            self.loginView.transform = .identity
            self.view.layoutIfNeeded()
        }) { _ in
            completion?()
        }
    }
}
