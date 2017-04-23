//
//  LoginViewController.swift
//  JakeSnap
//
//  Created by Jake Wojtas on 4/22/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//
/* TO DO LIST
 - Display message if user account has not been created yet
 - Display message if wrong username or password
*/

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var jakeSnapLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var snapOnButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func snapOnButton(_ sender: UIButton) {
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            print("User tried to sign in")
            if error != nil {
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
            } else {
                print("Sign in successful")
                self.performSegue(withIdentifier: "signInSegue", sender: nil)
                
            }
        })
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
