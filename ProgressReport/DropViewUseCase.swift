//
//  DropViewUseCase.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/22.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Foundation

protocol DropUsecaseProtocol {
    func postTextFile(_ : String)
}

class DropViewUseCase{
    private let repository: DropViewRepository
    
    init() {
        self.repository = DropViewRepository()
    }
    
    func postTextFile(_ path: String) {
        var content: String = ""
        
        do {
            content = try String(contentsOfFile: path)
        } catch  {
            print("Path or File not found")
        }
        
        if (content != "") {
            repository.postProgressReport(addBoader(addBoader(content)))
        }
    }
    
    private func addBoader(_ content: String) -> String{
        return "```\(content)```"
    }
}
