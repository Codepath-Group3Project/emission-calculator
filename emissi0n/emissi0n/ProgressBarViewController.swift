//
//  ProgressBarViewController.swift
//  emissi0n
//
//  Created by Gulshan Meem on 11/2/22.
//

import UIKit
import Parse
import SwiftUI

class ProgressBarViewController: UIViewController {

    
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var limitLbl: UILabel!
    @IBOutlet weak var monthLbl: UILabel!
    
    let ProgressLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    var limit = 0.0
    var total = 0.0
    var totalEm = 0
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLimTotal()
        totalLbl.text = String(total)
        limitLbl.text = String(limit)
        let mytime = Date()
        let format = DateFormatter()
        format.timeStyle = .none
        format.dateStyle = .long
        let month = format.string(from: mytime)
        let firstWord = month.components(separatedBy: " ").first
        monthLbl.text = (firstWord!) // "What"
        
    }
    
    func getLimTotal(){
        
        let currentUser = PFUser.current()!
        limit = Double(currentUser["goal"] as! Int)
        
        let query = PFQuery(className:"vehicleEmission")
        query.whereKey("owner", equalTo: currentUser)
        
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) scores2.")
                // Do something with the found objects
                for object in objects {
                    
                    let em = object["emission"] ?? "0"
                    let floatEm = Int(round(Float(String(describing: em))!))
                    self.total += Double(floatEm)
                    self.totalEm += floatEm
                }
                
                self.limitLbl.text = String(self.limit)
                self.totalLbl.text = String(self.totalEm)
                self.createCircularProgressBar(limit: CGFloat(self.limit),total: CGFloat(self.total))
            }
            
        }
        print("PRIIIIIIIIIIIIIINTING TOTALLLLLLLLLLL")
        print (total)
        print(totalEm)

    }
        
    func createCircularProgressBar(limit:CGFloat, total:CGFloat){
        let center =  view.center
            
            // create my track layer
            
            
        let circularPath = UIBezierPath(arcCenter: center, radius: 120, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
            
        trackLayer.strokeColor = Color.chromeWhite.cgColor
        trackLayer.lineWidth = 12
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)
            
        ProgressLayer.path = circularPath.cgPath
            
        ProgressLayer.strokeColor = Color.ourGreen.cgColor
        ProgressLayer.lineWidth = 12
        ProgressLayer.fillColor = UIColor.clear.cgColor
        ProgressLayer.lineCap = CAShapeLayerLineCap.round
            
        ProgressLayer.strokeEnd = total/limit - 0.13
            
        if (ProgressLayer.strokeEnd > 0.7 ){
            ProgressLayer.strokeColor = Color.ourRed.cgColor
        } else if (ProgressLayer.strokeEnd > 0.5){
            ProgressLayer.strokeColor = Color.ourOrange.cgColor
        }else if (ProgressLayer.strokeEnd > 0.4){
            ProgressLayer.strokeColor = Color.ourYellow.cgColor
        }
            
        view.layer.addSublayer(ProgressLayer)
            
    }
    
    
    
    @IBAction func updateButton(_ sender: Any) {
        self.performSegue(withIdentifier: "updateSegue", sender: nil)
    }
    
    
    @IBAction func onLogoutButtotn(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController = main.instantiateViewController(identifier: "SignInViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = signInViewController
        
    }
    
}
