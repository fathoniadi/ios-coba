//
//  ViewController.swift
//  change_view
//
//  Created by Fathoni Adi Kurniawan on 20/11/17.
//  Copyright © 2017 Fathoni Adi Kurniawan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var hello_label: UILabel!
    @IBOutlet weak var username_textfield: UITextField!
    @IBOutlet weak var password_textfield: UITextField!
    
    let session = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func setDefaultLabelText(_ sender: UIButton)
    {
        hello_label.text = "Hello"
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        let destination = segue.destination
            as! DashboardController
        //destination.labelText = "Arrived from Scene 1"
    }
    
    @IBAction func returned(segue: UIStoryboardSegue) {
        let username_log = session.string(forKey: "username")
        print(username_log as Any)
    }
    
    @IBAction func login_button(_ sender: UIButton) {
        let username = username_textfield.text
        let password = password_textfield.text
        
        self.session.set(username, forKey: "username")
        self.performSegue(withIdentifier: "dashboard_segue", sender: self)
    }
    

}

