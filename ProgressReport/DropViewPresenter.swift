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
    private weak var viewInput: DropViewInput?
    
    required init(viewInput: DropViewInput){
        self.viewInput = viewInput
    }
    
    func draggingEntered(_ entered: Bool) {
        viewInput?.setTextColor(entered ? NSColor.systemBlue : NSColor.windowFrameColor)
    }
}
