//
//  NewBetViewController.swift
//  BetApp
//
//  Created by Сергей Иванчихин on 25.05.2022.
//

import UIKit

class NewBetViewController: UIViewController, betData {
    //    MARK: - IB Outlets
    
    //    MARK: - Public Properties
    
    var bet = Bet(sportType: "", league: "", matchDate: "", homeTeam: "", guestTeam: "", betType: "", ratio: 1.0, betAmount: 0, result: "")
    var betIndexPath = 0
    var delegate: MainViewController?
    var isBetСhanging = false
    
    //    MARK: - Private Properties
    
    private let newBetLabel = CustomLabel(text: "Новая ставка", size: 30)
    private let ratioLabel = CustomLabel(text: "Коэфициент", size: 15)
    private let betAmountLabel = CustomLabel(text: "Ставка", size: 15)
    
    private let datePicker = UIDatePicker()
    private let sportTypePicker = UIPickerView()
    private let leaguePicker = UIPickerView()
    private let homeTeamPicker = UIPickerView()
    private let questTeamPicker = UIPickerView()
    private let betTypePicker = UIPickerView()
    private let resultPicker = UIPickerView()
    
    private let teamsStackView = UIStackView()
    private let ratioStackView = UIStackView()
    private let betAmountStackView = UIStackView()
    
    private let datePickerTF = UITextField()
    private let sportTypeTF = UITextField()
    private let leagueTF = UITextField()
    private let homeTeamTF = UITextField()
    private let questTeamTF = UITextField()
    private let betTypeTF = UITextField()
    private let ratioTF = UITextField()
    private let betAmountTF = UITextField()
    private let resultTF = UITextField()
    
    private let saveButton = UIButton(type: .system)
    private let cancelButton = UIButton(type: .system)
    private let deleteButton = UIButton(type: .system)
    
    //    MARK: - Initializers
    
    //    MARK: - Override methods
    
    override func viewDidLoad() {
        view.backgroundColor = Resources.Colors.appBackground
        
        pickerDelegateAndDataSourceSetup(for: [sportTypePicker,
                                               leaguePicker,
                                               homeTeamPicker,
                                               questTeamPicker,
                                               betTypePicker,
                                               resultPicker])
        getBetData(betData: bet)
        configureSaveButton()
        configureCancelButton()
        configureDeleteButton()
        configureSV(for: [teamsStackView,
                          ratioStackView,
                          betAmountStackView])
        configureTF(for: [datePickerTF,
                          sportTypeTF,
                          leagueTF,
                          homeTeamTF,
                          questTeamTF,
                          betTypeTF,
                          ratioTF,
                          betAmountTF,
                          resultTF])
        createDataPicker()
        SetConstraints()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //    MARK: - IB Actions
    
    //    MARK: - Public Methods
    
    func getBetData(betData: Bet) {
        if isBetСhanging {
            datePickerTF.text = betData.matchDate
            sportTypeTF.text = betData.sportType
            leagueTF.text = betData.league
            homeTeamTF.text = betData.homeTeam
            questTeamTF.text = betData.guestTeam
            betTypeTF.text = betData.betType
            ratioTF.text = String(Float(round(100 * betData.ratio) / 100))
            betAmountTF.text = String(betData.betAmount)
            resultTF.text = betData.result
        } else {
            ratioTF.text = ""
            betAmountTF.text = ""
        }
    }
    
    //    MARK: - Private Methods
    
    private func createDataPicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        datePicker.preferredDatePickerStyle = .wheels
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        datePickerTF.inputAccessoryView = toolbar
        toolbar.setItems([doneBtn], animated: true)
        datePickerTF.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
    }
    
    @objc func donePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        datePickerTF.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    private func configureSaveButton() {
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.tintColor = Resources.Colors.appBackground
        saveButton.titleLabel?.font = Resources.Font.fontForButton(with: 20)
        saveButton.backgroundColor = Resources.Colors.tabBar
        saveButton.layer.cornerRadius = 15
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        if isBetСhanging {
            saveButton.isEnabled = false
            saveButton.setTitle("Изменить", for: .normal)
        } else {
            saveButton.isEnabled = false
        }
    }
    
