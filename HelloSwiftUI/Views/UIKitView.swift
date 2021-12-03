//
//  UIKitView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/3.
//

import SafariServices
import SwiftUI
import UIKit

struct UIKitView: View {
    @State var search = ""

    var body: some View {
        return List {
            Text("search: \(search)")

            SearchBarView(searchText: $search)

            NavigationLink(destination: SafariView(url: URL(string: "https://www.baidu.com")!)) {
                Text("百度")
            }
        }
    }
}

struct SearchBarView: UIViewRepresentable {
    @Binding var searchText: String

    class Coordinator: NSObject, UISearchBarDelegate {
        var searchBarView: SearchBarView

        init(_ searchBarView: SearchBarView) {
            self.searchBarView = searchBarView
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchBarView.searchText = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.endEditing(true)
        }

        deinit {
            print("Coordinator 释放了")
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let uiView = UISearchBar()
        uiView.placeholder = "Input something..."
        uiView.searchBarStyle = .minimal
        uiView.delegate = context.coordinator
        return uiView
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = searchText
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let controller = SFSafariViewController(url: url)
        return controller
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}
