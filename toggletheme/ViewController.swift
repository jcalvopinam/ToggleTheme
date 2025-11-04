//
//  ViewController.swift
//  toggletheme
//
//  Created by Juan Calvopina on 19/10/2018.
//  Copyright © 2018 Juan Calvopina. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // invoke to switch theme
        switchTheme()
        
        // Close the application
        NSApp.terminate(self)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    // Run the appleScript to switch the current theme.
    fileprivate func switchTheme() {
        let myAppleScript = "tell application \"System Events\" to tell appearance preferences to set dark mode to not dark mode"
        
        var error: NSDictionary?
        
        if let scriptObject = NSAppleScript(source: myAppleScript) {
            if let outputString = scriptObject.executeAndReturnError(&error).stringValue{
                print("changed: ", outputString)
            } else if (error != nil) {
                print("error: ", error?.description ?? "error")
            }
        }
    }

}

