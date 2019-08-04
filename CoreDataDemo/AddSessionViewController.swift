//
//  AddSessionViewController.swift
//  CoreData
//
//  Created by Matthew Dias on 8/4/19.
//  Copyright © 2019 Matthew Dias. All rights reserved.
//

import UIKit

class AddSessionViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var speakerField: UITextField!
    @IBOutlet weak var dateField: UITextField!

    let speakerPicker = UIPickerView()
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        speakerPicker.dataSource = self
        speakerPicker.delegate = self
        speakerField.inputView = speakerPicker
    
        dateField.inputView = datePicker
    }
    
    @IBAction func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        // TODO: add session to Core Data
        dismiss(animated: true, completion: nil)
    }

}

extension AddSessionViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // TODO: populate from Core Data
        return 1
    }

}

extension AddSessionViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "TODO: speakers from Core Data"
    }
    
}
