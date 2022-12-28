//
//  UIImage + Extension.swift
//  FirebaseChat
//
//  Created by Сергей Иванчихин on 17.05.2022.
//

import UIKit

class CustomImage: UIImageView {
    override init(image: UIImage?) {
            super.init(image: image)
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            self.layer.cornerRadius = self.frame.size.height / 2
            self.clipsToBounds = true
            self.layer.borderColor = Resources.Colors.appOrange.cgColor
            self.layer.borderWidth = 2
        }
}
