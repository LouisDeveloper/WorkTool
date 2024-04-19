//
//  Attendance.swift
//  WorkTool
//
//  Created by Louis on 10/04/2024.
//

import Foundation
import SwiftData

@Model
class Attendance: Identifiable{
    
    @Attribute(.unique) var id:String = UUID().uuidString
    public var date:Date
    public var clockInTime:Date
    public var clockOutTime:Date
    public var lunchBreak:Bool
    
    @Transient
    public var isPbOrDayOff:Bool = false
    
    init(id: String = UUID().uuidString ,date: Date, clockInTime: Date, clockOutTime: Date, lunchBreak: Bool) {
        self.date = date
        self.clockInTime = clockInTime
        self.clockOutTime = clockOutTime
        self.lunchBreak = lunchBreak
    }
    
//    public var date: Date {
//        get {
//            return _date
//        }
//        set {
//            _date = newValue
//        }
//    }
//    
//    public var clockInTime: Date {
//        get {
//            return _clockInTime
//        }
//        set {
//            _clockInTime = newValue
//        }
//    }
//    
//    public var clockOutTime: Date {
//        get {
//            return _clockOutTime
//        }
//        set {
//            _clockOutTime = newValue
//        }
//    }
//    
//    public var lunchBreak: Bool {
//        get {
//            return _lunchBreak
//        }
//        set {
//            _lunchBreak = newValue
//        }
//    }
}
