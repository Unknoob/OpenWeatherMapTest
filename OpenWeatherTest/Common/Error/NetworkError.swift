//
//  NetworkError.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 18/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import Foundation

enum NetworkError: GenericError {
    
    case cfurlErrorUnknown
    case cfurlOrNSURLErrorCancelled
    case cfurlOrNSURLErrorTimedOut
    case cfurlOrNSURLErrorCannotFindHost
    case cfurlOrNSURLErrorCannotConnectToHost
    case cfurlOrNSURLErrorNetworkConnectionLost
    case cfurlOrNSURLErrorDNSLookupFailed
    case cfurlOrNSURLErrorNotConnectedToInternet
    case cfurlOrNSURLErrorBadServerResponse
    case cfurlErrorAppTransportSecurityRequiresSecureConnection
    case cfurlGenericError
    
    static func networkConnectionErrorContainThisCode(_ code: Int) -> Bool {
        return (-1022 ... -998).contains(code)
    }
    
    static func errorWithCode(_ code: Int) -> NetworkError {
        switch code {
        case -998:
            return .cfurlErrorUnknown
        case -999:
            return .cfurlOrNSURLErrorCancelled
        case -1001:
            return .cfurlOrNSURLErrorTimedOut
        case -1003:
            return .cfurlOrNSURLErrorCannotFindHost
        case -1004:
            return .cfurlOrNSURLErrorCannotConnectToHost
        case -1005:
            return .cfurlOrNSURLErrorNetworkConnectionLost
        case -1006:
            return .cfurlOrNSURLErrorDNSLookupFailed
        case -1009:
            return .cfurlOrNSURLErrorNotConnectedToInternet
        case -1011:
            return .cfurlOrNSURLErrorBadServerResponse
        case -1022:
            return .cfurlErrorAppTransportSecurityRequiresSecureConnection
        default:
            return .cfurlGenericError
        }
    }
    
    var message: String {
        switch self {
        case .cfurlOrNSURLErrorNetworkConnectionLost,
             .cfurlOrNSURLErrorNotConnectedToInternet:
            return "It doesn't look like you're connected to the internet."
        case .cfurlOrNSURLErrorTimedOut:
            return "It took way too long to load the information, make sure you're connected to the internet."
        default:
            return "An unexpected error occurred."
        }
    }
}