    private func configureCancelButton() {
        cancelButton.setTitle("Отмена", for: .normal)
        cancelButton.tintColor = Resources.Colors.appBackground
        cancelButton.titleLabel?.font = Resources.Font.fontForButton(with: 20)
        cancelButton.backgroundColor = Resources.Colors.appRed
        cancelButton.layer.cornerRadius = 15
        cancelButton.addTarget(self, action: #selector(closeBet), for: .touchUpInside)
    }
    
    private func configureDeleteButton() {
        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.tintColor = Resources.Colors.appBackground
        deleteButton.titleLabel?.font = Resources.Font.fontForButton(with: 20)
        deleteButton.backgroundColor = Resources.Colors.appRed
        deleteButton.layer.cornerRadius = 15
        
        if isBetСhanging {
            deleteButton.isHidden = false
            deleteButton.addTarget(self, action: #selector(closeBet), for: .touchUpInside)
        } else {
            deleteButton.isHidden = true
        }
    }
    
    @objc func closeBet(sender: UIButton) {
        if sender == deleteButton {
            DataManager.shared.deleteBet(at: betIndexPath)
        }
        dismiss(animated: true)
    }
    
    @objc func saveButtonPressed() {
        let bet = Bet(sportType: sportTypeTF.text!,
                      league: leagueTF.text!,
                      matchDate: datePickerTF.text!,
                      homeTeam: homeTeamTF.text!,
                      guestTeam: questTeamTF.text!,
                      betType: betTypeTF.text!,
                      ratio: Float(ratioTF.text!)!,
                      betAmount: Int(betAmountTF.text!)!,
                      result: resultTF.text!)
        
        if isBetСhanging {
            DataManager.shared.changeBet(with: bet, in: betIndexPath)
        } else {
            DataManager.shared.placeBet(with: bet)
        }
        
        dismiss(animated: true)
    }
    
    private func didBetChangeValue(textField: UITextField) -> Bool {
        return true
    }
    
    private func configureTF(for textFields: [UITextField]) {
        textFields.forEach { textField in
            textField.textAlignment = .center
            textField.borderStyle = .roundedRect
            switch textField {
            case datePickerTF:
                textField.placeholder = "Дата матча"
            case sportTypeTF:
                textField.inputView = sportTypePicker
                textField.placeholder = "Вид спорта"
            case leagueTF:
                textField.inputView = leaguePicker
                textField.placeholder = "Лига"
            case homeTeamTF:
                textField.inputView = homeTeamPicker
                textField.placeholder = "Хозяева"
            case questTeamTF:
                textField.inputView = questTeamPicker
                textField.placeholder = "Гости"
            case betTypeTF:
                textField.inputView = betTypePicker
                textField.placeholder = "Тип ставки"
            case ratioTF:
                textField.placeholder = "Коэффициент"
                textField.keyboardType = .decimalPad
            case betAmountTF:
                textField.placeholder = "Ставка"
                textField.keyboardType = .decimalPad
            default:
                textField.inputView = resultPicker
                textField.placeholder = "Результат"
            }
        }
    }
    
    private func configureSV(for stackViews: [UIStackView]) {
        stackViews.forEach { stackView in
            stackView.axis = NSLayoutConstraint.Axis.horizontal
            stackView.distribution = .fillEqually
            stackView.alignment = UIStackView.Alignment.center
            switch stackView {
            case teamsStackView:
                stackView.spacing = 10
            default:
                stackView.spacing = 30
            }
        }
    }
    
    private func checkingBet() {
        let checked: Bool
        if datePickerTF.text == ""
            || sportTypeTF.text == ""
            || leagueTF.text == ""
            || homeTeamTF.text == ""
            || questTeamTF.text == ""
            || betTypeTF.text == ""
            || ratioTF.text == ""
            || betAmountTF.text == ""
            || homeTeamTF.text == questTeamTF.text{
            checked = false
        } else {
            checked = true
        }
        saveButton.isEnabled = checked
    }
    
    private func SetConstraints() {
        translatesAutoresizingMaskIntoConstraintsForAllToFalse(for:
                                                                [newBetLabel,
                                                                 ratioLabel,
                                                                 betAmountLabel,
                                                                 teamsStackView,
                                                                 ratioStackView,
                                                                 betAmountStackView,
                                                                 datePickerTF,
                                                                 sportTypeTF,
                                                                 leagueTF,
                                                                 homeTeamTF,
                                                                 questTeamTF,
                                                                 betTypeTF,
                                                                 ratioTF,
                                                                 betAmountTF,
                                                                 resultTF,
                                                                 saveButton,
                                                                 cancelButton,
                                                                 deleteButton])
        
        view.addSubview(newBetLabel)
        view.addSubview(ratioLabel)
        
        view.addSubview(datePickerTF)
        view.addSubview(sportTypeTF)
        view.addSubview(leagueTF)
        view.addSubview(betTypeTF)
        view.addSubview(resultTF)
        view.addSubview(teamsStackView)
        view.addSubview(ratioStackView)
        view.addSubview(betAmountStackView)
        
        teamsStackView.addArrangedSubview(homeTeamTF)
        teamsStackView.addArrangedSubview(questTeamTF)
        ratioStackView.addArrangedSubview(ratioLabel)
        ratioStackView.addArrangedSubview(ratioTF)
        betAmountStackView.addArrangedSubview(betAmountLabel)
        betAmountStackView.addArrangedSubview(betAmountTF)
        
        view.addSubview(saveButton)
        view.addSubview(cancelButton)
        view.addSubview(deleteButton)
        
        NSLayoutConstraint.activate([
            newBetLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            newBetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            datePickerTF.topAnchor.constraint(equalTo: newBetLabel.bottomAnchor, constant: 15),
            datePickerTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            datePickerTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            sportTypeTF.topAnchor.constraint(equalTo: datePickerTF.bottomAnchor, constant: 15),
            sportTypeTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            sportTypeTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            leagueTF.topAnchor.constraint(equalTo: sportTypeTF.bottomAnchor, constant: 15),
            leagueTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            leagueTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            teamsStackView.topAnchor.constraint(equalTo: leagueTF.bottomAnchor, constant: 15),
            teamsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            teamsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            betTypeTF.topAnchor.constraint(equalTo: teamsStackView.bottomAnchor, constant: 15),
            betTypeTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            betTypeTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            ratioStackView.topAnchor.constraint(equalTo: betTypeTF.bottomAnchor, constant: 15),
            ratioStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            ratioStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            betAmountStackView.topAnchor.constraint(equalTo: ratioStackView.bottomAnchor, constant: 15),
            betAmountStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            betAmountStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            resultTF.topAnchor.constraint(equalTo: betAmountStackView.bottomAnchor, constant: 15),
            resultTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            resultTF.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            saveButton.topAnchor.constraint(equalTo: resultTF.bottomAnchor, constant: 15),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.widthAnchor.constraint(equalToConstant: 150),
            
            cancelButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 10),
            cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: 150),
            
            deleteButton.topAnchor.constraint(equalTo: cancelButton.bottomAnchor, constant: 10),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func pickerDelegateAndDataSourceSetup(for pickers: [UIPickerView]) {
        for picker in pickers {
            picker.delegate = self
            picker.dataSource = self
        }
    }
    
    private func translatesAutoresizingMaskIntoConstraintsForAllToFalse<T: UIView>(for all: [T]) {
        for one in all {
            one.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}



extension NewBetViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case sportTypePicker:
            return DataManager.shared.sportType.keys.count
        case leaguePicker:
            return DataManager.shared.sportType.values.count
        case homeTeamPicker, questTeamPicker:
            guard let league = leagueTF.text else { return 1 }
            switch sportTypeTF.text {
            case "Баскетбол":
                return DataManager.shared.basketballClubs[league]?.count ?? 1
            case "Футбол":
                return DataManager.shared.footballClubs[league]?.count ?? 1
            default:
                return DataManager.shared.hockeyClubs[league]?.count ?? 1
            }
        case betTypePicker:
            return DataManager.shared.betTypes[sportTypeTF.text ?? "Футбол"]?.count ?? 1
        case resultPicker:
            return Resources.Result.allCases.count
        default:
            return DataManager.shared.sportType.keys.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case sportTypePicker:
            return updateTeamsList(for: sportTypeTF, with: pickerView, at: row)
        case leaguePicker:
            return updateTeamsList(for: leagueTF, with: pickerView, at: row)
        case homeTeamPicker:
            return updateTeamsList(for: homeTeamTF, with: pickerView, at: row)
        case questTeamPicker:
            return updateTeamsList(for: questTeamTF, with: pickerView, at: row)
        case betTypePicker:
            return updateTeamsList(for: betTypeTF, with: pickerView, at: row)
        case resultPicker:
            return updateTeamsList(for: resultTF, with: pickerView, at: row)
        default:
            return updateTeamsList(for: sportTypeTF, with: pickerView, at: row)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case sportTypePicker:
            leagueTF.text = ""
            homeTeamTF.text = ""
            questTeamTF.text = ""
            betTypeTF.text = ""
            leaguePicker.selectRow(0, inComponent: 0, animated: true)
            switch pickerView.selectedRow(inComponent: 0) {
            case 0: sportTypeTF.text = "Баскетбол"
            case 1: sportTypeTF.text = "Футбол"
            default: sportTypeTF.text = "Хоккей"
            }
            sportTypeTF.resignFirstResponder()
            
        case leaguePicker:
            homeTeamTF.text = ""
            questTeamTF.text = ""
            
            guard let array = DataManager.shared.sportType[sportTypeTF.text ?? "Футбол"] else { return }
            leagueTF.text = array[row]
            leaguePicker.resignFirstResponder()
            
        case homeTeamPicker, questTeamPicker:
            var array = [String]()
            guard let league = leagueTF.text else { return }
            switch sportTypeTF.text {
            case "Баскетбол":
                array = DataManager.shared.basketballClubs[league] ?? [""]
            case "Футбол":
                array = DataManager.shared.footballClubs[league] ?? [""]
            default:
                array = DataManager.shared.hockeyClubs[league] ?? [""]
            }
            
            if pickerView == homeTeamPicker {
                homeTeamTF.text = array[row]
                homeTeamPicker.resignFirstResponder()
            } else {
                questTeamTF.text = array[row]
                questTeamPicker.resignFirstResponder()
            }
            
        case betTypePicker:
            guard let array = DataManager.shared.betTypes[sportTypeTF.text ?? "Футбол"] else { return }
            betTypeTF.text = array[row]
            betTypeTF.resignFirstResponder()
            
        case resultPicker:
            switch pickerView.selectedRow(inComponent: 0) {
            case 0: resultTF.text = Resources.Result.win.rawValue
            case 1: resultTF.text = Resources.Result.lost.rawValue
            case 2: resultTF.text = Resources.Result.refund.rawValue
            default: resultTF.text = Resources.Result.notCalculated.rawValue
            }
            resultTF.resignFirstResponder()
            
        default:
            sportTypeTF.resignFirstResponder()
        }
        
        checkingBet()
        self.view.endEditing(true)
    }
    
    func updateTeamsList(for textField: UITextField, with pickerView: UIPickerView, at row: Int) -> String {
        switch pickerView {
        case sportTypePicker:
            let array = Array(DataManager.shared.sportType.keys).sorted(by: <)
            return array[row]
        case leaguePicker:
            guard let array = DataManager.shared.sportType[sportTypeTF.text ?? "Футбол"] else { return ""}
            return array[row]
        case homeTeamPicker, questTeamPicker:
            var array = [String]()
            guard let league = leagueTF.text else { return ""}
            switch sportTypeTF.text {
            case "Баскетбол":
                array = DataManager.shared.basketballClubs[league] ?? [""]
            case "Футбол":
                array = DataManager.shared.footballClubs[league] ?? [""]
            default:
                array = DataManager.shared.hockeyClubs[league] ?? [""]
            }
            return array[row]
        case betTypePicker:
            guard let array = DataManager.shared.betTypes[sportTypeTF.text ?? ""] else { return ""}
            return array[row]
        case resultPicker:
            return Resources.Result.allCases[row].rawValue
        default:
            return DataManager.shared.sportType.keys.description
        }
    }
}
