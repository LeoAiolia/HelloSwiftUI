//
//  RichText.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/1.
//

import SwiftUI

struct RichTextView: View {
    var body: some View {
        
        let person = Person(name: "张三", age: 18)
        return VStack(alignment: .trailing, spacing: 5) {
            Text("Hello") + Text("world").foregroundColor(.red)
            Text("Hello \(Text("world").italic())")
            // LocalizedStringKey.StringInterpolation
            Text("A \(bold: "wonderful") serenity \(italic: "has taken") \("possession", color: .red) of my \(underline: "entire soul").")
            // String++
            Text("A \("wonderful".bold.italic()) serenity \("has taken".italic) \("possession".foregroundColor(.red)) of my \("entire soul".underline).")
            Text("1.5 + 1.5 = \(1.5 + 1.5, specifier: "%.1f")")
            Text("a man \(person)")
            if #available(macCatalyst 15.0, *) {
                Text("Stay Hungry, Stay Foolish!")
                    .font(.title2).bold()
                    .foregroundStyle(.linearGradient(
                        colors: [.orange, .yellow, .blue, .purple],
                        startPoint: .topLeading, endPoint: .bottomTrailing))
                    .textSelection(.enabled)
            }
            
            Text("百度").onTapGesture {
                print("tap baidu")
            }
        }
    }
}
