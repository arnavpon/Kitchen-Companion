//  Recipe+CoreDataProperties.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry  on 7/23/18.

//  CoreData extension for Recipe persistence - stores only a unique ID for the recipe and a URL referencing where the underlying XML document can be found
//  The XML is used to construct the active object for use (it renders the ingredients & preparation/cooking instructions)

import Foundation
import Cocoa
import CoreData

extension Recipe {
    
    @NSManaged public var identifier: String  // must be unique WITHIN THE MEAL'S CONTEXT
    @NSManaged public var meal: Meal  // reference to parent meal (to-one relationship)
    @NSManaged public var document: URL  // location of XML document backing recipe
    
    // MARK: - Initializers
    
    convenience init(id: String, meal: Meal) {  // init with parent meal
        let context = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Recipe", in: context)!
        self.init(entity: entity, insertInto: context)  // insert object into context
        self.identifier = id
        self.meal = meal
    }

}
