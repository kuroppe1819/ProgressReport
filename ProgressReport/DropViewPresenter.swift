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
    func draggingEntered(_: Bool)
}

class DropViewPresenter: DropPresenterProtocol{
    private var dropUseCase: DropViewUseCase?
//    private weak var viewInput: DropViewInput?

//    required init(viewInput: DropViewInput){
//        self.viewInput = viewInput
//    }
    
    init(){
        self.dropUseCase = DropViewUseCase()
    }
    
    func draggingEntered(_ entered: Bool) {
//        viewInput?.setTextColor(entered ? NSColor.systemBlue : NSColor.windowFrameColor)
    }
    
    func draggingEnded(_ sender: NSDraggingInfo){
        guard let path = loadFilePath(sender) else {
            return
        }
        dropUseCase?.postTextFile(path)
    }
    
    private func loadFilePath(_ sender: NSDraggingInfo) -> String? {
        guard let board = sender.draggingPasteboard().propertyList(forType: NSPasteboard.PasteboardType(rawValue: "NSFilenamesPboardType")) as? [String],
            let path = board.first
            else {
                return nil
        }
        return path
    }}
