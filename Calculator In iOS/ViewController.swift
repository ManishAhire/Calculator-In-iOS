//
//  ViewController.swift
//  Calculator In iOS
//
//  Created by Manish Ahire on 22/01/22.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var lblResult: UILabel! {
        didSet {
            self.lblResult.text = ""
        }
    }
    
    //MARK: - Variables
    var fisrtNumber : Double = 0
    var secondNumber : Double = 0
    var selectedOperator : String = ""
   
    //MARK: - Button Pressed
    @IBAction func numberPressed(_ sender: UIButton) {
        lblResult.text! += String(sender.tag)
    }
    
    @IBAction func dotButtonPressed(_ sender: Any) {
        lblResult.text! += "."
    }
    
    @IBAction func operatonPressed(_ sender: UIButton) {
        
        guard let number = Double(lblResult.text ?? "0") else { return }
        
        switch sender.tag {
        case 0 : // =
            secondNumber = number
            calculation(selectedOperator)
        case 1: // +
            selectedOperator = "+"
            fisrtNumber = number
            lblResult.text = ""
        case 2: // -
            selectedOperator = "-"
            fisrtNumber = number
            lblResult.text = ""
        case 3: // X
            selectedOperator = "X"
            fisrtNumber = number
            lblResult.text = ""
        case 4: // ÷
            selectedOperator = "÷"
            fisrtNumber = number
            lblResult.text = ""
        case 5: // %
            selectedOperator = "%"
            fisrtNumber = number
            lblResult.text = ""
        default:
            clearCalculation()
        }
        
    }
    
    @IBAction func plusMinusButtonPressed(_ sender: Any) {
        guard let number = Double(lblResult.text ?? "0") else { return }
        
        switch number.sign {
        case .minus:
            lblResult.text = abs(number).clean
        case .plus:
            lblResult.text = "-" + abs(number).clean
        }
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        clearCalculation()
    }
}

//MARK: - Helper
fileprivate extension ViewController {
    
    func clearCalculation() {
        selectedOperator = ""
        fisrtNumber = 0
        secondNumber = 0
        lblResult.text = ""
    }
    
    func calculation(_ selectedOperator : String) {
        
        guard !selectedOperator.isEmpty else {
            lblResult.text = ""
            return
        }
        
        switch selectedOperator {
        case "+" :
            lblResult.text = (fisrtNumber + secondNumber).clean
        case "-" :
            lblResult.text = (fisrtNumber + secondNumber).clean
        case "X" :
            lblResult.text = (fisrtNumber + secondNumber).clean
        case "÷" :
            lblResult.text = (fisrtNumber + secondNumber).clean
        case "%" :
            lblResult.text = (fisrtNumber.truncatingRemainder(dividingBy: secondNumber)).clean
        default:
            break
        }
    }
}

//MARK: - Clean Double
// Here we remove the decimal if it is the decimal is equal to 0
// ex. 12.0 = 12
//     12.3 = 12.3
fileprivate extension Double {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
