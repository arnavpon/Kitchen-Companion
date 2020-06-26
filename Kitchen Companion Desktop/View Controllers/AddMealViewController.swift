//  AddMealViewController.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry  on 7/25/18.

//  View for adding new meals

import Cocoa

class AddMealViewController: NSViewController, NSTextFieldDelegate {
    
    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var saveMealButton: NSButton!
    
    var name: String = ""  // unique meal name
    
    // MARK: - ViewController Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        // dynamically generate checkboxes for type
        // dynamically generate checkboxes for genre
        // enable user to add their own types/genres for categorization?
        // enable user to define custom tags
    }
    
    // MARK: - TextField Delegate
    
    func controlTextDidChange(_ obj: Notification) {  // enable/disable save button
        name = nameTextField.stringValue.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).lowercased()  // store as all lowercase
        saveMealButton.isEnabled = (name.count > 0)
    }
    
    // MARK: - Button Actions
    
    @IBAction func saveMealButtonClicked(_ sender: Any) {
        let searchResults = fetchObjectsForEntity(named: Meal.EntityName, filters: ["name": name as NSObject])
        if (searchResults.count == 0) {  // make sure the meal name is unique
            if let vc = presentingViewController as? ScheduleViewController {  // insert into moc
                let _ = Meal(name: name)  // create meal object
                if (saveManagedObjectContext()) {  // save context
                    vc.updateMealList()  // refresh source for outlineView
                    vc.dismiss(self)  // dismiss modal window
                }
            }
        } else {  // provide feedback to user
            print("Meal name is NOT unique!")
        }
    }
    
}
