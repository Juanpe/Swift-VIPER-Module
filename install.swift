//
//  main.swift
//  InstallVIPERTemplate
//
//  Created by Juanpe Catalán on 17/02/2017.
//  Copyright © 2017 Juanpe Catalán. All rights reserved.
//

import Foundation

struct Constants {

    struct CommandLineValues {
        static let yes = "YES"
        static let no = "NO"
    }
    struct File {
        static let templateName = "Module VIPER.xctemplate"
        static let destinationRelativePath = "/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Templates/Project Templates/iOS/Application"
    }

    struct Messages {
        static let successMessage = "✅  Template was installed succesfully 🎉. Enjoy it 🙂"
        static let successfullReplaceMessage = "✅  The Template has been replaced for you with the new version 🎉. Enjoy it 🙂"
        static let errorMessage = "❌  Ooops! Something went wrong 😡"
        static let exitMessage = "Bye Bye 👋"
        static let promptReplace = "That Template already exists. Do you want to replace it? (YES or NO)"
    }

    struct Blocks {
        static let printSeparator = { print("====================================") }
    }
}


func printToConsole(_ message:Any){
    Constants.Blocks.printSeparator()
    print("\(message)")
    Constants.Blocks.printSeparator()
}

func moveTemplate(){
    do {
        let fileManager = FileManager.default
        let destinationPath = bash(command: "xcode-select", arguments: ["--print-path"]).appending(Constants.File.destinationRelativePath)
        printToConsole("Template will be copied to: \(destinationPath)")
        if !fileManager.fileExists(atPath: "\(destinationPath)/\(Constants.File.templateName)"){
            try fileManager.copyItem(atPath: Constants.File.templateName, toPath: "\(destinationPath)/\(Constants.File.templateName)")
            printToConsole(Constants.Messages.successMessage)

        } else {
            print(Constants.Messages.promptReplace)
            var input = ""
            repeat {
                guard let textFormCommandLine = readLine(strippingNewline: true) else {
                    continue
                }
                input = textFormCommandLine.uppercased()
            } while(input != Constants.CommandLineValues.yes && input != Constants.CommandLineValues.no)

            if input == Constants.CommandLineValues.yes {
                try replaceItemAt(URL(fileURLWithPath: "\(destinationPath)/\(Constants.File.templateName)"), withItemAt: URL(fileURLWithPath: Constants.File.templateName))
                printToConsole(Constants.Messages.successfullReplaceMessage)
            } else {
                print(Constants.Messages.exitMessage)
            }
        }
    }

    catch let error as NSError {
        printToConsole("\(Constants.Messages.errorMessage) : \(error.localizedFailureReason!)")
    }
}

func replaceItemAt(_ url: URL, withItemAt itemAtUrl: URL) throws {
    let fileManager = FileManager.default
    try fileManager.removeItem(at: url)
    try fileManager.copyItem(atPath: itemAtUrl.path, toPath: url.path)
}

func shell(launchPath: String, arguments: [String]) -> String {
    let task = Process()
    task.launchPath = launchPath
    task.arguments = arguments

    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: String.Encoding.utf8)!
    if output.count > 0 {
        //remove newline character.
        let lastIndex = output.index(before: output.endIndex)
        return String(output[output.startIndex ..< lastIndex])
    }
    return output
}

func bash(command: String, arguments: [String]) -> String {
    let whichPathForCommand = shell(launchPath: "/bin/bash", arguments: [ "-l", "-c", "which \(command)" ])
    return shell(launchPath: whichPathForCommand, arguments: arguments)
}

moveTemplate()
