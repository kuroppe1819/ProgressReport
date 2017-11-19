//
//  DropViewRepository.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/23.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Foundation

protocol DropRepositoryProtocol {
    func postProgressReport(_ : String)
}

class DropViewRepository{
    private let httpClient: HttpClient?
    
    init(httpClient: HttpClient){
        self.httpClient = httpClient
    }
    
    func postProgressReport(_ comment: String){
        httpClient?.postProgressReport(SlackApi.addComentsFiles(comment: comment))
    }
}
