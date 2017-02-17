//
//  main.swift
//  InstallVIPERTemplate
//
//  Created by Juanpe Catalán on 17/02/2017.
//  Copyright © 2017 Juanpe Catalán. All rights reserved.
//

import Foundation

let templateName = "Module VIPER.xctemplate"
let destinationPath = "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"

func printInConsole(_ message:Any){
    print("====================================")
    print("\(message)")
    print("====================================")
}

func moveTemplate(){

    let fileManager = FileManager.default
    
    do {
        if !fileManager.fileExists(atPath:"\(destinationPath)/\(templateName)"){
        
            try fileManager.copyItem(atPath: templateName, toPath: "\(destinationPath)/\(templateName)")
            
            printInConsole("Template installed succesfully. Enjoy it")
            
        }else{
            printInConsole("Template already exists")
        }
    }
    catch let error as NSError {
        printInConsole("Ooops! Something went wrong: \(error.localizedFailureReason!)")
    }
}

moveTemplate()




