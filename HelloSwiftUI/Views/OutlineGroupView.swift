//
//  OutlineGroupView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/8.
//

import SwiftUI

struct OutlineGroupView: View {
    struct ExpandWeather: Hashable, Identifiable {
      let id = UUID()
      var name: String
      var icon: String
      var weathers: [ExpandWeather]?
    }
    
    let expandWeather: [ExpandWeather] = [
      ExpandWeather(name: "Weather", icon: "", weathers: [
        ExpandWeather(name: "Sunshine", icon: "sun.max.fill"),
        ExpandWeather(name: "Cloud", icon: "cloud"),
        ExpandWeather(name: "Snow", icon: "snow"),
        ExpandWeather(name: "Rain", icon: "cloud.rain.fill")
      ])
    ]
    
    var body: some View {
//        List(expandWeather, children: \.weathers) { weather in
//          Label(weather.name, systemImage: weather.icon)
//        }
        
        List {
            OutlineGroup(expandWeather, children: \.weathers) { weather in
                Label(weather.name, systemImage: weather.icon)
            }
            
            Section {
                DisclosureGroupView()
            }
        }
        
    }
}

struct DisclosureGroupView: View {
    @State private var isExpanded = false
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            Toggle("展开/收起", isOn: $isExpanded)
            DisclosureGroup("内嵌列表") {
                Text("hello 1")
                Text("hello 2")
                Text("hello 3")
                Text("hello 4")
            }
        } label: {
            Text("Disclosure")
        }

    }
}
