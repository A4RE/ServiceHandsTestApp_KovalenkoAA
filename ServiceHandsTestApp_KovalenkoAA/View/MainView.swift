//
//  MainView.swift
//  ServiceHandsTestApp_KovalenkoAA
//
//  Created by Андрей Коваленко on 25.06.2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewViewModel()
    
    var body: some View {
        ZStack {
            gradient
            VStack {
                headerText
                listOfCells
                    .padding(.top, 22)
                    .padding(.bottom, 16)
                Spacer()
                button
            }
            .padding(16)
            
        }
    }
}

// MARK: Elements
private extension MainView {
    
    var gradient: some View {
        LinearGradient(colors: [Color(red: 42/255, green: 4/255, blue: 73/255), Color(red: 5/255, green: 2/255, blue: 9/255)], startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
            .ignoresSafeArea()
    }
    
    var headerText: some View {
        Text("Клеточное наполнение")
            .font(.system(size: 20, weight: .semibold))
            .foregroundColor(.white)
    }
    
    var listOfCells: some View {
        ScrollViewReader { proxy in
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.cells) { cell in
                    CellListView(name: cell.type.rawValue, description: cell.description, backImage: cell.backImage, label: cell.label)
                        .id(cell.id)
                }
            }
            .onChange(of: viewModel.cells, {
                if let lastCellId = viewModel.cells.last?.id {
                    withAnimation {
                        proxy.scrollTo(lastCellId, anchor: .bottom)
                    }
                }
            })
        }
    }
    
    var button: some View {
        Button(action: {
            viewModel.addCell()
        }, label: {
            Text("сотворить".uppercased())
                .foregroundColor(.white)
                .font(.system(size: 14, weight: .regular))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(Color(red: 85/255, green: 54/255, blue: 111/255))
                .clipShape(RoundedRectangle(cornerRadius: 4))
            
        })
    }
}

#Preview {
    MainView()
}
