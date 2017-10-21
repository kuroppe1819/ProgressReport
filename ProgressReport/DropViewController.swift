//
//  DropViewController.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/21.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Cocoa

protocol DropViewInput: class {
    func setTextColor(_: NSColor)
}

class DropViewController: NSViewController {
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var dropView: DropView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func setTextColor(_ color: NSColor){
        descriptionLabel.textColor = color
    }
}
