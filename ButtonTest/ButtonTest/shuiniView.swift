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
                Circle()
                    .trim(from: 0, to: 0.75)
                    .stroke(todayColor.opacity(0.7), style: StrokeStyle(lineWidth: 6.0, lineCap: .round, dash: [15]))
                    .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
                    .rotationEffect(Angle(degrees: -45))
                    .shadow(color: todayColor.opacity(0.5), radius: 8, x: 6, y: 5)
                    .offset(y:10)
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(todayColor, style: StrokeStyle(lineWidth: 6.0, lineCap: .round))
                    .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
                    .rotationEffect(Angle(degrees: -45))
                    .shadow(color: todayColor.opacity(0.5), radius: 8, x: 6, y: 5)
                    .offset(y:10)
                Text("距离水逆结束还有XX天")
                    .foregroundColor(todayColor)
                    .offset(x: 0, y: -120)
                Text("今日水逆")
                    .font(.custom("indicator", size: screenSize.width*0.15))
                    .fontWeight(.black)
                    .shadow(radius: 5, x: 10, y: 10)
                    .foregroundColor(todayColor)
                    .multilineTextAlignment(.center)
                    .frame(width: screenSize.width*0.3)
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
