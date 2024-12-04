//
//  CardSelectViewModel.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 04.12.24.
//

import RealmSwift


final class CardSelectViewModel {
    
    private let realm = try? Realm()
    var cardList: Results<Card>?
    
    var reloadCallback: (() -> Void)?
    
    init() {
        fetchCustomerList()
    }
    
    func fetchCustomerList() {
        self.cardList = realm?.objects(Card.self)
    }

    
    func getCard(at index: Int) -> Card? {
        return cardList?[index]
    }

}
