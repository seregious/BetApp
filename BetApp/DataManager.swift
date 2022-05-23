//
//  DataManager.swift
//  BetApp
//
//  Created by Anton Vassel on 23.05.2022.
//

class DataManager {
    static let shared = DataManager()
    
    var betDataBase: [Bet] = []
    
    func placeBet(sportType: String,
                  tournament: String,
                  matchDate: String,
                  homeTeam: String,
                  questTeam: String,
                  betType: String,
                  ratio: Float,
                  betAmount: Int,
                  result: Result) {
        
        betDataBase.append(
            Bet(
                sportType: sportType,
                tournament: tournament,
                matchDate: matchDate,
                homeTeam: homeTeam,
                questTeam: questTeam,
                betType: betType,
                ratio: ratio,
                betAmount: betAmount,
                result: result))
    }
    
    private init() {}
}

