//
//  shuiniView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 5/16/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct shuiniView: View {
    
    let colorLight : Color = Color("bg-light")
    let colorDark : Color = Color("bg-dark")
    let todayColor : Color = Color("cautious")
    
    var body: some View {

        let gradient = LinearGradient(gradient: Gradient(colors: [colorDark, colorLight]), startPoint: .top, endPoint: .bottom)
        let gradientReversed = LinearGradient(gradient: Gradient(colors: [colorLight, colorDark]), startPoint: .top, endPoint: .bottom)
        
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
                Circle()
                    .trim(from: 0, to: 0.75)
                    .stroke(todayColor.opacity(0.7), style: StrokeStyle(lineWidth: 6.0, dash: [10]))
                    .frame(width: 300, height: 300)
                    .rotationEffect(Angle(degrees: -45))
                    .offset(y:10)
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(todayColor, lineWidth: 6)
                    .frame(width: 300, height: 300)
                    .rotationEffect(Angle(degrees: -45))
                    .offset(y:10)
                Text("距离水逆结束还有XX天")
                    .foregroundColor(todayColor)
                    .offset(x: 0, y: -120)
                Text("今日水逆")
                    .font(.custom("indicator", size: 60))
                    .fontWeight(.black)
                    .shadow(radius: 5, x: 10, y: 10)
                    .foregroundColor(todayColor)
                    .multilineTextAlignment(.center)
                    .frame(width: 120.0)
            }
                    
            .animation(.default)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct shuiniView_Previews: PreviewProvider {
    static var previews: some View {
        shuiniView()
    }
}
