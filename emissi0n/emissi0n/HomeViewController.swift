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


extension Calendar {
    static let gregorian = Calendar(identifier: .gregorian)
}

extension Date {
    func startOfWeek(using calendar: Calendar = .gregorian) -> Date {
        calendar.dateComponents([.calendar, .yearForWeekOfYear, .weekOfYear], from: self).date!
    }
}

class HomeViewController: UIViewController {
    
    @IBOutlet weak var datePicked: UIDatePicker!
    @IBOutlet weak var distanceTraveledInput: UITextField!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var emissionLabel: UILabel!
    @IBOutlet weak var avgEmissionLabel: UILabel!
    @IBOutlet weak var minEmissionLabel: UILabel!
    @IBOutlet weak var maxEmissionLabel: UILabel!
    @IBOutlet weak var recentEmissionText: UILabel!
    @IBOutlet weak var recentEmissionUnits: UILabel!
    
    
    var emissionArray = [Int]()
    var emissionTotal = 0
    var isHidden = true
    

    
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
        
        // hide recent emission until button is pressed
        recentEmissionText.isHidden = isHidden
        emissionLabel.isHidden = isHidden
        recentEmissionUnits.isHidden = isHidden
        
        
        
        populateWeeklyDashboard()
        
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
        
        // display recent emission
        isHidden = false
        recentEmissionText.isHidden = isHidden
        emissionLabel.isHidden = isHidden
        recentEmissionUnits.isHidden = isHidden
        
        
        print("Pressed Submit")
        
    }
    

    
    func populateWeeklyDashboard() {
        let currentUser = PFUser.current()!
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let yesterday = formatter.date(from: "2022/11/06")!
        
        let query = PFQuery(className:"vehicleEmission")
        query.whereKey("date", greaterThan: yesterday)
        
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) scores2.")
                // Do something with the found objects
                for object in objects {
                    let owner = object["owner"]!
                    let currentUserId = currentUser.objectId
                    let ownerId = (owner as AnyObject).objectId
                    let em = object["emission"] ?? "0"
                    let floatEm = Int(round(Float(String(describing: em))!))

                    // append emission if user is current user
                    if currentUserId == ownerId {
                        self.emissionArray.append(floatEm)
                        self.emissionTotal += floatEm
                    }
    

                }
                
                var avgEmission = 0
                if self.emissionArray.count != 0 {
                    avgEmission = self.emissionTotal / self.emissionArray.count
                }
                
                print(self.emissionArray)
                self.minEmissionLabel.text = String(self.emissionArray.min() ?? 0)
                self.maxEmissionLabel.text = String(self.emissionArray.max() ?? 0)
                self.avgEmissionLabel.text = String(avgEmission)
                

            }
            
        }
        
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
