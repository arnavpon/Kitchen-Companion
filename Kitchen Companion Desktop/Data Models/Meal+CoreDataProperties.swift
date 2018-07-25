//  Meal+CoreDataProperties.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry  on 7/23/18.

//

import Foundation
import Cocoa
import CoreData

enum MealTypes: Int {  // type of meal
    case Breakfast = 0, Lunch, Dinner, Snack
}

enum MealGenre: Int {  // genre of the cuisine
    case Italian = 0, Mexican, Indian, Greek, American
}

extension Meal {

    @NSManaged public var name: String
    @NSManaged public var type: NSNumber?  // rawValue for MealType enum object
    @NSManaged public var genre: NSNumber?  // rawValue for MealGenre enum object
    @NSManaged public var tags: [String]?  // customizable meal tags
    @NSManaged public var recipes: [Recipe]  // list of recipes (to-many relationship)
    
    // MARK: - Initializers
    
    convenience init(name: String) {
        let context = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Meal", in: context)!
        self.init(entity: entity, insertInto: context)  // insert object into context
        self.name = name
    }
    
}
