//
//  SafeAreaView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/8.
//

import SwiftUI

struct SafeAreaView: View {
    @State private var ignoreSafeArea: Bool = true
    
    var body: some View {
        ZStack {
            if ignoreSafeArea {
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            } else {
                LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
            }
            Section {
                Toggle("忽略safeArea", isOn: $ignoreSafeArea)
                NavigationLink(destination: OtherView()) {
                    Text("otherView")
                }
            }
        }
    }
}

struct ViewA: View {
  var body: some View {
    Text("ViewA")
  }
}

struct ViewB: View {
  var body: some View {
    Text("ViewB")
  }
}

private struct OtherView: View {
    private let destinations = ["ViewA", "ViewB"]
    @State private var showDialog = false
    
    var body: some View {
        List {
            Section("AnyView") {
                ForEach(destinations, id: \.self) { v in
                    NavigationLink(destination: destinationTo(v)) {
                        Text(v)
                    }
                }
            }
            
            Section {
                Button {
                  showDialog = true
                } label: {
                  Text("Show ConfirmationDialog")
                }
                .confirmationDialog("ConfirmationDialog", isPresented: $showDialog, actions: {
                  Button("Option 1", role: .destructive, action: {})
                  Button("Option 2", action: {})
                  Button("Option 3", action: {})
                  Button("Cancel", role: .cancel) {
                    showDialog = false
                  }
                }, message: {
                  Text("message")
                })
            }
        }
    }
    
    func destinationTo(_ to: String) -> some View {
        switch to {
        case "ViewA":
            return AnyView(ViewA())
        case "ViewB":
            return AnyView(ViewB())
        default:
            return AnyView(EmptyView())
        }
    }
}
