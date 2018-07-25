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
    } catch let error as NSError {
        print("[Helper] Could not save MOC - \(error.localizedDescription)")
    }
    return false
}

func fetchObjectsForEntity(named: String) -> [NSManagedObject] {
    var fetchedObjects = [NSManagedObject]()  // init return object
    guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
        return fetchedObjects
    }
    let managedObjectContext = appDelegate.persistentContainer.viewContext
    let request = NSFetchRequest<NSManagedObject>(entityName: named)
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
    let objects = fetchObjectsForEntity(named: named)
    var counter = 0
    for object in objects {
        managedObjectContext.delete(object)
        print("<Deleted Object>")
        counter += 1
    }
    print("Deleted \(counter) objects in total!")
}
