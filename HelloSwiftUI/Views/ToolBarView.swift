//
//  ToolBarView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/2.
//

import SwiftUI

struct ToolbarView: View {
  @State private var text = ""
  @State private var bold = false
  @State private var textColor: Color = .primary
  @State private var fontSize: CGFloat = 18
  
  var font: Font {
    .system(size: fontSize, weight: bold ? .bold : .regular)
  }
  
  var body: some View {
    TextEditor(text: $text)
      .font(font)
      .foregroundColor(textColor)
      .frame(height: 200)
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(.blue, lineWidth: 1)
      )
      .padding(.horizontal)
      .toolbar {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
          ColorPicker("", selection: $textColor)
          Toggle(isOn: $bold) {
            Image(systemName: "bold")
          }
        }
        
        // 放键盘上
        ToolbarItem(placement: .keyboard) {
          HStack {
            Spacer()
            Button("确定") {
              UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil, from: nil, for: nil)
            }
          }
        }
        
        ToolbarItem(placement: .bottomBar) {
          Slider(value: $fontSize, in: 12...24) {
            Text("Font Size: \(fontSize)")
          } minimumValueLabel: {
            Text("A").font(.system(size: 12))
          } maximumValueLabel: {
            Text("A").font(.system(size: 24))
          }
        }
      }
  }
}

