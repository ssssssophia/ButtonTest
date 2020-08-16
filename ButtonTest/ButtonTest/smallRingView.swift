//
//  smallRingView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 3/29/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct smallRingView: View {
    var ringColor = Color("lucky")
    var width : CGFloat = 44
    var height : CGFloat = 44
    var count = 5
    var time : Double = 9

    
    var body: some View {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let dateString = formatter.string(from: Date())
        
        let clock : Double = NumberFormatter().number(from: dateString) as! Double
        
        var due : Bool = false
        if abs(time - clock) <= 1 {
            due = true
        } else {
            due = false
        }

        return ZStack {
            if due {
                ZStack {
                    ZStack {
                        Circle()
                            .foregroundColor(ringColor.opacity(1))
                            .frame(width: 1.3*width , height: 1.3*height)
                            .shadow(color: ringColor.opacity(1), radius: 5, x: 3, y: 3)
                        blurView(style: .systemUltraThinMaterialLight).clipShape(Circle())
                            .frame(width: 1.3 * width, height: 1.3 * height)
                            .foregroundColor(ringColor)
                            .shadow(color: ringColor.opacity(0.7),radius: 5)
                        Text("\(count)")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .rotationEffect(Angle(degrees: Double(-15*time)))
                    }
                        .offset(y : -screenSize.width * 0.375)
                }.rotationEffect(Angle(degrees: Double(15*time)))
            } else {
                ZStack {
                    ZStack {
                        blurView(style: .systemUltraThinMaterialLight).clipShape(Circle())
                            .frame(width: 0.9 * width, height: 0.9 * height)
                            .shadow(radius: 5)
                            .shadow(color: Color("grey-light").opacity(0.3), radius: 5, x: 3, y: 3)
                        Text("\(count)")
                            .font(.system(size: 23))
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .rotationEffect(Angle(degrees: Double(-15*time)))
                    }
                        .offset(y : -screenSize.width * 0.375)
                }.rotationEffect(Angle(degrees: Double(15*time)))
            }
        }
        


    }
}

struct smallRingView_Previews: PreviewProvider {
    static var previews: some View {
        smallRingView()
    }
}


