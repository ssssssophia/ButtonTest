//
//  weekView2.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 7/11/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//


import SwiftUI

let weekday = weekdayLookUp()

let weekColor = ["lucky", "normal", "normal", "cautious", "normal", "normal", "normal"]

let weekText = ["顺遂", "尚可", "尚可", "谨慎", "尚可", "尚可", "尚可"]

struct weekView2: View {
    let colorLight : Color = Color("bg-light")
    let colorDark : Color = Color("bg-dark")
//    let todayColor: Color = Color("cautious")

    
    var body: some View {
        let gradient = LinearGradient(gradient: Gradient(colors: [colorDark, colorLight]), startPoint: .top, endPoint: .bottom)
        let gradientReversed = LinearGradient(gradient: Gradient(colors: [colorLight, colorDark]), startPoint: .top, endPoint: .bottom)
        
        let todayColor: Color = Color(weekColor[weekday-1])
        let todayText = weekText[weekday-1]
        
        return
            
            ZStack {
                ZStack {

                    Circle()
                        .stroke(gradient, lineWidth: 30)
                        .frame(width: 0.5*screenSize.width, height: 0.5*screenSize.width)
                    Circle()
                        .stroke(gradientReversed, lineWidth: 30)
                        .frame(width: 0.5*screenSize.width, height: 0.5*screenSize.width)
                    gradientReversed
                        .clipShape(Circle())
                        .frame(width: 0.45*screenSize.width, height: 0.45*screenSize.width)
                }
                .blur(radius: 10)
                
                Text("\(todayText)")
                    .font(.custom("indicator", size: screenSize.width*0.21))
                    .fontWeight(.black)
                    .shadow(radius: 5, x: 10, y: 10)
                    .foregroundColor(todayColor)
                    .multilineTextAlignment(.center)
                    .frame(width: screenSize.width*0.21)
                
                Circle()
                    .stroke(Color("grey-light").opacity(0.3),style: StrokeStyle(lineWidth: 3.0, lineCap: .round, dash: [0.68*3.14/14*screenSize.width]))
                    .frame(width: 0.68*screenSize.width)
                    .rotationEffect(Angle(degrees: -90))
                
                Circle()
                    .trim(from: 0, to: 1)
                    .stroke(Color("grey-light").opacity(0.3), style: StrokeStyle(lineWidth: 8.0, lineCap: .round, dash: [0.75*3.14/14*screenSize.width]))
                    .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
                    .rotationEffect(Angle(degrees: -90))
                    .shadow(color: todayColor.opacity(0.5), radius: 8, x: 6, y: 5)
                   
                ZStack {
                    ForEach((0...weekday-1), id:\.self) { day in
                        colorWeekRing(day: day)
                    }
                }
                
                
            }
//            .animation(.default)
//            .edgesIgnoringSafeArea(.all)
        
    }
    
    
}

struct weekView2_Previews: PreviewProvider {
    static var previews: some View {
        weekView2()
    }
}

struct colorWeekRing: View {
    var day: Int = 0

    var body: some View {

        Circle()
            .trim(from: 0, to: 1/14)
            .stroke(Color(weekColor[day]).opacity(0.7), style: StrokeStyle(lineWidth: 8.0, lineCap: .round))
            .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
            .rotationEffect(Angle(degrees: Double(-90 + day*360/7)))
            .shadow(color: Color(weekColor[day]).opacity(0.5), radius: 8, x: 6, y: 5)
            
        
    }
}

func weekdayLookUp() -> Int {
    var weekday : Int
    
    let currentDate = Date()
    let calendar = Calendar.current
    weekday = calendar.dateComponents([.weekday], from: currentDate).weekday!
    if weekday == 1 {
        weekday = 7
    } else {
        weekday = weekday - 1
    }
    
    return weekday
}
