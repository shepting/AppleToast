//
//  UIViewControllerExtensions.swift
//  Toast
//
//  Created by Steven Hepting on 10/27/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {

    func hasNavBar() -> Bool {
        return self.navigationController != nil
    }

    func hasTabBar() -> Bool {
        return self.tabBarController != nil
    }

}
