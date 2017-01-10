//
//  PreferencesWindow.swift
//
//  Created by xuneng on 2016/12/28.
//  Copyright © 2016年 xn4545945. All rights reserved.
//

import Cocoa
import KeyHolder
import Magnet


// MARK: - PreferencesWindowDelegate
protocol PreferencesWindowDelegate {
    func preferencesDidUpdate()
}


class PreferencesWindow: NSWindowController ,NSWindowDelegate, NSApplicationDelegate{

    @IBOutlet weak var savezipBtn: NSButton!
    @IBOutlet weak var filepathTextField: NSTextField!
    @IBOutlet weak var recordView: RecordView!
    var mainWindow:MainWindow!
    
    var delegate:PreferencesWindowDelegate?
    
    //window nib name
    override var windowNibName : String! {
        return "PreferencesWindow"
    }
    
    
    override func windowDidLoad() {
        super.windowDidLoad()

        //窗口设置
        self.window?.center()                    //屏幕中间显示
        //self.window?.makeKeyAndOrderFront(nil)   //主窗口
        //NSApp.activate(ignoringOtherApps: true)  //显示
        
        //设置默认值
        //let defaults = UserDefaults.standard
        //let city = defaults.string(forKey: "city") ?? DEFAULT_CITY
        //cityTextField.stringValue = city
        
        mainWindow = AppDelegate.mainWindow
        
        setupRecordView()
        
    }
    
    
    func setupRecordView(){
        
        recordView.tintColor = NSColor(red: 0.164, green: 0.517, blue: 0.823, alpha: 1)
        let keyCombo = KeyCombo(doubledCocoaModifiers: .command)
        recordView.keyCombo = keyCombo
        recordView.delegate = self
        
        let hotKey = HotKey(identifier: HOTKEY_SHOW, keyCombo: keyCombo!, target: self, action: #selector(PreferencesWindow.hotkeyCalled))
        hotKey.register()
        
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
    
    
    @IBAction func filepathClicked(_ sender: Any) {
        
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseDirectories = true
        openPanel.canCreateDirectories = true
        openPanel.canChooseFiles = false
        openPanel.begin { (result) -> Void in
            if result == NSFileHandlingPanelOKButton {
                
                let path = openPanel.directoryURL?.path
                print(path)
                self.filepathTextField.stringValue = path!
                
            }
        }
        
 
    }
    
    
    
    // MARK: - NSWindowDelegate
    func windowWillClose(_ notification: Notification) {
        
        //设置
        let defaults = UserDefaults.standard
        //defaults.set(cityTextField.stringValue, forKey: "city")
        
        //调用代理
        //delegate?.preferencesDidUpdate()
        
    }
    
}

// MARK: - RecordView Delegate
extension PreferencesWindow: RecordViewDelegate {
    func recordViewShouldBeginRecording(_ recordView: RecordView) -> Bool {
        return true
    }
    
    func recordView(_ recordView: RecordView, canRecordKeyCombo keyCombo: KeyCombo) -> Bool {
        // You can customize validation
        return true
    }
    
    func recordViewDidClearShortcut(_ recordView: RecordView) {
        print("clear shortcut")
        HotKeyCenter.shared.unregisterHotKey(with: HOTKEY_SHOW)
    }
    
    func recordViewDidEndRecording(_ recordView: RecordView) {
        print("end recording")
    }
    
    func recordView(_ recordView: RecordView, didChangeKeyCombo keyCombo: KeyCombo) {
        HotKeyCenter.shared.unregisterHotKey(with: HOTKEY_SHOW)
        let hotKey = HotKey(identifier: HOTKEY_SHOW, keyCombo: keyCombo, target: self, action: #selector(PreferencesWindow.hotkeyCalled))
        hotKey.register()
    }
    
}



