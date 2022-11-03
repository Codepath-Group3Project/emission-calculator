//
//  UpdateViewController.swift
//  emissi0n
//
//  Created by Gulshan Meem on 11/2/22.
//

import UIKit

class UpdateViewController: UIViewController {

    @IBOutlet weak var NewGoalTextField: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func toUpdateBtn(_ sender: Any) {
        //let query = PFQuery(className:"posts")
        dismiss(animated: true, completion: nil  )
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
