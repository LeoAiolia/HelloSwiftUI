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
                Section(header: Text("basic")) {
                    NavigationLink(destination: TextView()) {
                        PageRow(title: "Text", subTitle: "Hello Text")
                    }
                    NavigationLink(destination: RichTextView()) {
                        PageRow(title: "RichText", subTitle: "Hello RichText")
                    }
                    NavigationLink(destination: LabelView()) {
                        PageRow(title: "Label", subTitle: "Hello Label")
                    }
                    NavigationLink(destination: TextFieldView()) {
                        PageRow(title: "TextField", subTitle: "Hello TextField")
                    }
                }
                
                Section(header: Text("B")) {
                    
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
