//
//  IndicatorView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/3.
//

import SwiftUI

struct IndicatorView: View {
    var body: some View {
        return List {
            Section(header: Text("progress")) {
                ProgressView()
                ProgressView("加载中")
                    .progressViewStyle(CircularProgressViewStyle(tint: .orange))

                ProgressView().progressViewStyle(.circular)
                ProgressView().progressViewStyle(.linear)
            }

            NavigationLink(destination: IndicatorDemoView()) {
                Text("Demo")
            }
        }
    }
}

private struct IndicatorDemoView: View {
    @State private var progress = 0.0 {
        didSet {
            if progress == 100 {
                title = "下载完成！"
                systemImgName = "checkmark.seal.fill"
            } else {
                title = "下载ing..."
                systemImgName = "square.and.arrow.down"
            }
        }
    }

    @State private var title = "下载ing..."
    @State private var systemImgName = "square.and.arrow.down"
    /// 定时器
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    var body: some View {
        List {
            Section {
                ProgressView(title, value: progress, total: 100)
                    .progressViewStyle(CircularProgressViewStyle(tint: .orange))
                    .foregroundColor(.blue)
                    .accentColor(.orange)
                
                ProgressView(title, value: progress, total: 100)
                    .foregroundColor(.blue)
                    .accentColor(.orange)

                ProgressView(value: progress, total: 100) {
                    HStack {
                        Image(systemName: systemImgName)
                        Text(title)
                    }
                    .foregroundColor(.blue)
                } currentValueLabel: {
                    Text("\(Int(progress))%").foregroundColor(.orange)
                }
            } header: {
                Text("进度条")
            }
            .onReceive(timer) { _ in // 接收定时器更新事件
                if progress < 100 {
                    progress = min(100, progress + Double(arc4random_uniform(5) + 1))
                }
            }
        }
        .listStyle(.insetGrouped)
    }
}
