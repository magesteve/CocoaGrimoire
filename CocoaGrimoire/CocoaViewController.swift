//
//  CocoaViewController.swift
//  CocoaGrimoire
//
//  Created by Steve Sheets on 2/11/21.
//

import Cocoa
import SwiftSpellBook
import CocoaSpellBook

class CocoaViewController: NSViewController {

    @IBAction func buttonAction(_ sender: Any) {
        guard let button = sender as? NSButton else { return }
        
        switch button.tag {
        case 1:
            CocoaSpellBook.openURL("https://github.com/magesteve/CocoaSpellBook")
            
        case 2:
            CocoaSpellBook.saveFile(string: "This is a test of CocoaGrimoire.")
            
        case 3:
            CocoaSpellBook.openFileString(type: "TXT") { result in
                CocoaSpellBook.standardMessage("The file you selected has \(result.count) characters in it.", iconName:NSImage.infoName)
            }
            
        default:
            return
        }
    }
    
}

