//  ViewController.swift
//  Kitchen Companion Mobile
//  Created by Arnav Pondicherry  on 7/15/18.

//  Mobile Counterpart for Kitchen Companion for phone & tablet. Core features include:
//  1) Grocery list, generated based on meal schedule for the week, and structured by grocery store > grocery aisle or section (e.g. produce vs. baking goods, etc.) so navigation is more logical and cost is controlled.
//      - Make it easy to REMOVE items from the list that are already present & don't need to be purchased (since the app can't know what's in your cupboard. Or can it? Based on what you previously purchased & the meals you have scheduled longitudinally, perhaps it can predict when you run out of various ingredients.)
//      - In order to structure appropriately, the app will need to learn where things are located in the grocery store. So in the beginning, we will need to tag items based on which aisle they are found in based on (1) AISLE in GROCERY STORE - e.g. baking goods are found in aisle X in SR vs. Harris Teeter; (2) SECTION - e.g. chocolate chips tend to be found in baking goods.

//  2) Pricing Comparison: goal is for app to crowdsource for users so that they know which stores to go to in order to find the cheapest products. User (optionally) inputs prices paid for the items on the grocery list during shopping. They can also input comparative prices for the same good at a competing grocery store. This way, a database can be built and updated constantly.
//      - Do we need to match to SPECIFIC grocery stores (e.g. the Harris Teeter @ this address). Prices must vary from place to place, no? Data can tell us this, but tag by address to start. Google Maps API to disambiguate?
//      - Store prices for products based on weight/volume. Don't ask user "How much did you pay for this item?" Ask how much was paid, weight of the item bought, & calculate BOTH a rate metric and an absolute metric (so we can get data on discounting for bulk purchases).
//      - Database Structure: SQL vs. NoSQL? More structured table & efficient lookup might be better here - entry includes timestamp, object's GENERIC name, BRAND name, a tag indicating category of the product (e.g. fruit for banana), ABSOLUTE price, weight/size, store name/address. Maybe consider having a picture of each item for image recognition training. Have lookup tables for stores, item names, weight measures, etc.
//      - How do we deal with generic products with tons of different individual varieties, such as bread? I can buy a packaged loaf (Arnold, whole wheat vs. white), a full baguette, rolls, etc. How do individuals report price for such variable items???
//      - Allow users to take a picture of a receipt in order to auto-populate the database? Can we get the appropriate rate metrics ($/weight) from the receipt alone?

//  3) Meal Preparation Scheduler: tells you what order to perform each step of the meal so that everything appears on the table at the same time, with minimal wastage. Particularly useful for meals with multiple components.
//      - To better understand process of scheduling, write out how you would schedule a meal on a piece of paper first. Schedule each component of the meal side-by-side indicating what starts when, taking into account passive & active (subdivided into fully vs. partially active) preparation times. Add a completion button so user can indicate when a specific step is complete. The scheduler should be flexible, so if the user is interrupted and cannot follow the procedure exactly, the system can accommodate.
//      - Will rely on a scheduling AI, which will need to learn what tasks require full attention (e.g. roasting garlic on high heat), moderate attention (something that just needs to be stirred every so often), no attention (set water to boil). We can input this to teach the system. Based on this information, the scheduler can accommodate multi-tasking vs. single tasking & create a PRIORITY listing.
//      - One obvious constraint - a portion of the meal (output ingredient that requires inputs from other ingredients) that is required for a later step must be scheduled before that step! System must know this and adjust accordingly.

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

