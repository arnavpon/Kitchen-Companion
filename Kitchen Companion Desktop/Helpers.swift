//  Helpers.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry on 7/24/18.

//  Helper methods

import Foundation
import Cocoa

func saveManagedObjectContext() -> Bool {
    guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
        return false
    }
    let managedObjectContext = appDelegate.persistentContainer.viewContext
    do {
        try managedObjectContext.save()
        print("Saved MOC!")
        return true
    } catch let error as NSError {
        print("[Helper] Could not save MOC - \(error.localizedDescription)")
    }
    return false
}

func fetchObjectsForEntity(named: String, filters: [String: NSObject]?) -> [NSManagedObject] {  // filters enable search by KVP (field: value)
    var fetchedObjects = [NSManagedObject]()  // init return object
    guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
        return fetchedObjects
    }
    let managedObjectContext = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSManagedObject>(entityName: named)
    if let searchParameters = filters {  // check for search parameters
        for (key, value) in searchParameters {
            let predicate = NSPredicate(format: "%K == %@", key, value)  // equality check
            request.predicate = predicate  // set predicate
            break  // only allow 1 search item for now
        }
    }
    do {
        fetchedObjects = try managedObjectContext.fetch(request)
    } catch let error as NSError {
        print("[Helper] Could not fetch objects from entity '\(named)' - \(error.localizedDescription)")
    }
    return fetchedObjects
}

func deleteAllObjectsForEntity(named: String) {
    guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
        return
    }
    let managedObjectContext = appDelegate.persistentContainer.viewContext
    let objects = fetchObjectsForEntity(named: named, filters: nil)
    var counter = 0
    for object in objects {
        managedObjectContext.delete(object)
        print("<Deleted Object>")
        counter += 1
    }
    print("Deleted \(counter) objects in total!")
}
