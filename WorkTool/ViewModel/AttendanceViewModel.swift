//
//  AttendanceViewModel.swift
//  WorkTool
//
//  Created by Louis on 10/04/2024.
//

import Foundation

class AttendanceViewModel:ObservableObject{
    
    @Published var attendanceList:[Attendance] = []
    
    init(){
        getAttendanceList()
    }
    
    public func getAttendanceList(){
//        attendanceList.append(Attendance(date: Date(), clockInTime: Date(), clockOutTime: Date(), lunchBreak: true))
//        attendanceList.append(Attendance(date: Date(), clockInTime: Date(), clockOutTime: Date(), lunchBreak: false))
//        attendanceList.append([Attendance(date: Date(), clockInTime: Date(), clockOutTime: Date(), lunchBreak: true)])
    }

    
}
