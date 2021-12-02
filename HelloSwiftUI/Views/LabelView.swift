//
//  LabelView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/2.
//

import SwiftUI

struct LabelView: View {
    var body: some View {
        
        return List {
            Section(header: EmptyView()) {
                Label("Rain", systemImage: "cloud.rain").labelStyle(.titleOnly)
                Label("Rain", systemImage: "cloud.rain").labelStyle(.iconOnly)
                if #available(macCatalyst 14.5, *) {
                    Label("Rain", systemImage: "cloud.rain").labelStyle(.titleAndIcon)
                }
                Label("Rain", systemImage: "cloud.rain").labelStyle(.automatic)
                
                Label("Rain", systemImage: "cloud.rain")
                Label("Snow", systemImage: "snow")
                Label("Sun", systemImage: "sun.max")
            }
            
            Section(header: EmptyView()) {
                Label("Apple", systemImage: "applelogo")
                if #available(macCatalyst 14.5, *) {
                    Label("Apple", systemImage: "applelogo").labelStyle(.titleAndIcon)
                }
                Label("Apple", systemImage: "applelogo").labelStyle(ReserveLabelStyle())
                Label("Apple", systemImage: "applelogo").labelStyle(.verticalLabel)
                Label("Apple", systemImage: "applelogo").labelStyle(.leftRightLabel)
            }
        }
    }
}

struct ReserveLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack(alignment: .center, spacing: 10) {
            configuration.title
            configuration.icon
        }
    }
}

struct ShadowLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    Label(configuration)
      .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
  }
}

extension LabelStyle where Self == ShadowLabelStyle {
  static var shadowLabel: Self { Self() }
}


struct VerticalLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    VStack(alignment: .center, spacing: 10) {
      configuration.icon
      configuration.title
    }
  }
}

extension LabelStyle where Self == VerticalLabelStyle {
  static var verticalLabel: Self { Self() }
}

struct LeftRightLabelStyle: LabelStyle {
  func makeBody(configuration: Configuration) -> some View {
    HStack(alignment: .center, spacing: 10) {
      configuration.icon
      Spacer()
      configuration.title
    }
  }
}

extension LabelStyle where Self == LeftRightLabelStyle {
    static var leftRightLabel: Self { Self() }
}

