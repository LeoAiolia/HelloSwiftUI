//
//  Home.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/11/30.
//

import SwiftUI

struct TextView: View {
    var body: some View {
        return List {
            VStack(alignment: .leading, spacing: 5) {
                Text("Hello".locale)
                Text("Hello")
                Text("Hello").environment(\.locale, Locale(identifier: "zh-Hans"))
                Text("Hello \(Image(systemName: "globe"))").environment(\.locale, Locale(identifier: "en_US"))
                Text("Hello \(Image(systemName: "globe"))").environment(\.locale, Locale(identifier: "zh-Hans"))
                // Image("data_moment_1_1").frame(width: 200, height: 200, alignment: .center)
                Text("Date: \(Date(), style: .date)")
                Text("Time: \(Date(), style: .time)")
                Text("Meeting: \(DateInterval(start: Date(), end: Date(timeIntervalSinceNow: 3600)))")
                Text("􀿔").font(.system(size: 80))
                Image(systemName: "mic.fill").frame(width: 200, height: 200, alignment: .leading)
                // Stack 超过10个就会报错， Extra argument in call
                // Text("Hello")
            }
            
            Text("Stay Hungry, Stay Foolish!")
              .blur(radius: 2) // radius 值越大，模糊效果越重
            
            Link("百度", destination: URL(string: "https://www.baidu.com")!)
            NavigationLink(destination: TextView()){
                Text("下一页")
            }
//            .navigationViewStyle(.columns)
//
//            NavigationLink(destination: TextView()){
//                Text("下一页")
//            }.navigationViewStyle(.automatic)
//
//            NavigationLink(destination: TextView()){
//                Text("下一页")
//            }.navigationViewStyle(.stack)
        }
    }
}




