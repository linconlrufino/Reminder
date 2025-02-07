//
//  Untitled.swift
//  Reminder
//
//  Created by Linconl Rufino on 24/01/25.
//

import Foundation
import UIKit

class SplashViewController : UIViewController {
    
    private lazy var contentView : SplashView = {
        let splashView = SplashView()
        splashView.backgroundColor = Colors.primaryRedBase
        splashView.translatesAutoresizingMaskIntoConstraints = false
        return splashView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGesture()

        setup()
    }
    
    private func setup(){
        view.addSubview(contentView)
        navigationController?.navigationBar.isHidden = true
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showLoginBottomSheet))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func showLoginBottomSheet() {
        let loginBottomSheet = LoginBottomSheetViewController()
        loginBottomSheet.modalPresentationStyle = .overCurrentContext
        loginBottomSheet.modalTransitionStyle = .crossDissolve
        self.present(loginBottomSheet, animated: false) {
            loginBottomSheet.animateShow()
        }
    }
}
