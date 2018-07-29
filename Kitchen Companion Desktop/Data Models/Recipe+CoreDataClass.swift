//  Recipe+CoreDataClass.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry  on 7/23/18.

//  Build tags/indexes @ the RECIPE level rather than the meal level.
//  RECIPE INGREDIENTS: ingredients need to be a TYPE rather than a string.
//      - The OUTPUT of any recipe is an INGREDIENT
//      - Recipes should be able to take other recipes into their ingredient list (since their output is of type ingredient). Say a recipe needs a homemade red sauce. Then the ingredient definition can include a <Recipe> rather than a simpler ingredient, and the system should be able to accommodate.
//      - An obvious constraint would be that the steps of the ingredient that is a recipe would need to be completed BEFORE the ingredient is needed in the enclosing recipe!

//  DYNAMIC RECIPES: say we have a generic recipe such as pasta with red sauce, with only a couple of interchangeable elements (the vegetables to add). Instead of creating multiple recipes, leading to waste of space, what if we can create a more flexible recipe definition that allows definition of the core recipe with flexible components that can be altered based on the ingredients desired (one for squash/zucchini, one for frozen veggies, etc.)? Can it be built to automatically adjust the preparation instructions, recalculates an accurate preparation time, etc.

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
