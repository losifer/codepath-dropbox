//
//  SignInFormViewController.swift
//  cp-1-Dropbox
//
//  Created by Sebastian Drew on 9/21/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class SignInFormViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the view.
        
        emailField.delegate = self
        passwordField.delegate = self
        
        signInButton.enabled = false
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Detects when a user touches the screen and tells the keyboard to disappear when that happens
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    // Dismisses the keyboard when you press return (the bottom right key)
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if emailField.text == "" && passwordField.text == "" {
            
            
            self.signInButton.enabled = false
        }else {
            
            self.signInButton.enabled = true
        }
        
        return true
        
    }
    
    
    @IBAction func signInButtonDidTouch(sender: AnyObject) {
        
        if emailField.text != "" && passwordField.text != "" {
            
        var accountViewController:UserSignInTabController
        
        accountViewController = self.storyboard?.instantiateViewControllerWithIdentifier("UserSignInTabController") as! UserSignInTabController
        
        accountViewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        
        self.presentViewController(accountViewController, animated: true, completion: nil)
        
        } else {
            let alertController = UIAlertController(title: "Incorrect Login Info", message: "Your login or password is incorrect or empty, please try again.", preferredStyle: .Alert)
            
            let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // ...
            }
            alertController.addAction(OKAction)
            
            self.presentViewController(alertController, animated: true) {
                // ...
            }
        }
        
    }

    @IBAction func signOnTroubleButtonDidTouch(sender: AnyObject) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
            // ...
        }
        alertController.addAction(cancelAction)
        
        let OKAction = UIAlertAction(title: "Forgot Password?", style: .Default) { (action) in
            // ...
        }
        alertController.addAction(OKAction)
        
        let destroyAction = UIAlertAction(title: "Single Sign-On", style: .Default) { (action) in
            // ...
        }
        alertController.addAction(destroyAction)
        
        self.presentViewController(alertController, animated: true) {
            // ...
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
