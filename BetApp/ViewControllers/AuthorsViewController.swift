//
//  AuthorsViewController.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 23.05.2022.
//

import UIKit

import UIKit

class AuthorsViewController: UIViewController {
    
    let antonImage = CustomImage(image: UIImage(named: "anton"))
    let antonLabel = CustomLabel(text: Resources.Texts.anton.rawValue)
    
    let sergeyImage = CustomImage(image: UIImage(named: "sergey"))
    let sergeyLabel = CustomLabel(text: Resources.Texts.sergey.rawValue)
    
    let messageLabel = CustomLabel(text: Resources.Texts.message.rawValue,size: 15)
    
    override func viewDidLoad() {
        view.backgroundColor = .clear
        configureLabelText(for: [antonLabel, sergeyLabel, messageLabel])
        messageLabel.textAlignment = .justified
        setConst()
        setupNavBar()
    }
    
    private func configureLabelText(for labels: [CustomLabel]) {
        labels.forEach { label in
            label.numberOfLines = 0
        }
    }
    
    private func setConst() {
        
        antonImage.translatesAutoresizingMaskIntoConstraints = false
        antonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        sergeyImage.translatesAutoresizingMaskIntoConstraints = false
        sergeyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(antonLabel)
        view.addSubview(antonImage)
        view.addSubview(sergeyLabel)
        view.addSubview(sergeyImage)
        view.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            antonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            antonImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            antonImage.heightAnchor.constraint(equalToConstant: 150),
            antonImage.widthAnchor.constraint(equalToConstant: 150),
            
            antonLabel.centerYAnchor.constraint(equalTo: antonImage.centerYAnchor),
            antonLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            sergeyImage.centerXAnchor.constraint(equalTo: antonImage.centerXAnchor),
            sergeyImage.topAnchor.constraint(equalTo: antonImage.bottomAnchor, constant: 20),
            sergeyImage.heightAnchor.constraint(equalToConstant: 150),
            sergeyImage.widthAnchor.constraint(equalToConstant: 150),
            
            sergeyLabel.centerYAnchor.constraint(equalTo: sergeyImage.centerYAnchor),
            sergeyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            messageLabel.topAnchor.constraint(equalTo: sergeyImage.bottomAnchor, constant: 40),
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    
    private func setupNavBar() {
        
        title = "Авторы"
        let navBar = UINavigationBarAppearance()
        navBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBar.backgroundColor = Resources.Colors.tabBar
        
        navigationController?.navigationBar.standardAppearance = navBar
        navigationController?.navigationBar.scrollEdgeAppearance = navBar
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}

