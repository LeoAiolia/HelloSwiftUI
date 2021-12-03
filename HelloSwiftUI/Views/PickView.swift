//
//  PickView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/3.
//

import SwiftUI

struct PickView: View {
    
    @State private var isOn = false
    @State private var selectedWeather = 0
    @State private var selectedDate = Date()
    
    @State private var value1: CGFloat = 0.5
    @State private var value2: CGFloat = 0.5
    @State private var value3: CGFloat = 0.5
    @State private var value4: CGFloat = 70
    
    @State private var isEditing = false
    
    @State private var shoes = 2
    @State private var selectedColor = Color.white
    
    private let weathers = [
      ("Sunshine", "sun.max.fill"),
      ("Cloud", "cloud"),
      ("Snow", "snow"),
      ("Rain", "cloud.rain.fill")
    ]
    
    var body: some View {
        return List {
            
            Toggle(isOn: $isOn) {
              Image(systemName: "bold")
            }
            
            // picker
            Picker(selection: $selectedWeather, label: Text("Weather")) {
              ForEach(0 ..< weathers.count) {
                Label(weathers[$0].0, systemImage: weathers[$0].1)
              }
            }
            
            Section(header: Text("date picker")) {
                // datePicker
                DatePicker("日期", selection: $selectedDate)
                // Date()... 表示只能选择当前日期之后的范围，如示例所示，...Date() 表示当前时间之前的范围，Date().addingTimeInterval(86400*7) 则表示当前时间往后一周的时间范围
                DatePicker(selection: $selectedDate, in: Date()..., displayedComponents: .date) {
                  Label("日期", systemImage: "clock.fill").foregroundColor(.blue)
                }
            }
            
            Section(header: Text("slider")) {
                Slider(value: $value1, in: 0.1...1)
                Slider(value: $value2, in: 0.5...1, minimumValueLabel: Text("0.5"), maximumValueLabel: Text("1")) {}
                Slider(value: $value3, in: 0...1, step: 0.2) {}
                
                Slider(value: $value4, in: 70...147, step: 1, onEditingChanged: {
                  isEditing = $0
                }, minimumValueLabel: Text("70"), maximumValueLabel: Text("147")) {
                  Text("Points")
                }
                // .footnote("Points: \(value), is changing: \(isEditing)")
                .accentColor(.orange)
            }
            
            Stepper(value: $shoes, in: 2...20, step: 2) {
              Text("Pair of shoes: \(shoes/2)")
            }
            
            // supportsOpacity default: true
            ColorPicker(selection: $selectedColor, supportsOpacity: false) {
              Label("Apple Color", systemImage: "applelogo")
              .foregroundColor(selectedColor)
            }
        }
    }
}
