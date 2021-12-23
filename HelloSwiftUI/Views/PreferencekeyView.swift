//
//  PreferencekeyView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/23.
//

import SwiftUI

struct PreferencekeyView : View {
  
  @State private var email = ""
  @State private var password = ""
  // 保存、更新文字列所需要的合适宽度，这里是最大值
  @State private var textWidth: CGFloat?
  
  var body: some View {
    Form {
      HStack {
        Text("电子邮箱")
          .frame(width: textWidth, alignment: .leading)
          .background(TextBackgroundView())
        TextField("请输入", text: $email)
          .textFieldStyle(.roundedBorder)
      }
      
      HStack {
        Text("密码")
          .frame(width: textWidth, alignment: .leading)
          .background(TextBackgroundView())
        TextField("请输入", text: $password)
          .textFieldStyle(.roundedBorder)
      }
    }
    .onPreferenceChange(TextWidthPreferenceKey.self) { (value) in
      print(value)
//        if value > BackgroudViewPreferenceKey.defaultValue {
//            textWidth = value
//        }
        textWidth = value.max()
    }
  }
}

struct TextBackgroundView: View {
  var body: some View {
    GeometryReader { gr in
      Rectangle()
        .fill(Color.clear)
        .preference(key: TextWidthPreferenceKey.self,
                    value: [gr.size.width])
    }
  }
}

struct TextWidthPreferenceKey: PreferenceKey {

  // 偏好值没有被设定时，使用默认值
    static var defaultValue: [CGFloat] = []

  // 收集视图树中的数据
  // nextValue 的闭包是惰性调用的，只有需要用到它时才会去获取相应的值
  static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
    print("reduce old value: \(value)")
    value.append(contentsOf: nextValue())
    print("reduce newValue value: \(value)")
    value = [value.max()!]
  }
}
//struct BackgroudViewPreferenceKey: PreferenceKey {
//    static var defaultValue: CGFloat = 0.0
//
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        let newValue = nextValue()
//        print("reduce old value: \(value) newValue: \(newValue)")
//        value = max(value, newValue)
//    }
//
//    typealias Value = CGFloat
//}
