//
//  CellListView.swift
//  ServiceHandsTestApp_KovalenkoAA
//
//  Created by Андрей Коваленко on 25.06.2024.
//

import SwiftUI

struct CellListView: View {
    
    var name: String
    var description: String
    var backImage: String
    var label: String
    
    var body: some View {
        
        HStack(spacing: 16) {
            Image(backImage)
                .resizable()
                .frame(width: 45)
                .overlay {
                    Text(label)
                }
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.black)
                Text(description)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundColor(.black)
            }
            Spacer()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .foregroundColor(.white)
        )
        
    }
}

//#Preview {
//    CellListView()
//}
