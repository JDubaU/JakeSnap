//
//  SnapsViewController.swift
//  JakeSnap
//
//  Created by Jake Wojtas on 4/22/17.
//  Copyright © 2017 Jake Wojtas. All rights reserved.
//

import UIKit

class SnapsViewController: UIViewController {

    
    @IBOutlet weak var logOutBarButton: UIBarButtonItem!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutBarButton(_ sender: Any) {
        logOutBarButton.title = "Testing"
        performSegue(withIdentifier: "logOutSegue", sender: nil)
        //dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "addSnapSegue", sender: nil)
    }
    
    
   
    

}
