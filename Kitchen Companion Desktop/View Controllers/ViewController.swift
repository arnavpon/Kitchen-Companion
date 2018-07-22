//  ViewController.swift
//  Kitchen Companion Desktop
//  Created by Arnav Pondicherry on 7/15/18.

// Home Screen for application

// first flow is for menu planning
// 1) need a way to add/edit MEAL names & display in table view
// create repository of MEALS - a single meal can have multiple recipes to make it
// each meal name should be unique, e.g. "Garlic & Oil Pasta" w/ any number of recipes
// tag/categorize recipes based on type of cuisine
// need a data model for persistence - meal name, genre, reference to recipes (XML documents), portionSize (how long meal lasts normally in days)
// need a data object to store recipe

// 2) need a way to schedule meals for the week. needs to be flexible to accommodate variety of eating routines (breakfast + dinner, B/L/D, etc.) & time frames (does user schedule week by week, longer or shorter periods, etc).
// needs to understand user's meal habits. ask how many meals per day, which ones need assigning
// calendar, can assign meals to particular days of the week
// can set constraints (e.g. Friday is "Italian" day)
// user can auto-schedule meals (done based on constraints) or add recipe to a day themself
// attempts to maximize time between repetitions
// needs to understand how long given meal will last for

// 3) convert the menu for the week into a recipe -> grocery list -> mobile app companion
// need an underlying recipe XML format backing up the recipe name
// part 1 of XML document will be INGREDIENTS
// part 2 of XML document will be PREPARATION
// part 3 of XML document will be COOKING
// create a data object in code to back up XML? To enable recipe scaling based on # needed to feed.
// sync XML documents w/ iCloud
// need to use Cloud to hold grocery list & pull when user loads iPhone app

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

}
