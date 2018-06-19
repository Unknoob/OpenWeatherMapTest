//
//  NetworkManager.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Alamofire

public class NetworkManager {
    // MARK: - Attributes
    
    /// The base URL for the API calls.
    private static let kBaseURL: String = "https://api.openweathermap.org/data/2.5/"
    
    // MARK: - Instance Methods
    
    /// Makes a request to a specified endpoint.
    /// - Parameters:
    ///     - requestPath: The request path for the endpoint.
    ///     - parameters: The request parameters.
    ///     - httpMethod: The request HTTP method.
    ///     - completion: The completion closure.
    static func request(_ requestPath: String, parameters: JSONDictionary, httpMethod: Alamofire.HTTPMethod, completion: @escaping (_ result: Result<Data>) -> ()) {
        
        var completeParameters = parameters
        completeParameters["APPID"] = "a6fa1ca81c402a4e8562c64b02e50bb6"
        completeParameters["cnt"] = 50
        
        Alamofire.request(kBaseURL + requestPath, method: httpMethod, parameters: completeParameters).responseJSON { response in
            switch response.result {
            case .success:
                print("Request: \(String(describing: response.request))")
                print("Response: \(String(describing: response.response))")
                print("Result: \(response.result)")
                print("JSON: \(try! JSONSerialization.jsonObject(with: response.data!, options: .allowFragments))")
                
                if let statusCode = response.response?.statusCode, statusCode != 200 {
                    completion(.failure(NetworkError.errorWithCode(statusCode)))
                    return
                }
                
                completion(.success(response.data!))
                
            case .failure(let error):
                completion(.failure(NetworkError.errorWithCode(error.code)))
            }
        }
    }
    
}
