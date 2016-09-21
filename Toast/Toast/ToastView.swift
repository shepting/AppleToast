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

    var stackView = UIStackView()
    let spinner = UIActivityIndicatorView()
    let mainLabel = UILabel()
    let detailLabel = UILabel()
    let image = UIImage()
    let button = UIButton()
}

extension ToastView {

    convenience init<T: Toastable>(message: T) {
        self.init()

//        self.frame = defaultFrame
        print("Showing \(message.mainMessage())")
        backgroundColor = .black
        layer.cornerRadius = 4

        // Main
        mainLabel.textColor = .white
        mainLabel.text = message.mainMessage()

        // Detail
        detailLabel.textColor = .lightGray
        detailLabel.text = "Detail label"

        // Stack View
        stackView = UIStackView(arrangedSubviews: [mainLabel, detailLabel])
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.addArrangedSubview(mainLabel)
        stackView.addArrangedSubview(detailLabel)
        stackView.axis = .vertical
        stackView.frame = self.bounds
        addSubview(stackView)
        stackView.spacing = 10
        stackView.layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.fillSuperview()
    }

    override func didMoveToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        constrainNearTop()
    }

}

extension UIView {
    func fillSuperview() -> Void {
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

    func constrainNearTop() {
        if let superview = self.superview {
            superview.topAnchor.constraint(equalTo: self.topAnchor, constant: -50).isActive = true
            superview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        } else {
            print("Not in a superview! No constraints being added.")
        }
    }
}
