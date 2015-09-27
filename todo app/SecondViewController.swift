//
//  SecondViewController.swift
//  todo app
//
//  Created by Jesús Maldonado on 9/20/15.
//  Copyright © 2015 Jesus Maldonado. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.allowsMultipleSelectionDuringEditing = false;
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        table.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arrayHasBeenSet = NSUserDefaults.standardUserDefaults().objectForKey("array")
        if (arrayHasBeenSet != nil) {
            let array = NSUserDefaults.standardUserDefaults().objectForKey("array") as AnyObject! as! Array<String>
            return array.count
        } else {
            return 0
        }
    }

    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        let array = NSUserDefaults.standardUserDefaults().objectForKey("array") as AnyObject! as! Array<String>
//
        cell.textLabel?.text = "\(array[indexPath.row])"
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        var array = NSUserDefaults.standardUserDefaults().objectForKey("array") as AnyObject! as! Array<String>
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            array.removeAtIndex(indexPath.row)
            tableView.beginUpdates()
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                NSUserDefaults.standardUserDefaults().setObject(array, forKey: "array")
            tableView.endUpdates()

        }

    
    }
    
    
    func deleteRowsAtIndexPaths(indexPaths: [NSIndexPath], withRowAnimation animation: UITableViewRowAnimation) {
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

