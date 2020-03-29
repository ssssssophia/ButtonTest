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
    var time : Double = 10

    
    var body: some View {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        let dateString = formatter.string(from: Date())
        
        let clock : Double = NumberFormatter().number(from: dateString) as! Double
        
        var due : Bool = false
        if time - clock <= 1 {
            due = true
        } else {
            due = false
        }
        
        let multiplier = due ? width * 1.2 / 44 : width / 44
        
        var offsetSize = CGSize.zero
        if time == 0 {
            offsetSize.width = 0
            offsetSize.height = -150
        } else if time == 2 {
            offsetSize.width = 75
            offsetSize.height = -130
        } else if time == 4 {
            offsetSize.width = 130
            offsetSize.height = -75
        } else if time == 6 {
            offsetSize.width = 150
            offsetSize.height = 0
        } else if time == 8 {
            offsetSize.width = 130
            offsetSize.height = 75
        } else if time == 10 {
            offsetSize.width = 75
            offsetSize.height = 130
        } else if time == 12 {
            offsetSize.width = 0
            offsetSize.height = 150
        } else if time == 14 {
            offsetSize.width = -75
            offsetSize.height = 130
        } else if time == 16 {
            offsetSize.width = -130
            offsetSize.height = 75
        } else if time == 18 {
            offsetSize.width = -150
            offsetSize.height = 0
        } else if time == 20 {
            offsetSize.width = -130
            offsetSize.height = -75
        } else if time == 22 {
            offsetSize.width = -75
            offsetSize.height = -130
        } else {
            offsetSize.width = 0
            offsetSize.height = -150
        }
        
        return ZStack {
            
//            LinearGradient(gradient: Gradient(colors: [Color("bg-light"), Color("bg-dark")]), startPoint: .top, endPoint: .bottom)
//                .clipShape(Circle())
//                .frame(width: due ? width * 1.2 : width , height: due ? height * 1.2 : height)
            
            Circle()
                .foregroundColor(ringColor.opacity(0.25))
//                .stroke(Color("grey-light").opacity(0.1), style: StrokeStyle(lineWidth: 8 * multiplier))
                .frame(width: due ? width * 1.2 : width , height: due ? height * 1.2 : height)
                .shadow(color: ringColor.opacity(1), radius: 3, x: 3, y: 3)
            
            Circle()
                .stroke(Color.clear, style: StrokeStyle(lineWidth: 6 * multiplier))
                .frame(width: due ? width * 1.2 : width , height: due ? height * 1.2 : height)
//                .shadow(color: ringColor.opacity(0.2), radius: 1, x: 1, y: 1)
//                .shadow(radius: 3, x: 5, y: 5)
            Text("\(count)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(ringColor)
        }
//        .background(ringColor.opacity(0.25))
//        .clipShape(Circle())
//        .rotationEffect(Angle(degrees: time/24*360), anchor: .center)
        .offset(offsetSize)
//        .shadow(color: ringColor.opacity(1), radius: 2, x: 2, y: 2)
//        .shadow(radius: 2, x: 2, y: 2)
    }
}

struct smallRingView_Previews: PreviewProvider {
    static var previews: some View {
        smallRingView()
    }
}
