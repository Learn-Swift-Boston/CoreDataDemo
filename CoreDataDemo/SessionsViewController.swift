//
//  SessionsViewController.swift
//  CoreData
//
//  Created by Matthew Dias on 8/4/19.
//  Copyright © 2019 Matthew Dias. All rights reserved.
//

import UIKit
import CoreData

class SessionsViewController: UITableViewController {

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    private lazy var fetchedResultsController: NSFetchedResultsController<Session> = {
        let fetchRequest: NSFetchRequest<Session> = Session.fetchRequest()

        let sortDescriptor = NSSortDescriptor(keyPath: \Session.date, ascending: true)

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


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.fetchedObjects?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sessionCell", for: indexPath) as! SessionTableViewCell
        let session = fetchedResultsController.fetchedObjects?[indexPath.row]

        cell.titleLabel.text = session?.title
        cell.speakerLabel.text = session?.speaker?.name
        cell.dateLabel.text = session?.date.map(dateFormatter.string(from:))

        return cell
    }

}
