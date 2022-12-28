//
//  CustomCollectionViewCell.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 23.05.2022.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private var resultLabel = CustomLabel()
    private var matchDate = CustomLabel()
    private var sportTypeLabel = CustomLabel()
    private var tournamentLabel = CustomLabel()
    private var matchLabel = CustomLabel()
    private var betTypeLabel = CustomLabel()
    private var ratioLabel = CustomLabel()
    private var betAmountLabel = CustomLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = Resources.Colors.cellBackground
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.white.cgColor
        contentView.layer.cornerRadius = 25
        
        let header = UIStackView(
            arrangedSubviews: [resultLabel, matchDate],
            axis: .horizontal,
            spacing: 20
        )
        
        let body = UIStackView(
            arrangedSubviews: [sportTypeLabel, tournamentLabel, betTypeLabel],
            axis: .horizontal,
            spacing: 20
        )
        body.distribution = .equalCentering
        
        let footer = UIStackView(
            arrangedSubviews: [betAmountLabel, ratioLabel],
            axis: .horizontal,
            spacing: 20)
        footer.distribution = .equalCentering
        
        let stackView = UIStackView(
            arrangedSubviews: [
                header,
                addSeparator(with: Resources.Colors.separator, height: 1),
                body,
                matchLabel,
                footer],
            axis: .vertical,
            spacing: 5)
        
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
        resultLabel.text = bet.result
        resultLabel.font = UIFont.boldSystemFont(ofSize: 19)
        matchDate.text = bet.matchDate
        
        sportTypeLabel.text = bet.sportType
        tournamentLabel.text = bet.league
        matchLabel.text = bet.match
        betTypeLabel.text = bet.betType
        
        ratioLabel.text = String(bet.ratio)
        ratioLabel.font = UIFont.boldSystemFont(ofSize: 19)
        
        betAmountLabel.text = String(bet.betAmount)
        betAmountLabel.font = UIFont.boldSystemFont(ofSize: 19)
        
        switch bet.result {
        case Resources.Result.win.rawValue:
            resultLabel.textColor = Resources.Colors.winFont
            betAmountLabel.textColor = Resources.Colors.winFont
            betAmountLabel.text = "\(bet.betAmount)  -> " + String(format: "%.0f", Float(bet.betAmount) * bet.ratio)
        case Resources.Result.lost.rawValue:
            resultLabel.textColor = Resources.Colors.lostFont
            betAmountLabel.textColor = Resources.Colors.lostFont
        case Resources.Result.refund.rawValue:
            resultLabel.textColor = Resources.Colors.refundFont
            betAmountLabel.textColor = Resources.Colors.refundFont
        default:
            resultLabel.textColor = Resources.Colors.notCalculatedFont
            betAmountLabel.textColor = Resources.Colors.notCalculatedFont
        }
    }
}
