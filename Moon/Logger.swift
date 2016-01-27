//
//  Logger.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 27/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import Foundation
let log: XCGLogger = {

    #if DEBUG
        //Log: Debug, Info, Warning, Error, Severe
        let logLevel: XCGLogger.LogLevel = .Debug
    #else
        //Log: Error, Severe
        let logLevel: XCGLogger.LogLevel = .Error
    #endif

    var log = XCGLogger.defaultInstance()

    log.setup(logLevel, showThreadName: true, showLogLevel: false)
    log.dateFormatter = {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = ""
        return dateFormatter
        }()
    return log
}()

//    log.verbose("A verbose message, usually useful when working on a specific problem")
//    log.debug("A debug message")
//    log.info("An info message, probably useful to power users looking in console.app")
//    log.warning("A warning message, may indicate a possible error")
//    log.error("An error occurred, but it's recoverable, just info about what happened")
//    log.severe("A severe error occurred, we are likely about to crash now")

