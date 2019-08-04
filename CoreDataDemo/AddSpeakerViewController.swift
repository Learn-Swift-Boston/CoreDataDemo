//
//  AddSpeakerViewController.swift
//  CoreData
//
//  Created by Matthew Dias on 8/4/19.
//  Copyright © 2019 Matthew Dias. All rights reserved.
//

import UIKit

class AddSpeakerViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func cancelTapped() {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func addTapped(_ sender: Any) {
        // TODO: add name to Core Data
        dismiss(animated: true, completion: nil)
    }
}
