//
//  homeView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 3/22/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct homeView: View {
    
    let colorLight : Color = Color("bg-light")
    let colorDark : Color = Color("bg-dark")
    let todayColor : Color = Color("lucky")
    
    var body: some View {
        let gradient = LinearGradient(gradient: Gradient(colors: [colorDark, colorLight]), startPoint: .top, endPoint: .bottom)
        let gradientReversed = LinearGradient(gradient: Gradient(colors: [colorLight, colorDark]), startPoint: .top, endPoint: .bottom)
        
        return
        
        
            ZStack {
                gradientReversed
                VStack(alignment: .center) {
                    Spacer().frame(height: 35)
                    HStack {
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("grey-light"))
                        }.padding(.trailing)
                    }
                    HStack {
                        Button(action: {}) {
                            Text("今日")
                                .foregroundColor(todayColor)
                                .bold()
                        }.padding()
                        Button(action: {}) {
                            Text("本周")
                                .foregroundColor(Color("grey-light"))
                        }.padding()
                        Button(action: {}) {
                            Text("本月")
                                .foregroundColor(Color("grey-light"))
                        }.padding()
                        Button(action: {}) {
                            Text("本年")
                                .foregroundColor(Color("grey-light"))
                        }.padding()
                    }
                    
                    ZStack {
                        softCircleView()
                        
                        Text("顺遂")
                            .font(.custom("indicator", size: 100))
                            .fontWeight(.black)
                            .foregroundColor(todayColor)
                            .multilineTextAlignment(.center)
                            .frame(width: 100.0)
                        Circle()
                            .trim(from: 0, to: 0.6)
                            .stroke(todayColor, lineWidth: 6)
                            .frame(width: 300, height: 300)
                            .rotationEffect(Angle(degrees: -90))
                        
                    }.padding([.leading, .bottom, .trailing])
                        
                
                    todayInfoView()
                        .padding()
                    Spacer()
                    
                }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}
