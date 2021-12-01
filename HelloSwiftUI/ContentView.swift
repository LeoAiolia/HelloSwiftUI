//
//  ContentView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/11/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("A")) {
                    NavigationLink(destination: TextView()) {
                        PageRow(title: "Text", subTitle: "Hello Text")
                    }
                }
                
                Section(header: Text("B")) {
                    NavigationLink(destination: RichTextView()) {
                        PageRow(title: "RichText", subTitle: "Hello RichText")
                    }
                }
            }.listStyle(GroupedListStyle())
                .navigationBarTitle(Text("Example"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    print("Tap")
                }, label: {
                    Text("Right").foregroundColor(.orange)
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
