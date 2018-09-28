//
//  HomePageViewController.swift
//  BetaHubs
//
//  Created by Lobna on 9/27/18.
//  Copyright © 2018 Lobna. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var vc = ViewController()
    
//    override func viewDidAppear(_ animated: Bool) {
//        if let x = UserDefaults.standard.object(forKey: "username") as? String
//        {
//            welcomeLabel.text = "Welcome \(x)"
//        }
//        
//    }
    
    @IBAction func logout(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "isLogged")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let logoutView = storyboard.instantiateViewController(withIdentifier: "ViewController")
        self.present(logoutView, animated: true, completion: nil)
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
