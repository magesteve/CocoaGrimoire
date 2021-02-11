//
//  GrimoireViewController.swift
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

// MARK: - GrimoireViewController Class

class GrimoireViewController: NSViewController, SlamTaskBossProtocol  {

    // MARK: - SlamTaskAppProtocol Requirement
    
    var listTasks = SlamTaskList()

   // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Setup Tasks
        
        add(task:SlamTask(title: "savetext", action: { info in
            CocoaSpellBook.saveFile(string: "This is a test of CocoaGrimoire.")
        }))
        add(task:SlamTask(title: "opentext", action: { info in
            CocoaSpellBook.openFileString() { result in
                CocoaSpellBook.standardMessage("The file you selected has \(result.count) characters in it.", iconName:NSImage.infoName)
            }
        }))
    }
    
}

