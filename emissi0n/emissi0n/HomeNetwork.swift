import Foundation
import Alamofire

func getVehicleEmission(distance: Int, completion: @escaping (String) -> Void) {
    let apiKey = "Bearer ZPJKM20ZXW4FWJJGJ4TDV2GSCN6M"
    let url = URL(string: "https://beta3.api.climatiq.io/estimate")!
    let params: [String: Any] = [
        "emission_factor": ["activity_id":"passenger_vehicle-vehicle_type_car-fuel_source_na-engine_size_na-vehicle_age_na-vehicle_weight_na"],
        "parameters": ["distance": distance,
                       "distance_unit": "mi"]]

    let headers: HTTPHeaders = ["Content-Type": "application/json","authorization": apiKey]
    let configuration = URLSessionConfiguration.default
    configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
    let emissionJSON = AF.request("https://beta3.api.climatiq.io/estimate", method: .post, parameters: params as? Parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in switch response.result {
    case .success:
        if let json = response.value as? [String:Any] {
            
//            print(json)

            let emission = String(describing: json["co2e"]!)
            completion(emission)
//            return emission
        }
    case .failure(let error):
        print(error)
//        completion(.failure(error))
        }
    }
}



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


func getVehicleModel(modelId: String = "2b1d0cd5-59be-4010-83b3-b60c5e5342da") {
    
    // set url and API
    let url = URL(string: "https://www.carboninterface.com/api/v1/vehicle_makes/\(modelId)/vehicle_models")!
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
        
        let code = response as! HTTPURLResponse
        print("Code: \(code.statusCode)")
             
        guard let data = data else {return}
        let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
        
        print("data dictionary is \(dataDictionary)")

    }
    
    task.resume()
    
    
}

