//
//  AppDelegate.swift
//  CocoaGrimoire
//
//  Created by Steve Sheets on 2/11/21.
//

import Cocoa
import PreferencesSpellBook

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBAction func preferenceAction(_ sender: Any) {
        PreferencesItem.display()
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        // MARK: Setup preference window
        
        if let vc = NSStoryboard.main?.instantiateController(withIdentifier: "general") as? NSViewController {
            PreferencesItem.addItem(ident: "general", title: "General", imageName: NSImage.actionTemplateName, viewController: vc, width: 300, height: 200)
        }

        if let vc = NSStoryboard.main?.instantiateController(withIdentifier: "sound") as? NSViewController {
            PreferencesItem.addItem(ident: "sound", title: "Sound", imageName: NSImage.computerName, viewController: vc, width: 400, height: 300)
        }

    }

    func applicationWillTerminate(_ aNotification: Notification) {
    }

}

