//
//  TestResponderChain.swift
//  TestApp
//
//  Created by Daniel Pustotin on 20.01.2024.
//

import Foundation
import UIKit

class TestResponderChainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray

        setupSubviews()
    }

    private func setupSubviews() {
        let viewA = ViewA(frame: .zero)

        view.addSubview(viewA)
        viewA.translatesAutoresizingMaskIntoConstraints = false

        [
            viewA.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewA.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewA.widthAnchor.constraint(equalToConstant: 200),
            viewA.heightAnchor.constraint(equalToConstant: 200)
        ]
            .forEach { $0.isActive = true }
    }
}

private class ViewA: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .blue

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupSubviews() {
        let viewB = ViewB(frame: .zero)

        Array

        addSubview(viewB)
        viewB.translatesAutoresizingMaskIntoConstraints = false

        [
            viewB.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewB.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewB.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            viewB.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ]
            .forEach { $0.isActive = true }
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("ViewA hitTest")
        return super.hitTest(point, with: event)
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("ViewA pointInside")
        return super.point(inside: point, with: event)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ViewA touchesBegan")
        super.touchesBegan(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ViewA touchesCancelled")
        super.touchesCancelled(touches, with: event)
    }
}

private class ViewB: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .red
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        print("ViewB hitTest")
        return super.hitTest(point, with: event)
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        print("ViewB pointInside")
        return super.point(inside: point, with: event)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ViewB touchesBegan")
        super.touchesBegan(touches, with: event)
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ViewB touchesCancelled")
        super.touchesCancelled(touches, with: event)
    }
}
