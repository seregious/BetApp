//
//  AuthorsViewController.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 23.05.2022.
//

import UIKit

class AuthorsViewController: UIViewController {
    
    let titleLabel = CustomLabel(text: "Авторы", size: 50)
    
    let antonImage = CustomImage(image: UIImage(named: "anton"))
    let antonLabel = CustomLabel(text: "Антон")
    
    let sergeyImage = CustomImage(image: UIImage(named: "sergey"))
    let sergeyLabel = CustomLabel(text: "Сергей")
    
    override func viewDidLoad() {
        view.backgroundColor = .clear
        setConst()
    }
    
    
    private func setConst() {

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        antonImage.translatesAutoresizingMaskIntoConstraints = false
        antonLabel.translatesAutoresizingMaskIntoConstraints = false
        
        sergeyImage.translatesAutoresizingMaskIntoConstraints = false
        sergeyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(antonLabel)
        view.addSubview(antonImage)
        view.addSubview(sergeyLabel)
        view.addSubview(sergeyImage)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            antonImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            antonImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            antonImage.heightAnchor.constraint(equalToConstant: 200),
            antonImage.widthAnchor.constraint(equalToConstant: 200),
            
            antonLabel.centerYAnchor.constraint(equalTo: antonImage.centerYAnchor),
            antonLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            sergeyImage.centerXAnchor.constraint(equalTo: antonImage.centerXAnchor),
            sergeyImage.topAnchor.constraint(equalTo: antonImage.bottomAnchor, constant: 30),
            sergeyImage.heightAnchor.constraint(equalToConstant: 200),
            sergeyImage.widthAnchor.constraint(equalToConstant: 200),
            
            sergeyLabel.centerYAnchor.constraint(equalTo: sergeyImage.centerYAnchor),
            sergeyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
        ])
        

        
    }
}
