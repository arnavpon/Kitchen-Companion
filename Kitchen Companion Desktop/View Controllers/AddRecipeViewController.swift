//  AddRecipeViewController.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry on 7/25/18.

//  View for adding new recipes
//  User can add recipe in 4 ways:
//  (1) Enter data through a form, w/ metadata, ingredients, preparation, cooking
//  (2) Enter the URL where a recipe is found, system parses webpage to generate recipe & asks user to confirm that everything looks right
//  (3) Copy & paste text from webpage into system, which parses text
//  (4) [Late Stage] Automatically crawl web based on recipe name & pull recipes that match, enable users to accept or deny based on what they see. 

import Cocoa

class AddRecipeViewController: NSViewController {

    var senderViewController: ScheduleViewController?  // sender of segue
    
    // MARK: - ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}
