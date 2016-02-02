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
