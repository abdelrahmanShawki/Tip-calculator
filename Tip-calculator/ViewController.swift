//
//  ViewController.swift
//  Tip-calculator
//
//  Created by Macbook on 2024/08/05.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var tip_percent: UISegmentedControl!
    @IBOutlet weak var Bill: UITextField!
    let tips = [0.1 , 0.15 , 0.2 , 0.25]
    let numFormatter = NumberFormatter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numFormatter.numberStyle = .currency
        
        // benefit of making configuration in did load
        // https://claude.site/artifacts/af8e7114-cc1b-4fb5-a6b3-c8e75786dd4d
        
        numFormatter.locale = Locale(identifier: "en_US")  // Explicitly set to US locale
        numFormatter.currencyCode = "USD"  // Explicitly set to US Dollars
        
        
    }


   
    
    @IBAction func sgAction(_ sender: Any) {
        calcTip()
    }
    
    @IBAction func billChanged(_ sender: Any) {
        calcTip()
    }
    
    func calcTip() {
        let billAmt = Double(Bill.text ?? "0.0") ?? 0.0
        let selectedIndex = tip_percent.selectedSegmentIndex
        let tip_percent = tips[selectedIndex]
        let tip = billAmt * tip_percent
        let total = billAmt + tip
        let total_str = numFormatter .string(for: total) ??  ""
        result.text = "Total: \(total_str) "
        
    }
}

