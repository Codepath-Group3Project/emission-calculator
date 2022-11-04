//
//  ProgressBarViewController.swift
//  emissi0n
//
//  Created by Gulshan Meem on 11/2/22.
//

import UIKit
import Parse

class ProgressBarViewController: UIViewController {

  
    let ProgressLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    var limit = 0
    var total = 0
        
    let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 36)
        return label
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = PFUser.current()!
        
        limit = currentUser["goal"] as! Int
        total = 300
            
        createCircularProgressBar(limit: CGFloat(limit),total: CGFloat(total))
    }
        
    func createCircularProgressBar(limit:CGFloat, total:CGFloat){
        let center =  view.center
        label.text = "\(Int(total)) \n out of \n \(Int(limit)) "
        label.sizeToFit()
        view.addSubview(label)
        label.center = center
            
            // create my track layer
            
            
        let circularPath = UIBezierPath(arcCenter: center, radius: 120, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        trackLayer.path = circularPath.cgPath
            
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 12
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        view.layer.addSublayer(trackLayer)
            
        ProgressLayer.path = circularPath.cgPath
            
        ProgressLayer.strokeColor = UIColor.green.cgColor
        ProgressLayer.lineWidth = 12
        ProgressLayer.fillColor = UIColor.clear.cgColor
        ProgressLayer.lineCap = CAShapeLayerLineCap.round
            
        ProgressLayer.strokeEnd = 0.7 - 0.13
            
        if (ProgressLayer.strokeEnd > 0.7 ){
            ProgressLayer.strokeColor = UIColor.red.cgColor
        } else if (ProgressLayer.strokeEnd > 0.5){
            ProgressLayer.strokeColor = UIColor.orange.cgColor
        }else if (ProgressLayer.strokeEnd > 0.4){
            ProgressLayer.strokeColor = UIColor.yellow.cgColor
        }
            
        view.layer.addSublayer(ProgressLayer)
            
    }
    
    @IBAction func updateButton(_ sender: Any) {
        self.performSegue(withIdentifier: "updateSegue", sender: nil)
    }
        
}
