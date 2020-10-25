//
//  homeView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 3/22/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

let screenSize : CGRect = UIScreen.main.bounds

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        let removal = AnyTransition.move(edge: .leading)
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.03 * Double(index))
    }
}

struct homeView: View {
    
    @State var budaoState = CGSize.zero
    @State var wanshiState = CGSize.zero
    @State var animat = false
    @State var showToday : Bool = true
    @State var showWeek : Bool = false
    @State var showMonth : Bool = false
    @State var showYear : Bool = false
    @State var showShuini : Bool = false
    @State var showToolBar : Bool = false
    @State var contentText = String("日")
    @State var dayColor = Color.white
    @State var weekColor = Color("grey-light")
    @State var monthColor = Color("grey-light")
    @State var yearColor = Color("grey-light")
    @State var indicateBarOffset : Int = -104
    
    var colorLight : Color = Color("bg-light")
    var colorDark : Color = Color("bg-dark")
    var todayColor : Color = Color("normal")
    var todayColorLight : Color = Color("normal-light")

    
    var body: some View {
//        let gradient = LinearGradient(gradient: Gradient(colors: [colorDark, colorLight]), startPoint: .top, endPoint: .bottom)
        let gradientReversed = LinearGradient(gradient: Gradient(colors: [todayColor.opacity(1), todayColor.opacity(0.2)]), startPoint: .topTrailing, endPoint: .bottomLeading)
        
        
        
        return
        
        
            ZStack {
                Rectangle()
                    .foregroundColor(colorLight)
//                ZStack {
//                    Rectangle()
//                        .foregroundColor(todayColor.opacity(0.3))
//                        .frame(width: screenSize.width-1, height: screenSize.height)
//                        .offset(x: -0.5*screenSize.width)
//                        .blur(radius: 4)
//
//                    Text("万事")
//                        .multilineTextAlignment(.leading)
//                        .font(.system(size: 15))
//                        .foregroundColor(animat ? Color(.clear) : Color("grey-light"))
//                        .offset(x: -30, y: screenSize.height*0.125)
//                    Button (action: {self.animat.toggle()}) {
//                        Text("< Back to Home")
//                    }
//                    .offset(x: screenSize.width * -0.78, y: screenSize.height * -0.43)
//                }
//                .offset(x: animat ? screenSize.width*0.5 : 0, y: animat ? screenSize.height * 0: screenSize.height*0.35)
//                .animation(.spring())
//                ZStack {
//                    Rectangle()
//                        .foregroundColor(todayColor.opacity(0.3))
//                        .frame(width: 0.5*screenSize.width-1, height: screenSize.height)
//                        .offset(x: 0.25*screenSize.width)
//                        .blur(radius: 4)
//                    Text("步道")
//                        .multilineTextAlignment(.leading)
//                        .font(.system(size: 15))
//                        .foregroundColor(Color("grey-light"))
//                        .offset(x: 30, y: screenSize.height*0.125)
//                }
//                .offset(x: 0, y: animat ? screenSize.height : screenSize.height*0.35)
//                .animation(.spring())
                ZStack {
                    VStack{
                        gradientReversed
                            .clipShape(Rectangle())
                            .frame(height: screenSize.height*0.5)
                            .offset(y: 20)
                        Rectangle()
                            .foregroundColor(todayColor)
                    }
                    .frame(height: screenSize.height*1)
                    .cornerRadius(30)
                    .offset(y: -screenSize.height*0.125)
                    .shadow(radius: 20)
                
                    ZStack {
                        ZStack{
//                            if !showToolBar {
//                                    Button (action: {
//                                            self.showToolBar.toggle()
////                                        }
//                                    }) {
//                                        neumButtonView(text: .constant(contentText), todayColor: .constant(todayColor))
//                                    }
//                                    .offset(x:-screenSize.width*0.38)
//
//                            } else {
//                            HStack {
//                                Button(action: {
//                                    self.showToday = true
//                                    self.showWeek = false
//                                    self.showMonth = false
//                                    self.showYear = false
//                                    self.showShuini = false
//                                    withAnimation {
//                                        self.showToolBar.toggle()
//                                    }
//                                    self.contentText = "日"
//                                }) {
//                                    neumButton(text: "日", todayColor: todayColor)
//                                    .scaleEffect(0.8)
//                                }.padding(5)
//                                Button(action: {
//                                    self.showToday = false
//                                    self.showWeek = true
//                                    self.showMonth = false
//                                    self.showYear = false
//                                    self.showShuini = false
//                                    withAnimation {
//                                        self.showToolBar.toggle()
//                                    }
//                                    self.contentText = "周"
//                                }) {
//                                    neumButton(text: "周", todayColor: todayColor)
//                                    .scaleEffect(0.8)
//                                }.padding(5)
//                                Button(action: {
//                                    self.showToday = false
//                                    self.showWeek = false
//                                    self.showMonth = true
//                                    self.showYear = false
//                                    self.showShuini = false
//                                    withAnimation {
//                                        self.showToolBar.toggle()
//                                    }
//                                    self.contentText = "月"
//                                }) {
//                                    neumButton(text: "月", todayColor: todayColor)
//                                    .scaleEffect(0.8)
//                                }.padding(5)
//                                Button(action: {
//                                    self.showToday = false
//                                    self.showWeek = false
//                                    self.showMonth = false
//                                    self.showYear = true
//                                    self.showShuini = false
//                                    withAnimation {
//                                        self.showToolBar.toggle()
//                                    }
//                                    self.contentText = "年"
//                                }) {
//                                    neumButton(text: "年", todayColor: todayColor)
//                                        .scaleEffect(0.8)
//                                }.padding(5)
//                                }
//                            .transition(.moveAndFade)
//                            .offset(x:-screenSize.width*0.12)
//
//                                }
                            
                            HStack {
                                Button(action: {
                                    self.dayColor = Color.white
                                    self.weekColor = Color("grey-light")
                                    self.monthColor = Color("grey-light")
                                    self.yearColor = Color("grey-light")
                                    self.indicateBarOffset = -104
                                    self.showToday = true
                                    self.showWeek = false
                                    self.showMonth = false
                                    self.showYear = false
                                    self.showShuini = false
                                }) {
                                    Text("今日")
                                        .foregroundColor(dayColor)
                                }
                                Spacer()
                                    .frame(width: 20)
                                Button(action: {
                                    self.dayColor = Color("grey-light")
                                    self.weekColor = Color.white
                                    self.monthColor = Color("grey-light")
                                    self.yearColor = Color("grey-light")
                                    self.indicateBarOffset = -48
                                    self.showToday = false
                                    self.showWeek = true
                                    self.showMonth = false
                                    self.showYear = false
                                    self.showShuini = false}) {
                                    Text("本周")
                                        .foregroundColor(weekColor)
                                }
                                Spacer()
                                    .frame(width: 20)
                                Button(action: {
                                    self.dayColor = Color("grey-light")
                                    self.weekColor = Color("grey-light")
                                    self.monthColor = Color.white
                                    self.yearColor = Color("grey-light")
                                    self.indicateBarOffset = 5
                                    self.showToday = false
                                    self.showWeek = false
                                    self.showMonth = true
                                    self.showYear = false
                                    self.showShuini = false}) {
                                    Text("本月")
                                        .foregroundColor(monthColor)
                                }
                                Spacer()
                                    .frame(width: 20)
                                Button(action: {
                                    self.dayColor = Color("grey-light")
                                    self.weekColor = Color("grey-light")
                                    self.monthColor = Color("grey-light")
                                    self.yearColor = Color.white
                                    self.indicateBarOffset = 62
                                    self.showToday = false
                                    self.showWeek = false
                                    self.showMonth = false
                                    self.showYear = true
                                    self.showShuini = false}) {
                                    Text("本年")
                                        .foregroundColor(yearColor)
                                }
                                Spacer()
                                    .frame(width: 40)
                            }
                            Rectangle()
                                .foregroundColor(Color.white)
                                .frame(width: 40, height: 2)
                                .offset(x: CGFloat(indicateBarOffset),y: 12)
                                .animation(.spring())
                            Button(action: {}) {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color.white)
                            }.padding(.trailing, 30)
                                    .offset(x: screenSize.width*0.4)
                        
                        }.padding(.bottom)
                        .offset(y: -screenSize.height*0.38)
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
                                softCircleView(colorLight: self.colorLight, colorDark: self.colorDark, todayColor: self.todayColor, todayColorLight: self.todayColorLight)
                            }
                            HStack{
                                Spacer().frame(width: screenSize.width*0.725)
                                Button(action:{
                                    self.showShuini.toggle()
                                }){
                                    ZStack{
                                        Circle()
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(todayColorLight)
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
                        .offset(y:screenSize.height*0.3)
                    }
                }
                .offset(x: 0, y: animat ? screenSize.height * -0.9 : 0)
                .animation(.spring(response: 0.1))
                
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
//            ZStack {
//                Rectangle()
//                    .frame(width: 0.15*screenSize.width, height: 0.15*screenSize.width)
//                    .cornerRadius(20)
//                    .rotationEffect(Angle(degrees: 45))
//                    .foregroundColor(self.todayColor)
//                    .offset(x: 0, y: animat ? screenSize.height * -0.6 : screenSize.height*0.38)
//                    .shadow(color:self.todayColor, radius: 3, x: 0, y: 3)
//                    .animation(.spring())
//                }
//                .gesture(
//                    TapGesture()
//                        .onEnded({
//                            self.animat.toggle()
//                        })
//                )
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
