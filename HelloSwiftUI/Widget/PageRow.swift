//
//  PageRow.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/11/30.
//

import SwiftUI


struct PageRow: View {
    
    private let title: String
    private let subTitle: String?
    
    init(title: String,subTitle: String? = nil) {
        self.title = title
        self.subTitle = subTitle
    }
    
    var body: some View {
        return VStack(alignment: .leading, spacing: 5) {
            Text(title).bold()
            if let sub = subTitle {
                Text(sub).font(.subheadline).opacity(0.5).lineLimit(nil)
            }
        }
    }
}
