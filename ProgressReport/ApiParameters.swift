//
//  ApiParameters.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/24.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Foundation
import Alamofire

protocol Api {
    var buildUrl: URL { get }
    var parameters: [String: Any] { get }
}

enum SlackApi: Api{
    case addComentsFiles(comment: String)
    
    var baseUrl: String {
        return "https://slack.com/api/"
    }
    
    var path: String {
        switch self {
        case .addComentsFiles:
            return "files.comments.add"
        }
    }
    
    var buildUrl: URL {
        guard let url = URL(string: "\(baseUrl)\(path)") else {
            abort()
        }
        return url
    }
    
    var fileId: String{
        return "F7EUKKXGC"
    }
    
    var key: String{
        guard let key = ProcessInfo.processInfo.environment["api_key"] else {
            abort()
        }
        return key

    }
    
    var parameters: Parameters {
        var params = ["token" : key]
        switch self {
            case .addComentsFiles(comment: let comment):
                params["file"] = fileId
                params["comment"] = comment
                return params
        }
    }
}

