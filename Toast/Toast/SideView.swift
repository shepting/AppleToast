//
//  SideView.swift
//  Toast
//
//  Created by Steven Hepting on 10/20/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import Foundation

class SideView: UIView {
    var stackView = UIStackView()

    let label = UILabel()
}

extension SideView {
    convenience init(message: String) {
//        self.init(frame:CGRect(x: 100, y: 20, width: 300, height: 100))

        self.init()

        alpha = 0.7
        backgroundColor = .black
        label.text = message
        addSubview(label)
        label.fillSuperview(padding: 6)
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        layer.cornerRadius = 3
        label.translatesAutoresizingMaskIntoConstraints = false

//        widthAnchor.constraint(equalToConstant: 200)
//        heightAnchor.constraint(equalToConstant: 100)
        print("init")
    }

    override func didMoveToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        constrainNearBottom()

    }
}
