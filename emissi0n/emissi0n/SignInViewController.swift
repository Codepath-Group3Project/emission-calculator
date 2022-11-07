// emissi0n
// SignInViewController.swift
// Created by Lucas Benda on  10/26/22 AT 10:49 AM.
// 
// Swift version  5.0
// Running on macOS 12.5


import UIKit
import Parse
import SwiftUI

class SignInViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let myColor = Color.ourGreen
        usernameField.layer.borderColor = myColor.cgColor
        passwordField.layer.borderColor = myColor.cgColor
        
        usernameField.layer.borderWidth = 1.25
        passwordField.layer.borderWidth = 1.25
        
        usernameField.layer.cornerRadius = 15
        passwordField.layer.cornerRadius = 15
        
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) {
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    
    @IBAction func onSignUp(_ sender: Any) {
        // open sign up page
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
//    @IBAction func onSignUp(_ sender: Any) {
//        // open sign up page
//        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}
