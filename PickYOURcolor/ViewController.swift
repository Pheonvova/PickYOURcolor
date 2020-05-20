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
        


        //Adding "Done" Button to keyboard
        addDoneButtonTo(manualValueOfRed)
        addDoneButtonTo(manualValueOfGreen)
        addDoneButtonTo(ManualValueOfBlue)
        
        colorCreator()
        textfieldedit()
        changeValueInLabels()
        
    }
    
    //Format float ro string with 2 digits after dot
    private func sliderValueFormatter (valueFrom slider: UISlider) -> String {
        let color = String(format: "%.2f", slider.value)
        
        return color
    }
    
    //Changing value for values of colors in labels
    private func changeValueInLabels () {
        valueOfRed.text = sliderValueFormatter(valueFrom: sliderForRedColor)
        valueOfGreen.text = sliderValueFormatter(valueFrom: sliderForGreenColor)
        valueOfBlue.text = sliderValueFormatter(valueFrom: sliderForBlueColor)
    }
    
    //Creating colors from Float values
    func colorCreator(){
        colorScreen.backgroundColor = UIColor(red: CGFloat(sliderForRedColor.value),
                                              green: CGFloat(sliderForGreenColor.value),
                                              blue: CGFloat(sliderForBlueColor.value),
                                              alpha: 1)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider ) {
        switch sender.tag {
        case 0:
            valueOfRed.text = sliderValueFormatter(valueFrom: sliderForRedColor)
            manualValueOfRed.text = sliderValueFormatter(valueFrom: sliderForRedColor)
        case 1:
            valueOfGreen.text = sliderValueFormatter(valueFrom: sliderForRedColor)
            manualValueOfGreen.text = sliderValueFormatter(valueFrom: sliderForGreenColor)
        case 2:
            valueOfBlue.text = sliderValueFormatter(valueFrom: sliderForBlueColor)
            ManualValueOfBlue.text = sliderValueFormatter(valueFrom: sliderForBlueColor)
        default:
            break
        }
        colorCreator()
        
    }
    
    func textfieldedit () {
        manualValueOfRed.text = sliderValueFormatter(valueFrom: sliderForRedColor)
        manualValueOfGreen.text = sliderValueFormatter(valueFrom: sliderForGreenColor)
        ManualValueOfBlue.text = sliderValueFormatter(valueFrom: sliderForBlueColor)
    }
    
    func textFieldCheker (fieldToChek: UITextField)  {
        guard let inputText = fieldToChek.text, !inputText.isEmpty else {  return   }
        
        if let inputText = Float(inputText) {
            fieldToChek.text = String(inputText)
            
            switch fieldToChek.tag {
            case 0: sliderForRedColor.value = inputText
            case 1: sliderForGreenColor.value = inputText
            case 2: sliderForBlueColor.value = inputText
            default: break
            }
            
            colorCreator()
            changeValueInLabels()
        } else {
            fieldToChek.text = "!"
        }
    }
}

extension ViewController: UITextFieldDelegate {
    
    // Скрываем клавиатуру нажатием на "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Скрытие клавиатуры по тапу за пределами Text View
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // Скрывает клавиатуру, вызванную для любого объекта
    }
    
    func textFieldDidEndEditing(_ inputText: UITextField) {
        guard let text = inputText.text else {  return   }
        
        if let valueOfColor = Float(text) {
            
            switch inputText.tag {
            case 0: sliderForRedColor.value = valueOfColor
            case 1: sliderForGreenColor.value = valueOfColor
            case 2: sliderForBlueColor.value = valueOfColor
            default: break
            }
            
            colorCreator()
            changeValueInLabels()
        } else {
            inputText.text = ""
        }
    }
}


extension ViewController {

    
    
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let toolbarDone = UIToolbar()
        toolbarDone.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
        
        let flexibleDone = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                           target: nil,
                                           action: nil)
        
        toolbarDone.items = [doneButton, flexibleDone]
        
        
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

