//
//  homeView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 3/22/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct homeView: View {
    
    @State var budaoState = CGSize.zero
    @State var wanshiState = CGSize.zero
    @State var animat = false
    
    
    let colorLight : Color = Color("bg-light")
    let colorDark : Color = Color("bg-dark")
    let todayColor : Color = Color("lucky")
    
    var body: some View {
//        let gradient = LinearGradient(gradient: Gradient(colors: [colorDark, colorLight]), startPoint: .top, endPoint: .bottom)
        let gradientReversed = LinearGradient(gradient: Gradient(colors: [colorLight, colorDark]), startPoint: .top, endPoint: .bottom)
        
        
//        let components = Calendar.current.dateComponents([.hour], from: Date())
//        let hour = components.hour

//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH"
//        let dateString = formatter.string(from: Date())
        
//        let clock : CGFloat = NumberFormatter().number(from: dateString) as! CGFloat

        
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
//                            .opacity( self.animat ? 0 : 1)
                        
//                        Text("顺遂")
//                            .font(.custom("indicator", size: 100))
//                            .fontWeight(.black)
//                            .shadow(radius: 5, x: 10, y: 10)
//                            .foregroundColor(todayColor)
//                            .multilineTextAlignment(.center)
//                            .frame(width: 100.0)
//                        Circle()
//                            .trim(from: 0, to: clock / 24)
//                            .stroke(todayColor, lineWidth: 6)
//                            .frame(width: 300, height: 300)
//                            .rotationEffect(Angle(degrees: -90))
//                            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
//
//
//                        smallRingView(ringColor: todayColor, width: 44, height: 44, count: 1, time: 0)
//                        smallRingView(ringColor: todayColor, width: 44, height: 44, count: 5, time: 16)
                        
                
                    }.padding([.leading, .trailing])
                    
                    HStack{
                        Spacer().frame(width: 300)
                        Button(action:{}){
                            ZStack{
                                Circle()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(todayColor.opacity(0.7))
                                Text("水逆")
                                    .font(.body)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                        
                
                    todayInfoView()
                        .padding()
                    Spacer()
                    
                }
                wanshiView()
                    .offset(x: 0, y: wanshiState.height)
                    .gesture(DragGesture()
                        .onChanged { value in
                            self.wanshiState = value.translation
//                            self.animat = true
                    }
                        .onEnded { value in
                            if self.wanshiState.height < -200 {
                                self.wanshiState.height = -740
                                self.budaoState.height = 100
                            } else {
                            self.wanshiState = CGSize.zero
                            self.budaoState = CGSize.zero
//                            self.animat = false
                            }
                    })

                budaoView()
                    .offset(x: 0, y: budaoState.height)
                    .gesture(DragGesture()
                        .onChanged { value in
                            self.budaoState = value.translation
//                            self.animat = true
                    }
                        .onEnded { value in
                            if self.budaoState.height < -200 {
                                self.budaoState.height = -810
                            } else {
                            self.budaoState = CGSize.zero
//                            self.animat = false
                            }
                        })
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        homeView()
    }
}

struct budaoView: View {
    var body: some View {
        VStack(spacing: 15) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            Text("步道")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color("grey-dark"))
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .offset(y: 810)
        .shadow(radius: 20)
    }
}

struct wanshiView: View {
    var body: some View {
        VStack(spacing: 15) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            Text("万事")
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(Color("grey-dark"))
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .offset(y: 740)
        .shadow(radius: 20)
    }
}
