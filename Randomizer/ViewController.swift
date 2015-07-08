//
//  ViewController.swift
//  Randomizer
//
//  Created by Bryce Young on 6/22/15.
//  Copyright © 2015 Bryce Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var myTableView: UITableView!
    var options: [String] = [String]()
    var numOfOptions: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numOfOptions
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomCell = tableView.dequeueReusableCellWithIdentifier("Cell") as! CustomCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            numOfOptions--
            myTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            
            self.myTableView.reloadData()
        }
    }
    
    @IBAction func addOption(sender: AnyObject) {
        numOfOptions = numOfOptions + 1
        self.myTableView.reloadData()
    }
    @IBAction func pickRandomOption(sender: AnyObject) {
        let num: UInt32 = UInt32(numOfOptions)
        let randomOptionNumber: Int = Int(arc4random_uniform(num))
        let indexPath = NSIndexPath(forRow: randomOptionNumber, inSection: 0)
        
        myTableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition:UITableViewScrollPosition.None)
    }

}

