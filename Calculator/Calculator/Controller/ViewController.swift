//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialLabel()
    }

    func setInitialLabel() {
        operandsLabel.text = ""
        operatorLabel.text = ""
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        operandsLabel.text = sender.currentTitle
    }
    
    
}
