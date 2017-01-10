//
//  MainWindow.swift
//  XNGithubDownloader
//
//  Created by xuneng on 2017/1/1.
//  Copyright © 2017年 xn4545945. All rights reserved.
//

import Cocoa
import Alamofire
import Zip

class MainWindow: NSWindowController,NSWindowDelegate ,NSTextFieldDelegate{


    var inputTF: NSTextField!
    var realDownloadURLString:String!
    
    
    //window nib name.
    override var windowNibName : String! {
        return "MainWindow"
    }
 
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        
        self.window?.makeKeyAndOrderFront(nil)   //主窗口
        NSApp.activate(ignoringOtherApps: true)
        //self.window?.styleMask = NSFullSizeContentViewWindowMask
        
        self.window?.titlebarAppearsTransparent = true
        self.window?.titleVisibility = .hidden
        self.window?.styleMask = NSFullSizeContentViewWindowMask
        
        setupInputTF()
        
        //https://github.com/Alamofire/Alamofire   输入
        //https://github.com/Alamofire/Alamofire/archive/master.zip  输出
        
        //downloadZip(urlStr: "http://localhost/AFN.zip")
//        downloadZip(urlStr: "https://github.com/Alamofire/Alamofire/archive/master.zip")
        
        
        //unzip();
        
        print(getRealDownloadURL(urlStr: inputTF.stringValue))
        
    }
    
    func setupInputTF(){
        
        let winWidth = Int((self.window?.frame.size.width)!)
        let winHeight = Int((self.window?.frame.size.height)!)
        let padding = 5
        //输入
        inputTF = NSTextField(frame: NSRect(x: padding, y: padding, width: winWidth - 2 * padding, height: winHeight - 2 * padding ))
        inputTF.drawsBackground = true
        inputTF.isEditable = true
        inputTF.delegate = self
        inputTF.placeholderString = "输入Github地址"
        inputTF.font = NSFont.labelFont(ofSize: 22)
        //单行
        inputTF.cell?.usesSingleLineMode = true
        inputTF.cell?.wraps = false
        inputTF.cell?.isScrollable = true
        self.window?.contentView?.addSubview(inputTF)
        inputTF.becomeFirstResponder()
        
//        inputTF.action
        
        //https://github.com/AFNetworking/AFNetworking
        
        //inputTF.stringValue = "https://github.com/Alamofire/Alamofire/archive/master.zip"
        
    }
    
    
    func getRealDownloadURL(urlStr:String) -> Bool{
        if urlStr.isEmpty {
            return false
        }
        
        //1.直接是文件下载地址的. (可以是.dmg等)
        
        //2.直接是github地址
        realDownloadURLString = urlStr + "/archive/master.zip"
        
        //3.直接是这种也可以AFNetworking/AFNetworking   (不区分大小写的)
        
        
        let separatedArray = realDownloadURLString.components(separatedBy: "/")
        let laststring = separatedArray.last!
        print("是文件\(laststring)")
        
        return true
    }
    
    
    func downloadZip(str:String){
        
        if !self.getRealDownloadURL(urlStr: str) {
            
            XNTips.hud(text: "网址无效", to: (self.window?.contentView)!)
            
            return
        }
        
        XNTips.hud(text: "开始下载", to: (self.window?.contentView)!)
        
        /*
        //指定下载路径和保存文件名
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("xxxxx/xxxxx.zip")
            
            //两个参数表示如果有同名文件则会覆盖，如果路径中文件夹不存在则会自动创建
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        */
        
        let destination = DownloadRequest.suggestedDownloadDestination(for: .downloadsDirectory)
        
        Alamofire.download(realDownloadURLString, to: destination)
            .downloadProgress { progress in
                
                print("已下载：\(progress.completedUnitCount/1024)KB")
                print("总大小：\(progress.totalUnitCount/1024)KB")
            }
            .responseData { response in
                
                if let data = response.result.value {
                    print("下载完毕!")
                    
//                    let image = UIImage(data: data)
//
//                    let filePath = URL(fileURLWithPath: "/Users/xuneng/Desktop/1111")
//                    do{
//                        try data.write(to: filePath, options: Data.WritingOptions.atomic)
//                    }catch{
//                        
//                    }
                    
                }
        }
        
        
    }
    
    
    //根据url, 解析html得到项目的主要语言. 然后根据主要语言创建目录
    //html中搜索repository-lang-stats-graph
    func mkStoreDir(){
        
    }
    
    
    //解压
    func unzip(){
        
        do {
            
            let downloadsDirectory = FileManager.default.urls(for:.downloadsDirectory, in: .userDomainMask)[0]
            //let documentsDirectory = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)[0]
            
            let srcURL = downloadsDirectory.appendingPathComponent("afn/AFN.zip")
            let dstURL = downloadsDirectory.appendingPathComponent("afn/")
            print("zip文件路径\(srcURL)")
            print("unzip后的路径\(dstURL)")

            //let unzipDirectory = try Zip.quickUnzipFile(fileURL) // Unzip 快速解压到Document文件夹中
            
            try Zip.unzipFile(srcURL, destination: dstURL, overwrite: true, password: nil, progress: { (progress) -> () in
                print(progress)
            }) // Unzip
            
        }
        catch {
            print("Something went wrong")
        }
        
        
    }
    
    //MARK: - NSTextFieldDelegate
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        print("Selector method is (\(NSStringFromSelector(commandSelector)))")
        
        if commandSelector == #selector(self.insertNewline) {
            //Do something against ENTER key
            
            print("ENTER key")
            
            downloadZip(str: inputTF.stringValue)
            
        }
        else if commandSelector == #selector(self.deleteForward) {
            //Do something against DELETE key
            
        }
        else if commandSelector == #selector(self.deleteBackward) {
            //Do something against BACKSPACE key
            
        }
        else if commandSelector == #selector(self.insertTab) {
            //Do something against TAB key
        }else if commandSelector == #selector(self.cancelOperation) {
            
            print("ESC key")
        }
        
        // return YES if the action was handled; otherwise NO
        return false
    }

    
    
}
