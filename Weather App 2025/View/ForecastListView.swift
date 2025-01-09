//
//  ForecastListView.swift
//  Weather App 2025
//
//  Created by Kuda Zata on 8/1/2025.
//

import SwiftUI

struct ForecastListView: View {
    
    @State var forecastWeatherItems: [ForecastWeatherItem]
    @State private var startAnimation = false
    
    var body: some View {
        List(forecastWeatherItems, id: \.dt) { item in
            ZStack {
                HStack {
                    Text(item.dtTxt.dayOfWeek() ?? "")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 18))
                        .tracking(2)
                    Spacer()
                    Text(item.main.temp.toStringWithZeroDecimalPlaces() + "°")
                        .foregroundStyle(Color.white)
                        .tracking(2)
                }
                Image( item.weather[0].main.imageName, bundle: nil)
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .aspectRatio(contentMode: .fit)
            }
            .listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
    }
}
