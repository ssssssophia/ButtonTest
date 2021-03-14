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
    @State var redColorSet = [Color("red-point1"),Color("red-main1"),Color("red-sub1"),Color("red-point2"),Color("red-main2"),Color("red-sub2")]
    @State var yellowColorSet = [Color("yellow-point1"),Color("yellow-main1"),Color("yellow-sub1"),Color("yellow-point2"),Color("yellow-main2"),Color("yellow-sub2")]
    @State var blueColorSet = [Color("blue-point1"),Color("blue-main1"),Color("blue-sub1"),Color("blue-point2"),Color("blue-main2"),Color("v-sub2")]
    @State var greenColorSet = [Color("green-point1"),Color("green-main1"),Color("green-sub1"),Color("green-point2"),Color("green-main2"),Color("green-sub2")]
    
    

    
    var body: some View {
        
        let todaySet = greenColorSet
        let colorLight : Color = todaySet[2]
        let colorDark : Color = todaySet[5]
        let todayColor : Color = todaySet[1]
        let todayColorLight : Color = todaySet[0]
//        let gradient = LinearGradient(gradient: Gradient(colors: [colorDark, colorLight]), startPoint: .top, endPoint: .bottom)
        let gradientReversed = LinearGradient(gradient: Gradient(colors: [todayColor.opacity(0), todayColor.opacity(0.2)]), startPoint: .topTrailing, endPoint: .bottomLeading)
        
        
        
        return
        
        
            ZStack {
                Rectangle()
                    .foregroundColor(colorLight)
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
                                softCircleView(colorLight: colorLight, colorDark: colorDark, todayColor: todayColor, todayColorLight: todayColorLight)
                            }
                            HStack{
                                Spacer().frame(width: screenSize.width*0.725)
                                Button(action:{
                                    self.showShuini.toggle()
                                }){
                                    ZStack{
                                        neumButton(text: "水逆", todayColor: todayColor, ColorLight: colorLight)
                                            .scaleEffect(1)
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
                
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct homeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            homeView()
            homeView()
        }
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
