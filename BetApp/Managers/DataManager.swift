//
//  DataManager.swift
//  BetApp
//
//  Created by Anton Vassel on 23.05.2022.
//

class DataManager {
    static let shared = DataManager()
    
    let sportType = ["Футбол": ["АПЛ", "РПЛ", "Серия А"],
                     "Хоккей": ["НХЛ", "КХЛ", "АХЛ"],
                     "Баскетбол": ["НБА", "Евролига", "Единая Лига"]]
    
    let footballClubs = ["АПЛ": ["Манчестер Сити",
                                 "Ливерпуль",
                                 "Челси",
                                 "Тоттенхэм",
                                 "Арсенал",
                                 "Манчестер Юнайтед",
                                 "Вест Хэм Юнайтед",
                                 "Лестер Сити",
                                 "Брайтон",
                                 "Вулверхэмптон",
                                 "Ньюкасл Юнайтед",
                                 "Кристал Пэлас",
                                 "Брэнтфорд",
                                 "Астон Вилла",
                                 "Саутгемптон",
                                 "Эвертон",
                                 "Лидс Юнайтед",
                                 "Бернли",
                                 "Уотфорд",
                                 "Норвич Сити"],
                         "РПЛ" : ["Зенит",
                                  "Сочи",
                                  "Динамо",
                                  "Краснодар",
                                  "ЦСКА",
                                  "Локомотив",
                                  "Ахмат",
                                  "Крылья Советов",
                                  "Ростов",
                                  "Спартак",
                                  "Нижний Новгород",
                                  "Урал",
                                  "Химки",
                                  "Уфа",
                                  "Рубин",
                                  "Арсенал"],
                         "Серия А" : ["Милан",
                                      "Интер",
                                      "Наполи",
                                      "Ювентус",
                                      "Лацио",
                                      "Рома",
                                      "Фиорентина",
                                      "Аталанта",
                                      "Верона",
                                      "Торино",
                                      "Сассуоло",
                                      "Удинезе",
                                      "Болонья",
                                      "Эмполи",
                                      "Сампдория",
                                      "Специя",
                                      "Салернитана",
                                      "Кальяри",
                                      "Дженоа",
                                      "Венеция"]]
    
    let hockeyClubs = ["НХЛ" : ["Флорида",
                                "Колорадо",
                                "Каролина",
                                "Торонто",
                                "Миннесота",
                                "Калгари",
                                "Рейнджерс",
                                "Тампа-Бэй",
                                "Сент-Луис",
                                "Бостон",
                                "Эдмонтон",
                                "Питтсбург",
                                "Вашингтон",
                                "Лос-Анджелес",
                                "Даллас",
                                "Нэшвилл",
                                "Вегас",
                                "Виннипег",
                                "Айлендерс",
                                "Коламбус",
                                "Сан-Хосе",
                                "Анахайм",
                                "Баффало",
                                "Детройт",
                                "Оттава",
                                "Чикаго",
                                "Нью-Джерси",
                                "Филадельфия",
                                "Сиэтл",
                                "Аризона",
                                "Монреаль"],
                       "КХЛ" : ["Металург Мг",
                                "Трактор",
                                "СКА",
                                "Салават Юлаев",
                                "Ак Барс",
                                "Йокерит",
                                "ЦСКА",
                                "Димано М",
                                "Северсталь",
                                "Авангард",
                                "Локомотив",
                                "Спартак",
                                "Димано Мн",
                                "Сибирь",
                                "Нефтехимик",
                                "Торпедо",
                                "Барыс",
                                "Автомобилист",
                                "Амур",
                                "Витязь",
                                "ХК Сочи",
                                "Димано Р",
                                "Адмирал",
                                "Куньлунь РС"],
                       "АХЛ" : ["Чикаго",
                                "Стоктон",
                                "Онтарио",
                                "Ютика",
                                "Шарлотт",
                                "Колорадо",
                                "Спрингфилд",
                                "Манитоба",
                                "Бэйкерсхилд",
                                "Абботсфорд",
                                "Сиракьюз",
                                "Лаваль",
                                "Беллевиль",
                                "Провиденс",
                                "Милуоки",
                                "Рочестер",
                                "Хендерсон",
                                "Рокфорд",
                                "Торонто",
                                "Техас",
                                "Уилкс-Барре",
                                "Херши",
                                "Бриджпорт",
                                "Айова",
                                "Хартфорд",
                                "Гранд-Рапидс",
                                "Лихай",
                                "Сан-Диего",
                                "Кливленд",
                                "Тусон",
                                "Сан-Хосе"]]
    
