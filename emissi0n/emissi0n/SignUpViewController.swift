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
        let myColor = Color.ourGreen
        usernameField.layer.borderColor = myColor.cgColor
        passwordField.layer.borderColor = myColor.cgColor
        makeField.layer.borderColor = myColor.cgColor
        modelField.layer.borderColor = myColor.cgColor
        yearField.layer.borderColor = myColor.cgColor
        limitField.layer.borderColor = myColor.cgColor
        
        usernameField.layer.borderWidth = 1.25
        passwordField.layer.borderWidth = 1.25
        makeField.layer.borderWidth = 1.25
        modelField.layer.borderWidth = 1.25
        yearField.layer.borderWidth = 1.25
        limitField.layer.borderWidth = 1.25
        
        usernameField.layer.cornerRadius = 10
        passwordField.layer.cornerRadius = 10
        makeField.layer.cornerRadius = 10
        modelField.layer.cornerRadius = 10
        yearField.layer.cornerRadius = 10
        limitField.layer.cornerRadius = 10

    }
    
    
    @IBAction func onSignUpButton(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user["make"] = makeField.text
        user["model"] = modelField.text
        user["year"] = yearField.text
        user["goal"] = Int(limitField.text ?? "0") ?? 0

        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue2", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    @IBAction func onSignInButton(_ sender: Any) {
        // open sign in page
        self.performSegue(withIdentifier: "signInSegue", sender: nil)
    }
    
    
   
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
