//
//  UITetField Extension.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 25.05.2022.
//

import UIKit

class CustomTextField: UITextField {
    convenience init(font: UIFont? = UIFont.init(name: "avenir", size: 20)) {
        self.init()
        self.font = font
        self.borderStyle = .roundedRect
    }
}
