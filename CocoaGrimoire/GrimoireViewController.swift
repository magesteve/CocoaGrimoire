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
import InspectorSpellBook

// MARK: - GrimoireViewController Class

class GrimoireViewController: NSViewController, SlamTaskBossProtocol  {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mainView: NSView!
    @IBOutlet weak var sideView: NSTabView!
    @IBOutlet weak var fileView: NSTabView!

    // MARK: - Variables
    
    var rightInspector: InspectorStruct?
    var leftInspector: InspectorStruct?


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
        add(task:SlamTask(title: "tapleft", action: { [weak self] info in
            guard let strongSelf = self, var inspector = strongSelf.leftInspector else { return }
            
            inspector.tap(ident: info.word)
        }))
        add(task:SlamTask(title: "tapright", action: { [weak self] info in
            guard let strongSelf = self, var inspector = strongSelf.rightInspector else { return }
            
            inspector.tap(ident: info.word)
        }))

        // MARK: - Setup Inspector
        
        rightInspector = InspectorStruct(viewController: self, mainView: self.mainView, sideView: sideView)
        
        if let vc = NSStoryboard.main?.instantiateController(withIdentifier: "details") as? NSViewController {
            rightInspector?.add(ident: "details", viewController: vc)
        }

        if let vc = NSStoryboard.main?.instantiateController(withIdentifier: "information") as? NSViewController {
            rightInspector?.add(ident: "information", viewController: vc)
        }

        if let vc = NSStoryboard.main?.instantiateController(withIdentifier: "developer") as? NSViewController {
            rightInspector?.add(ident: "developer", viewController: vc)
        }

        leftInspector = InspectorStruct(kind: .left, viewController: self, mainView: self.mainView, sideView: fileView)
        
        if let vc = NSStoryboard.main?.instantiateController(withIdentifier: "files") as? NSViewController {
            leftInspector?.add(ident: "files", viewController: vc)
        }

    }
    
}

