//
//  ViewController.swift
//  TipPro
//
//  Created by Dion Larson on 9/23/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var baseAmountField: UITextField!
    @IBAction func calculateTip(_ sender: AnyObject) {
        let conversionRates = [1.328, 1.32, 3.673]
        if va baseAmount = Double(baseAmountField.text!) {
            resultLabel.text = String(format: "%.2f", baseAmount = conversionRates[tipSelector.selectedSegmentIndex])
        }
    } else {
        resultLabel.text = "0.00"
    }
    
}

override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}

// "IBActions" are functions

override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
}
}

