import Foundation

func getVehiclesMake() {
    let url = URL(string: "https://www.carboninterface.com/api/v1/vehicle_makes")!
    let apiKey = "DleF3nOyRZTHUA4imnUaXw"
    var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
    request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
    let task = session.dataTask(with: request) { (data, response, error) in
         // This will run when the network request returns
         if let error = error {
                print(error.localizedDescription)
         }
        
        let code = response as! HTTPURLResponse
             
        print("Code: \(code.statusCode)")
             
                
        guard let data = data else {return}
//        do {
//            let decoder = Decoder()
//            let jsonResponse = try decoder.decode(data, from:data)
//            print(jsonResponse)
//        }
        
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]

             print("data dictionary is \(dataDictionary)")

                    
                // TODO: Get the array of movies
                // TODO: Store the movies in a property to use elsewhere
                // TODO: Reload your table view data

//         }
    }
    
    task.resume()
    
}

