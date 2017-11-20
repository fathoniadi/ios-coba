//
//  ViewController.swift
//  change_view
//
//  Created by Fathoni Adi Kurniawan on 20/11/17.
//  Copyright © 2017 Fathoni Adi Kurniawan. All rights reserved.
//

import UIKit
import JWT
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
        let password = username_textfield.text
        
        if((username?.isEmpty)! || (password?.isEmpty)!)
        {
            let alert = UIAlertController(title: "Alert", message: "Username atau password tidak boleh kosong", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        let token = JWT.encode(claims: ["username": username, "password": password], algorithm: .hs256("secret".data(using: .utf8)!))
        
        self.session.set(token, forKey: "token")

        self.performSegue(withIdentifier: "dashboard_segue", sender: self)
    }
    

}

