//
//  EquatableViewDemo.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/23.
//

import SwiftUI

enum WeatherState: String {
    case sun = "sun"
    case rain = "rain"
}

struct EquatableViewDemo: View {
  @State private var weatherState: WeatherState = .sun
  
  var body: some View {
    VStack {
      Button {
        weatherState = Bool.random() ? .sun : .rain
      } label: {
        Text("Random Weather")
      }
      .buttonStyle(.borderless)
      
      Text(weatherState.rawValue)
      
      // 两种写法都可以
      // EquatableView(content: WeatherView(weatherState: weatherState))
        WeatherView(weatherState: weatherState).equatable()
    }
  }
}

// 观察控制台，我们发现，只有天气发生变化的时候，WeatherView 才会去更新视图。
// 去掉Equatable，发现也是只有weatherState变化了才会刷新视图。
struct WeatherView: View, Equatable {
    
  let weatherState: WeatherState
  
  var body: some View {
    print("刷新了: \(weatherState.rawValue)")
    return Text("WeatherView: \(weatherState.rawValue)")
  }
}
/*
 // 属性变为了 @Binding var weatherState: WeatherState，则需要实现 static func ==
struct WeatherView: View, Equatable {
  static func == (lhs: WeatherView, rhs: WeatherView) -> Bool {
    lhs.weatherState == rhs.weatherState
  }
    
  @Binding var weatherState: WeatherState
  
  var body: some View {
    print("刷新了: \(weatherState.rawValue)")
    return Text("WeatherView: \(weatherState.rawValue)")
  }
}
*/
