//
//  SideView.swift
//  Toast
//
//  Created by Steven Hepting on 10/20/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import Foundation
import UIKit

class SideView: UIView {

    let label = UILabel()
}

extension SideView {
    convenience init(message: String) {

        self.init()

        backgroundColor = .black
        label.text = message
        addSubview(label)
        label.fillSuperview(padding: 6)
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        layer.cornerRadius = 3
        label.translatesAutoresizingMaskIntoConstraints = false

        translatesAutoresizingMaskIntoConstraints = false
    }

//    override func didMoveToSuperview() {
//        translatesAutoresizingMaskIntoConstraints = false
//        placeOnRightSide()
//    }
}
