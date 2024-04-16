//
//  WorkToolApp.swift
//  WorkTool
//
//  Created by Louis on 04/04/2024.
//

import SwiftUI
import SwiftData

@main
struct WorkToolApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Attendance.self])
        
    }
}
