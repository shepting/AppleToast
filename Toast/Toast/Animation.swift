//
//  Animation.swift
//  Toast
//
//  Created by Steven Hepting on 9/12/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import UIKit

enum Direction {
    case top
    case bottom
}

extension UIViewController {

    func present(_ toastView: UIView, fromDirection: Direction) -> Void {
        print("Presenting view")

        self.view.addSubview(toastView)
    }
}
