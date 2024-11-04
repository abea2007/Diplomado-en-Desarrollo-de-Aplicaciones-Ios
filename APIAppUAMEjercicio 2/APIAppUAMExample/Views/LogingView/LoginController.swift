//
//  LoginController.swift
//  APIAppUAMExample
//
// Created by Carlos Abea on 3/11/24.

//

import Foundation

final class LoginController {
    private let apiDataSource = APIDataSource()
    
    func login(username: String, password: String) async -> LoginResponse? {
        await apiDataSource.logIn(username: username, password: password)
    }
}
