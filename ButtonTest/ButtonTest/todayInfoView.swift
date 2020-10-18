//
//  todayInfoView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 3/22/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct todayInfoView: View {
    var body: some View {
//        HStack(alignment: .center) {
//            Text("今日")
//                .multilineTextAlignment(.leading)
//                .font(.system(size: 30))
//                .foregroundColor(Color("grey-light"))
//                .frame(width: 30.0)
//            Spacer().frame(width: 20)
//            ScrollView(.vertical, showsIndicators: false) {
//                VStack {
//                    ForEach(0..<3) { item in
//                        GeometryReader { geometry in
//                            todayItemView()
//                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minY - 0.65*screenSize.height) ), axis: (x: 20, y: 0, z: 0))
//                        }
//                        .frame(width: 0.7*screenSize.width, height: 0.2*screenSize.height)
//                    }
//                }
//            }
//            .frame(height: 0.2*screenSize.height)
//
//        }
//
//    }
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<3) { item in
                    GeometryReader { geometry in
                        todayItemView()
                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 0.1*Double(screenSize.width)) / -20), axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(width: 0.7*screenSize.width, height: 0.25*screenSize.height)
                }
            }.padding(.horizontal, 0.1*screenSize.width)
        }
        .frame(height: 0.25*screenSize.height)
    }
}

struct todayInfoView_Previews: PreviewProvider {
    static var previews: some View {
        todayInfoView()
    }
}

struct todayItemView: View {
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                Image("Picture1")
                    .resizable()
                    .frame(width: 0.4*screenSize.width, height: 0.16*screenSize.height)
                    .shadow(radius: 10, x: 0, y: 10)
            }
            HStack(alignment: .center) {
                VStack(alignment: .leading) {
                    Text("头条")
                        .font(.headline)
                        .foregroundColor(Color("grey-median"))
                        .padding(.bottom)
                    Text("今日 宜xxxxxxxxxxxxx")
                        .font(.subheadline)
                        .foregroundColor(Color("grey-dark"))
                        .padding(.bottom)
                    Text("今日 忌xxxxxxxxxxxxx")
                        .font(.subheadline)
                        .foregroundColor(Color("grey-dark"))
                        .padding(.bottom)
                    
                    
                }
                .padding(.leading)
                Spacer()
            }
            
        }
        .frame(width: 250, height: 200)
        .background(Color(.white))
        .cornerRadius(30)
        
    }
}
