//
//  Toast.swift
//  Toast
//
//  Created by Steven Hepting on 9/10/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import UIKit

//func showMessage(message: String) {
//    Toaster.show(message)
//}


public extension UIViewController {
    public func showMessage(_ message: String) {
        Toaster.show(message)
    }
}

public class Toaster {

    public class func show(_ message: String) -> Void {
        let toastView = ToastView(message: message)
        toastView.alpha = 0.0
        let topWindow = UIWindow.topWindow()
        topWindow.backgroundColor = UIColor.black
        toastView.frame = CGRect(x: 100, y: 50, width: 200, height: 100)
        topWindow.addSubview(toastView)
        DispatchQueue.main.async { 
            toastView.superview?.bringSubview(toFront: toastView)
            UIView.animate(withDuration: 0.2, animations: {
                toastView.alpha = 1.0
            })
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
