//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Lola on 3/13/17.
//  Copyright © 2017 Lola. All rights reserved.
//

import UIKit

protocol SettingsViewControllerDelegate{
    func vcDidFinish(controller:SettingsViewController, index: Int)
}

class SettingsViewController: UIViewController {

    var delegate: SettingsViewControllerDelegate? = nil
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    var tipPercentageIndex: Int!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipPercentageIndex = defaults.integer(forKey: "default_tip_percentage_index")
        tipControl.selectedSegmentIndex = tipPercentageIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func changeDefaultTipPercentage(_ sender: Any) {
        tipPercentageIndex = tipControl.selectedSegmentIndex
    }
    
    @IBAction func saveSettings(_ sender: Any) {
        guard let delegate = self.delegate else {
            print("Delegate for FooTwoDelegateController not Set")
            return
        }
        
        delegate.vcDidFinish(controller: self, index: tipPercentageIndex)
        
        defaults.set(tipPercentageIndex, forKey: "default_tip_percentage_index")
        defaults.synchronize()
    }

}
