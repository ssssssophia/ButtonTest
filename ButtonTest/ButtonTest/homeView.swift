//
//  homeView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 3/22/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

let screenSize : CGRect = UIScreen.main.bounds

struct homeView: View {
    
    @State var budaoState = CGSize.zero
    @State var wanshiState = CGSize.zero
    @State var animat = false
    @State var showToday : Bool = true
    @State var showWeek : Bool = false
    @State var showMonth : Bool = false
    @State var showYear : Bool = false
    @State var showShuini : Bool = false
    @State var todayButtonColor : Color = Color("grey-light")
    @State var weekButtonColor : Color = Color("grey-light") 
    @State var monthButtonColor : Color = Color("grey-light")
    @State var yearButtonColor : Color = Color("grey-light")
    
    let colorLight : Color = Color("bg-light")
    let colorDark : Color = Color("bg-dark")
    let todayColor : Color = Color("cautious")

    
    var body: some View {
//        let gradient = LinearGradient(gradient: Gradient(colors: [colorDark, colorLight]), startPoint: .top, endPoint: .bottom)
        let gradientReversed = LinearGradient(gradient: Gradient(colors: [colorLight, colorDark]), startPoint: .center, endPoint: .bottom)
        
        
//        let components = Calendar.current.dateComponents([.hour], from: Date())
//        let hour = components.hour

//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH"
//        let dateString = formatter.string(from: Date())
        
//        let clock : CGFloat = NumberFormatter().number(from: dateString) as! CGFloat

        
        return
        
        
            ZStack {
                gradientReversed
                ZStack(alignment: .center) {
//                    Spacer().frame(height: screenSize.width*0.07)
                    HStack {
                        Button(action: {
                            self.showToday = true
                            self.showWeek = false
                            self.showMonth = false
                            self.showYear = false
                            self.showShuini = false
                            self.todayButtonColor = self.todayColor
                            self.weekButtonColor = Color("grey-light")
                            self.monthButtonColor = Color("grey-light")
                            self.yearButtonColor = Color("grey-light")
                        }) {
                            ZStack {
                                Circle()
                                    .foregroundColor(todayButtonColor)
                                    .frame(width: 0.1*screenSize.width, height: 0.1*screenSize.width)
                                    
                                Text("日")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }.padding()
                        Button(action: {
                            self.showToday = false
                            self.showWeek = true
                            self.showMonth = false
                            self.showYear = false
                            self.showShuini = false
                            self.weekButtonColor = self.todayColor
                            self.todayButtonColor = Color("grey-light")
                            self.monthButtonColor = Color("grey-light")
                            self.yearButtonColor = Color("grey-light")
                        }) {
                            ZStack {
                                Circle()
                                    .foregroundColor(weekButtonColor)
                                    .frame(width: 0.1*screenSize.width, height: 0.1*screenSize.width)
                                Text("周")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }.padding()
                        Button(action: {
                            self.showToday = false
                            self.showWeek = false
                            self.showMonth = true
                            self.showYear = false
                            self.showShuini = false
                            self.monthButtonColor = self.todayColor
                            self.todayButtonColor = Color("grey-light")
                            self.weekButtonColor = Color("grey-light")
                            self.yearButtonColor = Color("grey-light")
                        }) {
                            ZStack {
                                Circle()
                                    .foregroundColor(monthButtonColor)
                                    .frame(width: 0.1*screenSize.width, height: 0.1*screenSize.width)
                                Text("月")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }.padding()
                        Button(action: {
                            self.showToday = false
                            self.showWeek = false
                            self.showMonth = false
                            self.showYear = true
                            self.showShuini = false
                            self.yearButtonColor = self.todayColor
                            self.todayButtonColor = Color("grey-light")
                            self.weekButtonColor = Color("grey-light")
                            self.monthButtonColor = Color("grey-light")
                        }) {
                            ZStack {
                                Circle()
                                    .foregroundColor(yearButtonColor)
                                    .frame(width: 0.1*screenSize.width, height: 0.1*screenSize.width)
                                Text("年")
                                    .foregroundColor(.white)
                                    .bold()
                            }
                        }.padding()
//                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "person.fill")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color("grey-light"))
                        }.padding(.trailing)
                            .offset(x: 10)
                    }
                    .padding(.bottom)
                    .offset(y: -screenSize.height*0.4)
//                    Spacer().frame(height:screenSize.height*0)
                    ZStack {
                        if showShuini == true{
                            shuiniView()
                        } else if showWeek == true{
                            weekView()
                        } else if showMonth == true{
                            monthView()
                        } else if showYear == true{
                            yearView()
                        } else {
                            softCircleView()
                        }
                        HStack{
                            Spacer().frame(width: screenSize.width*0.725)
                            Button(action:{
                                self.showShuini.toggle()
                            }){
                                ZStack{
                                    Circle()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(todayColor.opacity(0.7))
                                    Text("水逆")
                                        .bold()
                                        .foregroundColor(.white)
                                }
                            }
                        }
                        .offset(y:screenSize.height*0.2)
                    }
                    .padding([.leading, .trailing])
                    .offset(y:-screenSize.height*0.125)
                    
                    
                        
                
//                    todayInfoView()
//                        .padding()
                    Spacer()
                    
                }
                todayInfoView()
                    .offset(y:screenSize.height*0.2)
                wanshiView()
                    .offset(x: 0, y: wanshiState.height)
                    .gesture(DragGesture()
                        .onChanged { value in
                            self.wanshiState = value.translation
//                            self.animat = true
                    }
                        .onEnded { value in
                            if self.wanshiState.height < -screenSize.height*0.22 {
                                self.wanshiState.height = -screenSize.height*0.825
                                self.budaoState.height = screenSize.height*0.11
                            } else {
                            self.wanshiState = CGSize.zero
                            self.budaoState = CGSize.zero
//                            self.animat = false
                            }
                    })
                    .animation(.spring())

                budaoView()
                    .offset(x: 0, y: budaoState.height)
                    .gesture(DragGesture()
                        .onChanged { value in
                            self.budaoState = value.translation
//                            self.animat = true
                    }
                        .onEnded { value in
                            if self.budaoState.height < -screenSize.height*0.22 {
                                self.budaoState.height = -screenSize.height*0.91
                            } else {
                            self.budaoState = CGSize.zero
//                            self.animat = false
                            }
                        })
                    .animation(.spring())
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
        VStack(spacing: 10) {
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
        .frame(width: screenSize.width)
        .padding(.top)
        .background(Color.white)
        .cornerRadius(30)
        .offset(y: screenSize.height*0.91)
        .shadow(radius: 20)
    }
}

struct wanshiView: View {
    var body: some View {
        VStack(spacing: 10) {
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
        .frame(width: screenSize.width)
        .padding(.top)
        .background(Color.white)
        .cornerRadius(30)
        .offset(y: screenSize.height*0.825)
        .shadow(radius: 20)
    }
}
