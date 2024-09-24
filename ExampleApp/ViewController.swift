//
//  ViewController.swift
//  ExampleApp
//
//  Created by brubru on 08.09.2024.
//

import UIKit

class ViewController: UIViewController {
	
	private let helper = Helper()
    
	private let textLabel = UILabel()
	private let imageView = UIImageView()
    private let imageContainerView = UIView()
    
	override func viewDidLoad() {
		super.viewDidLoad()
		updateNumbers()
		
		setupLabel()
        setupImageContainerView()
        setupImageView()
        view.addSubview(textLabel)
        view.addSubview(imageContainerView)
		setupView()
        setupLayout()
	}
	
	private func updateNumbers() {
		helper.addNumber(Int.random(in: 1...10))
	}
	
	private func setupLabel() {
		let firstNumber = helper.getNumbers().first
		textLabel.text = "\(firstNumber ?? 0)"
		textLabel.font = .systemFont(ofSize: 30, weight: .bold)
		textLabel.textColor = .red
	}
	
    private func setupImageContainerView(){
        imageContainerView.layer.shadowColor = UIColor.black.cgColor
        imageContainerView.layer.shadowOffset = CGSize(width: 5, height: 5)
        imageContainerView.layer.shadowOpacity = 0.7
        imageContainerView.layer.shadowRadius = 10
    }
    
    private func setupImageView() {
        imageView.image = UIImage(named: "raccoon")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFit
        
        imageContainerView.addSubview(imageView)
    }
    
    private func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.green.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
		
		// Добавляем подслой к кнопке
		view.layer.insertSublayer(gradient, at: 0)  // Градиент на фоне кнопки
	}
    
    private func setupLayout() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContainerView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 150),
            imageContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageContainerView.heightAnchor.constraint(equalToConstant: 200),
            imageContainerView.widthAnchor.constraint(equalToConstant: 200),
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor)
        ])
    }
}
