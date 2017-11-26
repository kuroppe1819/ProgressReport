//
//  DropView.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/21.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Cocoa
import RxSwift
import RxCocoa

class DropView: NSView {
    @IBOutlet weak var descriptionLabel: NSTextField!
    private var dropViewInout: DropViewInput?
    
    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        self.registerForDraggedTypes([NSPasteboard.PasteboardType.fileURL])
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }

    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        print("draggingEntered")
        descriptionLabel.textColor = NSColor.systemBlue
        return .copy
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        print("draggingExited")
        descriptionLabel.textColor = NSColor.windowFrameColor
    }
    
    override func draggingEnded(_ sender: NSDraggingInfo) {
        print("draggingEnded")
        dropViewInout?.draggingEnded(sender: sender)
        descriptionLabel.textColor = NSColor.windowFrameColor
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        print("performDragOperation")
        return true
    }
    
    func inject(dropViewInput: DropViewInput) {
        self.dropViewInout = dropViewInput
    }
}
