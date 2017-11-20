//
//  DashboardController.swift
//  change_view
//
//  Created by Fathoni Adi Kurniawan on 20/11/17.
//  Copyright © 2017 Fathoni Adi Kurniawan. All rights reserved.
//

import UIKit
import JWT

class DashboardController: UIViewController {

    let session = UserDefaults.standard
    
    @IBOutlet weak var hello_label: UILabel!
    @IBOutlet weak var username_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let token = self.session.string(forKey: "token")!
        do {
            let claims: ClaimSet = try JWT.decode(token, algorithm: .hs256("secret".data(using: .utf8)!))
            username_label.text = claims["username"] as? String
        } catch {
            self.performSegue(withIdentifier: "unWindToVC", sender: self)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exit_button(_ sender: UIButton)
    {
        let alertView = UIAlertController(title: "Exit?", message: "Are you sure, you want to exit?", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction (title: "Exit", style: .destructive ) { alertAction in
            let domain = Bundle.main.bundleIdentifier!
            UserDefaults.standard.removePersistentDomain(forName: domain)
            self.performSegue(withIdentifier: "unWindToVC", sender: self)
        }
        
        let cancelAction = UIAlertAction (title: "Cancel", style: .cancel ) {  alertAction in
            
        }
        
        alertView.addAction(deleteAction)
        alertView.addAction(cancelAction)
        
        self.present(alertView, animated: true, completion: nil)
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
