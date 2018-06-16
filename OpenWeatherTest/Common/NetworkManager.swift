//
//  NetworkManager.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 15/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation
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
    static func request(_ requestPath: String, parameters: JSONDictionary, parameterIsJSON: Bool, httpMethod: Alamofire.HTTPMethod, completion: @escaping (_ result: Result<JSONDictionary>) -> ()) {
        
        Alamofire.request(kBaseURL + requestPath, method: httpMethod).responseJSON { response in
            switch response.result {
            case .success:
                print("Request: \(String(describing: response.request))")   // original url request
                print("Response: \(String(describing: response.response))") // http url response
                print("Result: \(response.result)")
                
                if let json = response.result.value as? JSONDictionary {
                    print("JSON: \(json)") // serialized json response
                    completion(.success(json))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
