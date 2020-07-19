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

        
        return
        
        
            ZStack {
                ZStack {
                    Rectangle()
                        .foregroundColor(todayColor.opacity(0.3))
                        .frame(width: screenSize.width-1, height: screenSize.height)
                        .offset(x: -0.5*screenSize.width)
                        .blur(radius: 4)
                    
                    Text("万事")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 15))
                        .foregroundColor(animat ? Color(.clear) : Color("grey-light"))
                        .offset(x: -30, y: screenSize.height*0.125)
                    Button (action: {self.animat.toggle()}) {
                        Text("< Back to Home")
                    }
                    .offset(x: screenSize.width * -0.78, y: screenSize.height * -0.43)
                }
                .offset(x: animat ? screenSize.width*0.5 : 0, y: animat ? screenSize.height * 0: screenSize.height*0.35)
                .animation(.spring())
                ZStack {
                    Rectangle()
                        .foregroundColor(todayColor.opacity(0.3))
                        .frame(width: 0.5*screenSize.width-1, height: screenSize.height*0.3)
                        .offset(x: 0.25*screenSize.width)
                        .blur(radius: 4)
                    Text("步道")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 15))
                        .foregroundColor(Color("grey-light"))
                        .offset(x: 30, y: screenSize.height*0.125)
                }
                .offset(x: 0, y: animat ? screenSize.height * 0.85 : screenSize.height*0.35)
                .animation(.spring())
                ZStack {
                    ZStack{
                        Rectangle()
                            .frame(width: screenSize.width, height: screenSize.height*0.8)
                            
                    gradientReversed
                    }
                    .cornerRadius(30)
                    .offset(y: -screenSize.height*0.125)
                    .shadow(radius: 20)
                
                    ZStack(alignment: .center) {
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
                        ZStack {
                            if showShuini == true{
                                shuiniView()
                            } else if showWeek == true{
                                weekView2()
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
                        
                       
                        Spacer()
                        todayInfoView()
                        .offset(y:screenSize.height*0.25)
                    }
                }
                .offset(x: 0, y: animat ? screenSize.height * -0.9 : 0)
                .animation(.spring())
                
//                wanshiView()
//                    .offset(x: 0, y: wanshiState.height)
//                    .gesture(DragGesture()
//                        .onChanged { value in
//                            self.wanshiState = value.translation
//                    }
//                        .onEnded { value in
//                            if self.wanshiState.height < -screenSize.height*0.22 {
//                                self.wanshiState.height = -screenSize.height*0.825
//                                self.budaoState.height = screenSize.height*0.11
//                            } else {
//                            self.wanshiState = CGSize.zero
//                            self.budaoState = CGSize.zero
//                            }
//                    })
//                    .animation(.spring())

//                budaoView()
//                    .offset(x: 0, y: budaoState.height)
//                    .gesture(DragGesture()
//                        .onChanged { value in
//                            self.budaoState = value.translation
//                    }
//                        .onEnded { value in
//                            if self.budaoState.height < -screenSize.height*0.22 {
//                                self.budaoState.height = -screenSize.height*0.91
//                            } else {
//                            self.budaoState = CGSize.zero
//                            }
//                        })
//                    .animation(.spring())
            ZStack {
                Circle()
                    .frame(width: 0.15*screenSize.width)
                    .foregroundColor(self.todayColor)
                    .offset(x: 0, y: animat ? screenSize.height * -0.6 : screenSize.height*0.375)
                    .shadow(color:self.todayColor, radius: 3, x: 0, y: 3)
                    .animation(.spring())
                }
                .gesture(
                    TapGesture()
                        .onEnded({
                            self.animat.toggle()
                        })
                )
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
