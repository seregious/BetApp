//
//  UILabel + Extension.swift
//  FirebaseChat
//
//  Created by Сергей Иванчихин on 17.05.2022.
//

import UIKit

class CustomLabel: UILabel {
    
    convenience init(text: String, size: CGFloat = 20) {
        self.init()
        
        self.text = text
        self.font = UIFont.init(name: "avenir", size: size)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.textColor = Resources.Colors.mainFont
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 20
    }
}
