//
//  Bet.swift
//  BetApp
//
//  Created by Anton Vassel on 23.05.2022.
//

struct Bet: Equatable {
    var sportType: String
    var league: String
    var matchDate: String
    var homeTeam: String
    var guestTeam: String
    var betType: String
    var ratio: Float
    var betAmount: Int
    var result: String
    
    var match: String {
        "\(homeTeam) - \(guestTeam)"
    }
}
