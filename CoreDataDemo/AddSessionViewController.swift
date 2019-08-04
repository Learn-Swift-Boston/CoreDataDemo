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

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        // TODO: add session to Core Data
        dismiss(animated: true, completion: nil)
    }

}
