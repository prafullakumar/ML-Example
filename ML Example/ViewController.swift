//
//  ViewController.swift
//  ML Example
//
//  Created by prafull kumar on 21/10/17.
//  Copyright © 2017 Prafulla. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {
    var mlModel: ProfitPredictor?
    @IBOutlet weak var profit: UILabel!
    @IBOutlet weak var marketing: UITextField!
    @IBOutlet weak var admin: UITextField!
    @IBOutlet weak var rnd: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // init model
        self.mlModel =  ProfitPredictor.init()
        profit.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func predict(_ sender: Any) {
        // fetch variable
        guard let marketingInv = marketing.text else {
            return
        }
        
        guard let adminInv = marketing.text else {
            return
        }
        
        guard let rndInv = marketing.text else {
            return
        }
        
        do {
            // create indupt data model
            let input = ProfitPredictorInput.init(R_D_Spend: Double(rndInv)!, Administration: Double(adminInv)!, Marketing_Spend: Double(marketingInv)!)
            
            // give input data model to your mlmodel
            let outData = try mlModel?.prediction(input: input)
            
            // fetch output result Done
            let result = outData?.Profit ?? 0
            profit.text = "total Profit: \(result)"
        } catch {
            print("failed to get data")
        }
        
    }
    
}

