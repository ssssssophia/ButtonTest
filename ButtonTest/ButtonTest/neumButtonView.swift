//
//  neumButtonView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 8/24/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//
 
import SwiftUI

struct neumButtonView: View {
    @Binding var text : String
    @Binding var todayColor : Color
    var body: some View {
        ZStack {
            neumButton(text: text, todayColor: todayColor)
            neumButton(text: "", todayColor: todayColor)
                .scaleEffect(0.2)
                .offset(x: 28, y: 28)
                .rotationEffect(Angle(degrees: -80))
            neumButton(text: "", todayColor: todayColor)
                .scaleEffect(0.2)
                .offset(x: 28, y: 28)
                .rotationEffect(Angle(degrees: -110))
            neumButton(text: "", todayColor: todayColor)
                .scaleEffect(0.2)
                .offset(x: 28, y: 28)
                .rotationEffect(Angle(degrees: -50))
        }
    }
}

struct neumButtonView_Previews: PreviewProvider {
    static var previews: some View {
        neumButtonView(text: .constant("日"), todayColor: .constant(Color("lucky")))
    }
}

struct neumToolbarView: View {
    @Binding var todayColor : Color
    var body: some View {
        HStack(alignment: .center) {
            neumButton(text: "日", todayColor: todayColor)
                .padding()
            neumButton(text: "周", todayColor: todayColor)
                .padding()
            neumButton(text: "月", todayColor: todayColor)
                .padding()
            neumButton(text: "年", todayColor: todayColor)
                .padding()
        }
    }
    
}

struct neumToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        neumToolbarView(todayColor: .constant(Color("lucky")))
    }
}

struct neumButton: View {
    var text = String("日")
    var todayColor : Color = Color("lucky")
    var body: some View {
        VStack {
            Text("\(text)")
                .font(.system(size: 25, weight: .bold))
                .foregroundColor(Color("grey-light"))
        }
        .frame(width: 50, height: 50)
        .background(
            ZStack {
                Rectangle()
                .cornerRadius(10)
                    .foregroundColor(Color.white)
                LinearGradient(gradient: Gradient(colors: [Color.white, Color("bg-light")]), startPoint: .topLeading, endPoint: .bottomTrailing)
                Rectangle()
                    .stroke(Color.clear, lineWidth: 5)
                    .cornerRadius(10)
                    .shadow(color: todayColor.opacity(0.3), radius: 3, x: -2.5, y: -2.5)
                Rectangle()
                    .stroke(Color.clear, lineWidth: 5)
                    .cornerRadius(10)
                    .shadow(color: Color.white, radius: 3, x: 1.5, y: 1.5)
            }
        )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.white, radius: 10, x: -10, y: -10)
            .shadow(color: todayColor.opacity(0.3), radius: 10, x: 10, y: 10)
    }
}
