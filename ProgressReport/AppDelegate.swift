//
//  AppDelegate.swift
//  ProgressReport
//
//  Created by kuroppe on 2017/10/20.
//  Copyright © 2017年 kuroppe. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let dropViewController = DropBuilder().build()
        if let window = NSApplication.shared.mainWindow {
            window.contentViewController = dropViewController
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

