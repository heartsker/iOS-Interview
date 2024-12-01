//
//  TestSwizzling.swift
//  TestApp
//
//  Created by Daniel Pustotin on 20.01.2024.
//

import Foundation
import ObjectiveC
import UIKit

enum TestSwizzling {
    static func test() {
        UIViewController.swizzle()

        let viewController = TestViewController()

        viewController.viewDidLoad()

        SomeClass.swizzle()

        let someClass = SomeClass()
        someClass.someMethod()
    }
}

private class TestViewController: UIViewController {
    // MARK: If the method is overridden, swizzling won't work
//    override func viewDidLoad() {
//        print("viewDidLoad [\(type(of: self))]")
//    }
}

extension UIViewController {
    @objc dynamic func swizzledViewDidLoad() {
        print("swizzled viewDidLoad [\(type(of: self))]")
        swizzledViewDidLoad()
    }

    static func swizzle() {
        // Make sure this isn't a subclass of UIViewController,
        // So that It applies to all UIViewController childs

        guard self == UIViewController.self else {
            return
        }

        Swizzler.swizzle(
            self,
            originalSelector: #selector(viewDidLoad),
            swizzledSelector: #selector(swizzledViewDidLoad)
        )
    }
}

private class SomeClass: NSObject {
    @objc dynamic func someMethod() {
        print("someMethod")
    }
}

private extension SomeClass {
    @objc private func swizzledSomeMethod() {
        print("swizzled someMethod")
    }

    static func swizzle() {
        guard self == SomeClass.self else {
            return
        }

        Swizzler.swizzle(
            self,
            originalSelector: #selector(someMethod),
            swizzledSelector: #selector(swizzledSomeMethod)
        )
    }
}

enum Swizzler {
    static func swizzle(_ type: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(type, originalSelector)!
        let swizzledMethod = class_getInstanceMethod(type, swizzledSelector)!

        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
}
