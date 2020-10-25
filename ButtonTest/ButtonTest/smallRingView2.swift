//
//  smallRingView2.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 8/21/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct smallRingView2: View {
    var hours = [0,2,5,6,7,9,10]
    var now : CGFloat = 10
    var todayColorLight = Color("normal-light")
    
    var body: some View {
        let busyHours = busyHour(l:hours)
       
        return ZStack {
//            Rectangle()
//                .foregroundColor(Color.black)
//            Circle()
//                .stroke(Color.white,style: StrokeStyle(lineWidth: 2.0, lineCap: .round))
//                .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
            
            ZStack {
                ForEach(0..<busyHours.count, id:\.self) { i in
                    busyHourView(hourArray:busyHours[i] as! [Int], now: self.now, todayColorLight: self.todayColorLight)
                }
            }
            
        }
        
            
            
    }
}


struct smallRingView2_Previews: PreviewProvider {
    static var previews: some View {
        smallRingView2()
    }
}


func busyHour(l: [Int]) -> Array<Any> {
    let arrayAll = Set(Array(0...11))
    let setL = Set(l)

    var freeHour = Array(arrayAll.subtracting(setL))
    freeHour.sort()

    var tempArray = (Array([[]]))
    if !Array(0..<freeHour[0]).isEmpty {
        tempArray += [Array(0...freeHour[0]-1)]
    }
    for i in (0...freeHour.count - 2) {
        if !Array(freeHour[i]+1..<freeHour[i+1]).isEmpty {
            tempArray += [Array(freeHour[i]+1..<freeHour[i+1])]
        }
    }
    if !Array(freeHour[freeHour.count-1]+1..<12).isEmpty {
        tempArray += [Array(freeHour[freeHour.count-1]+1..<12)]
    }

    let busyHour = Array(tempArray.suffix(from: 1))
    
    return busyHour
    }


struct busyHourView: View {
    var hourArray = Array([0])
    var now : CGFloat = 10
    var todayColorLight: Color = Color("normal-light")
    
    
    var body: some View {
        var single : Bool = true
        var during : Bool = false
        if hourArray.count == 1 {
            single = true
        } else {
            single = false
        }
        if CGFloat(hourArray[0]) <= now && CGFloat(hourArray[hourArray.count-1]) >= now {
            during = true
        } else {
            during = false
        }
        
        return ZStack {
            if single {
                if CGFloat(hourArray[0]) == now {
                    Circle()
                        .frame(width : 40)
                        .foregroundColor(Color.white)
                        .offset(y : -screenSize.width * 0.375)
                        .rotationEffect(Angle(degrees: Double(30*hourArray[0])))
                    Image(systemName: "airplane")
                        .resizable()
                        .offset(y : -screenSize.width * 0.375)
                        .rotationEffect(Angle(degrees: Double(30*hourArray[0])))
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.black)
                } else {
                
                    Circle()
                        .frame(width : 20)
                        .foregroundColor(Color.white)
                        .offset(y : -screenSize.width * 0.375)
                        .rotationEffect(Angle(degrees: Double(30*hourArray[0])))
                }
            } else {
                if  during {
                    Circle()
                        .trim(from: 0, to: CGFloat(hourArray.count-1)/12 )
                        .stroke(Color.white,style: StrokeStyle(lineWidth: 22.0, lineCap: .round))
                        .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
                        .foregroundColor(Color.white)
                        .rotationEffect(Angle(degrees: Double(-90 + 30*hourArray[0])))
                    Image(systemName: "3.circle")
                        .resizable()
                        .rotationEffect(Angle(degrees: Double(-30*hourArray[hourArray.count-1])))
                        .offset(y : -screenSize.width * 0.375)
                        .rotationEffect(Angle(degrees: Double(30*hourArray[hourArray.count-1])-0.5))
                        .frame(width: 20, height: 20)
                        .foregroundColor(todayColorLight)
                } else {
                    Circle()
                        .trim(from: 0, to: CGFloat(hourArray.count-1)/12 )
                        .stroke(Color.white,style: StrokeStyle(lineWidth: 10.0, lineCap: .round))
                        .frame(width: 0.75*screenSize.width, height: 0.75*screenSize.width)
                        .foregroundColor(Color.white)
                        .rotationEffect(Angle(degrees: Double(-90 + 30*hourArray[0])))
                }
            }
        }
    }
}
