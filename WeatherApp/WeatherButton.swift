//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Vladimir Fursov on 03.04.2024.
//

import Foundation
import SwiftUI


struct ButtonView: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Button(action: {
        }, label: {
            Text(title)
                .frame(width: 250, height: 50)
                .foregroundColor(textColor)
                .font(.system(size: 30, weight: .regular, design: .default))
                .background(backgroundColor)
                .cornerRadius(30)
        })
        .padding(.top, 30)
    }
} 
