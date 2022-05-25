//
//  CustomCollectionViewCell.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 23.05.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private var sportTypeLabel = CustomLabel()
    private var tournamentLabel = CustomLabel()
    private var matchLabel = CustomLabel()
    private var betTypeLabel = CustomLabel()
    private var ratioLabel = CustomLabel()
    private var betAmountLabel = CustomLabel()
    private var resultLabel = CustomLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black.withAlphaComponent(0.1)
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.cornerRadius = 25
        
        let firstStack = UIStackView(
            arrangedSubviews: [sportTypeLabel, tournamentLabel, betTypeLabel],
            axis: .horizontal,
            spacing: 20
        )
        firstStack.distribution = .equalCentering
        
        let secondStack = UIStackView(
            arrangedSubviews: [ratioLabel, betAmountLabel, resultLabel],
            axis: .horizontal,
            spacing: 20)
        secondStack.distribution = .equalCentering
        
        let stackView = UIStackView(
            arrangedSubviews: [firstStack, matchLabel, secondStack],
            axis: .vertical,
            spacing: 10)
        
        self.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getData(bet: Bet) {
        sportTypeLabel.text = bet.sportType
        tournamentLabel.text = bet.tournament
        matchLabel.text = bet.match
        betTypeLabel.text = bet.betType
        ratioLabel.text = String(bet.ratio)
        betAmountLabel.text = String(bet.betAmount)
        resultLabel.text = bet.result.rawValue
    }
}
