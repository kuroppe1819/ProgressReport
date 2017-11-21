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
    private let draggingEnteredSubject = Variable(false)
    private let enteredFileSubject = PublishSubject<NSDraggingInfo>()

    var draggingEntered: Observable<Bool> { return draggingEnteredSubject.asObservable() }
    var enteredFile: Observable<NSDraggingInfo> { return enteredFileSubject }

    required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        self.registerForDraggedTypes([NSPasteboard.PasteboardType.fileURL])
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
    }

    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        print("draggingEntered")
        draggingEnteredSubject.value = true
        return .copy
    }
    
    override func draggingExited(_ sender: NSDraggingInfo?) {
        print("draggingExited")
        draggingEnteredSubject.value = false
    }
    
    override func draggingEnded(_ sender: NSDraggingInfo) {
        print("draggingEnded")
        enteredFileSubject.onNext(sender)
        draggingEnteredSubject.value = false
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        print("performDragOperation")
        return true
    }
}
