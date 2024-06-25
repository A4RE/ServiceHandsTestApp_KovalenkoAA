//
//  MainViewViewModel.swift
//  ServiceHandsTestApp_KovalenkoAA
//
//  Created by Андрей Коваленко on 25.06.2024.
//

import Foundation

final class MainViewViewModel: ObservableObject {
    
    @Published var cells: [CellModel] = []
    
    func addCell() {
        let newCellType: CellType = Bool.random() ? .alive : .dead
        let description = newCellType == .alive ? "и шевелится!" : "или прикидывается"
        let backImage = newCellType == .alive ? "aliveImg" : "dieImg"
        let label = newCellType == .alive ? "💥" : "💀"
        
        cells.append(CellModel(type: newCellType, description: description, backImage: backImage, label: label))
        
        if cells.suffix(3).allSatisfy({ $0.type == .alive }) {
            cells.append(CellModel(type: .life, description: "Ку-ку!", backImage: "liveImg", label: "🐣"))
        } else if cells.suffix(3).allSatisfy({ $0.type == .dead }) {
            cells.removeAll { $0.type == .life }
        }
    }
}
