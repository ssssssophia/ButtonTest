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
    var time : Double = 1

    
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
        
        var offsetSize = CGSize.zero
        if time == 1 {
            offsetSize.width = CGFloat(sin(15/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = -CGFloat(cos(15/180*Double.pi))*screenSize.width*0.375
        } else if time == 3 {
            offsetSize.width = CGFloat(sin(45/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = -CGFloat(cos(45/180*Double.pi))*screenSize.width*0.375
        } else if time == 5 {
            offsetSize.width = CGFloat(cos(15/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = -CGFloat(sin(15/180*Double.pi))*screenSize.width*0.375
        } else if time == 7 {
            offsetSize.width = CGFloat(cos(15/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = CGFloat(sin(15/180*Double.pi))*screenSize.width*0.375
        } else if time == 9 {
            offsetSize.width = CGFloat(sin(45/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = CGFloat(cos(45/180*Double.pi))*screenSize.width*0.375
        } else if time == 11 {
            offsetSize.width = CGFloat(sin(15/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = CGFloat(cos(15/180*Double.pi))*screenSize.width*0.375
        } else if time == 13 {
            offsetSize.width = -CGFloat(sin(15/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = CGFloat(cos(15/180*Double.pi))*screenSize.width*0.375
        } else if time == 15 {
            offsetSize.width = -CGFloat(sin(45/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = CGFloat(cos(45/180*Double.pi))*screenSize.width*0.375
        } else if time == 17 {
            offsetSize.width = -CGFloat(cos(15/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = CGFloat(sin(15/180*Double.pi))*screenSize.width*0.375
        } else if time == 19 {
            offsetSize.width = -CGFloat(cos(15/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = -CGFloat(sin(15/180*Double.pi))*screenSize.width*0.375
        } else if time == 21 {
            offsetSize.width = -CGFloat(cos(45/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = -CGFloat(sin(45/180*Double.pi))*screenSize.width*0.375
        } else if time == 23 {
            offsetSize.width = -CGFloat(sin(15/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = -CGFloat(cos(15/180*Double.pi))*screenSize.width*0.375
        } else {
            offsetSize.width = CGFloat(sin(15/180*Double.pi))*screenSize.width*0.375
            offsetSize.height = -CGFloat(cos(15/180*Double.pi))*screenSize.width*0.375
        }
        

        return ZStack {
            if due {
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
                }
                    .offset(offsetSize)
            } else {
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

