//
//  ButtonView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/2.
//

import SwiftUI

struct ButtonView: View {
    var body: some View {
        return List {
            // 1、字符串构建，支持本地化字符串
            Button("Hello World") {
              // action
              print("Hello")
            }
            
            // 2、自定义样式
            Button {
              // action
              print("Hello 自定义样式")
            } label: {
              VStack(spacing: 8) {
                Image(systemName: "square.and.arrow.up")
                Text("Share")
              }
              .padding()
              .foregroundColor(.white)
              .background(Color.blue)
              .cornerRadius(10)
              .shadow(color: Color.black.opacity(0.35), radius: 5, x: 0, y: 5)
            }
            
            if #available(macCatalyst 15.0, *) {
                Button("Hello World") {}
                .tint(.green)
                .buttonBorderShape(.capsule) // iOS 15+
                .buttonStyle(.borderedProminent) // iOS 15+
                .controlSize(.large) // iOS 15+，可以改变按钮的尺寸
            }
            
            Section(header: Text("Style")) {
                Button("Hello World") {}
                Button("Hello World") {}.buttonStyle(.shadow)
                Button("Hello World") {}.buttonStyle(.plain)
                Button("Hello World") {}.buttonStyle(.automatic)
                Button("Hello World") {}.buttonStyle(.borderless)
                if #available(macCatalyst 15.0, *) {
                    Button("Hello World") {}.buttonStyle(.bordered)
                    Button("Hello World") {}.buttonStyle(.borderedProminent)
                }
            }
            
            Section(header: Text("menu")) {
                Menu("More") {
                  Button("Add") {}
                  Button("Edit") {}
                  Button("Delete") {}
                }
                
                Menu {
                  Button {} label: {
                    Label("Add", systemImage: "plus")
                  }
                  
                  Button {} label: {
                    Label("Edit", systemImage: "pencil")
                  }
                  
                  Button {} label: {
                    Label("Delete", systemImage: "minus.circle")
                  }
                  
                  // 只要是 View 类型皆可，这里使用了 Picker
                  Picker("Picker", selection: $selection) {
                    Text("Item1").tag(0)
                    Text("Item1").tag(1)
                    Text("Item1").tag(2)
                  }
                } label: {
                  Text("More")
                  Image(systemName: "ellipsis")
                }
                
                // 使用
                Menu("BorderMenuStyle") {
                  Button("Add") {}
                  Button("Edit") {}
                  Button("Delete") {}
                }
                .menuStyle(.borderMenu)
            }
        }.navigationBarItems(trailing: EditButton())
    }
    
    @State var selection: Bool = true
}

struct ShadowButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundColor(configuration.isPressed ? .gray : .white)
      .padding()
      .background(configuration.isPressed ? Color.purple : Color.blue)
      .cornerRadius(10)
      .shadow(color: Color.black.opacity(0.35), radius: 5, x: 0, y: 5)
  }
}

extension ButtonStyle where Self == ShadowButtonStyle {
  static var shadow: Self { Self() }
}


struct BorderMenuStyle: MenuStyle {
  func makeBody(configuration: Configuration) -> some View {
    Menu(configuration)
      .foregroundColor(.blue)
      .padding(3)
      .border(Color.blue, width: 2)
  }
}

extension MenuStyle where Self == BorderMenuStyle {
  static var borderMenu: Self { Self() }
}
