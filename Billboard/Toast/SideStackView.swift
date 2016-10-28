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
        sharedStackView.addSubview(sideView)
        sideView.placeOnRightSide()
    }
    override func didMoveToSuperview() {
        fillSuperview()
        print("Side stack filling superview")
    }
}

extension SideStackView {

    convenience init() {
        self.init(frame:CGRect())

        spacing = 10
        layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10)
        translatesAutoresizingMaskIntoConstraints = false


        UIWindow.topWindow().addSubview(self)
        print("init static side view")

    }
    
}
