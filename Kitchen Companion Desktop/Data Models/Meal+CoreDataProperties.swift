//  Meal+CoreDataProperties.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry  on 7/23/18.

//

import Foundation
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
    @NSManaged public var recipes: [Int]  // list of recipe ID numbers
    
    // MARK: - Initializers
    
    public convenience init(name: String, entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        self.init(entity: entity, insertInto: context)
        self.name = name
    }
    
    // MARK: - Fetch Logic
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

}
