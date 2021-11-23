//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var operandsLabel: UILabel!
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var calculatorScrollView: UIScrollView!
    @IBOutlet weak var calculateStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialLabel()
        setInitialView()
    }

    func setInitialLabel() {
        operandsLabel.text = "0"
        operatorLabel.text = ""
    }
    
    func setInitialView() {
        calculateStackView.isHidden = true
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        operandsLabel.text = sender.currentTitle
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        operatorLabel.text = sender.currentTitle
    }
}
