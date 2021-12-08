//
//  GroupView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/3.
//

import SwiftUI

struct GroupView: View {
    var body: some View {
        List {
            GroupBox(label: Text("groupBox label")) {
                Text("groupBox1")
                Text("groupBox2")
            }.groupBoxStyle(.reserver)

            VStack {
                controlGroup
                    .controlGroupStyle(.automatic)

                controlGroup
                    .controlGroupStyle(.navigation)
            }

            Group {
                Text("group1")
                Text("group2")
                Text("group3")
            }

            Section {
                Text("section1")
                Text("section2")
                Text("section3")
            }
            
            NavigationLink(destination: FormView()) {
                Text("fromView")
            }
        }
    }

    var controlGroup: some View {
        ControlGroup {
            Button {} label: {
                Label("iPhone", systemImage: "iphone")
            }

            Button {} label: {
                Label("iMac", systemImage: "desktopcomputer")
            }

            Button {} label: {
                Label("iPad", systemImage: "ipad.landscape")
            }
        }
        .tint(.purple)
    }
}

struct FormView: View {
    var body: some View {
        Form {
            Text("form1")
            Text("form2")
            Text("form3")
        }
    }
}

struct ReserveGroupStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        return VStack(alignment: .center, spacing: 10) {
            configuration.content
            configuration.label
        }
    }
}

extension GroupBoxStyle where Self == ReserveGroupStyle {
    static var reserver: ReserveGroupStyle { Self() }
}