    let basketballClubs = ["НБА":["Финикс",
                                  "Мемфис",
                                  "Голден Стэйт",
                                  "Майами",
                                  "Даллас",
                                  "Милуоки",
                                  "Бостон",
                                  "Филадельфия",
                                  "Юта",
                                  "Торонто",
                                  "Денвер",
                                  "Чикаго",
                                  "Миннесота",
                                  "Кливленд",
                                  "Атланта",
                                  "Шарлотт",
                                  "Нью-Йорк",
                                  "Нью-Орлеанс",
                                  "Вашингтон",
                                  "Сан-Антонио",
                                  "Лос-Анджелес",
                                  "Сакраменто",
                                  "Портленд",
                                  "Индиана",
                                  "Оклахома",
                                  "Детройт",
                                  "Орландо",
                                  "Хьюстон"],
                           "Евролига" : ["Барселона",
                                         "Олимпиакос",
                                         "Олимпия",
                                         "Реал М",
                                         "Маккаби",
                                         "Анадолу Эфес",
                                         "Монако",
                                         "Бавария",
                                         "Црвена Звезда",
                                         "Баскония",
                                         "Альба",
                                         "Фенербахче",
                                         "Панатинаикос",
                                         "Жальгирис",
                                         "АСВЕЛ"],
                           "Единая Лига" : ["ЦСКА",
                                            "Зенит",
                                            "УНИКС",
                                            "Локомотив-Кубань",
                                            "Парма",
                                            "Автодор",
                                            "Енисей",
                                            "Нижний Новгород",
                                            "Цмоки-Минск",
                                            "Астана"]]
    let betTypes = [
        "Футбол": ["П1", "Х", "П2", "Х1", "Х2", "Ф1 (0)","Ф2 (0)", "ТБ 2,5", "ТМ 2,5"],
        "Хоккей" : ["П1", "Х", "П2", "Х1", "Х2", "Ф1 (0)","Ф2 (0)", "ТБ 5,5", "ТМ 5,5"],
        "Баскетбол" : ["П1", "П2", "Ф1 (+10)","Ф2 (+10)", "Ф1 (-10)","Ф2 (-10)", "ТБ 215","ТМ 215"]
    ]
    
    private var betDataBase: [Bet] = [
        Bet(sportType: "Хоккей", league: "НХЛ", matchDate: "13 марта 2022 г.", homeTeam: "Торонто", guestTeam: "Бостон", betType: "Ф1 (0)", ratio: 1.6, betAmount: 4000, result: Resources.Result.win.rawValue),
        Bet(sportType: "Футбол", league: "АПЛ", matchDate: "15 апр. 2022 г.", homeTeam: "Лестер Сити", guestTeam: "Арсенал", betType: "Х2", ratio: 1.5, betAmount: 3500, result: Resources.Result.lost.rawValue),
        Bet(sportType: "Футбол", league: "РПЛ", matchDate: "29 апр. 2022 г.", homeTeam: "Зенит", guestTeam: "Краснодар", betType: "П1", ratio: 1.9, betAmount: 5000, result: Resources.Result.win.rawValue),
        Bet(sportType: "Баскетбол", league: "НБА", matchDate: "10 мая 2022 г.", homeTeam: "Чикаго", guestTeam: "Юта", betType: "ТБ (215)", ratio: 2.0, betAmount: 2500, result: Resources.Result.refund.rawValue),
        Bet(sportType: "Футбол", league: "АПЛ", matchDate: "24 мая 2022 г.", homeTeam: "Манчестер Сити", guestTeam: "Тоттенхэм", betType: "Х", ratio: 4.0, betAmount: 10000, result: Resources.Result.notCalculated.rawValue),
        Bet(sportType: "Футбол", league: "АПЛ", matchDate: "24 мая 2022 г.", homeTeam: "Манчестер Сити", guestTeam: "Тоттенхэм", betType: "Х", ratio: 4.0, betAmount: 10000, result: Resources.Result.notCalculated.rawValue),
        Bet(sportType: "Футбол", league: "АПЛ", matchDate: "24 мая 2022 г.", homeTeam: "Манчестер Сити", guestTeam: "Тоттенхэм", betType: "Х", ratio: 4.0, betAmount: 10000, result: Resources.Result.notCalculated.rawValue),
        Bet(sportType: "Футбол", league: "АПЛ", matchDate: "24 мая 2022 г.", homeTeam: "Манчестер Сити", guestTeam: "Тоттенхэм", betType: "Х", ratio: 4.0, betAmount: 10000, result: Resources.Result.notCalculated.rawValue)
    ]
    
    func placeBet(with bet: Bet) {
        
        betDataBase.append(
            Bet(
                sportType: bet.sportType,
                league: bet.league,
                matchDate: bet.matchDate,
                homeTeam: bet.homeTeam,
                guestTeam: bet.guestTeam,
                betType: bet.betType,
                ratio: bet.ratio,
                betAmount: bet.betAmount,
                result: bet.result))
    }
    
    func changeBet(with bet: Bet, in betIndex: Int) {
        betDataBase[betDataBase.count - 1 - betIndex] = bet
    }
    
    func getBets() -> [Bet] {
        betDataBase.reversed()
    }
    
    func deleteBet(at betIndex: Int) {
        betDataBase.remove(at: betDataBase.count - 1 - betIndex)
        print(betDataBase)
    }
    
    private init() {}
}

