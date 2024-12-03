//
//  AuthViewModel.swift
//  BankingApp
//
//  Created by Nijat Shikhaliyev on 02.12.24.
//

import Foundation
import RealmSwift
    
final class AuthViewModel {
    
        enum ViewState {
            case error(message:String)
            case loginError(message:String)
        }
    
    var callback: ((ViewState) -> Void)?
    private let realm = try!Realm()
     var Users: Results<UserDTO>?
    lazy var surname = String()
    lazy var name  = String()
    lazy var email = String()
    lazy var password  = String()
    lazy var loggedEmail = String()
    lazy var loggedPass = String()
    
    func checkValidation() {
        guard !surname.isEmpty, !name.isEmpty, !email.isEmpty, !password.isEmpty
        else {return error(message: "Can't be empty")}
        guard surname.isValidLastname() else {return error(message: "Surname must be min. 5 characters")}
        guard name.isValidName() else {return error(message: "Name must be min. 3 characters")}
        guard email.isValidEmail() else {return error(message: "Enter correct email format")}
        guard password.isValidPass() else {return error(message: "Password must be min. 8 characters")}
        
        createUser()
    }
    func checkUser() -> Bool {
        var isUser = Bool()
        fetchUserList()
        guard !loggedEmail.isEmpty && !loggedPass.isEmpty else {return false}
        guard let users = Users else {return false}
        for user in users {
            if user.email == loggedEmail && user.password == loggedPass {
                isUser = true
            }else {
                isUser = false
            }
        }
        return isUser
    }
    
    func error(message: String) {
        callback?(.error(message: message))
    }
    
    func getList() {
        let results = realm.objects(UserDTO.self)
        Users = results
    }
    func writeRealm(model:UserDTO) {
        try! realm.write {
            realm.add(model)
        }
    }
    
    func fetchUserList() {
       Users = realm.objects(UserDTO.self)
    }
    
    func createUser() {
        let user = UserDTO()
        user.name = name
        user.surname = surname
        user.email = email
        user.password = password
        writeRealm(model: user)
        getList()
    }
    
}
