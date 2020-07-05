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
                            .foregroundColor(Color.white)
                            .frame(width: 1.4*width , height: 1.4*height)
                            .shadow(color: ringColor.opacity(1), radius: 3, x: 2, y: 2)
                        
                        Circle()
                            .foregroundColor(ringColor.opacity(1))
                            .frame(width: 1.1*width , height: 1.1*height)
                        Text("\(count)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .rotationEffect(Angle(degrees: Double(-15*time)))
                    }
                        .offset(y : -screenSize.width * 0.375)
                }.rotationEffect(Angle(degrees: Double(15*time)))
            } else {
                ZStack {
                    ZStack {
                        Circle()
                            .foregroundColor(Color.white)
                            .frame(width: 1.1*width , height: 1.1*height)
                            .shadow(color: ringColor.opacity(1), radius: 3, x: 2, y: 2)
                        Circle()
                            .foregroundColor(Color("grey-median"))
                            .frame(width: 0.9 * width, height: 0.9 * height)
                        Text("\(count)")
                            .font(.title)
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


