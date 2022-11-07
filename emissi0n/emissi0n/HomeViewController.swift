// emissi0n
// HomeViewController.swift
// Created by Lucas Benda on  10/26/22 AT 10:50 AM.
// 
// Swift version  5.0
// Running on macOS 12.5


import UIKit
import Parse
import AlamofireImage
import SwiftUI


class HomeViewController: UIViewController {
    
    @IBOutlet weak var datePicked: UIDatePicker!
    @IBOutlet weak var distanceTraveledInput: UITextField!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var emissionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let myColor = Color.ourGreen
        distanceTraveledInput.layer.borderColor = myColor.cgColor
        distanceTraveledInput.layer.borderWidth = 1.25
        distanceTraveledInput.layer.cornerRadius = 10
        
        let currentUser = PFUser.current()
        makeLabel.text = currentUser?["make"] as! String
        modelLabel.text = currentUser?["model"] as! String
        yearLabel.text = currentUser?["year"] as! String
        
    }
    
    @IBAction func onEmissionSubmit(_ sender: Any) {
        let date = datePicked.date
        
        // calculate emission based on distance & vehicle
        let distance = Int(distanceTraveledInput.text ?? "0") ?? 0
        
        getVehicleEmission(distance: distance) { emission in
            print("Emission is \(emission)")
            let emission = Int(round(Float(emission) ?? 0))
            
            self.emissionLabel.text = String(emission)
            
            
            // save emission event to parse database
            let vehicleEmission = PFObject(className: "vehicleEmission")
            vehicleEmission["owner"] = PFUser.current()
            vehicleEmission["emission"] = String(emission)
            vehicleEmission["distanceTraveled"] = distance
            vehicleEmission["date"] = date
            
            vehicleEmission.saveInBackground{ (succeeded, error) in
                if (succeeded) {
                    print("Vehicle emission saved")
                } else {
                    print("Object not saved")
                }
            }
            
        }
        distanceTraveledInput.text = ""
        
        print("Pressed Submit")
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController = main.instantiateViewController(identifier: "SignInViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = signInViewController
    }
}
