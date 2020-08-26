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
                    busyHourView(hourArray:busyHours[i] as! [Int])
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
    
    
    var body: some View {
        var single : Bool = true
        if hourArray.count == 1 {
            single = true
        } else {
            single = false
        }
        
        return ZStack {
            if single {
                Circle()
                    .frame(width : 20, height : 20)
                    .foregroundColor(Color.white)
                    .offset(y : -screenSize.width * 0.375)
                    .rotationEffect(Angle(degrees: Double(30*hourArray[0])))
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
