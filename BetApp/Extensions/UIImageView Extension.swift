//
//  UIImage + Extension.swift
//  FirebaseChat
//
//  Created by Сергей Иванчихин on 17.05.2022.
//

import UIKit

//extension UIImageView {
//    convenience init(image: UIImage?, contentMode: UIView.ContentMode) {
//        self.init()
//
//        self.image = image
//        self.contentMode = .scaleAspectFit
//        self.frame.size.height = 200
//        self.frame.size.width = 200
//    }
//}

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
            self.layer.borderColor = UIColor.appOrange.cgColor
            self.layer.borderWidth = 2
        }
}
