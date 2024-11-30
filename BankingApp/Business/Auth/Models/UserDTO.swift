//
//  UserDTO.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 18.11.24.
//

import Foundation
import RealmSwift
class UserDTO: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String?
    @Persisted var surname: String?
    @Persisted var email: String?
    @Persisted var password: String?
}
