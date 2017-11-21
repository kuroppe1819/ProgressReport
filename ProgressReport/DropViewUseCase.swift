//
//  DropViewUseCase.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/22.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Foundation

protocol DropUseCaseProtocol {
    func postTextFile(path: String)
}

class DropViewUseCase: DropUseCaseProtocol {
    private let dropRepository: DropViewRepository?

    init(dropRepository: DropViewRepository) {
        self.dropRepository = dropRepository
    }

    func postTextFile(path: String) {
        var content: String?

        do {
            content = try String(contentsOfFile: path)
        } catch {
            print("Path or File not found")
        }

        guard let comment = content else {
            return
        }
        dropRepository?.postProgressReport(addBoader(comment))
    }

    private func addBoader(_ content: String) -> String {
        return "```\(content)```"
    }

}
