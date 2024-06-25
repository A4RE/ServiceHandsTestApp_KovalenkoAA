//
//  CellModel.swift
//  ServiceHandsTestApp_KovalenkoAA
//
//  Created by Андрей Коваленко on 25.06.2024.
//

import Foundation

enum CellType: String {
    case dead = "Мёртвая"
    case alive = "Живая"
    case life = "Жизнь"
}


struct CellModel: Identifiable, Equatable {
    let id = UUID()
    let type: CellType
    let description: String
    let backImage: String
    let label: String
}
