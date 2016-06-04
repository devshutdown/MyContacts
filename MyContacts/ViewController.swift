//
//  ViewController.swift
//  MyContacts
//
//  Created by Aaron Goodin on 6/4/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    @IBOutlet weak var fullname: UITextField!
    
    @IBOutlet weak var email: UITextField!

    @IBOutlet weak var phone: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    
    @IBOutlet weak var status: UILabel!
    
    
    @IBAction func btnSave(sender: UIButton) {
        
        if (contactdb != nil)
        {
            contactdb.setValue(fullname.text, forKey: "fullname")
            contactdb.setValue(email.text, forKey: "email")
            contactdb.setValue(phone.text, forKey: "phone")
        }
        else{
            let entityDescription =
                NSEntityDescription.entityForName("Contact", inManagedObjectContext: manangedObjectContext)
            
            let contact = Contact(entity:entityDescription!, insertIntoManagedObjectContext: manangedObjectContext)
            
            contact.fullname = fullname.text!
            contact.email = email.text!
            contact.phone = phone.text!
            
        }
        
        var error: NSError?
        do{
            try manangedObjectContext.save()
        } catch let error1 as NSError{
            error = error1
        }
        
        if let err = error{
            status.text = err.localizedFailureReason
        }
        else{
            self.dismissViewControllerAnimated(false, completion: nil)
        }
    }
    
    
    @IBAction func btnBack(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(false, completion: nil)
        
    }
    
    let manangedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    var contactdb:NSManagedObject!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if (contactdb != nil)
        {
            fullname.text = contactdb.valueForKey("fullname") as? String
            email.text = contactdb.valueForKey("email") as? String
            phone.text = contactdb.valueForKey("phone") as? String
            btnSave.setTitle("Update", forState: UIControlState.Normal)
        }
        
        fullname.becomeFirstResponder()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
  
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        if(touches.first as UITouch!) != nil{
            DismissKeyboard()
        }
    }
    
    func DismissKeyboard(){
        fullname.endEditing(true)
        email.endEditing(true)
        phone.endEditing(true)
    }


}

