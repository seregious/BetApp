//
//  StatViewControlles.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 23.05.2022.
//

import UIKit

class StatViewController: UIViewController {
    
    var bets: [Bet] = []
    
    private let betCountLabel = CustomLabel()
    private let betSumAll = CustomLabel()
    private let maxAndMinBetValues = CustomLabel()
    
    override func viewDidLoad() {
        view.backgroundColor = .clear
        configureLabel(label: [betCountLabel, betSumAll, maxAndMinBetValues])
        setConstraints()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bets = DataManager.shared.getBets()
        getBetListStats(bets: bets)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        betCountLabel.text = ""
    }
    
    private func getBetListStats(bets: [Bet]) {
        var winSum = betWinCalculate()
        
        betCountLabel.text =
        """
        Общее количество ставок - \(bets.count), из них:
        выиграно - \(bets.filter({$0.result == "Выигрыш"}).count),
        проиграно - \(bets.filter({$0.result == "Проигрыш"}).count),
        возвратов - \(bets.filter({$0.result == "Возврат"}).count),
        в игре - \(bets.filter({$0.result == "Не рассчитана"}).count).
        """
        
        betSumAll.text =
        """
        Общая сумма ставок - \(bets.map({$0.betAmount}).reduce(0, +)), из них:
        выиграно - \(winSum),
        проиграно - \(bets.filter({$0.result == "Проигрыш"}).map({$0.betAmount}).reduce(0, +)),
        возвращено - \(bets.filter({$0.result == "Возврат"}).map({$0.betAmount}).reduce(0, +)),
        в игре - \(bets.filter({$0.result == "Не рассчитана"}).map({$0.betAmount}).reduce(0, +)).
        
        Итог:  \(winSum - bets.filter({$0.result == "Проигрыш"}).map({$0.betAmount}).reduce(0, +))
        """
        
        maxAndMinBetValues.text =
        """
        Максимальная сумма ставки - \(bets.map({$0.betAmount}).max() ?? 0)
        Минимальная сумма ставки - \(bets.map({$0.betAmount}).min() ?? 0)
        
        Максимальный выигрыш - \(betMaxWinCalculate())
        Максимальный проигрыш - \(bets.filter({$0.result == "Проигрыш"}).map {$0.betAmount}.max() ?? 0)
        """
    }
    
    private func betWinCalculate() -> Int {
        var sum = 0
        let betsWin = bets.filter({$0.result == "Выигрыш"})
        
        betsWin.forEach { bet in
            sum += Int(Float(bet.betAmount) * (bet.ratio - 1))
        }
        return sum
    }
    
    private func betMaxWinCalculate() -> Int {
        var maxWin = 0
        let betsWin = bets.filter({$0.result == "Выигрыш"})
        
        betsWin.forEach { bet in
            if Int(Float(bet.betAmount) * (bet.ratio - 1)) > maxWin {
                maxWin = Int(Float(bet.betAmount) * (bet.ratio - 1))
            }
        }
        return maxWin
    }
    
    private func configureLabel(label: [CustomLabel]) {
        label.forEach { label in
            label.translatesAutoresizingMaskIntoConstraints = false
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 0
        }
    }
    
    private func setConstraints() {
        
        view.addSubview(betCountLabel)
        view.addSubview(betSumAll)
        view.addSubview(maxAndMinBetValues)
        
        NSLayoutConstraint.activate([
            betCountLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            betCountLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            betCountLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            betSumAll.topAnchor.constraint(equalTo: betCountLabel.bottomAnchor, constant: 30),
            betSumAll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            betSumAll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            maxAndMinBetValues.topAnchor.constraint(equalTo: betSumAll.bottomAnchor, constant: 30),
            maxAndMinBetValues.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            maxAndMinBetValues.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
    private func setupNavBar() {
        
        title = "Статистика"
        let navBar = UINavigationBarAppearance()
        navBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBar.backgroundColor = Resources.Colors.tabBar
        
        navigationController?.navigationBar.standardAppearance = navBar
        navigationController?.navigationBar.scrollEdgeAppearance = navBar
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.tintColor = UIColor.white
    }
}
