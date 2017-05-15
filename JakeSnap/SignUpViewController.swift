//
//  SignUpViewController.swift
//  JakeSnap
//
//  Created by Jake Wojtas on 4/23/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var snappingButton: UIButton!
    @IBOutlet weak var backBarButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func snappingButton(_ sender: AnyObject?) {
        FIRAuth.auth()?.createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
            print("We tried to create a user")
            
            if error != nil {
                print("Error during user creation :\(error)")
                let alert = UIAlertController(title: "Invalid Input", message: "Email may already be registered or illegal characters used", preferredStyle: .actionSheet)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {
                    (alert:UIAlertAction!) in
                }))
                self.present(alert, animated: true, completion: nil)
                

            } else {
                self.performSegue(withIdentifier: "doneSignUpSegue", sender: nil)
            }
        })

    }
    
    
    @IBAction func usernameEnter(_ sender: Any) {
        emailTextField.resignFirstResponder()
        passwordTextField.becomeFirstResponder()
    }
    
    
    @IBAction func passwordEnter(_ sender: Any) {
        self.snappingButton(nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        navigationItem.backBarButtonItem = backItem 
    }
    
    @IBAction func barBackButton(_ sender: Any) {
        performSegue(withIdentifier: "signUpBackButton", sender: nil)
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
