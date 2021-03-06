//
//  ContentView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 3/12/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct softCircleView0: View {
    
    let colorLight : Color = Color("bg-light")
    let colorDark : Color = Color("bg-dark")
    let todayColor: Color = Color("lucky")
    
//    @State var isPressed = false
    
    var body: some View {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let dateString = formatter.string(from: Date())
        let clock : CGFloat = NumberFormatter().number(from: dateString) as! CGFloat

        let lintGradient = AngularGradient(
            gradient: Gradient(colors: [todayColor, todayColor.opacity(0.3)]),
        center: .center,
        startAngle: .degrees(Double(clock) * 15),
        endAngle: .degrees(0))
        
        return
            
            ZStack {
//                ZStack {
//
//                    Circle()
//                        .stroke(gradient, lineWidth: 30)
//                        .frame(width: 0.5*screenSize.width, height: 0.5*screenSize.width)
//                    Circle()
//                        .stroke(gradientReversed, lineWidth: 30)
//                        .frame(width: 0.5*screenSize.width, height: 0.5*screenSize.width)
//                    gradientReversed
//                        .clipShape(Circle())
//                        .frame(width: 0.45*screenSize.width, height: 0.45*screenSize.width)
//                }
//                .blur(radius: 10)
                Circle()
                    .frame(width: 0.55*screenSize.width, height: 0.55*screenSize.width)
                    .foregroundColor(Color.white)
                    .blur(radius: 10)
                Text("谨慎")
                    .font(.custom("indicator", size: screenSize.width*0.21))
                    .fontWeight(.black)
                    .shadow(radius: 5, x: 10, y: 10)
                    .foregroundColor(todayColor)
                    .multilineTextAlignment(.center)
                    .frame(width: screenSize.width*0.21)
                    .lineSpacing(/*@START_MENU_TOKEN@*/-13.0/*@END_MENU_TOKEN@*/)
                
                ZStack {
                    Circle()
                        .trim(from: 0, to: clock / 24)
                        .stroke(lintGradient, style: StrokeStyle(lineWidth: 5.0, lineCap: .round))
                        .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
                        .rotationEffect(Angle(degrees: -90))
//                        .shadow(color: todayColor.opacity(0.5), radius: 8, x: 6, y: 5)
                    smallRingView2()
                }
                .shadow(color: Color(.black).opacity(0.4), radius: 8, x: 10, y: 10)
                
                
                
//                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 11, time: 21)
//                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 13, time: 17)

            }
            .animation(.default)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct ContentView_Previews0: PreviewProvider {
    static var previews: some View {
        softCircleView0()
    }
}
