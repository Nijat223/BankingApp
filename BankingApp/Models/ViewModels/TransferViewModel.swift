//
//  TransferViewModel.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 02.12.24.
//

import Foundation
import RealmSwift

final class TransferViewModel {
    
    private(set) var cards: Results<Card>?
    var selectedCardFrom = Card()
    var selectedCardTo = Card()
    var amount = Int()
    
    func getList() {
        cards =  RealmHelper.instance.getList(of: Card.self)
    }
    func transfer() {
        RealmHelper.instance.updateObject {
            selectedCardFrom.balance -= amount
            selectedCardTo.balance += amount
        }
    }
}
