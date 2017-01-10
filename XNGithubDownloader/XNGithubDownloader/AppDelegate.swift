//
//  AppDelegate.swift
//  XNGithubDownloader
//
//  Created by xuneng on 2016/12/30.
//  Copyright © 2016年 xn4545945. All rights reserved.
//

import Cocoa
import KeyHolder
import Magnet


let HOTKEY_SHOW = "KeyHolderShow"


@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    static var mainWindow:MainWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        //主窗口
        //mainWindow.window?.hidesOnDeactivate = true
        AppDelegate.mainWindow = MainWindow()   //主窗口
        AppDelegate.mainWindow.window?.makeKeyAndOrderFront(nil)
        

        NSEvent.addGlobalMonitorForEvents(matching: .leftMouseDown) { (_) in
            if (AppDelegate.mainWindow.window?.isVisible)! {
                AppDelegate.mainWindow.close()
            }
        }
        
        //默认快捷键
        let keyCombo = KeyCombo(doubledCocoaModifiers: .command)
        HotKeyCenter.shared.unregisterHotKey(with: HOTKEY_SHOW)
        let hotKey = HotKey(identifier: HOTKEY_SHOW, keyCombo: keyCombo!, target: self, action: #selector(AppDelegate.hotkeyCalled))
        hotKey.register()
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
        HotKeyCenter.shared.unregisterAll()
    }

    
    //key
    func hotkeyCalled() {
        print("HotKey called!!!!")
        
        DispatchQueue.main.async {
            if (AppDelegate.mainWindow.window?.isVisible)! {
                AppDelegate.mainWindow.close()
            }else{
                AppDelegate.mainWindow.showWindow(nil)
            }
        }
        
    }
    
    
}



