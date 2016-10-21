//
//  UIViewExtensions.swift
//  Toast
//
//  Created by Steven Hepting on 10/20/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import Foundation

extension UIView {
//    func fillSuperview() -> Void {
//        self.fillHorizontally()
//        self.fillVertically()
//    }

    func fillSuperview(padding: CGFloat = 0.0) -> Void {
        if let superview = self.superview {
            let topBottomPadding = padding - 2
            superview.leftAnchor.constraint(equalTo: leftAnchor, constant: -padding).isActive = true
            superview.rightAnchor.constraint(equalTo: rightAnchor, constant: padding).isActive = true
            superview.topAnchor.constraint(equalTo: topAnchor, constant: -topBottomPadding).isActive = true
            superview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: topBottomPadding).isActive = true
        } else {
            print("Not in a superview! No constraints being added.")
        }
    }

    func fillHorizontally() -> Void {
        if let superview = self.superview {
            superview.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
            superview.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true

        } else {
            print("Not in a superview! No constraints being added.")
        }
    }

    func fillVertically() -> Void {
        if let superview = self.superview {
            superview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            superview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        } else {
            print("Not in a superview! No constraints being added.")
        }
    }

    func constrainNearTop() {
        if let superview = self.superview {
            superview.topAnchor.constraint(equalTo: self.topAnchor, constant: -50).isActive = true
            superview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        } else {
            print("Not in a superview! No constraints being added.")
        }
    }

    func constrainNearBottom() {
        if let superview = self.superview {
            superview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 150).isActive = true
            superview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
            print("constraining near bottom")
        } else {
            print("Not in a superview! No constraints being added.")
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
