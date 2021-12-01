//
//  String++.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/11/30.
//

import SwiftUI

extension String {
    var locale: LocalizedStringKey {
        return .init(stringLiteral: self)
    }
    
    var bold: Text {
        return Text(self).bold()
    }
    
    var underline: Text {
        return Text(self).underline()
    }
    
    var italic: Text {
        return Text(self).italic()
    }
    
    func foregroundColor(_ color: Color?) -> Text{
        return Text(self).foregroundColor(color)
    }
}

// https://onevcat.com/2021/03/swiftui-text-2/
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
extension LocalizedStringKey.StringInterpolation {
    mutating func appendInterpolation(bold value: LocalizedStringKey){
        appendInterpolation(Text(value).bold())
    }

    mutating func appendInterpolation(underline value: LocalizedStringKey){
        appendInterpolation(Text(value).underline())
    }

    mutating func appendInterpolation(italic value: LocalizedStringKey) {
        appendInterpolation(Text(value).italic())
    }

    mutating func appendInterpolation(_ value: LocalizedStringKey, color: Color?) {
        appendInterpolation(Text(value).foregroundColor(color))
    }
}


