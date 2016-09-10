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
        // Do any additional setup after loading the view, typically from a nib.

        Toaster.show("Done loading.")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

