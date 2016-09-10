//
//  ToastView.swift
//  Toast
//
//  Created by Steven Hepting on 9/10/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import UIKit

class ToastView: UIView {

    let spinner = UIActivityIndicatorView()
    let label = UILabel()
    let image = UIImage()
    let button = UIButton()

}

extension ToastView {

    convenience init (message: String) {
        self.init()
        print("Showing \(message)")
        self.backgroundColor = .blackColor()
        self.label.layer.cornerRadius = 4
        self.addSubview(label)
        self.label.textColor = .whiteColor()
        self.label.frame = self.frame
        self.label.text = message
    }

}
