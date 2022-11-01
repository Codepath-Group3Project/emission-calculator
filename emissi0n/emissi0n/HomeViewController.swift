// emissi0n
// HomeViewController.swift
// Created by Lucas Benda on  10/26/22 AT 10:50 AM.
// 
// Swift version  5.0
// Running on macOS 12.5


import UIKit
import Parse

class HomeViewController: UIViewController {

    @IBOutlet weak var datePicked: UIDatePicker!
    @IBOutlet weak var distanceTraveledInput: UITextField!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        getVehicleMakes()
        let currentUser = PFUser.current()
        makeLabel.text = currentUser?["make"] as! String
        modelLabel.text = currentUser?["model"] as! String
        yearLabel.text = currentUser?["year"] as! String
        
    }
    
    
    // what I need to create:
    // elements in storyboard
    // function on save button
    // 
    
    @IBAction func onEmissionSubmit(_ sender: Any) {
//        let date = datePicked.date
//        let distance = distanceTraveledInput.text!

        // calculate emission based on distance & vehicle
        print("Pressed Submit")
//        getVehicleModel()
        
        
        // create parse table for emissionsVehicle
//        let vehicleEmission = PFObject(className: "vehicleEmission")
//        vehicleEmission["userId"] =
//        vehicleEmission["vehicleId"] =
//        vehicleEmission["distance"] =
//        vehicleEmission["userId"] =
    
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
