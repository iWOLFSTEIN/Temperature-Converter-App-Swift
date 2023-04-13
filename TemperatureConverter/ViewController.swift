//
//  ViewController.swift
//  ViewsAndFrames
//
//  Created by BrainX Technologies on 13/04/2023.
//

import UIKit


enum Mode {
    case CF, FC
}

class ViewController: UIViewController {

    @IBOutlet weak var tempField: UITextField!
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var convertButton: UIButton!
    
    var appMode: Mode = .CF
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.cornerRadius = 10
        switchButton.layer.cornerRadius = 10
        containerView.subviews[2].layer.cornerRadius = 10
        convertButton.layer.cornerRadius = 10
        
        
        convertButton.titleLabel?.textColor = .black
        switchButton.titleLabel?.textColor = .black
        
        
        tempField.delegate = self
        tempField.keyboardType = UIKeyboardType.numberPad
        
        
    }

    
    @IBAction func switchMode(_ sender: UIButton) {
        
        let tLabel: UILabel = containerView.subviews[1] as! UILabel
        tempField.text = ""
        
        if appMode == .CF {
            headingLabel.text = "Farenheit to Celcius"
            tempField.placeholder = "Temperature in Farenheit"
            tLabel.text = "Temperature in Celcius"
            switchButton.setTitle("Celcius to Farenheit", for: UIControl.State.normal)
            appMode = .FC
            answerLabel.text = "0 C"
        }
        else {
            headingLabel.text = "Celcius to Farenheit"
            tempField.placeholder = "Temperature in Celcius"
            tLabel.text = "Temperature in Farenheit"
            switchButton.setTitle("Farenheit to Celcius", for: UIControl.State.normal)
            appMode = .CF
            answerLabel.text = "0 F"
        }
        
    }
    @IBAction func convert(_ sender: UIButton) {
        
        if let text = tempField.text {
            if !text.isEmpty{
                let tempInNumber = Float(text)
                
                if appMode == .CF{
                    let calcTemp = ( tempInNumber! * ( 9 / 5 )) + 32
                    answerLabel.text = String(format: "%.1f",calcTemp) + " F"
                }
                else {
                    let calcTemp = ( tempInNumber! - 32 ) * (5.0/9.0)
                    answerLabel.text = String(format: "%.1f",calcTemp) + " C"
                }
               
             
            }
        }
    }
    
}

extension ViewController: UITextFieldDelegate{
    
}
