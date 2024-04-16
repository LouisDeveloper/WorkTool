//
//  AttendancePage.swift
//  WorkTool
//
//  Created by Louis on 05/04/2024.
//

import SwiftUI

struct AttendancePage: View {
    
    @Binding var path:NavigationPath
    @State var selectedTab: Int = 0
    
    var body: some View {
        VStack{
            navigationBar(pageTitle: "Attendance", isHome: false, path: $path)
            
            TabView(selection:$selectedTab){
                ScrollView{
                    
                    ClockInView(selectedTab: $selectedTab)
                        .padding(.horizontal)
                    //                    .background(Color.red)
                        
                }
                .tabItem {
                    // Assuming you have an image named 'clockLogo' in your assets
                    Image(systemName: "clock")
                    Text("Clock in/out")
                }
                .tag(0)
                

                AttendanceHistoryView()
                    .background(Color.blue)
                    .tabItem {
                        // Assuming you have an image named 'historyLogo' in your assets
                        Image(systemName: "list.clipboard")
                        Text("History")
                    }
                    .tag(1)
            }
            .transition(.asymmetric(insertion: .move(edge: .top), removal: .move(edge: .bottom)))
            .tint(Color.primary)
//            Spacer()
        }
        .toolbar(.hidden)
       
    }
}

struct AttendancePage_Preview:PreviewProvider{
    static var previews: some View {
        @State var path = NavigationPath()
        
        
        AttendancePage(path: $path)
    }
}

//#Preview {
//    @State var path = NavigationPath()
//    
//    
//}
