//
//  FirstViewController.swift
//  AGPBox Mobile
//
//  Created by Andrew Augustine on 10/6/15.
//  Copyright © 2015 Andrew Augustine. All rights reserved.
//

import UIKit
import Stripe

class FirstViewController: UIViewController, STPPaymentCardTextFieldDelegate {
    
    var paymentTextField: STPPaymentCardTextField! = nil
    var submitButton: UIButton! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

