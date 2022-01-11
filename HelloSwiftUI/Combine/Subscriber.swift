//
//  Subscriber.swift
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/23.
//

import Combine
import SwiftUI

class SomeObject {
    var value: String = "" {
        didSet {
            print(value)
        }
    }
}

//class A {
//    let object = SomeObject()
//
//    let publisher = ["Hello", "world"].publisher.assign(to: \.value, on: object)
//}
//
//func b() {
//    let curPublisher = CurrentValueSubject<String, Never>("1")
//    
//    let cancellable: AnyCancellable = curPublisher.print("__Debug_").sink { completion in
//        switch completion {
//        case .finished:
//            print("finished")
//        case .failure(let error):
//            print("get a error: \(error)")
//        }
//    } receiveValue: { str in
//        print(str)
//    }
//    
////    cancellable.cancel()
//}
