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
    private let stackView = UIStackView()
    
	override func viewDidLoad() {
		super.viewDidLoad()
		updateNumbers()
		
		setupLabel()
        setupImageContainerView()
        setupImageView()
        setupStackView()
        view.addSubview(stackView)
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
        textLabel.textAlignment = .center
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
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(imageContainerView)
    }
    
    private func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
            stackView.heightAnchor.constraint(equalToConstant: 400),
            
            imageView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor)
        ])
    }
}
