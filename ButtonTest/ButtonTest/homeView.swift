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
    
    let colorLight : Color = Color("bg-light")
    let colorDark : Color = Color("bg-dark")
    let todayColor : Color = Color("lucky")

    
    var body: some View {
//        let gradient = LinearGradient(gradient: Gradient(colors: [colorDark, colorLight]), startPoint: .top, endPoint: .bottom)
        let gradientReversed = LinearGradient(gradient: Gradient(colors: [todayColor.opacity(0.2), todayColor.opacity(0.01)]), startPoint: .center, endPoint: .bottom)
        
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
                        .frame(width: 0.5*screenSize.width-1, height: screenSize.height)
                        .offset(x: 0.25*screenSize.width)
                        .blur(radius: 4)
                    Text("步道")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 15))
                        .foregroundColor(Color("grey-light"))
                        .offset(x: 30, y: screenSize.height*0.125)
                }
                .offset(x: 0, y: animat ? screenSize.height : screenSize.height*0.35)
                .animation(.spring())
                ZStack {
                    ZStack{
                        Rectangle()
                            .foregroundColor(Color.white)
//                            .frame(width: screenSize.width, height: screenSize.height)
                            
                        gradientReversed
                    }
                    .cornerRadius(30)
                    .offset(y: -screenSize.height*0.125)
                    .shadow(radius: 20)
                
                    ZStack {
                        ZStack{
                            if !showToolBar {
                                    Button (action: {
//                                        withAnimation(.easeInOut) {
                                            self.showToolBar.toggle()
//                                        }
                                    }) {
                                        neumButtonView(text: .constant(contentText), todayColor: .constant(todayColor))
                                    }
                                    .offset(x:-screenSize.width*0.38)
                                    
                            } else {
                            HStack {
                                Button(action: {
                                    self.showToday = true
                                    self.showWeek = false
                                    self.showMonth = false
                                    self.showYear = false
                                    self.showShuini = false
                                    withAnimation {
                                        self.showToolBar.toggle()
                                    }
                                    self.contentText = "日"
                                }) {
                                    neumButton(text: "日", todayColor: todayColor)
                                    .scaleEffect(0.8)
                                }.padding(5)
                                Button(action: {
                                    self.showToday = false
                                    self.showWeek = true
                                    self.showMonth = false
                                    self.showYear = false
                                    self.showShuini = false
                                    withAnimation {
                                        self.showToolBar.toggle()
                                    }
                                    self.contentText = "周"
                                }) {
                                    neumButton(text: "周", todayColor: todayColor)
                                    .scaleEffect(0.8)
                                }.padding(5)
                                Button(action: {
                                    self.showToday = false
                                    self.showWeek = false
                                    self.showMonth = true
                                    self.showYear = false
                                    self.showShuini = false
                                    withAnimation {
                                        self.showToolBar.toggle()
                                    }
                                    self.contentText = "月"
                                }) {
                                    neumButton(text: "月", todayColor: todayColor)
                                    .scaleEffect(0.8)
                                }.padding(5)
                                Button(action: {
                                    self.showToday = false
                                    self.showWeek = false
                                    self.showMonth = false
                                    self.showYear = true
                                    self.showShuini = false
                                    withAnimation {
                                        self.showToolBar.toggle()
                                    }
                                    self.contentText = "年"
                                }) {
                                    neumButton(text: "年", todayColor: todayColor)
                                        .scaleEffect(0.8)
                                }.padding(5)
                                }
                            .transition(.moveAndFade)
                            .offset(x:-screenSize.width*0.12)
                                
                                }
                            Button(action: {}) {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color("grey-light"))
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
                Rectangle()
                    .frame(width: 0.15*screenSize.width, height: 0.15*screenSize.width)
                    .cornerRadius(20)
                    .rotationEffect(Angle(degrees: 45))
                    .foregroundColor(self.todayColor)
                    .offset(x: 0, y: animat ? screenSize.height * -0.6 : screenSize.height*0.38)
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
