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
        
        let currentUser = PFUser.current()!
        let query = PFQuery(className:"vehicleEmission")
        query.whereKey("owner", equalTo: currentUser)
        query.includeKeys(["emission","distanceTraveled", "date"])
        query.order(byDescending: "date")
        
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
        
        // convert emission to float
        let em = emission["emission"] ?? "0"
        let floatEm = Int(round(Float(String(describing: em))!))
        
        
        // convert date to text
        let df = DateFormatter()
        df.dateFormat = "MM/dd/yyyy"
        let date = df.string(from: emission["date"] as! Date)
        
        // assign values to labels
        cell.date.text = date as! String
        cell.distance.text = String(describing: emission["distanceTraveled"] as! NSNumber) + " miles"
        cell.emission.text = String(describing: floatEm)
        
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

    @IBAction func onLogoutButton(_ sender: Any) {
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let signInViewController = main.instantiateViewController(identifier: "SignInViewController")
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene, let delegate = windowScene.delegate as? SceneDelegate else { return }
        
        delegate.window?.rootViewController = signInViewController
        
        
    }
}
