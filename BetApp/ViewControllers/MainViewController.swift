//
//  ViewController.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 23.05.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    let bet = Bet(sportType: "Футбол", tournament: "РПЛ", matchDate: "14.09", homeTeam: "ЦСКА", guestTeam: "Спартак", betType: "П1", ratio: 1.2, betAmount: 300, result: .win)
    var bets: [Bet] {
        [bet, bet, bet, bet, bet, bet, bet]
    }
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupCollectionView()
        setupNavBar()
        
    }
    
    
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bets.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as! CustomCollectionViewCell
        cell.getData(bet: bets[indexPath.row])
        return cell
    }
    
    
    
}

extension MainViewController {
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let size = view.frame.size.width  - 40
        layout.itemSize = CGSize(width: size, height: 120)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .clear
    }
    
    private func setupNavBar() {
        title = "Ставки"
        let navBar = UINavigationBarAppearance()
        navBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBar.backgroundColor = .appRed
        
        navigationController?.navigationBar.standardAppearance = navBar
        navigationController?.navigationBar.scrollEdgeAppearance = navBar
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBet)
        )
    }
    
    @objc private func addBet() {
        let newBetVC = NewBetViewController()
        present(newBetVC, animated: true)
    }
}
