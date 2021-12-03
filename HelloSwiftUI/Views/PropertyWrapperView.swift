//
//  PropertyWrapperView.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/3.
//

import SwiftUI

enum FocusedField: Hashable, Codable {
    case mobile
    case nickname
    case password
}

///     struct LoginForm {
///         enum Field: Hashable {
///             case username
///             case password
///         }
///
///         @State private var username = ""
///         @State private var password = ""
///         @FocusState private var focusedField: Field?
///
///         var body: some View {
///             Form {
///                 TextField("Username", text: $username)
///                     .focused($focusedField, equals: .username)
///
///                 SecureField("Password", text: $password)
///                     .focused($focusedField, equals: .password)
///
///                 Button("Sign In") {
///                     if username.isEmpty {
///                         focusedField = .username
///                     } else if password.isEmpty {
///                         focusedField = .password
///                     } else {
///                         handleLogin(username, password)
///                     }
///                 }
///             }
///         }
///     }
struct PropertyWrapperView: View {
    private let p = _Person(name: "Steve Jobs", birth: "2021年10月14")

    @FocusState private var focusedField: FocusedField?

    @State private var mobile = ""
    @State private var nickname = ""
    @State private var password = ""

    @State private var isValidToRegister = false

    @State private var showSheet = false

    var body: some View {
        List {
            Section(header: Text("CNNumber")) {
                Text("2021年10月14")
                Text(p.birth)
            }

            VStack {
                TextField("手机号", text: $mobile)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusedField, equals: .mobile)
                TextField("昵称", text: $nickname)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusedField, equals: .nickname)
                SecureField("密码", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .focused($focusedField, equals: .password)

                Button {
                    if mobile.isEmpty {
                        focusedField = .mobile
                    } else if nickname.isEmpty {
                        focusedField = .nickname
                    } else if password.isEmpty {
                        focusedField = .password
                    } else {
                        isValidToRegister = true
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                } label: {
                    Text("注册")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                .controlSize(.regular)
                .alert(isPresented: $isValidToRegister) {
                    Alert(title: Text("注册成功"), message: nil, dismissButton: .default(Text("OK")))
                }

                Button {
                    showSheet = true
                } label: {
                    Text("Sheet")
                }.sheet(isPresented: $showSheet) {
                    print("action dismiss")
                } content: {
                    Text("123")
                    Text("456")
                    Button {
                        showSheet = false
                    } label: {
                        Text("back")
                    }
                }.padding(.top, 10)
            }
        }
    }
}

private struct _Person {
    var name: String
    @CNNumber var birth: String
}

@propertyWrapper
struct CNNumber {
    private let table = [
        "0": "〇",
        "1": "一",
        "2": "二",
        "3": "三",
        "4": "四",
        "5": "五",
        "6": "六",
        "7": "七",
        "8": "八",
        "9": "九",
    ]
    private var value = ""

    var wrappedValue: String {
        get { value }
        set {
            value = convertToCNNumbers(newValue)
        }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }

    func convertToCNNumbers(_ string: String) -> String {
        var res = ""
        for v in string {
            res += table[String(v)] ?? String(v)
        }
        return res
    }
}
