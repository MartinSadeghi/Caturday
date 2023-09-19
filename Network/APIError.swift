//
//  APIError.swift
//  Caturday
//
//  Created by Mommo Sadeghi on 19/09/23.
//

import Foundation


enum APIError: Error, CustomStringConvertible {
    case badURLError
    case badResponseError(statusCode: Int)
    case urlError(URLError?)
    case parsingError(DecodingError?)
    case unknownError
    
    var localizedDescription: String {
        // showing error description to the user (User Feedback)
        
        switch self {
        case .badURLError, .parsingError, .unknownError:
            return "Sorry!, something went wrong"
        case .badResponseError(_):
            return "Sorry!, the connection to our server failed."
        case .urlError(let error):
            return error?.localizedDescription ?? "Something went wrong!"
        }
    }
    
    var description: String {
        // info for debugging
        switch self {
        case .badURLError:
            return "Invalid url."
        case .badResponseError(statusCode: let staatusCode):
            return "Bad response with status code \(staatusCode)"
        case .urlError(let error):
            return error?.localizedDescription ?? "URL session error"
        case .parsingError(let error):
            return "Parsing error \(error?.localizedDescription ?? "")"
        case .unknownError:
            return "Unknown error"
            
        }
    }
}
