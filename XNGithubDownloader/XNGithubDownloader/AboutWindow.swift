//
//  AboutWindow.swift
//  XNGithubDownloader
//
//  Created by xuneng on 2017/1/1.
//  Copyright © 2017年 xn4545945. All rights reserved.
//

import Cocoa

class AboutWindow: NSWindowController {

    
    //window nib name
    override var windowNibName : String! {
        return "AboutWindow"
    }
    
    
    override func windowDidLoad() {
        super.windowDidLoad()

        XNTips.hud(text: "hello", to: (self.window?.contentView)!)
        
    }
    
    @IBAction func githubClicked(_ sender: Any) {
        
        
        NSWorkspace.shared().open(URL(string: "https://github.com/xn4545945/XNGithubDownloader")!)
    }
    
    @IBAction func blogClicked(_ sender: Any) {
        NSWorkspace.shared().open(URL(string: "http://blog.xigulu.com")!)
        
    }
    
    
    
}
