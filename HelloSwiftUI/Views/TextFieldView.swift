//
//  TextFieldView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/2.
//

import SwiftUI

struct TextFieldView: View {
    @State private var s1 = ""
    @State private var s2 = ""
    @State private var s3 = 0
    @State private var pwd = ""
    
    var body: some View {
     
        return List {
            if #available(macCatalyst 15.0, *) {
                Section(header: EmptyView()) {
                    Text("s1: \(s1)")
                    TextField("TextField", text: $s1).onSubmit(of: .text) {
                        print("return s1: \(s1)")
                    }
                }
            }
            
            Section(header: EmptyView()) {
                GroupBox(label: Text("s2: \(s2)")) {
                    TextField("Observe TextField", text: $s2) { isEditing in
                        print("isEditing: \(isEditing)")
                    }.textFieldStyle(.roundedBorder)
                    if #available(macCatalyst 15.0, *) {
                        onSubmit {
                            print("return s2: \(s2)")
                        }
                    }
                }
            }
            
            GroupBox(label: Text(String(s3))) {
              /// 3
              TextField("Formatter TextField", value: $s3, formatter: NumberFormatter()) {
                (isEditing) in
                print(isEditing)
              } onCommit: {
                print("Return")
              }
              .textFieldStyle(.roundedBorder)
              .keyboardType(.numbersAndPunctuation)
            }

            GroupBox(label: Text("密码输入: \(pwd)")) {
              /// 密码输入
                SecureField("Password", text: $pwd).textFieldStyle(.plain)
            }
            
            GroupBox(label: Text("备注")) {
                TextEditorView(placeholder: "请输入")
            }
        }
    }
}


struct TextEditorView: View {
    @State private var text = "Stay Hungry, Stay Foolish!"
    let placeholder: String
    
    var body: some View {
        return ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
              .frame(height: 150)
              .lineSpacing(10.0)                  // 行距
              .multilineTextAlignment(.leading)    // 对齐方式
              .overlay(
                RoundedRectangle(cornerRadius: 5)
                  .stroke(Color.blue, lineWidth: 1)
              )
            
            if text.isEmpty {
              Text(placeholder)
                .foregroundColor(Color(UIColor.placeholderText))
                .padding(8)
            }
          }
    }
}
