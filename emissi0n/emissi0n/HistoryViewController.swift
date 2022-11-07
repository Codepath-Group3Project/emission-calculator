//
//  HistoryViewController.swift
//  emissi0n
//
//  Created by Gulshan Meem on 11/6/22.
//

import UIKit
import Parse

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableVIew: UITableView!
    var emissions = [PFObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableVIew.delegate = self
        tableVIew.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let query = PFQuery(className:"vehicleEmission")
        query.includeKeys(["emission","distanceTraveled", "date"])
        
        query.findObjectsInBackground{(emissions, error) in
            if emissions != nil{
                self.emissions = emissions!
                self.tableVIew.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emissions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let emission = emissions[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell") as! HistoryTableViewCell
        
        //let em = emission["emission"] ?? "0"
        //if case let em != nil
       // {
       //   let em = "\(em)"
      //  }else{
       //     let em = "0"
       // }
        
        
        //print(em)
        //cell.date.text = emission
        //cell.distance.text = emission["distanceTraveled"] as? String
        //cell.emission.text = String(em)
        
        return cell
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
