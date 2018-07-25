//  ScheduleViewController.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry on 7/21/18.

//  Displays the meal schedule for the current week
// Home Screen for application

// first flow is for menu planning
// 1) need a way to add/edit MEAL names & display in table view
// create repository of MEALS - a single meal can have multiple recipes to make it
// each meal name should be unique, e.g. "Garlic & Oil Pasta" w/ any number of linked recipes
// tag/categorize recipes based on type of cuisine
// Read up on how to user CoreData again, create Fetch & lookup methods
//  - how to handle recipe metadata w/ portionSize
//  - how to handle utensils (e.g. pots/pans required), in metadata?
// Meals are displayed in side bar along left side of home screen, where user can add/remove/edit
//  - First level in OutlineView is some sort of tag (type/genre) to categorize/sort meals
//  - Second level is list of meals of the specified tag type
//  - Third level is recipes linked to the specified meal

// 2) need a way to schedule meals for the week. needs to be flexible to accommodate variety of eating routines (breakfast + dinner, B/L/D, etc.) & time frames (does user schedule week by week, longer or shorter periods, etc).
// needs to understand user's meal habits. ask how many meals per day, which ones need assigning
// calendar, can assign meals to particular days of the week
// can set constraints (e.g. Friday is "Italian" day)
// user can auto-schedule meals (done based on constraints) or add recipe to a day themself
// attempts to maximize time between repetitions
// needs to understand how long given meal will last for

// 3) convert the menu for the week into a recipe -> grocery list -> mobile app companion
// need an underlying recipe XML format backing up the recipe name
// part 0 of XML document will be METADATA (info on portionSize, required utensils, etc.)
// part 1 of XML document will be INGREDIENTS
// part 2 of XML document will be PREPARATION (instructions)
// part 3 of XML document will be COOKING (instructions)
// create a data object in code to back up XML to enable recipe scaling based on # needed to feed.
// sync XML documents w/ iCloud (or use AWS for better control)
// need to use Cloud to hold grocery list & pull when user loads iPhone app (AWS)

import Cocoa

class ScheduleViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource {

    @IBOutlet weak var mealView: NSOutlineView!

    var meals: [Meal] = [Meal]()  // list of known meals
    
    // MARK: - ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Pull meals from persistent store to display when view opens:
        meals = fetchObjectsForEntity(named: "Meal") as! [Meal]
        mealView.reloadData()  // refresh UI
    }
    
    // MARK: - OutlineView Logic
    
    func outlineView(_ outlineView: NSOutlineView, numberOfChildrenOfItem item: Any?) -> Int {
        if let meal = item as? Meal {  // underneath meals, display linked recipes
            return meal.recipes.count
        }
        return meals.count  // default - return number of meals
    }
    
    func outlineView(_ outlineView: NSOutlineView, child index: Int, ofItem item: Any?) -> Any {
        if let meal = item as? Meal {
            return meal.recipes[index]  // return specified recipe
        }
        return meals[index]  // default - return meal itself
    }
    
    func outlineView(_ outlineView: NSOutlineView, isItemExpandable item: Any) -> Bool { // indicates whether item in OutlineView is collapsible/expandable
        // meals should be collapsible, as should the categorization method
        if let meal = item as? Meal {
            return meal.recipes.count > 0  // if there are recipes, enable dropdown
        }
        return false
    }
    
    func outlineView(_ outlineView: NSOutlineView, viewFor tableColumn: NSTableColumn?, item: Any) -> NSView? {
        var view: NSTableCellView?
        if let meal = item as? Meal {
            view = outlineView.makeView(withIdentifier: NSUserInterfaceItemIdentifier.init("MealCell"), owner: self) as? NSTableCellView
            if let textField = view?.textField {  // display the meal name
                textField.stringValue = meal.name
                textField.sizeToFit()
            }
        } else if let recipe = item as? Recipe {
            
        }
        return view
    }
    
    // MARK: - Button Actions
    
    @IBAction func addMealButton(_ sender: Any) {  // generate alert for user to add a new button
        meals.append(Meal(name: "New Meal @ \(Date())"))  // ***
        let _ = saveManagedObjectContext()
        mealView.reloadData()
    }
}
