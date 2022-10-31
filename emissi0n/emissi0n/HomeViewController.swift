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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("View loaded")
        print("trying to get vehicle makes")
        
//        getVehicleMakes()
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
        getVehicleMakes()
        
        
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
