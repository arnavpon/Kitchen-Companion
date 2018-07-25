//  Recipe+CoreDataClass.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry  on 7/23/18.

//

import Foundation
import CoreData

@objc(Recipe)
public class Recipe: NSManagedObject {
    
    static var EntityName = "Recipe" // reference to entity name
    
    var metadata: String?  // recipe metadata object - contains info like portionSize, ...
    var ingredients: [Ingredient] = []
    var preparationInstructions: [Instruction] = []
    var cookingInstructions: [Instruction] = []
    
    // MARK: - Initializers
    
    // MARK: - Instance Methods
    
    func scaleIngredientsForPortionSize(size: Int) {
        // scales ingredients using specified portionSize in metadata compared to desired size
    }
    
}
