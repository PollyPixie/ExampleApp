//
//  UIView+Gradient.swift
//  ExampleApp
//
//  Created by Полина Соколова on 05.10.24.
//

import UIKit

extension UIView {
    func addGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        // Добавляем подслой к кнопке
        layer.insertSublayer(gradient, at: 0)  // Градиент на фоне кнопки
    }
}
