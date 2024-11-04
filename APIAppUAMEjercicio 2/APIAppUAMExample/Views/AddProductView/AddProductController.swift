//
//  AddProductController.swift
//  APIAppUAMExample
//
// Created by Carlos Abea on 3/11/24.

//

import Foundation

final class AddProductController {
    private let apiDataSource = APIDataSource()
    
    func createProduct(_ product: ProductModel) async -> Bool {
        await apiDataSource.createProduct(product)
    }
}
