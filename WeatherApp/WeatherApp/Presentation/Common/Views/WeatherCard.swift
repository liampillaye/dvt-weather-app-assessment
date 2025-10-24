//
//  WeatherCard.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct WeatherCard: View {
    
    let dayOfWeek: String
    let temperature: String
    let iconName: String
    
    var body: some View {
        HStack {
            VStack {
                Text(dayOfWeek)
                    .weatherTitleCardPoppinsSemiBoldStyle()
                    .padding(.top, 15)
                Spacer()
                Image("ClearSky-Day")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(.bottom, 10)
            }//:VSTACK
            .padding()
            Spacer()
            VStack() {
                Spacer()
                HStack {
                    Text("\(temperature)")
                        .weatherTempPoppinsBoldStyle()
                    Circle()
                        .stroke(.black, lineWidth: 3) // Blue outline with 5 point thickness
                        .frame(width: 10, height: 10)
                        .padding(.bottom,30)
                        .padding(.leading, -5)
                }//:HSTACK
            }//:VSTACK
            .padding()
        }//:HSTACK
        .frame(height: 130)
        .background(.white)
        .cornerRadius(10)
        .padding(.top, 10)
        .padding(.leading, 25)
        .padding(.trailing, 25)
    }//:BODY
}


//:PREVIEW
#Preview {
    WeatherCard(dayOfWeek: "Monday", temperature: "20", iconName: "Sunny")
}
