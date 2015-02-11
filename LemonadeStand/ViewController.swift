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
    var iceCubesMixed = 0
    var lemonsMixed = 0
    
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
        lemonsMixed++
        refreshView()
    }
    @IBAction func addMixIceCubeButtonPressed(sender: AnyObject) {
        iceCubesMixed++
        refreshView()
    }
    @IBAction func subtractMixLemonButtonPressed(sender: AnyObject) {
        lemonsMixed--
        refreshView()
    }
    @IBAction func subtractMixIceCubeButtonPressed(sender: AnyObject) {
        iceCubesMixed--
        refreshView()
    }
    @IBAction func startDayButtonPressed(sender: AnyObject) {
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

