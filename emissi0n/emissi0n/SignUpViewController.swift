// emissi0n
// SignUpViewController.swift
// Created by Lucas Benda on  10/26/22 AT 12:44 PM.
// 
// Swift version  5.0
// Running on macOS 12.5


import UIKit
import SwiftUI
import Parse

class SignUpViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var makeField: UITextField!
    @IBOutlet weak var modelField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var limitField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignUpButton(_ sender: Any) {
        
        
    }
    
    @IBAction func onSignInButton(_ sender: Any) {
        // open sign in page
        self.performSegue(withIdentifier: "signInSegue", sender: nil)
    }
    
    
    //    let user = PFUser()
//    user.username = usernameField.text
//    user.password = passwordField.text
//
//    user.signUpInBackground { (success, error) in
//        if success {
//            self.performSegue(withIdentifier: "loginSegue", sender: nil)
//        } else {
//            print("Error: \(String(describing: error?.localizedDescription))")
//        }
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
