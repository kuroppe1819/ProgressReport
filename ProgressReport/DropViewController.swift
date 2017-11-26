//
//  DropViewController.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/21.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Cocoa

protocol DropViewInput: class {
    func draggingEnded(sender: NSDraggingInfo?)
}

class DropViewController: NSViewController {
    @IBOutlet weak var dropView: DropView!
    private var dropPresenter: DropViewPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        print("viewDidLoad")
        dropView.inject(dropViewInput: self)
    }

    func inject(dropPresenter: DropViewPresenter) {
        self.dropPresenter = dropPresenter
    }
}

extension DropViewController: DropViewInput {

    func draggingEnded(sender: NSDraggingInfo?) {
        dropPresenter?.draggingEnded(sender: sender)
    }
}
