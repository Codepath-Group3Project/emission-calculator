//
//  UpdateViewController.swift
//  emissi0n
//
//  Created by Gulshan Meem on 11/2/22.
//

import UIKit
import Parse
import SwiftUI

class UpdateViewController: UIViewController {

    @IBOutlet weak var newGoalInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myColor = Color.ourGreen
        newGoalInput.layer.borderColor = myColor.cgColor
        newGoalInput.layer.borderWidth = 1.25
        newGoalInput.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }
    

    @IBAction func toUpdateBtn(_ sender: Any) {
   
        
        if let currentUser = PFUser.current(){
            currentUser["goal"] = Int(newGoalInput.text ?? currentUser["goal"] as! String) ?? currentUser["goal"]
            //set other fields the same way....
            currentUser.saveInBackground()
            
        }
        dismiss(animated: false, completion: nil)
    }
    
    
    
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: false, completion: nil  )
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
