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
                        .frame(width: 280, height: 300)
                    Circle()
                        .stroke(gradientReversed, lineWidth: 30)
                        .frame(width: 330, height: 330)
                    
//                    if isPressed {
                        gradient
                            .clipShape(Circle())
                            .frame(width: 330, height: 300)
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
                Text("顺遂")
                    .font(.custom("indicator", size: 100))
                    .fontWeight(.black)
                    .shadow(radius: 5, x: 10, y: 10)
                    .foregroundColor(todayColor)
                    .multilineTextAlignment(.center)
                    .frame(width: 100.0)
                Circle()
                    .trim(from: 0, to: clock / 24)
                    .stroke(todayColor, lineWidth: 6)
                    .frame(width: 300, height: 300)
                    .rotationEffect(Angle(degrees: -90))
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
                    
                
                smallRingView(ringColor: todayColor, width: 44, height: 44, count: 1, time: 0)
                smallRingView(ringColor: todayColor, width: 44, height: 44, count: 5, time: 16)
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
