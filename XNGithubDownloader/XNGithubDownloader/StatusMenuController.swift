//
//  StatusMenuController.swift
//  XNGithubDownloader
//
//  Created by xuneng on 2017/1/1.
//  Copyright © 2017年 xn4545945. All rights reserved.
//

import Cocoa

class StatusMenuController : NSObject,PreferencesWindowDelegate{
    
//    var mainWindow:MainWindow!   //主窗口
    var aboutWindow:AboutWindow!
    var preferencesWindow:PreferencesWindow!   //设置窗口
    
    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    
    override func awakeFromNib() {
        
        let icon = NSImage(named: "github36")
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        
        
        preferencesWindow = PreferencesWindow()
        preferencesWindow.delegate = self
        
        
        aboutWindow = AboutWindow()
        //aboutWindow.window?.orderFront(nil)
        
    }
    
    @IBAction func openClicked(_ sender: Any) {
        
        AppDelegate.mainWindow.showWindow(nil)
        
    }
    
    @IBAction func openFolderClicked(_ sender: Any) {
        
        NSWorkspace.shared().activateFileViewerSelecting([URL(fileURLWithPath: "/Volumes/MAC/GitHub/XNGithubDownloader")])
        
    }
    
    @IBAction func quitClick(_ sender: Any) {
        
        NSApplication.shared().terminate(self)
        
    }
    
    @IBAction func aboutClicked(_ sender: Any) {
        aboutWindow.showWindow(nil)
        
    }
    
    
    @IBAction func preferencesClicked(_ sender: Any) {
        preferencesWindow.showWindow(nil)
    }
    
    
    // MARK: - PreferencesWindowDelegate
    func preferencesDidUpdate() {
        //
    }
    
}
