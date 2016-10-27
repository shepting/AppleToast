//
//  ViewController.swift
//  Example
//
//  Created by Steven Hepting on 9/10/16.
//  Copyright © 2016 Hepting. All rights reserved.
//

import UIKit
import Toast

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let notification = NSNotification(name: NSNotification.Name(rawValue: "DidFinishNetwork"), object: nil, userInfo: ["details_key": "Full payload data..."])
        showMessage(notification)

        sideMessage("first")

        sideMessage("second")

//        showMessage("Finished")
    }

    @IBAction func showMessageTapped(_ sender: AnyObject) {
        showMessage("Button tapped.")
    }
}

