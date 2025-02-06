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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        setupConstraints()
    }
        
    private func setupConstraints() {
        self.view.addSubview(loginView)
    }
}
