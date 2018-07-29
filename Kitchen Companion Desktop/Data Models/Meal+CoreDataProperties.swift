//  Meal+CoreDataProperties.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry  on 7/23/18.

//  Custom Tags vs. Smart Meal-Indexing: custom tags should be associated @ the RECIPE level instead of at the meal level? These tags can (almost?) entirely be generated using the data present in the recipe (such as metadata, ingredient list, etc.). Essentially, custom tags are an INDEX used to rapidly search & sort meals/recipes in the mealView.
//  Indexes can occur on many different pieces of information such as constituent INGREDIENTS ("fish" vs. "meat" vs. "poultry" vs. "vegetarian"); COOK TIME (can sort by meals that take less than X to cook); PRICE (once we have sufficient data backing ingredient prices; UTENSILS ("one pot" meals).
//      - In the recipe metadata, include a "tags" field for these kinds of things. When a recipe is created, index on the various options & store as BINARY in a file on the system (update the index as the app is being used, write to file just before the app terminates).
//      - These indexes will also help the AI scheduler for preparation of meals. 

import Foundation
import Cocoa
import CoreData

enum MealTypes: String {  // type of meal
    case Breakfast = "breakfast"
    case Lunch = "lunch"
    case Dinner = "dinner"
    case Dessert = "dessert"
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
    @NSManaged public var recipes: [Recipe]  // list of recipes (to-many relationship)
    
    // MARK: - Initializers
    
    convenience init(name: String) {
        let context = (NSApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Meal", in: context)!
        self.init(entity: entity, insertInto: context)  // insert object into context
        self.name = name
    }
    
}
