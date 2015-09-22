//
//  SignInFormViewController.swift
//  cp-1-Dropbox
//
//  Created by Sebastian Drew on 9/20/15.
//  Copyright © 2015 los. All rights reserved.
//

import UIKit

class SignUpFormViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordStrengthLabel: UILabel!
    @IBOutlet weak var pwIndicatorOne: UIView!
    @IBOutlet weak var pwIndicatorTwo: UIView!
    @IBOutlet weak var pwIndicatorThree: UIView!
    @IBOutlet weak var pwIndicatorFour: UIView!
    @IBOutlet weak var createButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the view.
        
        firstNameField.delegate = self
        lastNameField.delegate = self
        emailField.delegate = self
        passwordField.delegate = self
        
        passwordStrengthLabel.text = ""
        passwordStrengthLabel.textColor = UIColor.redColor()
        
        createButton.enabled = false
        
    }
    
    @IBAction func passwordTypingChanged(sender: AnyObject) {
        
        // Password field logic courtesy of Stephanie, Lin, and Tim with some added modifications
        
        if passwordField.text?.characters.count == 0 {
            passwordStrengthLabel.text = ""
            pwIndicatorOne.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 0.902)
            pwIndicatorTwo.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 0.902)
            pwIndicatorThree.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 0.902)
            pwIndicatorFour.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 0.902)
            createButton.enabled = false
        }
        
        if passwordField.text?.characters.count > 0 {
            passwordStrengthLabel.text = "Weak"
            passwordStrengthLabel.textColor = UIColor.redColor()
            pwIndicatorOne.backgroundColor = UIColor.redColor()
            pwIndicatorTwo.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 0.902)
            pwIndicatorThree.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 0.902)
            pwIndicatorFour.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 0.902)
            createButton.enabled = true
        }
        
        if passwordField.text?.characters.count >= 4 {
            passwordStrengthLabel.text = "So-So"
            passwordStrengthLabel.textColor = UIColor.orangeColor()
            pwIndicatorTwo.backgroundColor = UIColor.orangeColor()
            pwIndicatorThree.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 0.902)
            pwIndicatorFour.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 0.902)
        }
        
        if passwordField.text?.characters.count >= 7 {
            passwordStrengthLabel.text = "Good"
            passwordStrengthLabel.textColor = UIColor(red: 0.973, green: 0.757, blue: 0.039, alpha: 1)
            pwIndicatorThree.backgroundColor = UIColor(red: 0.973, green: 0.757, blue: 0.039, alpha: 1)
            pwIndicatorFour.backgroundColor = UIColor(red: 0.902, green: 0.902, blue: 0.902, alpha: 1)
        }
        
        if passwordField.text?.characters.count >= 10 {
            passwordStrengthLabel.text = "Great"
            passwordStrengthLabel.textColor = UIColor(red: 0.114, green: 0.722, blue: 0, alpha: 1)
            pwIndicatorFour.backgroundColor = UIColor(red: 0.114, green: 0.722, blue: 0, alpha: 1)
        }
        
    }
    
    
    @IBAction func createButtonDidTouch(sender: AnyObject) {
        
        if firstNameField.text != "" && lastNameField.text != "" && emailField.text != "" && passwordField.text != "" {
        
        let alertController = UIAlertController(title: nil, message: "Before you can complete your registration, you must accept the Dropbox Terms of Service.", preferredStyle: .ActionSheet)
        
        
        let agreeAction = UIAlertAction(title: "I Agree", style: .Default) { (action) in
            // ...
            var agreeController:InitialSignInTabController
            
            agreeController = self.storyboard?.instantiateViewControllerWithIdentifier("InitialSignInTabController") as! InitialSignInTabController

            agreeController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            
            self.presentViewController(agreeController, animated: true, completion: nil)
            
        }
        
        alertController.addAction(agreeAction)
        
        let termsAction = UIAlertAction(title: "View Terms", style: .Default) { (action) in
            // ...
            
            var termsController: TermsViewController
            
            termsController = self.storyboard?.instantiateViewControllerWithIdentifier("TermsViewController") as! TermsViewController
            
            self.presentViewController(termsController, animated: true, completion: nil)
        
            }
        
            alertController.addAction(termsAction)
        
            self.presentViewController(alertController, animated: true) {
            // ...
            }
            
        } else {
                let alertController = UIAlertController(title: "Incomplete User Registration", message: "Please be sure to fill in all the fields before submitting.", preferredStyle: .Alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // ...
                }
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // ...
                }
            }

            
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
