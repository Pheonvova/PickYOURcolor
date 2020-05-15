//
//  ViewController.swift
//  PickYOURcolor
//
//  Created by Pheon on 15.05.2020.
//  Copyright © 2020 Pheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var colorScreen: UIView!
    
    
    
    @IBOutlet var sliderForRedColor: UISlider!
    @IBOutlet var sliderForGreenColor: UISlider!
    @IBOutlet var sliderForBlueColor: UISlider!
    
    @IBOutlet var labelForRed: UILabel!
    @IBOutlet var labelForGreen: UILabel!
    @IBOutlet var labelForBlue: UILabel!
    
    
    @IBOutlet var valueOfRed: UILabel!
    @IBOutlet var valueOfGreen: UILabel!
    @IBOutlet var valueOfBlue: UILabel!
    
    
    @IBOutlet var manualValueOfRed: UITextField!
    @IBOutlet var manualValueOfGreen: UITextField!
    @IBOutlet var ManualValueOfBlue: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Sliders setup
        sliderForRedColor.minimumValue = 0
        sliderForGreenColor.minimumValue = 0
        sliderForBlueColor.minimumValue = 0
        
        sliderForRedColor.maximumValue = 1
        sliderForGreenColor.maximumValue = 1
        sliderForBlueColor.maximumValue = 1
        
        sliderForRedColor.minimumTrackTintColor = .red
        sliderForGreenColor.minimumTrackTintColor = .green
        sliderForBlueColor.minimumTrackTintColor = .blue
        
        //Labels setup
        labelForRed.textColor = .red
        labelForGreen.textColor = .green
        labelForBlue.textColor = .blue
        
        //Text fields setup
        manualValueOfRed.delegate = self
        manualValueOfGreen.delegate = self
        ManualValueOfBlue.delegate = self
        
        manualValueOfRed.keyboardType = .numberPad
        manualValueOfGreen.keyboardType = .numberPad
        ManualValueOfBlue.keyboardType = .numberPad
        
        
        
        let toolbar = UIToolbar()
        
        manualValueOfRed.inputAccessoryView  = UIView()
        manualValueOfGreen.inputAccessoryView = UIView()
        ManualValueOfBlue.inputAccessoryView = UIView()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done,
                                         target: self,
                                         action: #selector(self.doneClicked))
        toolbar.setItems([doneButton], animated: true)
        
        
        
    }
    
    @IBAction func sliderMoved(_ Sender: Any ) {
        let redValue = CGFloat(sliderForRedColor.value)
        let greenValue = CGFloat(sliderForGreenColor.value)
        let blueValue = CGFloat(sliderForBlueColor.value)
        
        colorScreen.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
        
        valueOfRed.text = String(format: "%.2f", sliderForRedColor.value)
        valueOfGreen.text = String(format: "%.2f", sliderForGreenColor.value)
        valueOfBlue.text = String(format: "%.2f", sliderForBlueColor.value)
        
        manualValueOfRed.text = String(format: "%.2f", sliderForRedColor.value)
        manualValueOfGreen.text = String(format: "%.2f", sliderForGreenColor.value)
        ManualValueOfBlue.text = String(format: "%.2f", sliderForBlueColor.value)
        
        
    }
    
    @IBAction func textFieldsAditingOrEnd(_ sender: Any) {
        

        
    }
    
    @objc func doneClicked(){
        view.endEditing(true)
    }
    
}



extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case manualValueOfRed:
            manualValueOfRed.resignFirstResponder()
        case manualValueOfGreen:
            manualValueOfGreen.resignFirstResponder()
        case ManualValueOfBlue:
            ManualValueOfBlue.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
    

}
