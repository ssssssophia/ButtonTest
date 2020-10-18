//
//  ContentView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 3/12/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct softCircleView: View {
    
    let colorLight : Color = Color("bg-light")
    let colorDark : Color = Color("bg-dark")
    let todayColor: Color = Color("lucky")
    let todayColorLight: Color = Color("lucky-light")
    
//    @State var isPressed = false
    
    var body: some View {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let dateString = formatter.string(from: Date())
        let clock : CGFloat = NumberFormatter().number(from: dateString) as! CGFloat

        let lintGradient = AngularGradient(
            gradient: Gradient(colors: [todayColor, todayColor.opacity(0)]),
        center: .center,
        startAngle: .degrees(Double(clock) * 15),
        endAngle: .degrees(0))
        
        let circleGradient = LinearGradient(
            gradient: Gradient(colors: [todayColor, Color.white]), startPoint: .bottomTrailing, endPoint: .topLeading)
        
        return
            
            ZStack {
                Circle()
                    .fill(circleGradient)
                    .frame(width: 0.7*screenSize.width)
                Circle()
                    .frame(width: 0.5*screenSize.width)
                    .foregroundColor(todayColor)
                Circle()
                    .stroke(todayColorLight, style: StrokeStyle(lineWidth: 15.0, lineCap: .round))
                    .frame(width: 0.72*screenSize.width)
                Text("谨慎")
                    .font(.custom("indicator", size: screenSize.width*0.21))
                    .fontWeight(.black)
                    .shadow(radius: 5, x: 10, y: 10)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                    .frame(width: screenSize.width*0.21)
                    .lineSpacing(/*@START_MENU_TOKEN@*/-13.0/*@END_MENU_TOKEN@*/)
                
                ZStack {
                    Circle()
                        .trim(from: 0, to: clock / 24)
                        .stroke(lintGradient, style: StrokeStyle(lineWidth: 16.0, lineCap: .square))
                        .frame(width: 0.64*screenSize.width)
                        .rotationEffect(Angle(degrees: -93))
//                        .shadow(color: todayColor.opacity(0.5), radius: 8, x: 6, y: 5)
                    
                    dotView()
                    Rectangle()
                        .frame(width: 40, height: 4)
                        .cornerRadius(3)
                        .foregroundColor(Color.white)
                        .rotationEffect(Angle(degrees: Double(45)))
                        .offset(x: 0.24*screenSize.width, y: 0.24*screenSize.width)
                        .rotationEffect(Angle(degrees: Double(15*clock-135)))
                    
                }
                smallRingView2()
                    .shadow(color: Color(.black).opacity(0.4), radius: 8, x: 10, y: 10)
                
                
                
//                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 11, time: 21)
//                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 13, time: 17)

            }
            .animation(.default)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        softCircleView()
    }
}

struct dotView: View {
    var body: some View {
        ZStack {
            ForEach(0..<12) {item in
                Circle()
                    .frame(width: 5)
                    .foregroundColor(Color.white)
                    .offset(x: 0.21*screenSize.width, y: 0.21*screenSize.width)
                    .rotationEffect(Angle(degrees: Double(30*item-15)))
                
            }
        }
    }
}

