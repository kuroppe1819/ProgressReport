//
//  HttpClient.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/23.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Foundation
import Alamofire

class HttpClient{
    func postProgressReport(_ api: Api){
        Alamofire.request(api.buildUrl, method: .post, parameters: api.parameters)
            .response{ response in
                print(response)
        }
    }
}
