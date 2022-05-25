//
//  NewBetViewController.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 25.05.2022.
//

import UIKit

class NewBetViewController: UIViewController {
    
    let newBetLabel = CustomLabel(text: "Новая ставка", size: 50)
    
    
    override func viewDidLoad() {
        view.backgroundColor = .appBlue
        title = "Новая ставка"
    }
}
