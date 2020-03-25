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
        HStack(alignment: .center) {
            Text("今日")
                .multilineTextAlignment(.leading)
                .font(.system(size: 30))
                .foregroundColor(Color("grey-light"))
                .frame(width: 30.0)
            Spacer().frame(width: 20)
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    ForEach(0..<3) { item in
                        GeometryReader { geometry in
                            todayItemView()
                                .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minY - 500) ), axis: (x: 20, y: 0, z: 0))
                        }
                        .frame(width: 260, height: 150)
                    }
                }
            }
            .frame(height: 130)
        }

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
                    .frame(width: 150, height: 120)
                    .shadow(radius: 10, x: 0, y: 10)
            }
            HStack {
                VStack(alignment: .leading) {
                    Text("头条")
                        .font(.headline)
                        .foregroundColor(Color("grey-median"))
                        .padding(.bottom)
                    //                    .frame(width: 250)
                    Text("今日 宜xxxxxxxxxxxxx")
                        .font(.subheadline)
                        .foregroundColor(Color("grey-dark"))
                        .padding(.bottom)
                    //                    .frame(width: 250)
                    Text("今日 忌xxxxxxxxxxxxx")
                        .font(.subheadline)
                        .foregroundColor(Color("grey-dark"))
                        .padding(.bottom)
                    
                    
                }
                .padding(.leading)
                Spacer()
            }
            
        }
        .background(Color(.clear))
        .cornerRadius(30)
        .frame(width: 260, height: 150)
    }
}