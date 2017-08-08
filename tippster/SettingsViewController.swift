//
//  SettingsViewController.swift
//  tippster
//
//  Created by Gonzalo Maldonado Martinez on 8/2/17.
//  Copyright © 2017 Gonzalo Maldonado. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    let defaults = UserDefaults.standard

    @IBOutlet weak var defaultTipTextField: UITextField!

    @IBAction func defaultTipValueChange(_ sender: Any) {
        let defaultTipValue = (Double(defaultTipTextField.text!) ?? 0 ) / 100
        if (defaultTipValue != 0.0) {
            defaults.set(defaultTipValue, forKey: "DEFAULT_TIP")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        var storedValue = defaults.double(forKey: "DEFAULT_TIP")
        if (storedValue == 0.0) {
            storedValue = 0.18
            defaults.set(storedValue, forKey: "DEFAULT_TIP")
        }
        let displayValue = storedValue * 100
        defaultTipTextField.text = String(format: "%.2f %", displayValue)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
