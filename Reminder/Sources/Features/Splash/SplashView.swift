//
//  SplashView.swift
//  Reminder
//
//  Created by Linconl Rufino on 24/01/25.
//

import Foundation
import UIKit
import SwiftUI

class SplashView : UIView {

    private let logoImgView : UIImageView = {
        let logoImg = UIImageView()
        logoImg.image = UIImage(named: "Logo")
        logoImg.contentMode = .scaleAspectFit
        logoImg.translatesAutoresizingMaskIntoConstraints = false;
        return logoImg
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        addSubview(logoImgView)
        
        setupConstraints()
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            logoImgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImgView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
