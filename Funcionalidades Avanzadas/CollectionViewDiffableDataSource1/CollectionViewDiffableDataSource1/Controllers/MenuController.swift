//
//  MenuController.swift
//  CollectionViewDiffableDataSource1
//
//  Created by LABORATORIO MAC UAM on 31/8/24.
//

import Foundation

class MenuController{
    let dataSource: MenuDataSourceRepresentable
    
    init(dataSource: MenuDataSourceRepresentable) {
        self.dataSource = dataSource
    }
    func getMenuItems(query: String) -> [MenuModel]{
        dataSource.getMenuItems(query: query)
    }
}
