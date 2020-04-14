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
        
//        let multiplier = due ? width * 1.5 / 44 : width / 44
        
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
        
//        if due {
//            return dueRing()
//        } else {
//            return normalRing()
//        }

        return ZStack {
            if due {
                ZStack {
                    
                    //            LinearGradient(gradient: Gradient(colors: [Color("bg-light"), Color("bg-dark")]), startPoint: .top, endPoint: .bottom)
                    //                .clipShape(Circle())
                    //                .frame(width: due ? width * 1.2 : width , height: due ? height * 1.2 : height)
                    
                    Circle()
                        .foregroundColor(Color.white)
                        //                .stroke(Color("grey-light").opacity(0.1), style: StrokeStyle(lineWidth: 8 * multiplier))
                        .frame(width: 1.4*width , height: 1.4*height)
                    //                .shadow(color: ringColor.opacity(1), radius: 3, x: 3, y: 3)
                    
                    Circle()
                        .foregroundColor(ringColor.opacity(0.4))
                        .frame(width: 1.4*width , height: 1.4*height)
                        .shadow(color: ringColor.opacity(0.5), radius: 3, x: 5, y: 5)
                    //                .shadow(radius: 3, x: 5, y: 5)
                    Text("\(count)")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                }
                    //        .background(ringColor.opacity(0.25))
                    //        .clipShape(Circle())
                    //        .rotationEffect(Angle(degrees: time/24*360), anchor: .center)
                    .offset(offsetSize)
            } else {
                ZStack {
                            Circle()
                                .foregroundColor(ringColor)
                                .frame(width: 0.9 * width, height: 0.9 * height)
                            Text("\(count)")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                        }
                        .offset(offsetSize)
            }
        }
        


    }
}

struct smallRingView_Previews: PreviewProvider {
    static var previews: some View {
        smallRingView()
    }
}

