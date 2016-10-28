//
//  SideStackView.swift
//  Toast
//
//  Created by Steven Hepting on 10/27/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import Foundation
import UIKit

class SideStackView: UIStackView {
    private static let sharedStackView = SideStackView()

    class func addSideView(_ sideView: SideView) {
        sharedStackView.addArrangedSubview(sideView)
//        sideView.placeOnRightSide()
    }
    override func didMoveToSuperview() {
//        fillSuperview()
        placeOnRightSide()
        print("Side stack filling superview")
    }
}

extension SideStackView {

    convenience init() {
        self.init(frame:CGRect())

        spacing = 2
        layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10)
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        isLayoutMarginsRelativeArrangement = true
        alignment = .fill

        UIWindow.topWindow().addSubview(self)
        print("init static side view")

    }
    
}
