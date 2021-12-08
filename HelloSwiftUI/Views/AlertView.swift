//
// AlertView.swift
// HelloSwiftUI
//
// Created by dev-yxr on 2021/12/3.
//

import SwiftUI

struct AlertView: View {
    @State private var isShowAlert = false
    @State private var showDialog = false

    var body: some View {
        List {
            Label("alert", systemImage: "applelogo")
            .onTapGesture {
                isShowAlert = true
            }.alert(isPresented: $isShowAlert) {
                Alert(title: Text("注册成功"), message: nil, dismissButton: .default(Text("OK")))
            }

            NavigationLink(destination: ShowPartDetail()) {
                Label("sheet", systemImage: "applelogo")
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
}

struct ShowPartDetail: View {
    @State var sheetDetail: InventoryItem?
    var body: some View {
        Button("Show Part Details") {
            sheetDetail = InventoryItem(
                id: "0123456789",
                partNumber: "Z-1234A",
                quantity: 100,
                name: "Widget")
        }
        .sheet(item: $sheetDetail,
               onDismiss: didDismiss) { detail in
            VStack(alignment: .leading, spacing: 20) {
                Text("Part Number: \(detail.partNumber)")
                Text("Name: \(detail.name)")
                Text("Quantity On-Hand: \(detail.quantity)")
                Text("dismiss").foregroundColor(.blue).onTapGesture {
                    sheetDetail = nil
                }
            }
        }
    }

    func didDismiss() {
        print("sheet dismiss")
    }
}

struct InventoryItem: Identifiable {
    var id: String
    let partNumber: String
    let quantity: Int
    let name: String
}
