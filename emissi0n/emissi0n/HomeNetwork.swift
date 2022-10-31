import Foundation


func getVehicleMakes() {
    // set url and API
    let url = URL(string: "https://www.carboninterface.com/api/v1/vehicle_makes")!
    let apiKey = "DleF3nOyRZTHUA4imnUaXw"
    
    // make request object
    var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    
    // create session and task
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    
    let task = session.dataTask(with: request) { (data, response, error) in
         // This will run when the network request returns
         if let error = error {
                print(error.localizedDescription)
         }
        
//        let code = response as! HTTPURLResponse
//        print("Code: \(code.statusCode)")
             
        guard let data = data else {return}
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
        
        print("data dictionary is \(dataDictionary)")

    }
    
    task.resume()
    
}
