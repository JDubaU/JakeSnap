//
//  LoginViewController.swift
//  JakeSnap
//
//  Created by Jake Wojtas on 4/22/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//
/* TO DO LIST
✅
*/

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var jakeSnapLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var snapOnButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func snapOnButton(_ sender: AnyObject?) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("User tried to sign in")
            if error != nil {
                let alert = UIAlertController(title: "Incorrect Username or Password", message: "If you do not have an account yet, please press the Sign Up Button to create an account", preferredStyle: .actionSheet)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
                    (alert:UIAlertAction!) in
                }))
                self.present(alert, animated: true, completion: nil)
        
            } else {
                print("Sign in successful")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
                }
            })
        }
    
    @IBAction func signUpButton(_ sender: Any) {
        performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
    
    @IBAction func usernameEnter(_ sender: Any) {
        emailTextField.resignFirstResponder()
        passwordTextField.becomeFirstResponder()
    }
    
    @IBAction func passwordEnter(_ sender: Any) {
        self.snapOnButton(nil)
    }
    
    
/*
 print("We have an error! :\(error)")
 FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
 print("We tried to create a user")
 
 if error != nil {
 print("Error during user creation :\(error)")
 } else {
 let alert = UIAlertController(title: "Sign Up", message: "It seems that you do not have an account registered under this email. Please press the Sign Up Button to create an account", preferredStyle: UIAlertControllerStyle.alert)
 alert.addAction(UIAlertAction(title: "Sign Up", style: UIAlertActionStyle.default, handler: nil))
 self.present(alert, animated: true, completion: nil)
 }
 })
*/
 

}
