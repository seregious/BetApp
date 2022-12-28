//
//  UIView + Extension.swift
//  BetApp
//
//  Created by Anton Vassel on 26.12.2022.
//

import UIKit

extension UIView {
    func addSeparator(with color: UIColor, height: CGFloat) -> UIView {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0, y: frame.height - height, width: frame.width, height: height)
        
        return separator
    }
}
