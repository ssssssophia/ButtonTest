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
    let todayColor: Color = Color("cautious")
    
//    @State var isPressed = false
    
    var body: some View {
        let gradient = LinearGradient(gradient: Gradient(colors: [colorDark, colorLight]), startPoint: .top, endPoint: .bottom)
        let gradientReversed = LinearGradient(gradient: Gradient(colors: [colorLight, colorDark]), startPoint: .top, endPoint: .bottom)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let dateString = formatter.string(from: Date())
        let clock : CGFloat = NumberFormatter().number(from: dateString) as! CGFloat

        
        return
            
            ZStack {
//                gradientReversed
                ZStack {

                    Circle()
                        .stroke(gradient, lineWidth: 30)
                        .frame(width: 0.68*screenSize.width, height: 0.68*screenSize.width)
                    Circle()
                        .stroke(gradientReversed, lineWidth: 30)
                        .frame(width: 0.72*screenSize.width, height: 0.72*screenSize.width)
                    
//                    if isPressed {
                    gradientReversed
                        .clipShape(Circle())
                        .frame(width: 0.65*screenSize.width, height: 0.65*screenSize.width)
//                    } else {
//                        gradientReversed
//                            .clipShape(Circle())
//                            .frame(width: 330, height: 330)
//                    }
                }
                .blur(radius: 10)
//                .onTapGesture {
//                    self.isPressed.toggle()
//                }
                Text("谨慎")
                    .font(.custom("indicator", size: screenSize.width*0.21))
                    .fontWeight(.black)
                    .shadow(radius: 5, x: 10, y: 10)
                    .foregroundColor(todayColor)
                    .multilineTextAlignment(.center)
                    .frame(width: screenSize.width*0.21)
                Circle()
                    .trim(from: 0, to: clock / 24)
                    .stroke(todayColor, style: StrokeStyle(lineWidth: 6.0, lineCap: .round))
                    .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
                    .rotationEffect(Angle(degrees: -90))
                    .shadow(color: todayColor.opacity(0.5), radius: 8, x: 6, y: 5)
                    
                
                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 1, time: 1)
                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 3, time: 3)
                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 5, time: 5)
                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 7, time: 7)
                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 9, time: 9)
                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 11, time: 11)
                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 13, time: 13)
//                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 15, time: 15)
//                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 17, time: 17)
//                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 19, time: 19)
//                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 21, time: 21)
//                smallRingView(ringColor: todayColor, width: screenSize.width*0.1, height: screenSize.width*0.1, count: 23, time: 23)
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
