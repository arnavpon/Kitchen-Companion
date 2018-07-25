//  Meal+CoreDataProperties.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry  on 7/23/18.

//

import Foundation
import Cocoa
import CoreData

enum MealTypes: String {  // type of meal
    case Breakfast = "breakfast"
    case Lunch = "lunch"
    case Dinner = "dinner"
    case Snack = "snack"
}

enum MealGenre: String {  // genre of the cuisine
    case Italian = "Italian"
    case Mexican = "Mexican"
    case Indian = "Indian"
    case Greek = "Greek"
    case American = "American"
}

extension Meal {

    @NSManaged public var name: String
    @NSManaged public var type: [String]?  // rawValue for MealType enum object
    @NSManaged public var genre: [String]?  // rawValue for MealGenre enum object
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
