//
//  Person.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/1.
//

import SwiftUI

struct Person {
    var name: String
    var age: Int
}

extension Person: _FormatSpecifiable {
    var _arg: String { "\(name): \(age)岁" }
    var _specifier: String { "%@" }
}

extension LocalizedStringKey.StringInterpolation {
    mutating func appendInterpolation(_ person: Person) {
        appendLiteral("\(person.name): \(person.age)岁")
    }
}
