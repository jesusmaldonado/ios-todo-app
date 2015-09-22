//
//  FirstViewController.swift
//  todo app
//
//  Created by Jesús Maldonado on 9/20/15.
//  Copyright © 2015 Jesus Maldonado. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemToAdd.delegate = self
        if (!(NSUserDefaults.standardUserDefaults().objectForKey("array") != nil)) {
            let array = []
            NSUserDefaults.standardUserDefaults().setObject(array, forKey: "array")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet var itemToAdd: UITextField!
    
    @IBAction func addToStorage(sender: AnyObject) {
        var array = NSUserDefaults.standardUserDefaults().objectForKey("array") as AnyObject! as! Array<String>
        array.append(itemToAdd.text!)
        itemToAdd.text = nil
        NSUserDefaults.standardUserDefaults().setObject(array, forKey: "array")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        addToStorage(self)
        return true
    }
}

