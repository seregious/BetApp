//
//  Bet.swift
//  BetApp
//
//  Created by Anton Vassel on 23.05.2022.
//

struct Bet {
    var sportType: String
    var tournament: String
    var matchDate: String
    var homeTeam: String
    var guestTeam: String
    var betType: String
    var ratio: Float
    var betAmount: Int
    var result: Result
    
    var match: String {
        "\(matchDate): \(homeTeam) - \(guestTeam)"
    }
}

extension Bet {
    static func getBetList() -> [Bet] {
        DataManager.shared.betDataBase
    }
}

enum Result: String {
    case win = "Выигрыш"
    case lost = "Проигрыш"
    case refund = "Возврат"
    case notCalculated = "Не рассчитана"
}
