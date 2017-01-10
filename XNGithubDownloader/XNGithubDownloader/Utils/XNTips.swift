//
//  XNTips.swift
//  XNGithubDownloader
//
//  Created by xuneng on 2017/1/2.
//  Copyright © 2017年 xn4545945. All rights reserved.
//

import Foundation

class XNTips : NSObject{
    
    
    /// 仅文字
    ///
    /// - Parameters:
    ///   - text: 文字
    ///   - to: NSView
    class func hud(text:String, to:NSView){
        let hud = MBProgressHUD.showAdded(to: to, animated: true)!
        
        hud.mode = MBProgressHUDModeText
        hud.labelText = text
        hud.margin = 10.0
        hud.yOffset = 0.0
        hud.removeFromSuperViewOnHide = true
        hud.hide(true, afterDelay: 3)
    }
    
}
