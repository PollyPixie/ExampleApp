//
//  CustomButton.swift
//  ExampleApp
//
//  Created by Полина Соколова on 07.10.24.
//

import UIKit

class CustomButton: UIButton {
    
    init(textButton: String, bgColor: UIColor) {
        super.init(frame: .zero)
        setupButton(text: textButton, bgColor: bgColor)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup View
extension CustomButton {
    private func setupButton(text: String, bgColor: UIColor) {
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        backgroundColor = bgColor
        layer.cornerRadius = Constant.cornerRadius
        
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}

// MARK: - Constants
extension CustomButton {
    private enum Constant {
        static let cornerRadius: CGFloat = 10
    }
}
