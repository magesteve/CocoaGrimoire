//
//  AppDelegate.swift
//  CocoaGrimoire
//
//  Created by Steve Sheets on 2/11/21.
//

import Foundation
import Cocoa
import SwiftSpellBook
import CocoaSpellBook
import SlamTaskSpellBook
import PreferencesSpellBook

// MARK: - AppDelegate Class

@main
class AppDelegate: NSObject, SlamTaskAppProtocol {
    
    // MARK: - SlamTaskAppProtocol Requirement
    
    @IBAction func preferenceAction(_ sender: Any) {
        PreferencesItem.display()
    }

    // MARK: - SlamTaskAppProtocol Requirement
    
    var listTasks = SlamTaskList()

    // MARK: - Lifecycle
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // MARK: - Setup preference window
        
        if let vc = NSStoryboard.main?.instantiateController(withIdentifier: "general") as? NSViewController {
            PreferencesItem.addItem(ident: "general", title: "General", imageName: NSImage.actionTemplateName, viewController: vc, width: 300, height: 200)
        }

        if let vc = NSStoryboard.main?.instantiateController(withIdentifier: "sound") as? NSViewController {
            PreferencesItem.addItem(ident: "sound", title: "Sound", imageName: NSImage.computerName, viewController: vc, width: 400, height: 300)
        }

        // MARK: - Setup Tasks
        
        add(task:SlamTask(title: "web", action: { info in
            CocoaSpellBook.openURL(info.word)
        }))

    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }

}

