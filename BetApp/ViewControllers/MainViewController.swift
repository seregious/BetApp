//
//  ViewController.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 23.05.2022.
//

import UIKit

protocol betData {
    func getBetData(betData: Bet)
}

class MainViewController: UIViewController {
    
    var bets: [Bet] = []
    
    private var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupCollectionView()
        setupNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bets = DataManager.shared.getBets()
        collectionView?.reloadData()
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newBetVC = NewBetViewController()
            newBetVC.bet = bets[indexPath.row]
            newBetVC.betIndexPath = indexPath.row
            newBetVC.isBetСhanging = true
            newBetVC.delegate = self
            newBetVC.modalPresentationStyle = .fullScreen
        
        present(newBetVC, animated: true)
    }
}

extension MainViewController {
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let size = view.frame.size.width  - 30
        layout.itemSize = CGSize(width: size, height: 130)
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .clear
    }
    
    private func setupNavBar() {
        title = "Журнал ставок"
        let navBar = UINavigationBarAppearance()
        navBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBar.backgroundColor = Resources.Colors.tabBar
        
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
        newBetVC.modalPresentationStyle = .fullScreen
        present(newBetVC, animated: true)
    }
}
