//
//  DateUtil.swift
//  WorkTool
//
//  Created by Louis on 10/04/2024.
//

import Foundation

struct DateUtil{
    
    public func formatDate(date: Date, format:String) -> String {
            let formatter = DateFormatter()
            // Set the format to YYYY-MM-DD
            formatter.dateFormat = format
            return formatter.string(from: date)
    }
    
}
