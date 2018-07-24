//  Recipe+CoreDataProperties.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry  on 7/23/18.

//  CoreData extension for Recipe persistence - stores only a unique ID for the recipe and a URL referencing where the underlying XML document can be found
//  The XML is used to construct the active object for use (it renders the ingredients & preparation/cooking instructions)

import Foundation
import CoreData

extension Recipe {

    @NSManaged public var id: Int16  // unique ID number used to reference recipe
    @NSManaged public var document: URL  // location of XML document backing recipe
    
    // MARK: - Initializers
    
    // MARK: - Fetch Logic
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Recipe> {
        return NSFetchRequest<Recipe>(entityName: "Recipe")
    }

}
