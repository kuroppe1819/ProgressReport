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
    
    func postTextFile(_ path: String) {
        do {
            let content = try String(contentsOfFile: path)
            print("content: \(content)")
        } catch  {
            print("Path or File not found")
        }
        
        let env = ProcessInfo.processInfo.environment
        if let value = env["api_key"] {
            print(value)
        } else {
            // Environment variable not set (or not a string)
        }
    }
}
