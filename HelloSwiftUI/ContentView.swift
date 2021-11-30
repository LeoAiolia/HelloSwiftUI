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
                    NavigationLink(destination: HomeView()) {
                        PageRow(title: "Home", subTitle: "Hello Home")
                    }
                }
                
                Section(header: Text("B")) {
                    NavigationLink(destination: HomeView()) {
                        PageRow(title: "Mine", subTitle: "Hello Mine")
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
