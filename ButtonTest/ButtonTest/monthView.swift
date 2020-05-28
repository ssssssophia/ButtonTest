//
//  monthView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 5/24/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct monthView: View {
    let colorLight : Color = Color("bg-light")
    let colorDark : Color = Color("bg-dark")
    let todayColor: Color = Color("cautious")
        
//    @State var isPressed = false
        
    var body: some View {
        let gradient = LinearGradient(gradient: Gradient(colors: [colorDark, colorLight]), startPoint: .top, endPoint: .bottom)
        let gradientReversed = LinearGradient(gradient: Gradient(colors: [colorLight, colorDark]), startPoint: .top, endPoint: .bottom)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        let dateString = formatter.string(from: Date())
        let day : CGFloat = NumberFormatter().number(from: dateString) as! CGFloat
        
        let formatter2 = DateFormatter()
        formatter2.dateFormat = "MM"
        let dateString2 = formatter2.string(from: Date())
        let month : Int = NumberFormatter().number(from: dateString2) as! Int
        let monthLen : Int
        let dashLen : CGFloat
        
        if month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12 {
            monthLen = 31
            dashLen = 15.2
        } else if month==2{
            monthLen = 28
            dashLen = 16.8
        } else {
            monthLen = 30
            dashLen = 15.7
        }
        

        
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
                    .trim(from: 0, to: 1)
                    .stroke(Color("grey-light").opacity(0.3), style: StrokeStyle(lineWidth: 8.0, lineCap: .round, dash: [dashLen]))
//                    .stroke(todayColor, lineWidth: 6)
                    .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
                    .rotationEffect(Angle(degrees: -90))
                    .shadow(color: todayColor.opacity(0.5), radius: 8, x: 6, y: 5)
                Circle()
                    .trim(from: 0, to: day / CGFloat(monthLen))
                    .stroke(todayColor.opacity(0.7), style: StrokeStyle(lineWidth: 8.0, lineCap: .round, dash: [dashLen]))
                    .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
                    .rotationEffect(Angle(degrees: -90))
                    .shadow(color: todayColor.opacity(0.5), radius: 8, x: 6, y: 5)
                    
                
//                smallRingView(ringColor: todayColor, width: 44, height: 44, count: 1, time: 0)
//                smallRingView(ringColor: todayColor, width: 44, height: 44, count: 5, time: 16)
                
            }
            .animation(.default)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct monthView_Previews: PreviewProvider {
    static var previews: some View {
        monthView()
    }
}
