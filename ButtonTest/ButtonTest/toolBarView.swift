//
//  toolBarView.swift
//  ButtonTest
//
//  Created by Wang Sunyechu on 10/25/20.
//  Copyright © 2020 Wang Sunyechu. All rights reserved.
//

import SwiftUI

struct toolBarView: View {
    var colorLight : Color = Color("bg-light")
    var colorDark : Color = Color("bg-dark")
    var todayColor: Color = Color("cautious")
    var todayColorLight: Color = Color("normal-light")
    
    var body: some View {
        
        var dayColor = Color.white
        var weekColor = Color("grey-light")
        var monthColor = Color("grey-light")
        var yearColor = Color("grey-light")
        
        return 
        ZStack {
            Rectangle()
                .foregroundColor(todayColor)
            HStack {
                Button(action: {}) {
                    Text("今日")
                        .foregroundColor(dayColor)
                }
                Spacer()
                    .frame(width: 20)
                Button(action: {}) {
                    Text("本周")
                        .foregroundColor(weekColor)
                }
                Spacer()
                    .frame(width: 20)
                Button(action: {}) {
                    Text("本月")
                        .foregroundColor(monthColor)
                }
                Spacer()
                    .frame(width: 20)
                Button(action: {}) {
                    Text("本年")
                        .foregroundColor(yearColor)
                }
            }
        }
    }
}

struct toolBarView_Previews: PreviewProvider {
    static var previews: some View {
        toolBarView()
    }
}
