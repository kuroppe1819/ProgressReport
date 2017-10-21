//
//  DropView.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/21.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Cocoa

class DropView: NSView {
    private var presenter: DropPresenterProtocol?
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        self.registerForDraggedTypes([NSPasteboard.PasteboardType.fileURL])
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        print("draggingEntered")
        return .copy
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        print("draggingExited")
    }
    
    override func draggingEnded(_ sender: NSDraggingInfo) {
        print("draggingEnded")
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        print("performDragOperation")
        return true
    }
}
