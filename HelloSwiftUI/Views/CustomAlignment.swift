//
//  CustomAlignment.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/23.
//

import SwiftUI

struct CustomAlignmentView: View {
    var body: some View {
        List {
            Section("Default") {
                HStack(alignment: .bottom) {
                    Image(systemName: "applelogo")
                        .font(.largeTitle)
                    Text("Apple")
                }
            }
            Section("重写 alignmentGuide") {
                HStack(alignment: .bottom) {
                    Image(systemName: "applelogo")
                        .font(.largeTitle)
                        .alignmentGuide(.bottom, computeValue: { d in d[.bottom] - 5 })
                    Text("Apple")
                }
            }

            Section("offset") {
                HStack(alignment: .bottom) {
                    Image(systemName: "applelogo")
                        .font(.largeTitle)
                        .offset(x: 0, y: 5)
                    Text("Apple")
                }
            }

            Section("自定义 alignmentGuide") {
                VStack(alignment: .custom) {
                    HStack {
                        Text("姓名")
                            .alignmentGuide(.custom, computeValue: { $0[.trailing] })
                        Text("张三")
                    }
                    HStack {
                        Text("手机")
                            .alignmentGuide(.custom, computeValue: { $0[.trailing] })
                        Text("155********")
                    }

                    HStack {
                        Text("电子邮箱")
                            .alignmentGuide(.custom, computeValue: { $0[.trailing] })
                        Text("xxxxxx@gmail.com")
                    }
                }
            }

            Section("自定义 alignmentGuide2") {
                VStack(alignment: .leading) {
                    HStack {
                        Text("手机")
                            .alignmentGuide(.trailing, computeValue: { $0[.trailing] })
                        Text("155********")
                    }

                    HStack {
                        Text("电子邮箱")
                            .alignmentGuide(.trailing, computeValue: { $0[.trailing] })
                        Text("xxxxxx@gmail.com")
                    }
                }
            }
            
             VStack {
                 Text("Today's Weather")
                     .font(.title)
                     .border(.gray)
        
                 HStack {
                     Text("🌧")
                         .alignmentGuide(VerticalAlignment.center) { _ in -20 }
                         .border(.gray)
                     Text("Rain & Thunderstorms")
                         .border(.gray)
                     Text("⛈")
                         .alignmentGuide(VerticalAlignment.center) { _ in 20 }
                         .border(.gray)
                 }
             }
        }
    }
}

extension HorizontalAlignment {
    struct CustomAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.trailing]
        }
    }

    static let custom = HorizontalAlignment(CustomAlignment.self)
    
    struct Custom2Alignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context[.leading]
        }
    }

    static let custom2 = HorizontalAlignment(Custom2Alignment.self)
}
