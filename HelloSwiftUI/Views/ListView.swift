//
//  ListView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/3.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        List {
            Section("A") {
                NavigationLink(destination: GroupedList()) {
                    Text("GroupedList")
                }
                
                NavigationLink(destination: SearchListView()) {
                    Text("searchList")
                }
                
                NavigationLink(destination: SelectionListView()) {
                    Text("单选，双选")
                }
                
                NavigationLink(destination: ExpandListView()) {
                    Text("可展开视图")
                }
                
                NavigationLink(destination: EditListView()) {
                    Text("可编辑视图")
                }
                
                NavigationLink(destination: ScrollViewPage()) {
                    Text("滑动list")
                }
            }
            
            Section("ForEach") {
                ForEach(0..<3) { idx in
                    Text("ForEach: \(idx)")
                }
                
                ForEach(["A", "B"], id: \.self) { str in
                  Text(str)
                }
            }
        }
    }
}

private struct GroupedList: View {
  @State private var isIncreased = false
  
  var body: some View {
    List {
      Group {
        Section("Weather") {
          Text("Sun")
          Text("Cloud")
          Text("Snow")
        }
        
        Section("Animal") {
          Text("Dog")
          Text("Cat")
        }
      }
      .headerProminence(
        isIncreased ? .increased : .standard) // iOS 15.0+
    }
    .toolbar {
      ToolbarItem(placement: .bottomBar) {
        Toggle("isIncreased", isOn: $isIncreased)
          .toggleStyle(.switch)
      }
    }
  }
}

fileprivate struct Weather: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let icon: String
}

private struct SearchListView: View {
    
    @State private var weathers = [
      Weather(name: "Sunshine", icon: "sun.max.fill"),
      Weather(name: "Cloud", icon: "cloud"),
      Weather(name: "Snow", icon: "snow"),
      Weather(name: "Rain", icon: "cloud.rain.fill")
    ]
    
    @State private var searchText = ""
    
    
    var searchResults: [Weather] {
      searchText.isEmpty ? weathers : weathers.filter { $0.name.contains(searchText) }
    }
    
    var body: some View {
        List(Array(searchResults.enumerated()), id: \.offset) { i, v in
          Label(v.name, systemImage: v.icon)
            .swipeActions(edge: .leading, allowsFullSwipe: false) {
              Button {
                let random = Int(arc4random_uniform(UInt32(weathers.count)))
                weathers.append(weathers[random])
              } label: {
                Image(systemName: "plus.circle")
              }
              .tint(.green)
            }
            .swipeActions(edge: .trailing) {
              Button {
                weathers.remove(at: i)
              } label: {
                Image(systemName: "delete.backward")
              }
              .tint(.red)
              
              Button {
                let random = Int(arc4random_uniform(UInt32(weathers.count)))
                weathers[i] = weathers[random]
              } label: {
                Image(systemName: "arrow.clockwise")
              }
              .tint(.purple)
            }
        }
        // .searchable(text: $searchText, prompt: "Input something...")
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always) , prompt: "Input something...") {
          ForEach(searchResults, id: \.self) { v in
            Text("Looking for \(v.name)?").searchCompletion(v.name)
            Text("Looking for \(Image(systemName: v.icon))").searchCompletion(v.name)
          }
        }
        .onSubmit(of: .search) { // 点击推荐的建议或者键盘上的 return 键时会触发该事件
          print("搜索🔍")
        }
    }
}

struct SelectionListView: View {
  @State private var weathers = [
    Weather(name: "Sunshine", icon: "sun.max.fill"),
    Weather(name: "Cloud", icon: "cloud"),
    Weather(name: "Snow", icon: "snow"),
    Weather(name: "Rain", icon: "cloud.rain.fill")
  ]
  
  @State private var singleSelection: UUID?
  @State private var multiSelection = Set<UUID>()
  
  var body: some View {
    VStack {
      GroupBox("单选") {
        List(weathers, selection: $singleSelection) { // 单选
          Label($0.name, systemImage: $0.icon)
        }
      }
      GroupBox("多选") {
        List(weathers, selection: $multiSelection) { // 多选
          Label($0.name, systemImage: $0.icon)
        }
      }
    }
    .toolbar {
      EditButton()
    }
  }
}


struct ExpandListView: View {
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
        List(expandWeather, children: \.weathers) { weather in
          Label(weather.name, systemImage: weather.icon)
        }
    }
}


struct EditListView: View {
    @State private var weathers = [
        Weather(name: "Sunshine", icon: "sun.max.fill"),
        Weather(name: "Cloud", icon: "cloud"),
        Weather(name: "Snow", icon: "snow"),
        Weather(name: "Rain", icon: "cloud.rain.fill"),
    ]

    var body: some View {
        List {
            ForEach(weathers, id: \.self) { v in
                Label(v.name, systemImage: v.icon)
            }
            .onDelete(perform: onDelete)
            .onMove(perform: onMove)
        }
        .navigationBarItems(trailing: EditButton())
    }

    func onDelete(offsets: IndexSet) {
        weathers.remove(atOffsets: offsets)
    }

    func onMove(fromOffsets: IndexSet, toOffset: Int) {
        weathers.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}


struct ScrollViewPage: View {
    @State private var weathers = [
        Weather(name: "Sunshine", icon: "sun.max.fill"),
        Weather(name: "Cloud", icon: "cloud"),
        Weather(name: "Snow", icon: "snow"),
        Weather(name: "Rain", icon: "cloud.rain.fill"),
    ]

    var body: some View {
        ScrollViewReader { sr in
            List {
                ForEach(0...90, id: \.self) { v in
                    Text("v:\(v)")
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("无动画滑到70").onTapGesture {
                        sr.scrollTo(70, anchor: .center)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("动画滑到70").onTapGesture {
                        withAnimation {
                            sr.scrollTo(70, anchor: .bottom)
                        }
                    }
                }
            }
        }
    }
}
