//
//  ViewController.swift
//  BetaHubs
//
//  Created by Lobna on 9/27/18.
//  Copyright © 2018 Lobna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    @IBOutlet weak var warningText: UITextView!
    
    @IBOutlet weak var login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard (_:)))
        
        self.view.addGestureRecognizer(tapGesture)
        
        warningText.isUserInteractionEnabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if ((UserDefaults.standard.bool(forKey: "isLogged")) == true){
            navigate(flag: false)
        }
        login.isEnabled = false
    }

    var counter = 1
    var timer = Timer()
    
    @IBAction func loginAction(_ sender: UIButton) {
        
        let email = emailText.text
        //let name = email?.components(separatedBy: "@")
        let password = passwordText.text
        
        if(counter == 3){
            timer = Timer.scheduledTimer(timeInterval: 0, target: self, selector: (#selector(ViewController.disableButton)), userInfo: nil, repeats: false)
            warningText.text = "You entered email and password 3 times wrong wait for 60 sec"
            counter = 1
        }else{
            if(email == "lobna@mostafa.com" && password == "123456"){
                counter = 1
                UserDefaults.standard.set(true, forKey: "isLogged")
                //UserDefaults.standard.set(name, forKey: "username")
                UserDefaults.standard.synchronize()
                
                navigate(flag: true)
                
            }else{
                warningText.text = "You Entered a wrong email or password"
                counter += 1
            }
        }
    }
    
    @IBAction func emailEdited(_ sender: UITextField) {
        let Count = passwordText.text?.characters.count
        
        if(isVaildEmail(testStr: emailText.text!) && Count! >= 6){
            enableButton()
        }else{
            warningText.text = "Invalid email or password"
            login.isEnabled = false
        }
    }
    
    @IBAction func passwordEdited(_ sender: UITextField) {
        let Count = passwordText.text?.characters.count
        
        if(isVaildEmail(testStr: emailText.text!) && Count! >= 6){
            enableButton()
        }else{
            warningText.text = "Invalid email or password"
            login.isEnabled = false
        }
    }
    
    func navigate(flag : Bool){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let logoutView = storyboard.instantiateViewController(withIdentifier: "HomePageViewController")
        self.present(logoutView, animated: flag, completion: nil)
    }
    
    func dismissKeyboard (_ sender: UITapGestureRecognizer) {
        emailText.resignFirstResponder()
        passwordText.resignFirstResponder()
    }
    
    func isVaildEmail(testStr:String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailText = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        
        return emailText.evaluate(with:testStr)
    }
    
    func enableButton(){
        login.isEnabled = true
        warningText.text = ""
    }
    
    func disableButton(){
        login.isEnabled = false
        timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector: (#selector(ViewController.enableButton)), userInfo: nil, repeats: false)
    }
}

