//
//  ViewController.swift
//  tippster
//
//  Created by Gonzalo Maldonado on 7/26/17.
//  Copyright © 2017 Gonzalo Maldonado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipPercentageLabel: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    func tipPercentage() -> Double {
        if (tipControl.selectedSegmentIndex == 3) {
            return (Double(tipPercentageLabel.text!) ?? 0.00 ) / 100.00
        }

        let tipPercentages = [0.18, 0.2, 0.25]
        return Double(tipPercentages[tipControl.selectedSegmentIndex])
    }

    @IBAction func calculateTip(_ sender: Any) {
        if (tipControl.selectedSegmentIndex == 3) {
            tipPercentageLabel.isEnabled = true
        } else {
            tipPercentageLabel.isEnabled = false
        }

        let bill = Double(billField.text!) ?? 0
        let tip = bill * self.tipPercentage()
        let total = bill + tip
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}
