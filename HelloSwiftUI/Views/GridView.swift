//
//  GridPage.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/3.
//

import SwiftUI

struct GridView: View {
    var body: some View {
        List {
            NavigationLink(destination: HView()) {
                Text("HView")
            }
            
            NavigationLink(destination: VView()) {
                Text("VView")
            }
        }
    }
}
     
private struct HView: View {
    var body: some View {
        let rows: [GridItem] =
                Array(repeating: .init(.fixed(30)), count: 3)
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .top) {
                ForEach((0...79), id: \.self) {
                    let codepoint = $0 + 0x1f600
                    let codepointString = String(format: "%02X", codepoint)
                    Text("\(codepointString)")
                        .font(.footnote)
                    let emoji = String(Character(UnicodeScalar(codepoint)!))
                    Text("\(emoji)")
                        .font(.largeTitle)
                    Text("\(emoji)")
                        .font(.largeTitle)
                }
            }
        }
    }
}

private struct VView: View {
    var body: some View {
        let rows: [GridItem] =
                Array(repeating: .init(.adaptive(minimum: 50, maximum: 120)), count: 3)
        ScrollView(.vertical) {
            LazyVGrid(columns: rows, alignment: .leading) {
                ForEach((0...79), id: \.self) {
                    let codepoint = $0 + 0x1f600
                    let codepointString = String(format: "%02X", codepoint)
                    Text("\(codepointString)").lineLimit(1)
                        .font(.footnote)
                    let emoji = String(Character(UnicodeScalar(codepoint)!))
                    Text("\(emoji)")
                        .font(.largeTitle)
                    Text("\(emoji)")
                        .font(.largeTitle)
                }
            }
        }
    }
}
