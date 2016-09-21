//
//  ToastView.swift
//  Toast
//
//  Created by Steven Hepting on 9/10/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import UIKit

class ToastView: UIView {
    let defaultFrame = CGRect(x: 100, y: 50, width: 200, height: 100)

    let spinner = UIActivityIndicatorView()
    let label = UILabel()
    let image = UIImage()
    let button = UIButton()
}

extension ToastView {

    convenience init (message: String) {
        self.init()
        self.frame = defaultFrame
        print("Showing \(message)")
        self.backgroundColor = .black
        self.label.layer.cornerRadius = 4
        self.addSubview(label)

        self.label.textColor = .white
        self.layer.cornerRadius = 4
        self.label.text = message
    }

    override func didMoveToSuperview() {
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.label.fillSuperView()
    }

}

extension UIView {
    func fillSuperView() -> Void {
        self.fillHorizontally()
        self.fillVertically()
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
}
