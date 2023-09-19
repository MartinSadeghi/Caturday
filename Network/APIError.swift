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
    case urlError(URLError)
    case parsingError
    case unknownError
    
    var localizedDescription: String {
        // showing error description to the user (User Feedback)
        ""
    }
    
    var description: String {
        // info for debugging
        ""
    }
}
