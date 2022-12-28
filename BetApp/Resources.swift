//
//  Resources.swift
//  BetApp
//
//  Created by Anton Vassel on 26.12.2022.
//

import UIKit

enum Resources {
    enum Colors {
        static let winFont = UIColor(red: 153/255, green: 172/255, blue: 66/255, alpha: 1)
        static let lostFont = UIColor(red: 164/255, green: 53/255, blue: 92/255, alpha: 1)
        static let refundFont = UIColor(red: 42/255, green: 95/255, blue: 130/255, alpha: 1)
        static let notCalculatedFont = UIColor(red: 154/255, green: 164/255, blue: 171/255, alpha: 1)
        static let mainFont = UIColor(red: 46/255, green: 58/255, blue: 63/255, alpha: 1)
        
        static let appBackground = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        static let cellBackground = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        static let tabBar = UIColor(red: 23/255, green: 59/255, blue: 80/255, alpha: 1)
        
        static let appRed = UIColor(red: 255/255, green: 1/255, blue: 1/255, alpha: 0.7)
        static let appOrange = UIColor(red: 236/255, green: 155/255, blue: 59/255, alpha: 1)
        
        static let separator = UIColor(hexString: "#E8ECEF")
    }
    
    enum Font {
        static func fontForButton(with size: CGFloat) -> UIFont {
            UIFont.systemFont(ofSize: 20)
        }
    }
    
    enum Texts: String {
        case anton =
        """
        Антон Вассель
        telegram: @Benyray
        """
        
        case sergey =
        """
        Сергей Иванчихин
        telegram: @seregious
        """
        
        case message =
        """
        Данное приложения разработано для учета статистики ставок на спорт, т.к. в приложениях букмекерских контор данные возможность отсутствует.
        Соответственно, отследить свой выигрыши и проигрыши, полученные и проигранные средства игрок не в состоянии.
        И наше приложение решает эту проблему.
        """
    }
    
    enum Result: String, CaseIterable {
        case win = "Выигрыш"
        case lost = "Проигрыш"
        case refund = "Возврат"
        case notCalculated = "Не рассчитана"
    }
}

