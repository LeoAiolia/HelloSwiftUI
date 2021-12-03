//
//  CustomModifierView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/3.
//

import SwiftUI

struct CustomModifierView: View {
    var body: some View {
        
        return VStack {
            Text("Bruce").isVIP(false)
            Text("Bruce").isVIP(true)
        }
    }
}

struct Vip: ViewModifier {
    
    let isVip: Bool
    
    func body(content: Content) -> some View {
        return HStack {
            content
            if isVip {
                Text("VIP")
                    .font(.caption).bold()
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                    .padding(.vertical, 3)
                    .background(.orange)
                    .cornerRadius(3)
            } else {
                Button {
                    
                } label: {
                    Text("开通VIP")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(5)
                        .background(.blue)
                        .clipShape(Capsule())
                }.buttonStyle(.borderless)
            }
        }
    }
}

extension View {
    func isVIP(_ value: Bool) -> some View {
        return self.modifier(Vip(isVip: value))
    }
}
