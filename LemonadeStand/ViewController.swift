//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Matthew Linaberry on 2/11/15.
//  Copyright (c) 2015 Matthew Linaberry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cashLabel: UILabel!
    @IBOutlet weak var lemonsLabel: UILabel!
    @IBOutlet weak var iceCubesLabel: UILabel!
    
    @IBOutlet weak var lemonsPurchasedLabel: UILabel!
    @IBOutlet weak var iceCubesPurchasedLabel: UILabel!
    
    @IBOutlet weak var lemonsMixedLabel: UILabel!
    @IBOutlet weak var iceCubesMixedLabel: UILabel!
    var theSalesman = Salesman()
    var iceCubesPurchased = 0
    var lemonsPurchased = 0
    var iceCubesMixed = 0.0
    var lemonsMixed = 0.0
    
    var theLemonadeRatio:Double = 0.0
    
    let costOfLemon = 2
    let costOfIceCube = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addPurchaseLemonPressed(sender: AnyObject) {
        if theSalesman.cashOnHand >= costOfLemon {
            lemonsPurchased++
            theSalesman.lemonsOnHand++
            theSalesman.cashOnHand -= costOfLemon
        }
        else {
            // alert the user theyve got some money problems!
            showAlertWithText(message: "You don't have sufficient funds to buy a lemon!")
        }
        refreshView()
    }

    @IBAction func subtractLemonPurchaseButtonPressed(sender: AnyObject) {
        if lemonsPurchased > 0 {
            lemonsPurchased--
            theSalesman.lemonsOnHand--
            theSalesman.cashOnHand += costOfLemon
        }
        else {
            showAlertWithText( message: "You have not purchased any lemons!")
        }
        refreshView()
    }
    @IBAction func addPurchaseIceCubeButtonPressed(sender: AnyObject) {
        if theSalesman.cashOnHand >= costOfIceCube {
            iceCubesPurchased++
            theSalesman.iceCubesOnHand++
            theSalesman.cashOnHand -= costOfIceCube
        }
        else {
            showAlertWithText(message: "You don't have sufficient funds to buy an ice cube!")
        }
        refreshView()
    }
    
    @IBAction func subtractPurchaseIceCubeButtonPressed(sender: AnyObject) {
        if iceCubesPurchased > 0 {
            iceCubesPurchased--
            theSalesman.iceCubesOnHand--
            theSalesman.cashOnHand += costOfIceCube
        }
        else {
            showAlertWithText( message: "You have not purchased any ice cubes!")
        }
        refreshView()
    }
    
    @IBAction func addMixLemonButtonPressed(sender: AnyObject) {
        if theSalesman.lemonsOnHand >= 1 {
            lemonsMixed++
            theSalesman.lemonsOnHand--
        }
        else {
            showAlertWithText(header: "Alert", message: "You need to buy more lemons!")
        }
        refreshView()
    }
    @IBAction func addMixIceCubeButtonPressed(sender: AnyObject) {
        if theSalesman.iceCubesOnHand >= 1 {
            iceCubesMixed++
            theSalesman.iceCubesOnHand--
        }
        else {
            showAlertWithText(header: "Alert", message: "You need to buy more ice cubes!")
        }
        refreshView()
    }
    @IBAction func subtractMixLemonButtonPressed(sender: AnyObject) {
        if lemonsMixed > 0 {
            lemonsMixed--
            theSalesman.lemonsOnHand++
        }
        refreshView()
    }
    @IBAction func subtractMixIceCubeButtonPressed(sender: AnyObject) {
        if iceCubesMixed > 0 {
            iceCubesMixed--
            theSalesman.iceCubesOnHand++
        }
        refreshView()
    }
    @IBAction func startDayButtonPressed(sender: AnyObject) {
        if iceCubesMixed == 0  {
            showAlertWithText(header: "Attention!", message: "You must mix at least one ice cube!")
            return
        }
        calculateLemonadeRatio()
        // create a random number of customers for the day
        
//        Then, create a random taste preference(between 0 and 1) for each customer (hint, this should be a constant and you may want to use a type of loop to generate each preference).
//        For example, you might generate 5 customers for the day with preferences as such: 0.5, 0.7, 0.3, 0.4, 0.1
//        Then, you should compare your preferences to a range of values, as well as the current lemonade ratio to a separate range of values. Then see if they match. We are not comparing the ratios directly to each other! Ranges are shown in the steps below. So, what do we mean!? Here's a breakdown:
//        You should compare your randomly-generated customer's preferences to 3 different ranges from 0 to 1.
//        The three ranges are:
//        0 to 0.4 – favors acidic lemonade
//        0.4 to 0.6 – favors equal parts lemonade
//        0.6 to 1 – favors diluted lemonade
//        At the same time, you should be comparing your lemonade ratio to a different set of ranges.
//        Greater than 1 (Acidic Lemonade)
//        Equal to 1 (Equal Portioned Lemonade)
//        Less than 1 (Diluted Lemonade)
//        Here's where it will come together. I will spell out the first set of logic and hopefully you'll be able to do the rest.
//        For example, If customerPreference is Less than 0.4 AND lemonadeRatio is Greater than 1... Get paid a $1 and print out "Paid!"
//        This should read, If the customer likes acidic lemonade (between 0 – 0.4) and the lemonade is acidic (greater than 1) Get paid a dollar!
//        Follow this example for the next 2 comparison sets...
//        At the end, you'll want an else statement where they didn't want to buy your lemonade, so you will not be paid.
//        **You'll want to run through this logic for each customer you randomly generate.**
//        While you are comparing the preferences to these ranges, we want to see which customers are buying and which are not. So, write a println that will show
//        each customer’s generated preference value, and
//        whether or not they matched to the lemonade.
//        If they matched, print “Paid!”
//        If not, print “No match, No Revenue.”
        
        
        
    }
    
    func calculateLemonadeRatio() {
        theLemonadeRatio = (lemonsMixed / iceCubesMixed)
        println("The lemonade ratio is \(theLemonadeRatio)")
        
    }
    
    func refreshView() {
        cashLabel.text = "Cash: $\(theSalesman.cashOnHand)"
        iceCubesLabel.text = "Ice Cubes: \(theSalesman.iceCubesOnHand)"
        lemonsLabel.text = "Lemons: \(theSalesman.lemonsOnHand)"
        lemonsPurchasedLabel.text = "\(lemonsPurchased)"
        iceCubesPurchasedLabel.text = "\(iceCubesPurchased)"
        lemonsMixedLabel.text = "\(lemonsMixed)"
        iceCubesMixedLabel.text = "\(iceCubesMixed)"
    }
    
    func showAlertWithText (header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

