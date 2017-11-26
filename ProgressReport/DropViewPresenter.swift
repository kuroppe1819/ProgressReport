//
//  DropViewPresenter.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/21.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Foundation
import Cocoa

protocol DropPresenterProtocol {
    func draggingEnded(sender: NSDraggingInfo?)
}

class DropViewPresenter: DropPresenterProtocol{
    private var dropUseCase: DropViewUseCase?
    
    init(dropUseCase: DropViewUseCase){
        self.dropUseCase = dropUseCase
    }
    
    func draggingEnded(sender: NSDraggingInfo?){
        guard let sender = sender, let path = loadFilePath(sender) else {
            print("not exist path")
            return
        }
        dropUseCase?.postTextFile(path: path)
    }
    
    private func loadFilePath(_ sender: NSDraggingInfo) -> String? {
        guard let board = sender.draggingPasteboard().propertyList(forType: NSPasteboard.PasteboardType(rawValue: "NSFilenamesPboardType")) as? [String],
            let path = board.first
            else {
                return nil
        }
        return path
    }}
