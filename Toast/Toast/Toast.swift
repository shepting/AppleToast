//
//  Toast.swift
//  Toast
//
//  Created by Steven Hepting on 9/10/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import UIKit



public class Toaster {

    public class func show(message: String) -> Void {
        let toastView = ToastView(message: message)
        let topWindow = UIWindow.topWindow()
        topWindow.backgroundColor = UIColor.blackColor()
        toastView.frame = CGRectMake(100, 50, 200, 100)
        topWindow.addSubview(toastView)
        dispatch_async(dispatch_get_main_queue()) { 
            toastView.superview?.bringSubviewToFront(toastView)
        }

    }

    

}

extension UIWindow {

    class func topWindow() -> UIWindow {
        for window in UIApplication.sharedApplication().windows.reverse() {
            let windowOnMainScreen = window.screen == UIScreen.mainScreen()
            let windowIsVisible = !window.hidden && window.alpha > 0
            let windowLevelSupported = window.windowLevel >= UIWindowLevelNormal

            if (windowOnMainScreen && windowIsVisible && windowLevelSupported) {
                return window
            }
        }

        return UIApplication.sharedApplication().windows.first!
    }
}
