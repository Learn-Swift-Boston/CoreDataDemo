//
//  DataStore.swift
//  CoreDataDemo
//
//  Created by Zev Eisenberg on 8/4/19.
//  Copyright © 2019 Matthew Dias. All rights reserved.
//

import CoreData

class DataStore {

    // Note: having a shared/singleton data store isn't great practice, but it
    // simplifies a few things for this demo app. It is better to have a data
    // store at the top level of your app, such as in your App Delegate, and
    // then pass it down to objectst that need it. Passing the data store around
    // makes it much easier to test your classes by passing them a mock data
    // store, or a data store that does not save changes to disk.
    static var shared = DataStore()

    var managedObjectContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    private init() { }

    private lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it.
         */
        let container = NSPersistentContainer(name: "Demo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
