//
//  ContentView.swift
//  WeatherApp
//
//  Created by Vladimir Fursov on 03.04.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black: .blue, bottomColor: isNight ? .gray: .white)
            VStack {
                CityTextView(cityName: "Pyatigorsk, RUS")
                MainWeatherStatusView(imageName: "cloud.sun.fill", temperature: 36)
                    .padding(.bottom, 40)
                HStack {
                    weatherDays(temperature: 15, imageName: "sun.max.fill", dayweek: "Mon")
                    weatherDays(temperature: 30, imageName: "cloud.sun.fill", dayweek: "Tue")
                    weatherDays(temperature: 35, imageName: "sun.max.fill", dayweek: "Wed")
                    weatherDays(temperature: 20, imageName: "cloud.sun.rain.fill", dayweek: "Thu")
                    weatherDays(temperature: 25, imageName: "sun.rain.fill", dayweek: "Fri")
                }
                ButtonView(title: "Change theme", textColor: .blue, backgroundColor: .white)
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct weatherDays: View {
    var temperature: Int
    var imageName: String
    var dayweek: String
    var body: some View {
        VStack {
            Text("\(dayweek)")
                .font(.system(size: 15, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: "\(imageName)")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            Text("\(temperature)°")
                .font(.system(size: 30, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(colors: [.blue, .white], startPoint: .top, endPoint: .bottomTrailing)
            .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    var body: some View {
        Image(systemName: imageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        Text("\(temperature)°")
            .font(.system(size: 70, weight: .medium, design: .default))
            .foregroundColor(.white)
    }
}
