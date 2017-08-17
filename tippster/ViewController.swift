//
//  ViewController.swift
//  tippster
//
//  Created by Gonzalo Maldonado on 7/26/17.
//  Copyright © 2017 Gonzalo Maldonado. All rights reserved.
//

import UIKit

let CURRENT_BILL = "CURRENT_BILL"
let TEN_MINUTES_IN_SECONDS = 600.0

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipPercentageLabel: UITextField!
    var defaultPercentage = 0.18
    let defaults = UserDefaults.standard

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let storedValue = defaults.double(forKey: "DEFAULT_TIP")
        if (storedValue != 0.0 ) {
            let displayValue = String(format: "%.0f", storedValue * 100) + "%"
            tipControl.setTitle(displayValue, forSegmentAt: 0)
            self.defaultPercentage = storedValue
        }

        let billDict = defaults.dictionary(forKey: CURRENT_BILL)
        if ((billDict) != nil) {
            let updatedAt = billDict?["updated_at"] as! NSDate
            let billValue = billDict?["value"] as! Double

            let useStoredBill =
                billValue != 0.0 &&
                updatedAt.timeIntervalSinceNow < TEN_MINUTES_IN_SECONDS

            if (useStoredBill) {
                billField.text = String(billValue)
            } else {
                defaults.removeObject(forKey: CURRENT_BILL)
            }
        }
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

        let tipPercentages = [defaultPercentage, 0.2, 0.25]
        return Double(tipPercentages[tipControl.selectedSegmentIndex])
    }

    @IBAction func calculateTip(_ sender: Any) {
        if (tipControl.selectedSegmentIndex == 3) {
            tipPercentageLabel.isEnabled = true
        } else {
            tipPercentageLabel.isEnabled = false
        }

        let bill = Double(billField.text!) ?? 0.0
        let billDict = ["value": bill, "updated_at": NSDate()] as [String : Any]
        defaults.set(billDict, forKey: CURRENT_BILL)

        let tip = bill * self.tipPercentage()
        let total = bill + tip

        let formatter = NumberFormatter()
        formatter.numberStyle = .currency

        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLabel.text = formatter.string(from: NSNumber(value: total))

    }
}
