//
//  ImageView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/2.
//

import SwiftUI

struct ImageListView: View {
    var body: some View {
        return List {
            Image(systemName: "xmark.circle")
            Image(systemName: "swift")
                .blur(radius: 2)
            if #available(macCatalyst 15.0, *) {
                NavigationLink(destination: AdvancedAsyncImage()) {
                    Text("AdvancedAsyncImage")
                }
            }
            Image("data_moment_2_1")
                .resizable()
                .frame(width: 300, height: 300, alignment: .center)
                .aspectRatio(.none, contentMode: .fit)
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}

// private struct ImageItem: View {
//    var body: some View {
//        return HStack {
//
//        }
//    }
// }

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
private struct AdvancedAsyncImage: View {
    private let imageURLString = "https://images.pexels.com/photos/3652898/pexels-photo-3652898.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"

    var body: some View {
        AsyncImage(
            url: .init(string: imageURLString),
            transaction: .init(animation: .easeInOut(duration: 0.5))) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case let .success(image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                Image(systemName: "xmark.circle")
            @unknown default:
                Image(systemName: "xmark.circle")
            }
        }
        .frame(width: 200, height: 200)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.purple, lineWidth: 1)
        )
    }
}
