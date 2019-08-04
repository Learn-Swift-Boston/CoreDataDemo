//
//  AddSessionViewController.swift
//  CoreData
//
//  Created by Matthew Dias on 8/4/19.
//  Copyright © 2019 Matthew Dias. All rights reserved.
//

import UIKit
import CoreData

class AddSessionViewController: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var speakerField: UITextField!
    @IBOutlet weak var dateField: UITextField!

    let speakerPicker = UIPickerView()
    let datePicker = UIDatePicker()

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()

    private lazy var fetchedResultsController: NSFetchedResultsController<Speaker> = {
        let fetchRequest: NSFetchRequest<Speaker> = Speaker.fetchRequest()

        let sortDescriptor = NSSortDescriptor(keyPath: \Speaker.name, ascending: true)

        fetchRequest.sortDescriptors = [sortDescriptor]

        let fetchedResultsController = NSFetchedResultsController(
            fetchRequest: fetchRequest,
            managedObjectContext: DataStore.shared.managedObjectContext,
            sectionNameKeyPath: nil, // not using sections
            cacheName: nil // no need for caching
        )

        do {
            try fetchedResultsController.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Error fetching speakers: \(nserror), \(nserror.userInfo)")
        }
        return fetchedResultsController
    }()
    
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
        guard let title = titleField.text, !title.isEmpty else {
            let alert = UIAlertController(title: "Title can’t be empty", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        // TODO: add session to Core Data
        dismiss(animated: true, completion: nil)
    }

}

extension AddSessionViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }

}

extension AddSessionViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fetchedResultsController.fetchedObjects?[row].name
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        speakerField.text = fetchedResultsController.fetchedObjects?[row].name
    }
    
}
