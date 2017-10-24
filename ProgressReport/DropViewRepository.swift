//
//  DropViewRepository.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/23.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Foundation

class DropViewRepository{
    private let httpClient: HttpClient
    
    init(){
        self.httpClient = HttpClient()
    }
    
    func postProgressReport(_ comment: String){
        httpClient.postProgressReport(SlackApi.addComentsFiles(comment: comment))
    }
}
