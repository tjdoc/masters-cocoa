//
//  ViewController.swift
//  MeasureApp
//
//  Created by Tae-Jin Oh on 2020/11/10.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var unitPicker: UIPickerView!
    var pickerData: [[String]] = [[String]]()

    override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
    }

    // number of columns in data
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          return pickerData[component][row]
    }

    // Capture the picker view selection
    var unit12 = ["inch", "inch"]
    internal func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            unit12[0] = pickerData[0][row]
        } else {
            unit12[1] = pickerData[1][row]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.unitPicker.delegate = self
        self.unitPicker.dataSource = self
        pickerData = [["inch", "yard", "ft", "mm", "cm", "m", "km"],
                      ["inch", "yard", "ft", "mm", "cm", "m", "km"]]
    }

    //MARK: action
    @IBAction func convertButton(_ sender: Any) {
        outputLabel.text = "\(unit12[0]), \(unit12[1])"
        let unitDict = ["inch": UnitLength.inches,
                        "yard": UnitLength.yards,
                        "ft"  : UnitLength.feet,
                        "mm"  : UnitLength.millimeters,
                        "cm"  : UnitLength.centimeters,
                        "m"   : UnitLength.meters,
                        "km"  : UnitLength.kilometers]
        let inputStr = inputField.text != nil && inputField.text != "" ? inputField.text! : "0"
        
        let convertedVal = Measurement(value:Double(inputStr)!,unit: unitDict[unit12[0]]!).converted(to: unitDict[unit12[1]]!).value
        outputLabel.text = "\(inputStr)\(unit12[0]) = \(convertedVal)\(unit12[1])"
    }
}

