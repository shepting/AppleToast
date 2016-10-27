//
//  Toast.swift
//  Toast
//
//  Created by Steven Hepting on 9/10/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import UIKit

//func showMessage<T where T is Toastable>(message: T) {
//    Toaster.show(message)
//}


public extension UIViewController {
    public func showMessage<T: Toastable>(_ message: T) {
        Toaster.show(message)
    }

    public func sideMessage(_ message: String) {
        Toaster.showSideMessage(message)
    }
}

public class Toaster {

    public class func show<T: Toastable>(_ message: T) -> Void {
        let toastView = ToastView(message: message)
        let topWindow = UIWindow.topWindow()
        topWindow.addSubviewToTop(toastView) {
            toastView.fadeInFromTransparent()
            toastView.fadeOutAfterDelay()
        }
    }

    public class func showSideMessage(_ message: String) {
        let sideView = SideView(message: message)
        let topWindow = UIWindow.topWindow()
        topWindow.addSubviewToTop(sideView) {
            print("added")
//            sideView.trailingAnchor.constraint(equalTo: topWindow.trailingAnchor).isActive = true
        }
    }
}


extension UIWindow {

    class func topWindow() -> UIWindow {
        for window in UIApplication.shared.windows.reversed() {
            let windowOnMainScreen = window.screen == UIScreen.main
            let windowIsVisible = !window.isHidden && window.alpha > 0
            let windowLevelSupported = window.windowLevel >= UIWindowLevelNormal

            if (windowOnMainScreen && windowIsVisible && windowLevelSupported) {
                return window
            }
        }

        return UIApplication.shared.windows.first!
    }
}
