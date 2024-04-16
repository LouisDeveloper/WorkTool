//
//  example.swift
//  WorkTool
//
//  Created by Louis on 04/04/2024.
//

import SwiftUI

struct example: View {
    //    init() {
    //        // Customize navigation bar appearance
    //        let appearance = UINavigationBarAppearance()
    //        appearance.backgroundColor = .red
    //        UINavigationBar.appearance().standardAppearance = appearance
    //        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    //    }
    
    @State private var selectedDate: Date
    
    init() {
        // Initialize the selectedDate with a custom date
        let components = DateComponents(year: 2024, month: 4, day: 8, hour: 10, minute: 30)
        _selectedDate = State(initialValue: Calendar.current.date(from: components) ?? Date())
    }
    
    var body: some View {
        DatePicker("Select a date", selection: $selectedDate)
            .padding()
    }
}
struct DetailView: View {
    var body: some View {
        VStack {
            Text("Detail View")
        }
        .navigationBarTitle("Detail")
        .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Share") {
                            // Handle share action
                        }
                    }
                }
    }
}


struct example_Previews: PreviewProvider {
    static var previews: some View {
        example()
    }
}
