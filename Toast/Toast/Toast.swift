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
}

extension UIView {

    func fadeInFromTransparent() {
        self.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 1.0
        })
    }

    func fadeOutAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.0) {
            self.fadeOut()
        }
    }
    func fadeOut() {
        UIView.animate(withDuration: 0.3, animations: {
            self.alpha = 0
        })
    }

    func addSubviewToTop(_ view: UIView, completion: @escaping () -> ()) {
        self.addSubview(view)
        DispatchQueue.main.async {
            self.bringSubview(toFront: view)

            completion()
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
